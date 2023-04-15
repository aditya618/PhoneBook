package com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDAO {
	
private Connection conn;

public ContactDAO(Connection conn) {
	super();
	this.conn = conn;
}

public boolean saveContact(Contact c) {
	boolean f = false;
	
	try {
		String query = "insert into contact(name, email, phno, about ,userId) values (?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, c.getName());
		ps.setString(2, c.getEmail());
		ps.setString(3, c.getPhno());
		ps.setString(4, c.getAbout());
		ps.setInt(5, c.getUserId());
		
		int i = ps.executeUpdate();
		
		if(i == 1) {
			f = true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
}

public List<Contact> getAllContact(int uid) {
	List<Contact> contacts = new ArrayList<Contact>();
	Contact c = null;
	try {
		String query = "select * from contact where userId=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setInt(1, uid);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			c = new Contact();
			c.setId(rs.getInt("id"));
			c.setName(rs.getString("name"));
			c.setEmail(rs.getString("email"));
			c.setPhno(rs.getString("phno"));
			c.setAbout(rs.getString("about"));
			
			contacts.add(c);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return contacts;
}
}

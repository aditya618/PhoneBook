package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.conn.DbConnect;
import com.doa.ContactDAO;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phno = request.getParameter("contact");
		String about = request.getParameter("about");
		
//		System.out.print(userId + " " + name + " " + email + " " + phno + " " + about);
		
		Contact c = new Contact(name, email, phno, about, userId);
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		
		boolean f = dao.saveContact(c);
		HttpSession session = request.getSession();
		
		if(f) {
			session.setAttribute("successMsg","Contact Added!");
		} else {
			session.setAttribute("errorMsg","something went wrong!");
		}
		response.sendRedirect("addContact.jsp");
	}

}

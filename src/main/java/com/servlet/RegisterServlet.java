package com.servlet;

import java.io.IOException;

import com.conn.DbConnect;
import com.doa.UserDAO;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res ) throws IOException {
		
		String name = req.getParameter("name");
		String email= req.getParameter("email");
		String password = req.getParameter("password");
		
		User user = new User(name, email, password);
		UserDAO dao = new UserDAO(DbConnect.getConn());
		
		HttpSession session = req.getSession();
		
		boolean f = dao.userRegister(user);
		if(f) {
//			System.out.println("User registered successfuly");
			session.setAttribute("successMsg", "User registered successfuly");
		} else {
//			System.out.println("some error occurred");
			session.setAttribute("errorMsg", "Some error occurred");
		}
		
		res.sendRedirect("register.jsp");
	}
}

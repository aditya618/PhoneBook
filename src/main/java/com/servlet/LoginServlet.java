package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.conn.DbConnect;
import com.doa.UserDAO;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDAO dao = new UserDAO(DbConnect.getConn());
		User user = dao.userLogin(email, password);
		
		HttpSession session = request.getSession();
		if(user != null) {
//			System.out.println("User available");
			session.setAttribute("user", user);
			response.sendRedirect("index.jsp");
			
		} else {
//			System.out.println("Not available");
			session.setAttribute("errorMsg", "Invalid username or password");
			response.sendRedirect("login.jsp");
		}
	}

}

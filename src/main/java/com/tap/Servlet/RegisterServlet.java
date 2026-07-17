package com.tap.Servlet;

import java.io.IOException;
import java.sql.Timestamp;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/callRegisterServlet")
public class RegisterServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	String userName=req.getParameter("userName");
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	String role=req.getParameter("role");
	String adress=req.getParameter("adress");
	System.out.println("Address from form = " + adress);
	
	
	String hashpw= BCrypt.hashpw(password,BCrypt.gensalt(12));
	
	user user=new user(0, userName, hashpw, email, adress, role, null, null);
	System.out.println(user);
	UserDAOImpl userDAOImpl=new UserDAOImpl();
	
	int res = userDAOImpl.addUser(user);
	
	if(res == 1)
	{
		resp.sendRedirect("login.html");
	}
	else
	{
		resp.sendRedirect("register.html");
	}	
	}
}
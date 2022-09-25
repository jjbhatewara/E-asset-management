package com.easset.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.easset.dao.UserDao;
import com.easset.dao.UserDaoImpl;
import com.easset.model.Role;
import com.easset.model.User;

@WebServlet("/register")
public class RegistrationController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd= req.getRequestDispatcher("register.jsp");  
		rd.include(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("In Post");
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		UserDao ud = new UserDaoImpl();
		String uname = req.getParameter("uname");
		String password = req.getParameter("password");
		String telephone = req.getParameter("telephone");
		String email = req.getParameter("email");
		String username = req.getParameter("username");	
		User u1 = new User(uname, telephone, email, username);
		String output = ud.addUser(u1, 2, password);
		System.out.println(output);
		out.println("<script type=\"text/javascript\">");
		out.println("alert('"+output+"');");
		out.println("</script>"); 
		RequestDispatcher rd= req.getRequestDispatcher("register.jsp");  
		rd.include(req,resp);
		
	}
	
}

package com.easset.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easset.dao.UserDao;
import com.easset.dao.UserDaoImpl;

@WebServlet("/login")
public class LoginController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd= req.getRequestDispatcher("login.jsp");  
		rd.include(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String uname = req.getParameter("uname");
		String password = req.getParameter("password");
		UserDao ud = new UserDaoImpl();
		int lg = ud.login(uname, password);
		if(lg != -1) {
			HttpSession session = req.getSession();
			session.setAttribute("userid", lg);
			if(lg == 1) {
				resp.sendRedirect("adminhome");
			}
			else {
				resp.sendRedirect("userhome");
			}
			
		}
		else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invalid Username or Password');");
			out.println("</script>"); 
			RequestDispatcher rd= req.getRequestDispatcher("login.jsp");  
			rd.include(req,resp);  
		}
//		out.println("<h1>Welcome" + lg +"</h1>");
	}
	
}

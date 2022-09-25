package com.easset.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		System.out.println("in Logout");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		session.invalidate();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Logout Sucessfull');");
		out.println("</script>"); 
		
		req.getRequestDispatcher("login").include(req, resp);
//		resp.sendRedirect("login");
	}
	
}

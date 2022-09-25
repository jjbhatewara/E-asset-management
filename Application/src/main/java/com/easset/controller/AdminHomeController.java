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
import com.easset.model.User;

@WebServlet("/adminhome")
public class AdminHomeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		Object objId = session.getAttribute("userid");
		if(objId == null) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('User id null');");
			out.println("</script>"); 
			resp.sendRedirect("login");
		}
		int id = (int)objId;
		if(id != 1) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invalid Username or Password');");
			out.println("</script>");
			resp.sendRedirect("login");
		}
		UserDao ud = new UserDaoImpl();			
		User u1 = ud.getUserById(id);
		req.setAttribute("uname",u1.getName());
		req.setAttribute("telephone",u1.getTelephone());
		req.setAttribute("email", u1.getEmail());
		req.setAttribute("lastlogin", u1.getLastLogin());
		RequestDispatcher rd= req.getRequestDispatcher("adminhome.jsp");  
		rd.include(req,resp);
		
		
	}

}

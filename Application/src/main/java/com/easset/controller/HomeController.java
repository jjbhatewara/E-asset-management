package com.easset.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.easset.dao.*;

@WebServlet("")
public class HomeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		System.out.println("in get");
		RequestDispatcher rd= req.getRequestDispatcher("home.jsp");  
		AssetDao ad = new AssetDaoImpl();
		List<String> popAssets = ad.getPopularAssets();
		req.setAttribute("popAssets", popAssets);
		rd.include(req,resp);
	}
	
}

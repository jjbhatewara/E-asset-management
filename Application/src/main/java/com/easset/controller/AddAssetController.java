package com.easset.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easset.dao.*;
import com.easset.model.Asset;
import com.easset.model.AssetType;

@WebServlet("/addasset")
public class AddAssetController extends HttpServlet {
	
	static boolean flag = false;
	static String msg ;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out =resp.getWriter();
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
		
		AssetDao ad = new AssetDaoImpl();
		List<Asset> assets = ad.getAssets();
//		System.out.println(assets);
		List<AssetType> at = ad.getTypes();
		req.setAttribute("assets", assets);
		req.setAttribute("assettype", at);
		if(flag == true) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+msg+"');");
			out.println("</script>");
			flag=false;
		}
		req.getRequestDispatcher("/addasset.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		resp.setContentType("text/html");
		PrintWriter out =resp.getWriter();
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
		
		String i = req.getParameter("assetname");
		int j = Integer. parseInt(req.getParameter("cat"));		 
		String k = req.getParameter("desp");
		System.out.println(i+j+k);
		AssetDao ad = new AssetDaoImpl();
		int output = ad.addAsset(i, j, k);
		if(output == 0) {
			msg = "ERROR: Asset Not Added";
		}
		else {
			msg = "Asset Successfully Added";
		}
		flag = true;
		doGet(req,resp);
	}
	

}

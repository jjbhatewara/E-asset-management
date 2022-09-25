package com.easset.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easset.dao.AssetDao;
import com.easset.dao.AssetDaoImpl;
import com.easset.model.Asset;

@WebServlet("/borrowasset")
public class BorrowAssetController extends HttpServlet {
	
//	public static void delete() {
//		
//	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out =resp.getWriter();
		int assetID=0;
		HttpSession session = req.getSession();
		
		Object objId = session.getAttribute("userid");
//		System.out.println();
		
		if(objId == null ) {
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invalid Username or Password');");
			out.println("</script>"); 
			resp.sendRedirect("login");
		}
		int id = (int) objId;
		AssetDao ad = new AssetDaoImpl();
		try {			
			assetID = Integer.parseInt(req.getParameter("id"));
			ad.allocateAsset(id, assetID);
		}catch(Exception e) {			
		}				
		List<Asset> assets = ad.getAvailableAssets();	
		
		req.setAttribute("assets",assets);
		req.getRequestDispatcher("userborrow.jsp").forward(req, resp);
	}
}

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


@WebServlet("/userborroweedasset")
public class BorrowerController extends HttpServlet {
	static String msg;
	static boolean flag = false;
	
	public static void deAllocate(int id) {
		int assetID=id;	
		AssetDao ad = new AssetDaoImpl();
		int output = ad.deAllocateAsset(assetID);
		System.out.println(output);
		flag = true;
		if(output == 2) {
			msg = "Asset Successfully Deallocted";
		}
		else {
			msg = "Internal Error Occoured";
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		Object objId = session.getAttribute("userid");
		if(objId == null ) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invalid Username or Password');");
			out.println("</script>"); 
			resp.sendRedirect("login");
		}
		int id = (int) objId;
		
		int assetID = 0;
		try {
			assetID = Integer.parseInt(req.getParameter("id"));
			deAllocate(assetID);
		} catch (Exception e) {
		}
		AssetDao ad = new AssetDaoImpl();
		List<Asset> assets = ad.getAssetsById(id);
		req.setAttribute("assets", assets);

		if(flag == true) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+msg+"');");
			out.println("</script>");
			flag=false;
		}
		req.getRequestDispatcher("/usersAsset.jsp").forward(req, resp);
	}

	

}

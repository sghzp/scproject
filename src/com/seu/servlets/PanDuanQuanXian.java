package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;


public class PanDuanQuanXian extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println("进来了,get请求");
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("888888888888888");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String quanxian = (String)request.getParameter("quanxian");
		
		try{
		
		
				
				
				HttpSession session = request.getSession();
				String right = (String)session.getAttribute("right");
				char[] arr = right.toCharArray();
				//1000000:全部权限    1000100:上传和修改权限    1000010:审核权限     1000001:查询权限
				int check = 0;
				
				if (arr[0] == '0') {
					if (quanxian.equals("sc") && arr[4] == '1') {
						check = 1;
					}
					if (quanxian.equals("sh") && arr[5] == '1') {
						check = 1;
					}
					if (quanxian.equals("cx") && arr[6] == '1') {
						check = 1;
					}
				} else if (arr[0] == '1') {
					check = 1;
				}
		
				JSONArray jsonArray = new JSONArray();	
				jsonArray=JSONArray.fromObject(check);
				
				
				//System.out.println("PanDuanSjljh_state:"+jsonArray.toString()+"---"+jsonArray.size());
				out.write(jsonArray.toString());
				out.flush();
				out.close();
		
		
		
		}catch(Exception e){
			out.println("<script>");
			out.println("alert('由于您长时间未进行操作，请退出重新登录！');");
			out.println("</script>");
			out.flush();
			out.close();
		}
		
		
			
	}
	
}

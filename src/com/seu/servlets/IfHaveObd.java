package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.seu.dao.impl.ObdInfoDaoImpl;

public class IfHaveObd extends HttpServlet{
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
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		String enginetype = (String)request.getParameter("enginetype");
		
		
		String sql = "select * from obd where enginetype="+"'"+enginetype+"'";
		Integer check = 0;
		ObdInfoDaoImpl oidi = new ObdInfoDaoImpl();
		
		if(request.getParameter("caozuo").equals("add")){
			if(oidi.query(sql).size()>0){
				check = 1;
			}
		}else if(request.getParameter("caozuo").equals("modify")){
			//System.out.println(request.getParameter("id"));
			if(oidi.query(sql+" and id!="+request.getParameter("id")).size()>0){
				check = 1;
			}
			//System.out.println(sql+" and hexid!="+request.getParameter("HEXID"));
		}
		

		//System.out.println(sql);
		//Integer check = new Integer(hm.get(ecutype));
		
		JSONArray jsonArray = new JSONArray();
		
		jsonArray=JSONArray.fromObject(check);
		
		
		//System.out.println("IfHavaHex.java:"+jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
}

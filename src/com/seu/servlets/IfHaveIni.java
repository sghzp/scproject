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

import com.seu.dao.impl.IniInfoDaoImpl;

public class IfHaveIni extends HttpServlet{
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
		String ecuorder = (String)request.getParameter("ecuorder");
		String sbm = (String)request.getParameter("sbm");
		
		String sql = "select * from INIINFO where ecuorder="+"'"+ecuorder+"'"+" and sbm="+"'"+sbm+"'";
		Integer check = 0;
		IniInfoDaoImpl iidi = new IniInfoDaoImpl();
		
		if(request.getParameter("caozuo").equals("add")){
			if(iidi.query(sql).size()>0){
				check = 1;
			}
		}else if(request.getParameter("caozuo").equals("modify")){
			if(iidi.query(sql+" and iniid!="+Integer.parseInt(request.getParameter("INIID"))).size()>0){
				check = 1;
			}
			//System.out.println(sql+" and hexid!="+request.getParameter("HEXID"));
		}
		

		//System.out.println(sql);
		//Integer check = new Integer(hm.get(ecutype));
		
		JSONArray jsonArray = new JSONArray();
		
		jsonArray=JSONArray.fromObject(check);
		
		
		System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
}


package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.seu.beans.LogInfo;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.dao.impl.LogInfoDaoImpl;
import com.seu.dao.impl.UserInfoDaoImpl;

public class QueryRengonghao extends HttpServlet {
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
		//System.out.println("hello QueryManagement_log!");
		
		String clr1 = (String)request.getParameter("clr");
		
		String clr= URLDecoder.decode(clr1, "UTF-8");
		//System.out.println(clr);
		ArrayList<String> list = new ArrayList<String>();
		JSONArray jsonArray = new JSONArray();
		UserInfoDaoImpl uidi = new UserInfoDaoImpl();
		HashSet<String> clrgh = uidi.query_clrgh(clr);
		Iterator<String> it_sjljh = clrgh.iterator();
		
		while(it_sjljh.hasNext()){
			list.add(it_sjljh.next());
		}
		
		jsonArray=JSONArray.fromObject(list);
		
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
	
	
}

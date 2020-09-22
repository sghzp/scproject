package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.seu.beans.MessageInfo;

public class QueryMessage extends HttpServlet {
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
		

		List<MessageInfo> messageInfos = new ArrayList<MessageInfo>();
		
		JSONArray jsonArray = new JSONArray();

		



		
		
		messageInfos.add(new MessageInfo("请审核订货号为D2165，识别码为S8的整车数据", "", "未读"));
		messageInfos.add(new MessageInfo("请审核数据零件号为E21654789，版本号为02的HEX/PFILE数据", "", "已读"));
		
		jsonArray=JSONArray.fromObject(messageInfos);
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
	
	
}


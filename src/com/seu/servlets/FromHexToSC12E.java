package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.seu.dao.impl.IniInfoDaoImpl;
import com.seu.service.SC12Eservice;

public class FromHexToSC12E extends HttpServlet{
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
		//System.out.println("fromhextosc12e    进来了,get请求");
		PrintWriter out = response.getWriter();
		String sc12e = "sc12e";
		String sjljh = (String)request.getParameter("sjljh");
		Integer check = 0;
		
		SC12Eservice service = new SC12Eservice();
		service.write(sjljh);
		Map<String,String> result = service.checking();
		
		if(result != null){
			//System.out.println(result.get("result"));
			//System.out.println("0000000000000000000000000000000000000000");
			if(result.get("result").equals("1")){//result为1 就是成功，为0则失败。
				check = 1;//表示成功
			}else/* if(result.get("result").equals("0"))*/{
				check = 0;//表示失败
			}
		}else{
			check = 0;
		}
	
		
		

		
		JSONArray jsonArray = new JSONArray();
		
		jsonArray=JSONArray.fromObject(check);
		
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
}

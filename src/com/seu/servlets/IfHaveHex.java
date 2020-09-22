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

import com.seu.dao.impl.EcuBasicInfoImpl;
import com.seu.dao.impl.HexInfoDaoImpl;

public class IfHaveHex extends HttpServlet{
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
		String sjljh = (String)request.getParameter("sjljh");
		String version = (String)request.getParameter("version");
		
		String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and version="+"'"+version+"'";
		Integer check = 0;
		HexInfoDaoImpl hidi = new HexInfoDaoImpl();
		
		if(request.getParameter("caozuo").equals("add")){
			if(hidi.query(sql).size()>0){
				check = 1;
			}
		}else if(request.getParameter("caozuo").equals("modify")){
			if(hidi.query(sql+" and hexid!="+request.getParameter("HEXID")).size()>0){
				check = 1;
			}
			//System.out.println(sql+" and hexid!="+request.getParameter("HEXID"));
		}
		

		//System.out.println(sql);
		//Integer check = new Integer(hm.get(ecutype));
		
		JSONArray jsonArray = new JSONArray();
		
		jsonArray=JSONArray.fromObject(check);
		
		
		System.out.println("IfHavaHex.java:"+jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());//这一步只是把字符串发出去了而已！但是通过jsonArray这个类，
		//已经将对象的格式转化成了，格式固定的json格式，这个格式，在前端可以很方便的得到，像使用类那样！
		out.flush();
		out.close();
			
	}
	
}

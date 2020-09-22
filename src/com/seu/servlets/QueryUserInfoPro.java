package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.seu.beans.HexInfo;
import com.seu.beans.UserInfo;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.dao.impl.UserInfoDaoImpl;

public class QueryUserInfoPro extends HttpServlet {
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
		
		String num = (String)request.getParameter("num");
		String name =(String) request.getParameter("name");
		String department = (String)request.getParameter("department");

		
		num= URLDecoder.decode(num, "UTF-8");
		name= URLDecoder.decode(name, "UTF-8");
		department= URLDecoder.decode(department, "UTF-8");

		//System.out.println("我是厂家:" + obdcj);
		
		UserInfoDaoImpl userInfoDaoImpl = new UserInfoDaoImpl();
		List<UserInfo> userInfos = null;
		
		JSONArray jsonArray = new JSONArray();

		

		
		//String sql1 = "select * from HEXINFO where cartype =" +"'"+chexing +"'"+ " and starttime<="+"'"+starttime1+"'"+" and endtime>="+"'"+endtime1+"'"+" order by id desc ";
		StringBuffer sql = new StringBuffer("select * from userinfo where 1=1");
		
		
		
		//开始拼接字符串
		
		if(num.length() != 0){
			sql.append(" and num like "+"'%"+num+"%'");
		}
		if(name.length() != 0){
			sql.append(" and name like "+"'%"+name+"%'");
		}
		if(department.length() != 0){
			sql.append(" and department like "+"'%"+department+"%'");
		}

		
		
		userInfos = userInfoDaoImpl.queryby_sql(sql.toString());
		
		jsonArray=JSONArray.fromObject(userInfos);
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
	
	
}

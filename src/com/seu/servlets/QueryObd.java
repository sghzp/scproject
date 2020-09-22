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
import com.seu.beans.ObdInfo;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.dao.impl.ObdInfoDaoImpl;

public class QueryObd extends HttpServlet {
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
		String obdxh =(String) request.getParameter("obdxh");
		String obdcj = (String)request.getParameter("obdcj");

		
		enginetype= URLDecoder.decode(enginetype, "UTF-8");
		obdxh= URLDecoder.decode(obdxh, "UTF-8");
		obdcj= URLDecoder.decode(obdcj, "UTF-8");

		//System.out.println("我是厂家:" + obdcj);
		
		ObdInfoDaoImpl obdInfoDaoImpl = new ObdInfoDaoImpl();
		List<ObdInfo> obdInfos = null;
		
		JSONArray jsonArray = new JSONArray();

		

		
		//String sql1 = "select * from HEXINFO where cartype =" +"'"+chexing +"'"+ " and starttime<="+"'"+starttime1+"'"+" and endtime>="+"'"+endtime1+"'"+" order by id desc ";
		StringBuffer sql = new StringBuffer("select * from OBD where 1=1");
		
		
		
		//开始拼接字符串
		
		if(enginetype.length() != 0){
			sql.append(" and enginetype like "+"'%"+enginetype+"%'");
		}
		if(obdxh.length() != 0){
			sql.append(" and obdxh like "+"'%"+obdxh+"%'");
		}
		if(obdcj.length() != 0){
			sql.append(" and obdcj like "+"'%"+obdcj+"%'");
		}

		
		
		obdInfos = obdInfoDaoImpl.query(sql.toString());
		
		jsonArray=JSONArray.fromObject(obdInfos);
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
	
	
}

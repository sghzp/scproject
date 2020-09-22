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

import net.sf.json.JSONArray;

import com.seu.beans.HexInfo;
import com.seu.dao.impl.EcuBasicInfoImpl;
import com.seu.dao.impl.HexInfoDaoImpl;

public class ChangeTo3 extends HttpServlet{
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
		System.out.println("888888888888888");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check = 0;
		ArrayList<HexInfo> hexInfos = null;
		
		String sjljh = (String)request.getParameter("sjljh");
		String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state=0";
		
		
		
		HexInfoDaoImpl hidi = new HexInfoDaoImpl();
		hexInfos =hidi.query(sql);
		
		for(HexInfo h : hexInfos){
			hidi.changestateTo3(h.getHEXID());
		}
		
		
		JSONArray jsonArray = new JSONArray();	
		jsonArray=JSONArray.fromObject(check);
		//System.out.println("提交ing");
		
		//System.out.println("PanDuanSjljh_state:"+jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
}

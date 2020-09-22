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

public class PanDuanSjljh_state extends HttpServlet{
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
		
		ArrayList<HexInfo> hexInfos = null;
		PrintWriter out = response.getWriter();
		String sjljh = (String)request.getParameter("sjljh");
		//String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state<=1";//新增空状态后还没有做相应修改
		//String sql1 = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state<=1";//空状态对应 -1。而以前的state<=1 只对应正常和临时两种状态
		
		String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state=0";
		//String sql1 = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state<=1 and state!=-1";
		//System.out.println(sql);
		
		int check = 0;
		
		HexInfoDaoImpl hidi = new HexInfoDaoImpl();
		
		
		if(request.getParameter("caozuo").equals("add")){
			hexInfos = hidi.query(sql);
			//System.out.println(hexInfos.get(0));
			//System.out.println(sql1+" and hexid!="+request.getParameter("HEXID"));
			if(hexInfos.size() == 1){
				check = 1;
			}else{
				check = 0;
			}
		}else{
			hexInfos = hidi.query(sql);
			if(hexInfos.size()>=1){
				check = 1;
			}else{
				check = 0;
			}
		}

		
		
		JSONArray jsonArray = new JSONArray();	
		jsonArray=JSONArray.fromObject(check);
		
		
		//System.out.println("PanDuanSjljh_state:"+jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
}

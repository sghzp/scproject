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

import com.seu.beans.IniInfo;
import com.seu.dao.impl.EcuBasicInfoImpl;
import com.seu.dao.impl.IniInfoDaoImpl;

public class ChangeTo3_ini extends HttpServlet{
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
		System.out.println("ChangeTo3_ini");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check = 0;
		ArrayList<IniInfo> iniInfos = null;
		
		String ecuorder = (String)request.getParameter("ecuorder");
		String sbm = (String)request.getParameter("sbm");
		//String sql = "select * from INIINFO where ecuorder="+"'"+ecuorder+"'"+" and state=0";

		String sql = "select * from INIINFO where ecuorder="+"'"+ecuorder+"'"+" and state=0"+" and sbm "+" like "+"'%"+sbm.substring(0,1)+"%'";


		IniInfoDaoImpl iidi = new IniInfoDaoImpl();
		iniInfos =iidi.query(sql);
		
		for(IniInfo i : iniInfos){
			iidi.changestateTo3(i.getINIID());
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

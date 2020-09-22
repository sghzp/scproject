
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
import com.seu.beans.MesInfo;
import com.seu.dao.impl.EcuBasicInfoImpl;
import com.seu.dao.impl.IniInfoDaoImpl;
import com.seu.dao.impl.MesInfoDaoImpl;

public class LookForSjljhForIni extends HttpServlet{
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
/*		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//ArrayList<HexInfo> hexInfos = null;
		PrintWriter out = response.getWriter();
		String sjljh = (String)request.getParameter("sjljh");
		//MesInfoDaoImpl midi = new MesInfoDaoImpl();
		String sql = "select iniid,ecutype from INIINFO where sjljh="+"'"+sjljh+"' order by Scrq";
		
		IniInfoDaoImpl iidi = new IniInfoDaoImpl();
		ArrayList<IniInfo> iniInfos = null;
		iniInfos = iidi.query(sql);
		System.out.println(iniInfos);
		
		
		JSONArray jsonArray = new JSONArray();	
		//jsonArray=JSONArray.fromObject();
		
		
		//System.out.println("PanDuanSjljh_state:"+jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();*/
			
	}
	
}

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

import com.seu.beans.HexInfo;
import com.seu.beans.IniInfo;
import com.seu.beans.MesInfo;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.dao.impl.IniInfoDaoImpl;
import com.seu.dao.impl.MesInfoDaoImpl;

public class IfCanchexiaoshenhe extends HttpServlet{
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
		MesInfoDaoImpl midi = new MesInfoDaoImpl();
		MesInfo mesInfo = midi.query_by_num(num);
		int check = 0;
		if(mesInfo.getStyle() == 0){//hexInfo
			HexInfoDaoImpl hidi = new HexInfoDaoImpl();
			HexInfo hexInfo = hidi.queryby_sjljh_version(mesInfo.getSjljh(), mesInfo.getVersion());
			if(hexInfo.getState() == 0){
				check = 0;
			}else if(hexInfo.getState() == 1 && (hexInfo.getTimes() != 0  ||  hexInfo.getDownloadtimes() != 0)){
				check = 0;
			}else{
				check = 1;
			}
		}else{//iniINfo
			IniInfoDaoImpl iidi = new IniInfoDaoImpl();
			IniInfo iniInfo = iidi.queryby_ecuorder_sbm(mesInfo.getSjljh(), mesInfo.getVersion());
			if(iniInfo.getState() == 0){
				check = 0;
			}else if(iniInfo.getState() == 1 && (iniInfo.getTimes() != 0  ||  iniInfo.getDownloadtimes() != 0)){
				check = 0;
			}else{
				check = 1;
			}
		}
		


		
		JSONArray jsonArray = new JSONArray();
		
		jsonArray=JSONArray.fromObject(check);
		
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
}

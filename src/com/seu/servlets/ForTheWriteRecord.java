
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

import com.seu.beans.IniInfo;
import com.seu.dao.impl.IniInfoDaoImpl;

public class ForTheWriteRecord extends HttpServlet{
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
		
		JSONArray jsonArray = new JSONArray();
		
		PrintWriter out = response.getWriter();
		String ecuorder = (String)request.getParameter("ecuorder");
		String sbm = (String)request.getParameter("sbm");
		
		String sql = "select * from INIINFO where ecuorder="+"'"+ecuorder+"'"+" and sbm="+"'"+sbm+"'";
		Integer check = 0;
		IniInfoDaoImpl iidi = new IniInfoDaoImpl();
		
		if(iidi.query(sql).size()>0){
			IniInfo i = iidi.query(sql).get(0);
			jsonArray=JSONArray.fromObject(i);
		}else{
			jsonArray=JSONArray.fromObject(0);
		}
		
		

		//System.out.println(sql);
		//Integer check = new Integer(hm.get(ecutype));
		
		
		
		
		
		
		System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
}

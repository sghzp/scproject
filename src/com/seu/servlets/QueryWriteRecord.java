package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.seu.beans.WriteRecordInfo;
import com.seu.dao.impl.WriteRecordInfoDaoImpl;

public class QueryWriteRecord extends HttpServlet {
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
		//System.out.println("hello QueryWriteRecord!");
		
		String radio = (String)request.getParameter("radio");
		String guanjianzi = (String)request.getParameter("guanjianzi");
		
		
		radio= URLDecoder.decode(radio, "UTF-8");
		guanjianzi= URLDecoder.decode(guanjianzi, "UTF-8");
		
		//System.out.println(radio + guanjianzi);
		
		WriteRecordInfoDaoImpl wridi = new WriteRecordInfoDaoImpl();
		ArrayList<WriteRecordInfo> list = null;
		
		JSONArray jsonArray = new JSONArray();

		
		//String qqq = "013";
		
		//String sql1 = "select * from HEXINFO where cartype =" +"'"+chexing +"'"+ " and starttime<="+"'"+starttime1+"'"+" and endtime>="+"'"+endtime1+"'"+" order by id desc ";
		StringBuffer sql = new StringBuffer("select Top 5000 * from ECUINFO "/*where 1=1 */);
		//开始拼接字符串
		//SELECT * FROM [shangchai].[dbo].[ECUINFO] where ECUDate like '%012%';
		if (guanjianzi!="")  sql.append(/*" and "+*/"where "+radio+" like "+"'%"+guanjianzi+"%'");

		sql.append(" order by ECUDate DESC");
		
		
		
		
		System.out.println(sql);
	
		list = (ArrayList<WriteRecordInfo>) wridi.query(sql.toString());
		
		jsonArray=JSONArray.fromObject(list);
		
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
	
	
}


package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.seu.beans.HexInfo;
import com.seu.beans.LogInfo;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.dao.impl.LogInfoDaoImpl;
//在填写申请表单时，为了防止用户填错原有的状态，我们用这个servlet帮助用户，查询出原来的state。
public class QueryStatebysjljhversion extends HttpServlet {
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
		//System.out.println("hello QueryManagement_log!");
		
		String sjljh = (String)request.getParameter("sjljh");
		String version = (String) request.getParameter("version");
		
		//String clr= URLDecoder.decode(clr1, "UTF-8");
		//System.out.println(sjljh + "        " +version);
		//ArrayList<String> list = new ArrayList<String>();
		JSONArray jsonArray = new JSONArray();
		HexInfoDaoImpl hidi = new HexInfoDaoImpl();
		HexInfo hexInfo = hidi.queryby_sjljh_version(sjljh, version);
		
		if(hexInfo.getSjljh() == null){//就是查不到对应的HexInfo的情况
			//System.out.println("为空");
			jsonArray=JSONArray.fromObject(-2);
		}else{
			jsonArray=JSONArray.fromObject(hexInfo.getState());
		}//只返回一个表示状态的数字
		
		
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
	
	
}

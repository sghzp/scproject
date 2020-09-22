
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
import com.seu.beans.IniInfo;
import com.seu.beans.UserInfo;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.dao.impl.IniInfoDaoImpl;
import com.seu.dao.impl.UserInfoDaoImpl;

public class Autocomplete extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			 // System.out.println("in servlet!");
			  response.setContentType("text/html;charset=utf-8");
			  PrintWriter out = response.getWriter();
			  JSONArray jsonArray = new JSONArray();
			  String q = new String(request.getParameter("term").getBytes("ISO-8859-1"), "UTF-8");// autocomplete请求参数
			  String type = new String(request.getParameter("type").getBytes("ISO-8859-1"), "UTF-8");
			String sjljhecuorder1 = (String)request.getParameter("sjljhecuorder");
				
				//System.out.println(type);
				
			String sjljhecuorder= URLDecoder.decode(sjljhecuorder1, "UTF-8");
			  
//System.out.println("type》》》》》》》》"+type);
			  
			  //System.out.println(request.getParameter("term"));
			  //删除首尾的空格
			  if("sjljh".equals(type) && "ecuorder".equals(type) && "clr".equals(type) && ((q==null||q.trim().equals("")))){
			      return;
			  }
//System.out.println("type》》》》》》》》"+type);
			  HexInfoDaoImpl hidi = new HexInfoDaoImpl();
			  IniInfoDaoImpl iidi = new IniInfoDaoImpl();
			  UserInfoDaoImpl usdi = new UserInfoDaoImpl();
			  List<HexInfo> list1 = null;
			  List<IniInfo> list2 = null;
			  List<UserInfo> list3 = null;
			  
			  String sql = null;
			  if("sjljh".equals(type)){
				  sql = "select distinct sjljh from HEXINFO where sjljh like '" + q + "%'";
				  list1 = hidi.query_distinct(sql,"sjljh");
			  }else if("version".equals(type)){
				  sql = "select distinct version from HEXINFO where version like '" + q + "%' and sjljh = '" + sjljhecuorder + "'";
				  list1 = hidi.query_distinct(sql,"version");
			  }else if("ecuorder".equals(type)){
				  sql = "select distinct ecuorder from INIINFO where ecuorder like '" + q + "%'";
				  list2 = iidi.query_distinct(sql,type);
			  }else if("sbm".equals(type)){
				  sql = "select distinct sbm from INIINFO where sbm like '" + q + "%' and ecuorder = '" + sjljhecuorder + "'";
				  list2 = iidi.query_distinct(sql,type);
			  }else if("clr".equals(type)){
				  sql = "select distinct name from USERINFO where name like '" + q + "%'";
				  list3 = usdi.query_distinct(sql,type);
			  }else if("clrgh".equals(type)){
					//System.out.println(sql);
				  sql = "select distinct num from USERINFO where num like '" + q + "%' and name = '" + sjljhecuorder + "'";
				  list3 = usdi.query_distinct(sql,type);
		//System.out.println(sql);
			  }
			  if(list1 == null
					  && list2 == null){
				  jsonArray.add(list3);
			  }else if(list2 == null
					  && list3 == null){
				  jsonArray.add(list1);
			  }else if(list1 == null
					  && list3 == null){
				  jsonArray.add(list2);
			  }
			  

			  
			  //System.out.println(jsonArray.size());
			  //System.out.println(jsonArray);
			  out.println(jsonArray);
			  
			  out.flush();
			  out.close();
			 }
}


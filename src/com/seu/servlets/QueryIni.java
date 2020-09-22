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

import com.seu.beans.IniInfo;
import com.seu.dao.impl.IniInfoDaoImpl;

public class QueryIni extends HttpServlet {
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
		//System.out.println("hello QueryIni!");
		
		String ecuorder = (String)request.getParameter("ecuorder");
		//String ecutype = (String)request.getParameter("ecutype");
		String scr = (String)request.getParameter("scr");
		String sjljh = (String)request.getParameter("sjljh");
		//String sbm = (String)request.getParameter("sbm");
		String shzt = (String)request.getParameter("shzt");
		
		ecuorder= URLDecoder.decode(ecuorder, "UTF-8");
		//ecutype= URLDecoder.decode(ecutype, "UTF-8");
		scr = URLDecoder.decode(scr, "UTF-8");
		sjljh= URLDecoder.decode(sjljh, "UTF-8");
		//sbm = URLDecoder.decode(sbm, "UTF-8");
		shzt = URLDecoder.decode(shzt, "UTF-8");
		
		//System.out.println(version.length());
		//System.out.println(ecutype+"***"+sjljh+"***"+state+"***"+wtdbgdbh+"***"+hclcj+"***"+version);
		IniInfoDaoImpl iniInfoDaoImpl = new IniInfoDaoImpl();
		List<IniInfo> iniInfos = null;
		
		JSONArray jsonArray = new JSONArray();

		

		
		//String sql1 = "select * from HEXINFO where cartype =" +"'"+chexing +"'"+ " and starttime<="+"'"+starttime1+"'"+" and endtime>="+"'"+endtime1+"'"+" order by id desc ";
		StringBuffer sql = new StringBuffer("select * from INIINFO where 1=1");
		//开始拼接字符串
		//精确查询
/*		if(ecutype.length() != 0){
			sql.append(" and ECUType="+"'"+ecutype +"'");
		}
		if(sjljh.length() != 0){
			sql.append(" and sjljh="+"'"+sjljh +"'");
		}
		if(ecuorder.length() != 0){
			sql.append(" and ECUOrder="+"'"+ecuorder +"'");
		}
		if(sbm.length() != 0){
			sql.append(" and sbm="+"'"+sbm +"'");
		}
		if(shzt.length() != 0){
			sql.append(" and shzt="+"'"+shzt +"'");
		}*/
	
		//模糊查询
/*		if (ecutype.length() != 0) {
			sql.append(" and ECUType like " + "'%" + ecutype + "%'");
		}*/
		if (scr.length() != 0) {
			sql.append(" and scr like " + "'%" + scr + "%'");
		}
		if (sjljh.length() != 0) {
			sql.append(" and sjljh like " + "'%" + sjljh + "%'");
		}
		if (ecuorder.length() != 0) {
			sql.append(" and ECUOrder like " + "'%" + ecuorder + "%'");
		}
		if (shzt.length() != 0) {
			sql.append(" and state=" +  shzt );
		}
		
		sql.append(" order by scrq desc");
		
		
		
		//String bian = "变";
		//String sql1 = "select * from HEXINFO where Version="+"'"+bian +"'";
		iniInfos = iniInfoDaoImpl.query(sql.toString());
		//hexInfos = hexInfoDaoImpl.query(sql1);
		
		jsonArray=JSONArray.fromObject(iniInfos);
		
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
	
	
}

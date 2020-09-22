package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.seu.beans.IniInfo;
import com.seu.dao.impl.IniInfoDaoImpl;

public class QueryIni_mydata extends HttpServlet {
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
		String ecutype = (String)request.getParameter("ecutype");
		String sjljh = (String)request.getParameter("sjljh");
		//String sbm = (String)request.getParameter("sbm");
		String shzt = (String)request.getParameter("shzt");
		String type = (String)request.getParameter("type");
		String order = (String)request.getParameter("order");
		
		
		ecuorder= URLDecoder.decode(ecuorder, "UTF-8");
		ecutype= URLDecoder.decode(ecutype, "UTF-8");
		sjljh= URLDecoder.decode(sjljh, "UTF-8");
		//sbm = URLDecoder.decode(sbm, "UTF-8");
		shzt = URLDecoder.decode(shzt, "UTF-8");
		type = URLDecoder.decode(type, "UTF-8");
		order = URLDecoder.decode(order, "UTF-8");
		
		
		//System.out.println(version.length());
		//System.out.println(ecutype+"***"+sjljh+"***"+state+"***"+wtdbgdbh+"***"+hclcj+"***"+version);
		IniInfoDaoImpl iniInfoDaoImpl = new IniInfoDaoImpl();
		List<IniInfo> iniInfos = null;
		
		JSONArray jsonArray = new JSONArray();

		HttpSession session = request.getSession();
		String shangchuanren = (String)session.getAttribute("username");
		StringBuffer sql = new StringBuffer("select * from INIINFO where Scr="+"'"+shangchuanren+"'");
		sql.append(" order by scrq desc");
		iniInfos = iniInfoDaoImpl.query(sql.toString());
		//hexInfos = hexInfoDaoImpl.query(sql1);
		
		/**
		 * 将每个对象的State0，1，2，3，4对应成中文
		 */
		
		for(IniInfo i : iniInfos){
			if(i.getState() == 0){
				
			}
		}
		
		
		
		jsonArray=JSONArray.fromObject(iniInfos);
		
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
	
	
}

package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.seu.Global.Path;
import com.seu.beans.HexInfo;
import com.seu.dao.impl.HexInfoDaoImpl;

public class QueryHex_mydata extends HttpServlet {
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
		//System.out.println("为hex/pfile服务！");
		
		String ecutype = (String)request.getParameter("ecutype");
		String sjljh =(String) request.getParameter("sjljh");
		String state = (String)request.getParameter("state");
		//String hclcj =(String) request.getParameter("hclcj");
		String bz2 = (String)request.getParameter("bz2");
		String type = (String)request.getParameter("type");
		String order = (String)request.getParameter("order");
		
		ecutype= URLDecoder.decode(ecutype, "UTF-8");
		sjljh= URLDecoder.decode(sjljh, "UTF-8");
		state= URLDecoder.decode(state, "UTF-8");
		//hclcj= URLDecoder.decode(hclcj, "UTF-8");
		bz2= URLDecoder.decode(bz2, "UTF-8");
		type= URLDecoder.decode(type, "UTF-8");
		order= URLDecoder.decode(order, "UTF-8");
		//System.out.println(version.length());
		//System.out.println(ecutype+"***"+sjljh+"***"+state+"***"+wtdbgdbh+"***"+hclcj+"***"+version);
		HexInfoDaoImpl hexInfoDaoImpl = new HexInfoDaoImpl();
		List<HexInfo> hexInfos = null;
		
		JSONArray jsonArray = new JSONArray();
		HttpSession session = request.getSession();
		String shangchuanren = (String)session.getAttribute("username");

		
		StringBuffer sql = new StringBuffer("select * from HEXINFO where scz="+"'"+shangchuanren+"'");
		sql.append(" order by scrq desc");
		hexInfos = hexInfoDaoImpl.query(sql.toString());
		
		Map<String,String> map = Path.map2;
		//为了给每一个hexinfo的ecu型号改成相应的中文。
		for(int i = 0; i<hexInfos.size(); i++){
			hexInfos.get(i).setECUType(map.get(hexInfos.get(i).getECUType()));;
		}
		
		
		jsonArray=JSONArray.fromObject(hexInfos);
		
		
		//System.out.println(jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
	
	
}

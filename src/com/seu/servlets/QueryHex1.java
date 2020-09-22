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

import net.sf.json.JSONArray;

import com.seu.beans.HexInfo;
import com.seu.dao.impl.EcuBasicInfoImpl;
import com.seu.dao.impl.HexInfoDaoImpl;

public class QueryHex1 extends HttpServlet {
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
		String scr = (String)request.getParameter("scr");
		
		ecutype= URLDecoder.decode(ecutype, "UTF-8");
		sjljh= URLDecoder.decode(sjljh, "UTF-8");
		state= URLDecoder.decode(state, "UTF-8");
		//hclcj= URLDecoder.decode(hclcj, "UTF-8");
		bz2= URLDecoder.decode(bz2, "UTF-8");
		scr =  URLDecoder.decode(scr, "UTF-8");
		
		//System.out.println(scr);
		//System.out.println(ecutype+"***"+sjljh+"***"+state+"***"+wtdbgdbh+"***"+hclcj+"***"+version);
		HexInfoDaoImpl hexInfoDaoImpl = new HexInfoDaoImpl();
		List<HexInfo> hexInfos = null;
		
		JSONArray jsonArray = new JSONArray();

		

		
		//String sql1 = "select * from HEXINFO where cartype =" +"'"+chexing +"'"+ " and starttime<="+"'"+starttime1+"'"+" and endtime>="+"'"+endtime1+"'"+" order by id desc ";
		StringBuffer sql = new StringBuffer("select * from HEXINFO where 1=1");
		//开始拼接字符串
		//精确查询
		/*if(ecutype.length() != 0){
			sql.append(" and ECUType="+"'"+ecutype +"'");
		}
		if(sjljh.length() != 0){
			sql.append(" and sjljh="+"'"+sjljh +"'");
		}
		if(state.length() != 0){
			sql.append(" and state="+"'"+state +"'");
		}

		if(hclcj.length() != 0){
			sql.append(" and hclcj="+"'"+hclcj +"'");
		}
		if(version.length() != 0){
			sql.append(" and Version="+"'"+version +"'");
		}*/
		
		//模糊查询
		//模糊查询
		if (ecutype.length() != 0) {
			sql.append(" and ECUType like " + "'%" + ecutype + "%'");
		}
		if (sjljh.length() != 0) {
			sql.append(" and sjljh like " + "'%" + sjljh + "%'");
		}
		if (state.length() != 0) {
			sql.append(" and state=" + state);
		}
		if (bz2.length() != 0) {
			sql.append(" and bz2 like " + "'%" + bz2 + "%'");
		}
		if (scr.length() != 0) {
			sql.append(" and scz like " + "'%" + scr + "%'");
		}
		
		sql.append(" order by scrq desc");
		
		
		
		
		
		
		
		//String bian = "变";
		//String sql1 = "select * from HEXINFO where Version="+"'"+bian +"'";
		hexInfos = hexInfoDaoImpl.query(sql.toString());
		//hexInfos = hexInfoDaoImpl.query(sql1);
		
		Map<String,String> map = new EcuBasicInfoImpl().query5();
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

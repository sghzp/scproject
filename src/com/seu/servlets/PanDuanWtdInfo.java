
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

import com.seu.beans.HexInfo;
import com.seu.beans.MesInfo;
import com.seu.beans.WtdInfo;
import com.seu.dao.impl.EcuBasicInfoImpl;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.dao.impl.MesInfoDaoImpl;
import com.seu.dao.impl.WtdInfoDaoImpl;

public class PanDuanWtdInfo extends HttpServlet{
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
		//System.out.println("888888888888888");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		ArrayList<HexInfo> hexInfos = null;
		PrintWriter out = response.getWriter();
		String num = (String)request.getParameter("num");
		//String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state<=1";//新增空状态后还没有做相应修改
		//String sql1 = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state<=1";//空状态对应 -1。而以前的state<=1 只对应正常和临时两种状态
		MesInfoDaoImpl midi = new MesInfoDaoImpl();
		MesInfo mesInfo = midi.query_by_num(num);
		int check = 0;//1代表可以提交通过，0代表暂时不能通过（就是查询wtdinfo表后发现不行）
		WtdInfo wtdInfo = null;
		
		if(mesInfo.getStyle() == 0 && ("01".equals(mesInfo.getVersion()))){//特殊情况
			check = 1;
		}else{
			if(mesInfo.getDststate() == 0 || mesInfo.getDststate() == 1 ){//变为临时或正常状态要查询wtdinfo那个表
				WtdInfoDaoImpl widi = new WtdInfoDaoImpl();
				//if(mesInfo.getDststate() == 1 && mesInfo.getOristate() == -1){//空变临时
				if(mesInfo.getDststate() == 1){
					wtdInfo = widi.query(mesInfo.getSjljh(), mesInfo.getVersion(), 0);
				//}else if(mesInfo.getDststate() == 0 && mesInfo.getOristate() == 1){//临时变正常
				}else if(mesInfo.getDststate() == 0){
					wtdInfo = widi.query(mesInfo.getSjljh(), mesInfo.getVersion(), 1);
				}
				if(wtdInfo.getId() == 0){//说明没有找到相应的wtdInfo
					check = 0;
				}else{
					check = 1;
				}
				
			}else{
				check = 1;
			}
		}
		
		
		
		
		
		
		JSONArray jsonArray = new JSONArray();	
		jsonArray=JSONArray.fromObject(check);
		
		
		out.write(jsonArray.toString());
		out.flush();
		out.close();
			
	}
	
}

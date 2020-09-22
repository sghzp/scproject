
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
import com.seu.dao.impl.IniInfoDaoImpl;
import com.seu.dao.impl.MesInfoDaoImpl;
import com.seu.dao.impl.WtdInfoDaoImpl;

public class PanDuanWtdInfo_Tiqian extends HttpServlet{
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
		String sjljh = (String)request.getParameter("sjljh");
		String version = (String)request.getParameter("version");
		String style = (String)request.getParameter("style");
		String dststate = (String)request.getParameter("dststate");
		String oristate = (String)request.getParameter("oristate");
		System.out.println(sjljh+version+style+dststate+oristate);
		//String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state<=1";//新增空状态后还没有做相应修改
		//String sql1 = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state<=1";//空状态对应 -1。而以前的state<=1 只对应正常和临时两种状态
		int check = 0;//1代表可以提交通过，0代表暂时不能通过（就是查询wtdinfo表后发现不行）
		WtdInfo wtdInfo = null;
		
		if("0".equals(style) && ("01".equals(version))){//特殊情况
			check = 1;
		}else{
			if( (("1".equals(dststate)) && ("-1".equals(oristate)))  || (("0".equals(dststate)) && ("1".equals(oristate)))  ){//变为临时或正常状态要查询wtdinfo那个表
						
					if((("0".equals(style)) && (new HexInfoDaoImpl().ifhave_normal_sjljh(sjljh))) || ( ("1".equals(style)) && (new IniInfoDaoImpl().ifhave_normal_ecuorder(sjljh)))){//只有该数据零件号或订货号原来存在正常状态的数据时，才需要去wtdinfo表判断
						WtdInfoDaoImpl widi = new WtdInfoDaoImpl();
						//if(mesInfo.getDststate() == 1 && mesInfo.getOristate() == -1){//空变临时
						if("1".equals(dststate)){
							wtdInfo = widi.query(sjljh, version, 0);
							if(wtdInfo.getId() == 0){
								wtdInfo = widi.query(sjljh, version, 1);
							}
						//}else if(mesInfo.getDststate() == 0 && mesInfo.getOristate() == 1){//临时变正常
						}else if("0".equals(dststate)){
							wtdInfo = widi.query(sjljh, version, 1);
						}
						
						if(wtdInfo.getId() == 0){//说明没有找到相应的wtdInfo
							check = 0;
						}else{
							check = 1;
						}
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

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.MesInfoDaoImpl"%>
<%@ page import="com.seu.beans.MesInfo"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%@ page import="com.seu.beans.IniInfo"%>

<%
request.setCharacterEncoding("utf-8");//设置页面字符集
response.setCharacterEncoding("utf-8");
%>

<%
	String chuliriqi = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
	
	
	//String clyj = new String(request.getParameter("clyj").getBytes("ISO-8859-1"), "UTF-8");
	String num = (String)request.getParameter("num");
	
	
	MesInfoDaoImpl midi = new MesInfoDaoImpl();
	MesInfo mesInfo = midi.query_by_num(num);//先得到对象
	
	//mesInfo.setClzt(1);//（0-待处理，1-审核通过，2-驳回状态，3-撤销审核，4-撤销申请）
	mesInfo.setClzt(4);
	
	
	midi.updatemesInfo(mesInfo);//将处理状态改变
	
	String clzk = "申请已撤销-"+mesInfo.getSqsm()+"-"+mesInfo.getSqr()+"-"+chuliriqi+"-"+" ";
	midi.update_clzk(mesInfo, clzk);
	
	//接下来要根据mesInfo中的style位，得到是去改变Hexinfo还是IniInfo？
	if(mesInfo.getStyle() == 0){//0为数据零件号申请，1为整车信息申请
		HexInfoDaoImpl hidi = new HexInfoDaoImpl();
		HexInfo hexInfo = hidi.queryby_sjljh_version(mesInfo.getSjljh(), mesInfo.getVersion());
		hexInfo.setBz6("0");//0代表不在流程里
		hidi.updateHexInfo(hexInfo);
	}else{
		IniInfoDaoImpl iidi = new IniInfoDaoImpl();
		IniInfo iniInfo = iidi.queryby_ecuorder_sbm(mesInfo.getSjljh(), mesInfo.getVersion());
		iniInfo.setBz3("0");
		iidi.updateIniInfo(iniInfo);
	}
	
		
	
	boolean check2=true;
	if (check2) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='Tracing.jsp'");
		out.println("</script>");
	} else {//操作失败
		out.println("<script>");
		out.println("alert('操作失败');");
		out.println("window.location='Tracing.jsp'");
		out.println("</script>");
	}

	
%>
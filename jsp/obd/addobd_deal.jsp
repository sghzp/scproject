<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.JdbcUtils"%>
<%@ page import="com.seu.beans.ObdInfo"%>
<%@ page import="com.seu.dao.impl.ObdInfoDaoImpl"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>

<%
	/*
	 通知添加后台
	 */
	Connection conn = JdbcUtils.getConnection();
	request.setCharacterEncoding("GBK");//设置字符集
	ResultSet rs = null;//声明结果集

	//将上传文件保存到指定目录
	
	String shangchuanren = (String)session.getAttribute("username");
	
	String enginetype = (String) request.getParameter("enginetype");
	String obdxh = (String) request.getParameter("obdxh");
	String obdcj = (String) request.getParameter("obdcj");
	
	ObdInfoDaoImpl obdInfoDaoImpl = new ObdInfoDaoImpl();
	boolean check = obdInfoDaoImpl.addObdInfo(enginetype, obdxh, obdcj);
	
	LogInfoDaoImpl lidi = new LogInfoDaoImpl();
	String date = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
	lidi.addLogInfo(date, "用户"+shangchuanren+"增加发动机型号为"+enginetype+"的OBD管理信息成功");
 	

	//增加日志管理
	

	//******************************
	//************下边是存到数据库***************************
	
		/* LogInfoDaoImpl lidi = new LogInfoDaoImpl();
		lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+shangchuanren+"上传HEX数据零件号"+hexInfo.getSjljh()+"成功"); */
 	

	


	if (check) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='obd.jsp'");
		out.println("</script>");
	} else {//操作失败
			out.println("<script>");
			out.println("alert('操作失败');");
			out.println("history.go(-1)");
			//out.println("window.location='HexPfile.jsp'");
			out.println("</script>");
	}
	
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.JdbcUtils"%>
<%@ page import="com.seu.beans.ObdInfo"%>
<%@ page import="com.seu.dao.impl.ObdInfoDaoImpl"%>
<%@ page import="com.seu.ioutils.*"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashMap"%>
<%
	/*
	 通知添加后台
	 */
	Connection conn = JdbcUtils.getConnection();
	request.setCharacterEncoding("GBK");//设置字符集
	ResultSet rs = null;//声明结果集
	
	String ID1 = (String) request.getParameter("id");
	int id = Integer.parseInt(ID1);
	
	String shangchuanren = (String)session.getAttribute("username");
	String enginetype = (String) request.getParameter("enginetype");
	String obdxh = (String) request.getParameter("obdxh");
	String obdcj = (String) request.getParameter("obdcj");	

	ObdInfo obdInfo = new ObdInfo();
	
	obdInfo.setId(id);
	obdInfo.setEnginetype(enginetype);
	obdInfo.setOBDCJ(obdcj);
	obdInfo.setOBDXH(obdxh);
	
	boolean check = new ObdInfoDaoImpl().updateObdInfo(obdInfo);
	//更新操作要设定hexid的值。插入操作不用加入hexid的值，因为插入新行时，数据库的HEXID会自增
	
	//管理日志
	LogInfoDaoImpl lidi = new LogInfoDaoImpl();
	String date = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
	lidi.addLogInfo(date, "用户"+shangchuanren+"修改发动机型号为"+enginetype+"的OBD管理信息成功");


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
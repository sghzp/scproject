<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.JdbcUtils"%>
<%@ page import="com.seu.beans.UserInfo"%>
<%@ page import="com.seu.dao.impl.UserInfoDaoImpl"%>
<%@ page import="com.seu.ioutils.HandleFolder"%>
<%@ page import="com.seu.service.Ftpservice"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>

<%
	/*
	 通知添加后台
	 */
	Connection conn = JdbcUtils.getConnection();
	request.setCharacterEncoding("utf-8");//设置字符集
	
	String num = (String) request.getParameter("num");
	String name = (String) request.getParameter("name");
	String mail = (String) request.getParameter("mail");
	String department = (String) request.getParameter("department");
	
	UserInfo userInfo = new UserInfo();
	userInfo.setNum(num);
    userInfo.setName(name);
    userInfo.setMail(mail);
	userInfo.setDepartment(department);
	
	UserInfoDaoImpl userInfoDaoImpl = new UserInfoDaoImpl();
	boolean check = false;
	try{
		check = userInfoDaoImpl.addUser(userInfo);
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('用户已存在，请修改！');");
		out.println("history.go(-1)");
		//out.println("window.location='HexPfile.jsp'");
		out.println("</script>");
	}

	


	if (check) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='UserInfoPro.jsp'");
		out.println("</script>");
	} else {//操作失败
			out.println("<script>");
			out.println("alert('操作失败');");
			out.println("history.go(-1)");
			//out.println("window.location='HexPfile.jsp'");
			out.println("</script>");
	}
	
%>
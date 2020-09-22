<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.seu.ioutils.HandleFolder"%>

<%@ page import="com.seu.dao.impl.WriteRecordInfoDaoImpl"%>
<%
request.setCharacterEncoding("utf-8");//设置页面字符集
response.setCharacterEncoding("utf-8");
//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
%>

<%
	
	String ecudate1 = (String) request.getParameter("ecudate");
	
	
	//对传来的参数“解码”。why?
	String ecudate= new String( ecudate1.getBytes("iso-8859-1"), "UTF-8"); 


	
	//删除数据库中的数据
	WriteRecordInfoDaoImpl wridi = new WriteRecordInfoDaoImpl();
	System.out.println(ecudate);
	wridi.delete(ecudate);
	
	boolean check=true;
	if (check) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='WriteRecord.jsp'");
		out.println("</script>");
	} else {//操作失败
		out.println("<script>");
		out.println("alert('操作失败');");
		out.println("window.location='WriteRecord.jsp'");
		out.println("</script>");
	}
	out.flush();
   // out.close();
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>


<%@ page import="com.seu.dao.impl.ObdInfoDaoImpl"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.beans.ObdInfo"%>
<%
request.setCharacterEncoding("utf-8");//设置页面字符集
response.setCharacterEncoding("utf-8");
//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
%>

<%
	String shangchuanren = (String)session.getAttribute("username");
	String id = (String)request.getParameter("id");
	int a = Integer.parseInt(id);
	//删除数据库中的数据
	ObdInfoDaoImpl wridi = new ObdInfoDaoImpl();
	wridi.delete(a);
	
	String sql = "select * from obd where ID="+id; 
	ResultSet rs = null;
	ArrayList<ObdInfo> obdInfos = null;
	ObdInfo obdInfo = null;	
	obdInfos = (ArrayList)wridi.query(sql);
	obdInfo = (ObdInfo)obdInfos.get(0);
	
		//管理日志
	LogInfoDaoImpl lidi = new LogInfoDaoImpl();
	String date = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
	lidi.addLogInfo(date, "用户"+shangchuanren+"删除发动机型号为"+obdInfo.getEnginetype()+"的OBD管理信息成功");
	
	boolean check=true;
	if (check) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='obd.jsp'");
		out.println("</script>");
	} else {//操作失败
		out.println("<script>");
		out.println("alert('操作失败');");
		out.println("window.location='obd.jsp'");
		out.println("</script>");
	}
	out.flush();
   // out.close();
%>
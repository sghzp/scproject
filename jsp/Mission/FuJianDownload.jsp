<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.seu.beans.MesInfo"%>
<%@ page import="com.seu.dao.impl.MesInfoDaoImpl"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.beans.Util1"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.ioutils.FileToZip"%>
<%@ page import="com.seu.ioutils.HandleFolder"%>
<%@ page import="java.io.File"%>
<%@ page import="com.seu.Global.*"%>
<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");
//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
%>
	<%
	
	String num = (String)request.getParameter("num");
	String whichfile = (String)request.getParameter("whichfile");
	String filename = null;;
	
	MesInfoDaoImpl midi = new MesInfoDaoImpl();
	MesInfo mesInfo = midi.query_by_num(num);
	
	
	 %>	




	<%
		//新建一个smartupload对象
	SmartUpload su = new SmartUpload();
	//上传初始化
	su.initialize(pageContext);//pageContext是JSP九大内置对象之一
	//设定允许上传的文件类型
	//su.setAllowedFilesList("hex");
	su.setContentDisposition(null);
	//下载文件
	//先组合路径字符串


	//设置路径，合成路径名
	StringBuffer path = new StringBuffer("");
	path.append(Path.ROOT_EOL);
	//path.append("eol");
	path.append("/");
	path.append("fujian");
	path.append("/");
	path.append(num);
	path.append("/");
	if("1".equals(whichfile)){
		System.out.println("fujian  1");
		path.append(mesInfo.getFJ1());
	}
	else if("2".equals(whichfile)){
		System.out.println("fujian  2");
		path.append(mesInfo.getFJ2());
	}
	else if("3".equals(whichfile)){
		System.out.println("fujian  3");
		path.append(mesInfo.getFJ3());
	}
	try{
			su.downloadFile(path.toString());
	}
	catch(Exception e){
		out.println("<script>");
		out.println("alert('文件不存在，请联系管理员或上传者！');");
		out.println("history.go(-1)");
		out.println("</script>");
		out = pageContext.pushBody();
	}	
	boolean check2=true;
	if (check2) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='Dealing.jsp?num='"+num);
		out.println("</script>");
	} else {//操作失败
		out.println("<script>");
		out.println("alert('操作失败');");
		out.println("window.location='Dealing.jsp?num='"+num);
		out.println("</script>");
	}
	out.clear();
	
	out = pageContext.pushBody();
	
	
	
	
	 %>




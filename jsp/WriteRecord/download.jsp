<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.beans.Util1"%>

<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");
//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'HexPfile.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
	HexInfoDaoImpl hidi = new HexInfoDaoImpl();
	ArrayList<HexInfo> hexInfos = null;
	String sjljh1 = (String)request.getParameter("sjljh");
	String sjljh= new String( sjljh1.getBytes("iso-8859-1"), "UTF-8");
	String version1 = (String)request.getParameter("version");
	String version= new String( version1.getBytes("iso-8859-1"), "UTF-8");
	
	String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and version="+"'"+version+"'";
	hexInfos = hidi.query(sql);
	%>
	
	<%
		if(hexInfos.size() != 0){
	%>
			<%
			/* String HEXID1 = (String)request.getParameter("HEXID");
			String HEXID= new String( HEXID1.getBytes("iso-8859-1"), "UTF-8"); */ 
			int hexid = hexInfos.get(0).getHEXID();
			HexInfo hi = new HexInfoDaoImpl().query(hexid);
			response.sendRedirect(basePath+"/jsp/HexPfile/DownloadAll_deal.jsp?ecutype="+hi.getECUType()+"&sjljh="+hi.getSjljh()+"&version="+hi.getVersion()+"&hexname="+hi.getHEXFile()+"&HEXID="+hi.getHEXID());
			 %>	
		
			
<%-- 			<script src="js/jquery-1.9.1.min.js"></script>
			<script>
				var ecutype = "<%=hi.getECUType()%>";
				var sjljh = "<%=hi.getSjljh()%>";
				var version = "<%=hi.getVersion()%>";
				var hexname1 = "<%=hi.getHEXFile()%>";
				var hexname = encodeURIComponent(hexname1);
				var id = "<%=hi.getHEXID()%>";
	    		window.location.href="<%=basePath%>/jsp/HexPfile/DownloadAll_deal.jsp?ecutype="+ecutype+"&sjljh="+sjljh+"&version="+version+"&hexname="+hexname+"&HEXID="+id;
			
			</script>

			
		  </head> --%>
		  
		  <body>
		
		  </body>
		  
		<% }else{
				
		%> 
		
		</head>
		  <body> 
		 <script>
		 alert('不存在可下载的Hex文件！')
		 window.location.href="<%=basePath%>/jsp/WriteRecord/WriteRecord.jsp";
		 </script>
		  </body>
		  <% }%>
</html>

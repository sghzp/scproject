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
	//这里应该是什么规则？
	String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state=0 and shzt='已审核'";
	hexInfos = hidi.query(sql);
	
	String sql2 = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state=1 and shzt='已审核' order by version";
	ArrayList<HexInfo> hexInfos2 = null;
	hexInfos2 = hidi.query(sql2);
	
	%>
	
	<%
		if(hexInfos.size() != 0){
	%>
			<%
			/* String HEXID1 = (String)request.getParameter("HEXID");
			String HEXID= new String( HEXID1.getBytes("iso-8859-1"), "UTF-8"); */ 
			int hexid = hexInfos.get(0).getHEXID();
			HexInfo hi = new HexInfoDaoImpl().query(hexid);
			response.sendRedirect(basePath+"/jsp/CarManage/seeWholeCar.jsp?ecutype="+hi.getECUType()+"&HEXID="+hi.getHEXID());
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
			
			</script> --%>
			
		  </head>
		  
		  
		<% }else if(hexInfos2.size() != 0){//下载临时状态的文件，需要用户选择
		%>
				<html>
					<head>
						<script src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
						<script>
							function see(){
								var version = $("input[name='version']:checked").val();
								var sjljh = "<%=sjljh%>";
								//alert(version);
								if(version == undefined){
									//alert(version);
									alert("请选择版本号！");
								}else{
									window.location.href="<%=basePath%>/jsp/CarManage/seeWholeCar.jsp?sjljh="+ sjljh +"&version=" + version;
								}
								
							}
							function fanhui(){
								window.location.href="<%=basePath%>/jsp/CarManage/CarManage.jsp";
							}
						</script>
					</head>
					<body>
						<div align="center">
							<h1>请选择临时状态下的版本号：</h1>
								<%
									for(HexInfo h : hexInfos2){//DownloadAll_deal_for_linshistate.jsp
										%>
											<label><input id="version" name="version" type="radio" value="<%=h.getVersion()%>" /><%=h.getVersion()%></label>
											<br></br>
										<%
									}
								 %>
								 <input type="button" value="查看" onclick="see()"/>
								 <input type="button" value="返回" onclick="fanhui()"/>
						</div>
					</body>
				</html>
			<%
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}else{
				
		%> 
		
	
		
		 <script>
		 alert('不存在正常状态的数据零件号文件！');
		 window.location.href="<%=basePath%>/jsp/CarManage/CarManage.jsp";
		 </script>
	
		  <% }%>
</html>

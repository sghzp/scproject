<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.seu.beans.LogInfo"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>管理日志</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	
	<!-- 为了省事  直接用hexpfile.js了 -->
	<!-- <script src="js/WriteRecord.js"></script> -->
	
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/HexPfile.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/datagrid-scrollview.js"></script>
  	<script type="text/javascript" src="js/chart_Managementlog.js"></script>
	

	
	
  </head>
  
  <body>
   <table width = 100%>
   <tr>
   <td>
    <div id="chaxuntiaojian" style="width : 84%">
    	<form name="chaxuntiaojian" action="" method="post">
    		
    		<table width = 100%>
    			<tr style="background:#c9c9c9;">
    				<td>维护内容<input name="tiaojian" type="radio" value="datalog" id="datalog" checked="checked"/></td>
    				<td>维护时间<input name="tiaojian" type="radio" value="time" id="time"/></td>
    				<td><!-- 用户<input name="tiaojian" type="radio" value="datalog" id="datalog"/> --></td>
    				<td><!-- 数据零件号<input name="tiaojian" type="radio" value="datalog" id="datalog"/> --></td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    				<td>关键字：</td>
    				<td><input type="text" name="guanjianzi" id="guanjianzi" onkeydown="keydownEvent()"/></td>
    				<td><input name="cx" type="button" value="查询" onclick="query()" style="height:30; width:100"/></td>
    				<td><input type="text" value="" style="width:0;height:0;background:#c9c9c9;border:dotted #c9c9c9"> </td>
    				
    			</tr>
    		</table>
    	</form>	
    </div>
    </td>
    </tr>
    
    <tr>
    	<td>
			<div style="overflow: auto; width: 84%; height: 300" id="chaxunbiaogediv">
		    	<table height = 290  id="box">
	 
		    	</table>
		    </div>
	    </td>
    </tr>  
    </table>
    
    
   		   
  </body>
</html>
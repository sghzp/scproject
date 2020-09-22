<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>

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

	
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	
	<script src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/datagrid-scrollview.js"></script>
	<script type="text/javascript" src="js/MessageAlert.js"></script>
	<script>

	</script>
	
	
  </head>
  
  <body>
   <table id ="zhengti" width =110%>

    
    <tr>
    	<td>
		    <div style="overflow: auto; width: 84%; height: 300" id="chaxunbiaogediv">
		    	<table height = 290  id="box">
	 
		    	 </table>
		    </div>
	    </td>
    </tr>  
    </table>
    

    		<!-- <input name="fzxz" type="button" value="复制新增" />   -->  
  
  </body>
  
<!--   <script>
	$.post("./PanDuanQuanXian?quanxian=" +  "sc",null,function(data){	
	  	if(data == 0){
			$("#xz").attr('disabled',"true");
	 		$("#xg").attr('disabled',"true");
	 		$("#sc").attr('disabled',"true");
	 		$("#fzxz").attr('disabled',"true");
	  	}
	},"json");
  </script> -->
</html>

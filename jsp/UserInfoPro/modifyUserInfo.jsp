<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.seu.beans.UserInfo"%>
<%@ page import="com.seu.dao.impl.UserInfoDaoImpl"%>
<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");
String num = request.getParameter("num");
UserInfoDaoImpl userInfoDaoImpl = new UserInfoDaoImpl();
UserInfo userInfo = userInfoDaoImpl.query(num);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>修改密码</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	
	<!-- <script src="js/jquery-1.9.1.min.js"></script> -->
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script>

	function fanhui(){
		window.location.href="<%=basePath%>/jsp/UserInfoPro/UserInfoPro.jsp";
	}
	
	function tijiao000(){
		var department = $("#department").val();
		var mail = $("mail").val();
		if(department == "" || mail == ""){
			alert("请填写表格！");
		}else{
			form.action="<%=basePath%>/jsp/UserInfoPro/modifyUserInfo_deal.jsp";
			form.submit();
		}
	}
	
	
	
	</script>
	
	
  </head>
  
  <body>
  <div style="margin: 0 auto;width:40%;">
  <form name="form" action="" method="post">
   <table style=" font-size: 13px;border: 1px solid #000000;cellspacing: 0px; border-collapse:collapse;cellspacing:0px;height:30%;width:100%;background: #E0EEEE;">
  
    <tr>
    	<td>
		    <span style="font-size:15px">工号：</span>
	    </td>
	    <td>
	    	<input type="text" id="num" name="num" value="<%=userInfo.getNum()%>" readonly="readonly"/>
	    </td>
    </tr> 
    <tr>
    	<td>
		    <span style="font-size:15px">用户名：</span>
	    </td>
	    <td>
	    	<input type="text" id="name" name="name" value="<%=userInfo.getName()%>"  readonly="readonly"/>
	    </td>
    </tr>
    <tr>
    	<td>
		    <span style="font-size:15px">邮箱</span>
	    </td>
	    <td>
	    	<input type="text" id="mail" name="mail" value="<%=userInfo.getMail()%>"/>
	    </td>
    </tr>
    <tr>
    	<td>
		    <span style="font-size:15px">部门</span>
	    </td>
	    <td>
	    	<input type="text" id="department" name="department" value="<%=userInfo.getDepartment()%>"/>
	    </td>
    </tr>
    <tr>
    	<td></td>
    	<td>
    		<input type="button" id="tijiao" onclick="tijiao000()" value="提交" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff">
			<input type="button" id="tijiao" onclick="fanhui()" value="返回" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff">
    	</td>
    </tr> 
    </table>
    </form>
</div>
    		   
  </body>
</html>


<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>
<%
request.setCharacterEncoding("gbk");//设置页面字符集
response.setCharacterEncoding("GBK");

%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" id="css" href="css/addWholeCar.css"></link>
<script src="js/jquery-1.9.1.min.js"></script>


<script language="javascript">


function fanhui(){
window.location.href="<%=basePath%>/jsp/obd/obd.jsp";
}

function checkDo(){
/* 	var enginetype = $("#enginetype").val();
	var obdxh = $("#obdxh").val();
	var obdcj = $("#obdcj").val(); */
	var enginetype = $("#enginetype").val();
	$.post("./IfHaveObd?enginetype=" + enginetype+"&caozuo="+ "add",null,function(data){
			if(data == 0){//判断完所填信息是否唯一后，判断
				form.action="<%=basePath%>/jsp/obd/addobd_deal.jsp";
				form.submit();
			}else{
				alert("数据库中已存在相同发动机型号");
			}
		},"json");
	
	

}
</script>

</head>
<body>
<form name="form" action="" method="post">

	<div align="center">
		<h1>新增</h1>
	
		<table id="dataintable" >
			<tr style="height: 50px">
				<td>发动机型号</td>
				<td colspan="3"><input id="enginetype" name="enginetype" type="text" style="height: 30px; width: 300px"/></td>
			</tr>
			
			<tr style="height: 50px">
				<td>OBD型号</td>
				<td colspan="3"><input name="obdxh" type="text" style="height: 30px; width: 300px"/></td>
			</tr>
			
			<tr style="height: 50px">
				<td>OBD厂家</td>
				<td colspan="3"><input name="obdcj" type="text" style="height: 30px; width: 300px"/></td>
			</tr>
			<tr>
				<td colspan="4">
				<input type="button" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff" value="保存" onclick="checkDo()"/>
				<input type="button" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff" value="返回" onclick="fanhui()"/>
				</td>
			</tr>
			
		</table>
		
	</div>

</form>

</body>
</html>



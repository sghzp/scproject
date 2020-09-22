<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.dao.impl.MesInfoDaoImpl" %> 
<%@ page import="java.util.List" %> 
<%@ page import="com.seu.beans.MesInfo" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<% 
		List<MesInfo> arr = new MesInfoDaoImpl().query_fortheMission((String)session.getAttribute("bh"));
	%>
<title>main</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	font-family: 宋体;
}
a {
	font-size: 12px;
}
body {
	margin-left: 0px;
	margin-top: 10px;
	margin-right: 0px;
	margin-bottom: 0px;
}
a:link {
	color: #333333;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #333333;
}
a:hover {
	text-decoration: underline;
	color: #FF3300;
}
a:active {
	text-decoration: none;
	color: #333333;
}
-->
</style></head>
<body>

  <table width="95%" border="0" align="center" cellpadding="8" cellspacing="1" bgcolor="#1598CB">
    <tr>
      	<td bgcolor="#F1F5F8">用户： <%=session.getAttribute("username")%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																									<%int temp = 0;
																										for(MesInfo mi : arr){
																											//System.out.println(arr.size());
																											if(mi.getClzt() == 0 || mi.getClzt() == 2){
																												temp++;
																											}
																										}
																									 %>
				<a style="font-color:blue" href="jsp/Mission/Mission.jsp" target="main"><font color="red">待处理事项:  <%=temp%></font></a>
		</td>
<!-- 		<td bgcolor="#F1F5F8"><a style="font-color:blue" href="" target="main">消息:  0</a> 
			
			
		</td> -->
    </tr>
</table>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/style_top.css" rel="stylesheet" type="text/css" />
<title>top</title>
<style>
body{
font-size:12px;
margin:0;
padding:0;
background:url(images/admin_top_bg.gif) repeat-x top;
}
</style>
</head>

<body>
<img src="images/admin_top.gif" width="320" height="80" />
<img src="images/logo_scproject_no_word.png" width="70" height="70" />
<font size="5" style="font-weight:bold"><%=JdbcUtils.systemName%></font>
</body>
</html>

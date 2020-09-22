<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>上柴EOL数据管理平台</title>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /></head>
<frameset rows="80,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset rows="*" cols="180,*" framespacing="0" frameborder="no" border="0">
    <frame src="left.jsp" name="leftmenu" id="mainFrame" title="mainFrame" />
    <frameset rows="50,*" cols="*" framespacing="0" frameborder="no" border="0">
    <frame src="menu.jsp" name="topmenu" id="topmenu" title="mainFrame" />
     <!-- <frame src="jsp/Mission/Mission.jsp" name="main" scrolling="yes" noresize="noresize" id="rightFrame" title="rightFrame" /> -->
  
  	<frame src="<%=((((String)session.getAttribute("right")).toCharArray())[0] == '0' )  &&  ((((String)session.getAttribute("right")).toCharArray())[4] == '0' )  ? "jsp/HexPfile/HexPfile.jsp" : "jsp/Mission/Mission.jsp" %>" name="main" scrolling="yes" noresize="noresize" id="rightFrame" title="rightFrame" />
  	
  </frameset>
</frameset>
</frameset>
<noframes>
</html>

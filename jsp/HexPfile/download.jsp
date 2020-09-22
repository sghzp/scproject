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
	String HEXID1 = (String)request.getParameter("HEXID");
	String HEXID= new String( HEXID1.getBytes("iso-8859-1"), "UTF-8"); 
	int hexid = Integer.parseInt(HEXID);
	HexInfo hi = new HexInfoDaoImpl().query(hexid);
	int check = Util1.WhichToDownload(hi.getECUType());
	 %>	

	
	<script src="js/jquery-1.9.1.min.js"></script>
	<script>
	window.onload =function(){
		var check ="<%=check%>";
		 $("#hex").attr('disabled',"true");
		 $("#pfile").attr('disabled',"true");
		 $("#key").attr('disabled',"true");
		 $("#sbl").attr('disabled',"true");
		 $("#sre").attr('disabled',"true");
		 $("#dabao").attr('disabled',"true");
		if(check==1||check==3){
			$("#hex").removeAttr("disabled");		
		}
		if(check==0){
			$("#pfile").removeAttr("disabled");
			$("#key").removeAttr("disabled");
			$("#sbl").removeAttr("disabled");
			$("#dabao").removeAttr("disabled");
		}
		if(check==4){
			$("#sre").removeAttr("disabled");		
		}
	};
	</script>
	<script>

		function download1(){
	    //var test = "testhehe哈哈";
		var id = "<%=hexid%>";
		var whichfile = "1";
		//alert(id+whichfile);
		window.location.href="<%=basePath%>/jsp/HexPfile/Download_deal.jsp?whichfile="+whichfile+"&HEXID="+id;
		}
		function download2(){
	    //var test = "testhehe哈哈";
	    var id = "<%=hexid%>";
		var whichfile = "2";
		window.location.href="<%=basePath%>/jsp/HexPfile/Download_deal.jsp?whichfile="+whichfile+"&HEXID="+id;
		}
		function download3(){
	   var id = "<%=hexid%>";
	    //var test = "testhehe哈哈";
		var whichfile = "3";
		window.location.href="<%=basePath%>/jsp/HexPfile/Download_deal.jsp?whichfile="+whichfile+"&HEXID="+id;
		}
		function download4(){
	    //var test = "testhehe哈哈";
		var id = "<%=hexid%>";
		var whichfile = "4";
		window.location.href="<%=basePath%>/jsp/HexPfile/Download_deal.jsp?whichfile="+whichfile+"&HEXID="+id;
		}
		function download5(){
	    //var test = "testhehe哈哈";
		var id = "<%=hexid%>";
		var whichfile = "5";
		window.location.href="<%=basePath%>/jsp/HexPfile/Download_deal.jsp?whichfile="+whichfile+"&HEXID="+id;
		}
		
		function download6(){
	    //var test = "testhehe哈哈";
		var id = "<%=hexid%>";
		var whichfile = "6";
		window.location.href="<%=basePath%>/jsp/HexPfile/Download_deal.jsp?whichfile="+whichfile+"&HEXID="+id;
		}
	
	</script>
	
	
  </head>
  
  <body>
   <table width = 100%>
   <tr><td>
  <input name="hex" id="hex" type="button" value="下载HEX文件" onclick="download1()"/>
  </td></tr>
    <tr><td>
  <input name="pfile" id="pfile" type="button" value="下载Pfile文件" onclick="download2()"/>
  </td></tr>
    <tr><td>
  <input name="key" id="key" type="button" value="下载Key文件" onclick="download3()"/>
  </td></tr>
    <tr><td>
  <input name="sbl" id="sbl" type="button" value="下载SBL文件" onclick="download4()"/>
  </td></tr>
    <tr><td>
  <input name="sre" id="sre" type="button" value="下载SRE文件" onclick="download5()"/>
  </td></tr>
<!--       <tr><td>
  <input name="dabao" id="dabao" type="button" value="打包下载三个文件" onclick="download6()"/>
  </td></tr> -->
    </table>

  </body>
</html>

<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
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
<title>上柴EOL数据管理平台</title>
 <base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="css/easyui.css">
<link rel="stylesheet" type="text/css" href="css/icon.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">
	
	<!-- <script src="js/jquery-1.9.1.min.js"></script> -->
	
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/browserType.js" charset="utf-8"></script>


<link rel="stylesheet" type="text/css" id="css" href=""></link>
 
<STYLE>
body{
	background: #ebebeb;
	font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;
	color: #222;
	font-size: 12px;
}
*{padding: 0px;margin: 0px;}
.top_div{
	background: #008ead;
	width: 100%;
	height: 400px;
}
.ipt{
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
}
.ipt:focus{
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
}
.u_logo{
	background: url("images/username.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 43px;
	left: 40px;

}
.p_logo{
	background: url("images/password.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	left: 40px;
}
a{
	text-decoration: none;
}
.tou{
	background: url("images/tou.png") no-repeat;
	width: 97px;
	height: 92px;
	position: absolute;
	top: -87px;
	left: 140px;
}
.left_hand{
	background: url("images/left_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	left: 150px;
}
.right_hand{
	background: url("images/right_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	right: -64px;
}
.initial_left_hand{
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	left: 100px;
}
.initial_right_hand{
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	right: -112px;
}
.left_handing{
	background: url("images/left-handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -24px;
	left: 139px;
}
.right_handinging{
	background: url("images/right_handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -21px;
	left: 210px;
}

.ipt1 {	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
}
</STYLE>
     

 <script language="javascript">
 
 window.onload = function(){
	 if(jianchaliulanqi()){
		 
	 }else{
		 FalseMode();
	 }
 };
 
	function FalseMode() {
   	 	$("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: $(document).height() }).appendTo("body");
    	$("<div class=\"datagrid-mask-msg\"></div>").html("您的浏览器不支持该系统，请更换为IE9及以上版本！若浏览器版本正确，请在非兼容模式下登录系统。").appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(document).height() - 45) / 2 });
	}
 
 
 function jianchaliulanqi(){
	var arr = CheckBrowser();
	if(arr[0] == 'IE' && arr[1] > 8){
		return true;
		//alert("是IE浏览器9及以上版本");
	}else if(arr[0] == '火狐'){
		return true;
	}else{
		return false;
		//alert("您的浏览器不支持该系统，请更换为IE9及以上版本！");
	}
	 
 }
 
 function jianchaliulanqi_for_click(){
		var arr = CheckBrowser();
		if(arr[0] == 'IE' && arr[1] > 8){
			//return true;
			alert("是IE浏览器9及以上版本");
		}else{
			//return false;
			alert("您的浏览器不支持该系统，请更换为IE9及以上版本！若浏览器版本正确，请在非兼容模式下登录系统");
		}
		 
}
 
 function CheckBrowser() {  
     ua = navigator.userAgent;  
     ua = ua.toLocaleLowerCase(); 
     var browserVersion = "版本号";
     var browserType = "浏览器种类";
    // alert(ua);
     if (ua.match(/msie/) != null || ua.match(/trident/) != null) {  
         browserType = "IE";  
         browserVersion = ua.match(/msie ([\d.]+)/) != null ? ua.match(/msie ([\d.]+)/)[1] : ua.match(/rv:([\d.]+)/)[1];  
     } else if (ua.match(/firefox/) != null) {  
         browserType = "火狐";  
     } else if (ua.match(/opera/) != null) {  
         browserType = "欧朋";  
     } else if (ua.match(/chrome/) != null) {  
         browserType = "谷歌";  
     } else if (ua.match(/safari/) != null) {  
         browserType = "Safari";  
     }  
     var arr = new Array(browserType, browserVersion);  
     return arr;  
 }  
/*  function isIE(){
	 var userAgent = navigator.userAgent;
	 //可以判断IE7、8、9、10
	 if(userAgent.indexOf("MSIE") > 0){
		 return true;
	 }else{//包含IE11的情况
		 return false;
	 }
 } */
 
 function keydownEvent() {

	    var e = window.event || arguments.callee.caller.arguments[0];

	    if (e && e.keyCode == 13 ) {

	        checkDo();

	    }

	}
 
 function checkDo(){
	var sess = '<%=session.getAttribute("username")%>'; 
	//alert(sess);
	
	if(sess == 'null'){
		var check = 1;
		AddRunningDiv();
		if(check == 1){
				//alert("可以提交");
			yonghuxinxi.submit();
		}
	}else{
		alert("当前已有用户登录，请先退出当前用户！");
	}
	

}
 
	function AddRunningDiv() {
   	 	$("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: $(document).height() }).appendTo("body");
    	$("<div class=\"datagrid-mask-msg\"></div>").html("正在登录，请稍候...").appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(document).height() - 45) / 2 });
	}
 
 </script>
<meta name="GENERATOR" content="MSHTML 11.00.9600.17496"/></head> 
<BODY>
<!-- <form name="yonghuxinxi" id="yonghuxinxi" method="post" action="Login"> -->
<form name="yonghuxinxi" id="yonghuxinxi" method="post" action="Login">
<DIV class="top_div" align="center"><font color="#FFFFFF"><h1 style="font-size:30px"></br></br></br><%=JdbcUtils.systemName%></h1></font></DIV>

<DIV style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">

<DIV style="width: 165px; height: 96px; position: absolute;"></DIV>
<P style="padding: 30px 0px 10px; position: relative;"><SPAN 
class="u_logo"></SPAN>用户名：<input  type="text" class="ipt1"  name="username" id="username"/>
  </P>
<p style="position: relative;"><span class="p_logo"></span>
    密&nbsp;&nbsp;&nbsp;码：   <input  type="password" class="ipt1"  name="password" id="password" onkeydown="keydownEvent()"/>
</p>
	<DIV style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
	<P style="margin: 0px 35px 20px 45px;"><SPAN style="float: left;"></SPAN> 
	           <SPAN style="float: right;"><A style="color: rgb(204, 204, 204); margin-right: 10px;" 
	href="#"></A>  
	<input name="login" id="login" type="button" value="登录" style="border:1; height: 25px; width: 50px; 
						background: #15A3D9; color:#ffffff" onclick="checkDo()"/>
				<input type="reset" style="border:1; height: 25px; width: 50px; 
						background: #15A3D9; color:#ffffff" value="取消"/>
						
				<input type="button" style="border:1; height: 25px; width: 110px; 
						background: #15A3D9; color:#ffffff" value="检查浏览器版本" onclick="jianchaliulanqi_for_click()"/>
						
	           </SPAN>         </P>
	</DIV>
    <br/>  <br/> <br/>      
     建议使用浏览器为：IE9及以上版本(在非兼容模式下)。     
           
           
           
</DIV>
		   <div style="text-align:center;">

</div></form></BODY></HTML>

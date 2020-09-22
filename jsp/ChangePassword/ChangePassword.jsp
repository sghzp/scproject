<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");

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
	function forget(){
		alert("请联系信息中心陶汉兰！");
	}
	
	
	function tijiao(){
		var old = $("#old").val();
		var new_1 = $("#new_1").val();
		var new_2 = $("#new_2").val();
		if(old == "" || new_1 == "" || new_2 == ""){
			alert("请先填写新旧密码！");
		}else{
			if(new_1 == new_2){
					AddRunningDiv();
					$.post("./ChangePassword?old" + old +"&new_1=" + new_1+"&new_2=" + new_2,null,function(data){	
						MoveRunningDiv();
						if(data == 0){
							alert("更改成功！");
						}
						if(data == 1){
							alert("未查询到该用户信息");
						}
						if(data == 2){
							alert("新密码在前次已经使用过");
						}
						if(data == 3){
							alert("新密码长度太短");
						}
						if(data == 4){
							alert("新密码复杂度不符合要求同时包含数字、字母、及特殊符号");
						}
						if(data == 5){
							alert("新口令不一致");
						}
						if(data == 6){
							alert("原密码错误");
						}
						if(data == 7){
							alert("程序发生异常");
						}
						if(data == 8){
							alert("WebService未响应，请重试");
						}
						
						$("#old").val("");
						$("#new_1").val("");
						$("#new_2").val("");
					},"json");
			}else{
				alert("两次输入了不同的新密码！请重新修改！");
				$("#new_1").val("");
				$("#new_2").val("");
			}
		}	
	}

	
	function AddRunningDiv() {
   	 	$("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: $(document).height() }).appendTo("body");
    	$("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候...").appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(document).height() - 45) / 2 });
	} 

	function MoveRunningDiv() {
   	 	$("div[class='datagrid-mask']").remove();
    	$("div[class='datagrid-mask-msg']").remove();
	} 
	
	
	
	
	
	
	
	</script>
	
	
  </head>
  
  <body>
  <div style="margin: 0 auto;width:40%;">
   <table style=" font-size: 13px;border: 1px solid #000000;cellspacing: 0px; border-collapse:collapse;cellspacing:0px;height:30%;width:100%;background: #E0EEEE;">
  
    <tr>
    	<td>
		    <span style="font-size:15px">旧密码：</span>
	    </td>
	    <td>
	    	<input type="password" id="old" name="old"/>
	    </td>
    </tr> 
    <tr>
    	<td>
		    <span style="font-size:15px">新密码：</span>
	    </td>
	    <td>
	    	<input type="password" id="new_1" name="new_1"/>
	    </td>
    </tr>
    <tr>
    	<td>
		    <span style="font-size:15px">请重新输入新密码：</span>
	    </td>
	    <td>
	    	<input type="password" id="new_2" name="new_2" style="focus:yellow"/>
	    </td>
    </tr>
    <tr>
    	<td></td>
    	<td>
    		<input type="button" id="tijiao" onclick="tijiao()" value="提交" style=" height: 22px; width: 50px; 
					">
			<input type="button" id="tijiao" onclick="forget()" value="忘记密码？" style=" height: 22px; width: 80px; 
					">
    	</td>
    </tr> 
    </table>
</div>
    		   
  </body>
</html>


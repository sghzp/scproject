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
	<script type="text/javascript" src="js/obd.js"></script>
	<script>
		function xingzeng(){
    		window.location.href="<%=basePath%>/jsp/obd/addobd.jsp";
		}
		function modify(){
			var row = $('#box').datagrid('getSelected');
	    	if (row){
	    		var id = row.id;
				window.location.href="<%=basePath%>/jsp/obd/modifyobd.jsp?id="+id;
	    	}else{
	    		alert("请选择要修改的行");
	    	}
		
		}
		function del(){
		    var row = $('#box').datagrid('getSelected');
		    if (row){
		    	var id = row.id;
				window.location.href="<%=basePath%>/jsp/obd/deleteobd.jsp?id="+id;
		    }else{
		    	alert("请选择要删除的行");
		    }
		}
	</script>
	
	
  </head>
  
  <body>
   <table id ="zhengti" width =110%>
   <tr>
   <td>
    <div id="chaxuntiaojian" style="width : 84%">
    	<p>查询条件</p>
    	<form name="chaxuntiaojian" action="" method="post">
    		
    		<table width = 100%>
    		

    		
    			<tr style="background:#c9c9c9;">
    				<td><span style="font-size:15px">发动机型号</span>
						<input name="enginetype" type="text" value="" id="enginetype" onkeydown="keydownEvent()"/>
					</td>
					<td><span style="font-size:15px">OBD型号</span>
						<input name="obdxh" type="text" value="" id="obdxh" onkeydown="keydownEvent()"/>
					</td>
    				<td><span style="font-size:15px">OBD厂家</span>
    					<input name="obdcj" type="text" value="" id="obdcj" onkeydown="keydownEvent()"/>
    				</td>

    				
    				<td><input name="cx" type="button" value="查询" onclick="query()"style="height:30; width:100"/></td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    				<td></td>
    				<td></td>
    				<td></td>
    				<td></td>
    				<td></td>
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
    
    		<input id="xz" name="xz" type="button" value="新增" onclick="xingzeng()"style="height:30; width:100">

    		<input id="xg" name="xg" type="button" value="修改" onclick="modify()"style="height:30; width:100"/>
    		
    		<input id="sc" name="sc" type="button" value="删除" onclick="del()"style="height:30; width:100"/>
    		

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

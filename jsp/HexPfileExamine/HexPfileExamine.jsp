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
	<script src="js/HexPfile.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/datagrid-scrollview.js"></script>
  	<script type="text/javascript" src="js/chart_hexfileexamine.js"></script>
	
	
	<script>
	
	function see(){
		
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var id = row.HEXID;
	    	var ecutype = row.ECUType;
			window.location.href="<%=basePath%>/jsp/HexPfileExamine/seeWholeCar.jsp?HEXID="+id+"&ecutype="+ecutype;
	    }else{
	    	alert("请选择要查看的行");
	    }
		
	}

	function changecheck_0(){
	
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var id = row.HEXID;
	    	var check = 0;
			window.location.href="<%=basePath%>/jsp/HexPfileExamine/ChangeCheck.jsp?HEXID="+id+"&check="+check;
	    }else{
	    	alert("请选择行");
	    }
	}
	
	function changecheck_1(){
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var id = row.HEXID;
	    	var check = 1;
			window.location.href="<%=basePath%>/jsp/HexPfileExamine/ChangeCheck.jsp?HEXID="+id+"&check="+check;
	    }else{
	    	alert("请选择行");
	    }
	}




	
	</script>
	
	
  </head>
  
  <body>
   <table width = 110%>
   <tr>
   <td>
    <div id="chaxuntiaojian" style="width : 84%">
    	<p>查询条件</p>
    	<form name="chaxuntiaojian" action="" method="post">
    		
    		<table width = 100%>
    		
    		<%
				EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
				Map<String,String> m = ebii.query4();
				Iterator it = m.entrySet().iterator();
			 %>
    			<tr style="background:#c9c9c9;">
    				<td>ECU型号<select name="ECUType" size="1" id="ecutype">
					<option value="">请选择</option>
					<%
						while(it.hasNext()){
							Map.Entry<String,String> entry = (Map.Entry<String,String>)it.next(); 
							String key = (String)entry.getKey(); 
							String val = (String)entry.getValue();
					%>
					<option value="<%=val%>"><%=key%></option>
					<%
					}
					 %>
				
				</select></td>
					<td>发动机型号<input name="bz2" type="text" value="" id="bz2" onkeydown="keydownEvent()"/></td>
    				<td>数据零件号<input name="sjljh" type="text" value="" id="sjljh" onkeydown="keydownEvent()"/></td>
    				<td>状态<select name="state" size="1" id="state">
			    				<option value="">全部</option>
							    <option value="0">正常</option>
								<option value="1">临时</option>
								<option value="2">TP</option>
								<option value="3">备份</option>
								<option value="4">停用</option>
				   			</select></td>
    				
    				<td>审核状态
    						<select name="shzt" size="1" id="shzt">
			    				<option value="">全部</option>
							    <option value="未审核">未审核</option>
								<option value="已审核">已审核</option>
								
				   			</select></td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    				<td><input name="cx" type="button" value="查询" onclick="query()" style="height:30;width:100"/></td>
    				<td><span style="font-size:15px">按照</span><select id="type" onchange="querybyorder()">
    					<option value="">请选择</option>
    					<option value="sjljh">数据零件号</option>
    					<option value="ECUType">ECU型号</option>
    					<option value="bz2">发动机型号</option>
    					<option value="scrq">上传日期</option>
    					<option value="editdate">修改日期</option>
    					<option value="scz">上传人</option>
    				</select>
    				<span style="font-size:15px">进行</span>
    				<select id="shunxu"  onchange="querybyorder()">
    					<option value="asc">正序</option>
    					<option value="desc">倒序</option>
    				</select>
    				<span style="font-size:15px">排序</span></td>
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
    
    		<input id="ck" name="ck" type="button" value="查看" onclick="see()" style="height:30; width:100"/>
 			<input id="sh" name="sh" type="button" value="审核" onclick="changecheck_0()" style="height:30;width:100"/>
    		<input id="qxsh" name="qxsh" type="button" value="取消审核" onclick="changecheck_1()" style="height:30;width:100"/>    
    		<!-- <input name="fzxz" type="button" value="复制新增" />   -->  
  </body>
  <script>
  $.post("./PanDuanQuanXian?quanxian=" +  "sh",null,function(data){	
	  	if(data == 0){
	  	  	$("#sh").attr('disabled',"true");
	 		$("#qxsh").attr('disabled',"true");
	  	}
	},"json");

  </script>
</html>
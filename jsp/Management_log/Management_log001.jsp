<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.seu.beans.LogInfo"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>管理日志</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		.on
		{
		background:red;
		}		
	</style>
	
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/HexPfile.js"></script>
	<!-- 为了省事  直接用hexpfile.js了 -->
	<!-- <script src="js/WriteRecord.js"></script> -->
	<script>

	
	function query(){
	
	var radio = $('input:radio[name="tiaojian"]:checked').val();
	var guanjianzi = $("#guanjianzi").val();
	$.post("./QueryManagement_log?radio=" + encodeURI(encodeURI(radio)) +"&guanjianzi=" + encodeURI(encodeURI(guanjianzi)),null,function(data){	
		var tableStr = "<table width = 80% id='chaxunbiaoge'>";
		tableStr = tableStr
				+ "<tr id='biaoti'>"
				+ "<td class='xinxi' style='line-height:20px;'>维护时间</td>"
				+ "<td class='xinxi' style='line-height:20px;'>维护内容</td>"

				+ "</tr>";
			var len = data.length;
			
			for ( var i = 0; i < len; i++) {  
       			tableStr = tableStr + "<tr id='neirong'>"  
                +"<td style='line-height:20px;'>"+  data[i].time + "</td>"   
  				+"<td style='line-height:20px;'>"+  data[i].datalog + "</td>"



                +"</tr>";  
    		}
		
		tableStr = tableStr + "</table>";  
    	//添加到div中  
    	$("#chaxunbiaogediv").html(tableStr); 
		
		//默认设置第一行数据变红
			$("#chaxunbiaoge tr").first().next().addClass("on");
            //除了表头（第一行）以外所有的行添加click事件.

            $("#chaxunbiaoge tr").first().nextAll().click(function () {   
				$(this).addClass("on").siblings("tr").removeClass("on");
            });
            
            $("#chaxunbiaoge tr").addClass("gaodu");
		
	},"json");	
}
	
	</script>
	
	
  </head>
  
  <body>
   <table width = 100%>
   <tr>
   <td>
    <div id="chaxuntiaojian" style="width : 84%">
    	<p>查询条件</p>
    	<form name="chaxuntiaojian" action="" method="post">
    		
    		<table width = 100%>
    			<tr style="background:#c9c9c9;">
    				<td>维护时间<input name="tiaojian" type="radio" value="time" id="time" checked="checked"/></td>
    				<td>用户<input name="tiaojian" type="radio" value="datalog" id="datalog"/></td>
    				<td>数据零件号<input name="tiaojian" type="radio" value="datalog" id="datalog"/></td>
    				<td>订货号<input name="tiaojian" type="radio" value="datalog" id="datalog"/></td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    				<td>关键字：</td>
    				<td><input type="text" name="guanjianzi" id="guanjianzi"/></td>
    				<td><input name="cx" type="button" value="查询" onclick="query()"/></td>
    				<td></td>
    				
    			</tr>
    		</table>
    	</form>	
    </div>
    </td>
    </tr>
    
    <tr>
    	<td>
    		<p>查询结果表格</p>
		    <div style="overflow: auto; width: 84%; height: 300" id="chaxunbiaogediv">
		    	<table width = 80%  id="chaxunbiaoge">
		    		<tr height="10" id="biaoti">
		    			<td class="xinxi">维护时间</td>
		    			<td class="xinxi">维护内容</td>

		    		</tr>
		    		
		
		<%
			LogInfoDaoImpl lidi = new LogInfoDaoImpl();
		 	String sql = "select * from LOGINFO;";
		 	ArrayList<LogInfo> list = null;
		 	LogInfo logInfo = null;	
		 	list = (ArrayList<LogInfo>)lidi.query(sql);
			for(int i = 0; i<list.size(); i++){			
				logInfo = (LogInfo) list.get(i); 
		 %>
		    	
		    	    <tr height="10" id="neirong">
		    	    	<td class="xinxi"><%=logInfo.getTime()%></td>
		    	    	<td class="xinxi"><%=logInfo.getDatalog()%></td>		
		    		</tr>
		    		
		    <%
		    	} 
		     %>
		    	 
		    	    	
		    	</table>
		    </div>
	    </td>
    </tr>  
    </table>
    
    
    		   
  </body>
</html>



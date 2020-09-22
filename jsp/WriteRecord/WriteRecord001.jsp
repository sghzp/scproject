<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.seu.beans.WriteRecordInfo"%>
<%@ page import="com.seu.dao.impl.WriteRecordInfoDaoImpl"%>
<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>刷写记录</title>
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

	
	function del(){
		var ecudate = $(".on").find("td").first().next().next().next().next().next().next().next().next().next().next().text();
		window.location.href="<%=basePath%>/jsp/WriteRecord/Delete_deal.jsp?ecudate="+ecudate;
	} 
	
	function test001(){
		window.location.href="<%=basePath%>/jsp/WriteRecord/WriteRecord001.jsp";
	}
	
	function query(){
	
	var radio = $('input:radio[name="tiaojian"]:checked').val();
	var guanjianzi = $("#guanjianzi").val();
	$.post("./QueryWriteRecord?radio=" + encodeURI(encodeURI(radio)) +"&guanjianzi=" + encodeURI(encodeURI(guanjianzi)),null,function(data){	
		var tableStr = "<table width = 300% id='chaxunbiaoge'>";
		tableStr = tableStr
				+ "<tr id='biaoti'>"
				+ "<td class='xinxi' style='line-height:20px;'>订货号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>识别码</td>"
				+ "<td class='xinxi' style='line-height:20px;'>机型</td>"
				+ "<td class='xinxi' style='line-height:20px;'>主机号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>ECU序列号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>IQA码</td>"
				+ "<td class='xinxi' style='line-height:20px;'>HEX文件</td>"
				+ "<td class='xinxi' style='line-height:20px;'>INI文件</td>"
				+ "<td class='xinxi' style='line-height:20px;'>OBD生产厂家</td>"
				+ "<td class='xinxi' style='line-height:20px;'>操作员</td>"
				+ "<td class='xinxi' style='line-height:20px;'>刷写时间</td>"
				+ "</tr>";
			var len = data.length;
			
			for ( var i = 0; i < len; i++) {  
       			tableStr = tableStr + "<tr id='neirong'>"  
                +"<td style='line-height:20px;'>"+  data[i].ecuorder + "</td>"   
  				+"<td style='line-height:20px;'>"+  data[i].ecusn + "</td>"
 				+"<td style='line-height:20px;'>"+  data[i].ecutype + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].ecuid + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[1].obdtype + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].iqa + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].hex + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].ini + "</td>"
 				+"<td style='line-height:20px;'>"+  data[i].obdmanufacturer + "</td>"
 				+"<td style='line-height:20px;'>"+  data[i].operator + "</td>" 
				+"<td style='line-height:20px;'>"+  data[i].ecudate + "</td>"


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
    				<td>订货号<input name="tiaojian" type="radio" value="ecuorder" id="ecuorder" checked="checked"/></td>
    				<td>机型<input name="tiaojian" type="radio" value="ecutype" id="ecutype"/></td>
					<td>主机号<input name="tiaojian" type="radio" value="ecuid" id="ecuid"/></td>
					<td>HEX文件<input name="tiaojian" type="radio" value="hex" id="hex"/></td>
					<td>INI文件<input name="tiaojian" type="radio" value="ini" id="ini"/></td>
					<td>操作员<input name="tiaojian" type="radio" value="operator" id="operator"/></td>
					<td>刷写日期(格式为2015-11-29)<input name="tiaojian" type="radio" value="ecudate" id="ecudate"/></td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    				<td></td>
    				<td></td>
    				<td>关键字：</td>
    				<td><input type="text" name="guanjianzi" id="guanjianzi"/></td>
    				<td><input name="cx" type="button" value="查询" onclick="query()"/></td>
    				<td><input name="test" type="button" value="test" onclick="test001()"/></td>
    				<td><input name="sc" type="button" value="删除" onclick="del()"/></td>
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
		    	<table width = 300%  id="chaxunbiaoge">
		    		<tr height="10" id="biaoti">
		    			<td class="xinxi">订货号</td>
		    			<td class="xinxi">识别码</td>
		    			<td class="xinxi">机型</td>
		    			<td class="xinxi">主机号</td>
		    			<td class="xinxi">ECU序列号</td>
		    			<td class="xinxi">IQA码</td>
		    			<td class="xinxi">HEX文件</td>
		    			<td class="xinxi">INI文件</td>
		    			<td class="xinxi">OBD生产厂家</td>
		    			<td class="xinxi">操作员</td>
		    			<td class="xinxi">刷写时间</td>
		    		</tr>
		    		
		
		<%
			WriteRecordInfoDaoImpl wridi = new WriteRecordInfoDaoImpl();
		 	String sql = "select * from ECUINFO;";
		 	ArrayList<WriteRecordInfo> list = null;
		 	WriteRecordInfo writeRecordInfo = null;	
		 	list = (ArrayList<WriteRecordInfo>)wridi.query(sql);
			for(int i = 0; i<list.size(); i++){			
				writeRecordInfo = (WriteRecordInfo) list.get(i); 
		 %>
		    	
		    	    <tr height="10" id="neirong">
		    	    	<td class="xinxi"><%=writeRecordInfo.getEcuorder()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getEcusn()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getEcutype()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getEcuid()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getObdtype()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getIqa()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getHex()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getIni()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getObdmanufacturer()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getOperator()%></td>
		    	    	<td class="xinxi"><%=writeRecordInfo.getEcudate()%></td>

		    			
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
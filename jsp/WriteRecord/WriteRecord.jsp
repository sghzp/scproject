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

	
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	
	<!-- <script src="js/jquery-1.9.1.min.js"></script> -->
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  	
	<script type="text/javascript" src="js/datagrid-scrollview.js"></script>
	<script type="text/javascript" src="js/chart_WriteRecord.js"></script>
	

	<!-- 为了省事  直接用hexpfile.js了 -->
	<!-- <script src="js/WriteRecord.js"></script> -->
	<script>

	

function del(){
    var row = $('#box').datagrid('getSelected');
    if (row){
    	var ecudate = row.ecudate;
    	window.location.href="<%=basePath%>/jsp/WriteRecord/Delete_deal.jsp?ecudate="+ecudate;
    }else{
    	alert("请选择要删除的行");
    }
}


function downloadhex(){
	    
	var row = $('#box').datagrid('getSelected');
    if (row){
    			/////////////////////////////////////////////
	    		$("#xiazaihex").attr('disabled',"true");
		    	//setTimeout(function(){$('#xiazaihex').val('5s');},1000);
		    	//setTimeout(function(){$('#xiazaihex').val('4s');},2000);
		    	//setTimeout(function(){$('#xiazaihex').val('3s');},3000);
		    	//setTimeout(function(){$('#xiazaihex').val('2s');},4000);
		    	//setTimeout(function(){$('#xiazaihex').val('1s');},5000);
		    	//setTimeout(function(){$('#xiazaihex').val('0s');},6000);
		    	setTimeout(function(){
		    						  $("#xiazaihex").removeAttr("disabled");	
		    							},7000);
	    		///////////////////////////////////////////////
    	var ecuorder = encodeURIComponent(row.ecuorder);
    	var sbm = row.ecusn;
		<%-- $.post("./ForTheWriteRecord?ecuorder=" + ecuorder +"&sbm=" + sbm,null,function(data){	
			if(data == 0){
				alert("不存在可下载文件！");
			}else{
			    var sjljh = data[0].sjljh;
			    //alert(sjljh);
				window.location.href="<%=basePath%>/jsp/WriteRecord/download.jsp?sjljh="+sjljh;
			}
		},"json"); --%>
		var sjljh = encodeURIComponent(row.location);;
		var version = encodeURIComponent(row.obdmanufacturer);
		window.location.href="<%=basePath%>/jsp/WriteRecord/download.jsp?sjljh="+sjljh+"&version=" + version;
    	
    }else{
    	alert("请选择要下载的行");
    }

}
function downloadini(){
	var row = $('#box').datagrid('getSelected');
    if (row){
    	var ecuorder = encodeURIComponent(row.ecuorder);
    	var sbm = row.ecusn;
		$.post("./ForTheWriteRecord?ecuorder=" + ecuorder +"&sbm=" + sbm,null,function(data){	
			if(data == 0){
				alert("不存在可下载文件！");
			}else{
			    var sjljh = encodeURIComponent(data[0].sjljh);
			    var inifile = encodeURIComponent(data[0].INIFile);
			    var ecuorder = encodeURIComponent(row.ecuorder);
    			var sbm = encodeURIComponent(row.ecusn);
			    var ecutype = data[0].ECUType;
			    //alert(sjljh);
				window.location.href="<%=basePath%>/jsp/WriteRecord/DownloadIni.jsp?sjljh="+ sjljh + "&inifile=" + inifile +"&ecutype=" + ecutype+"&ecuorder=" + ecuorder+"&sbm=" + sbm;
			}
		},"json");
    	
    }else{
    	alert("请选择要下载的行");
    }
	
}
function downloadall(){
	var row = $('#box').datagrid('getSelected');
    if (row){
    	var ecuorder = encodeURIComponent(row.ecuorder);
    	var sbm = row.ecusn;
    	
    	/////////////////////////////////////////////
	    $("#dabao").attr('disabled',"true");
	    //setTimeout(function(){$('#dabao').val('5s');},1000);
	    //setTimeout(function(){$('#dabao').val('4s');},2000);
	    //setTimeout(function(){$('#dabao').val('3s');},3000);
	    //setTimeout(function(){$('#dabao').val('2s');},4000);
	    //setTimeout(function(){$('#dabao').val('1s');},5000);
	    //setTimeout(function(){$('#dabao').val('0s');},6000);
	    setTimeout(function(){
	    						  $("#dabao").removeAttr("disabled");	
	    						},7000);
	    ///////////////////////////////////////////////
    	
		$.post("./ForTheWriteRecord?ecuorder=" + ecuorder +"&sbm=" + sbm,null,function(data){	
			if(data == 0){
				alert("不存在可下载文件！");
			}else{
			    var sjljh = encodeURIComponent(row.location);;
				var version = encodeURIComponent(row.obdmanufacturer);
			    var inifile = encodeURIComponent(data[0].INIFile);
			    var ecutype = data[0].ECUType;
			    //alert(sjljh);
				window.location.href="<%=basePath%>/jsp/WriteRecord/DownloadAll_deal.jsp?sjljh="+ sjljh + "&inifile=" + inifile +"&ecutype=" + ecutype + "&ecuorder=" + ecuorder + "&sbm=" + sbm + "&version=" + version;
			}
		},"json");
    	
    }else{
    	alert("请选择要下载的行");
    }
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
    				<td>关键字：
	    				<!-- <select name="pagenumber" size="1" id="pagenumber">
						<option value="">请选择</option>
						</select> -->
					</td>
    				<td><input type="text" name="guanjianzi" id="guanjianzi" onkeydown="keydownEvent()"/></td>

    				<td><input name="cx" type="button" value="查询" onclick="query()" style="height:30; width:100"/></td>
    				<td><input id="xiazaihex" name="xiazaihex" type="button" value="下载hex/pfile" onclick="downloadhex()" style="height:30; width:100"/></td>
    				<td><input name="dc" type="button" value="导出整车信息" onclick="downloadini()" style="height:30; width:100"/></td>
    				<td><input id="dabao" name="xz" type="button" value="打包下载" onclick="downloadall()"style="height:30; width:125"/></td>
    				<td><input type="text" value="" style="width:0;height:0;background:#c9c9c9;border:dotted #c9c9c9"> </td>
    				
    				<!-- <td><input name="sc" type="button" value="删除" onclick="del()" style="height:30; width:100"/></td> -->
    			</tr>
    		</table>
    	</form>	
    </div>
    </td>
    </tr>
    
    <tr>
    	<td>
		    <div style="overflow: auto; width: 84%; height: 300" id="chaxunbiaogediv">
 				<table id="box" height = 290></table>
 				<!-- <input id="combobox" name="combobox"> -->
		    </div>
	    </td>
    </tr>  
    </table>

    		   
  </body>
</html>


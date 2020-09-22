<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.seu.beans.IniInfo"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");
/*
通知信息添加页面
*/
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CarManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/CarManage.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">

	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/datagrid-scrollview.js"></script>
  	<script type="text/javascript" src="js/chart_CarManage.js"></script>
	
	<script>
	function modify(){
	
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var id = row.INIID;
	    	var ecutype = row.ECUType;
			window.location.href="<%=basePath%>/jsp/CarManage/modifyIni.jsp?INIID="+id+"&ecutype="+ecutype;
	    }else{
	    	alert("请选择要修改的行");
	    }
	
	}

	function see(){
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var id = row.INIID;
	    	var ecutype = row.ECUType;
			window.location.href="<%=basePath%>/jsp/CarManage/seeIni.jsp?INIID="+id+"&ecutype="+ecutype;
	    }else{
	    	alert("请选择要查看的行");
	    }
	
	}

	
	function del(){
	
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var iniid = row.INIID;
	    	var ecuorder = row.ECUOrder;
	    	var ecutype = row.ECUType;
	    	var sjljh = row.sjljh;
	    	var inifile = row.INIFile;
	    	var sbm = row.sbm;
			window.location.href="<%=basePath%>/jsp/CarManage/Delete_deal.jsp?ecutype="+ecutype+"&sjljh="+sjljh+"&inifile="+inifile+"&iniid="+iniid+"&ecuorder="+ecuorder+"&sbm="+sbm;
	    }else{
	    	alert("请选择要删除的行");
	    }
	
	}
	
	function downloadhex(){
	
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	/////////////////////////////////////////////
	    	$("#hex").attr('disabled',"true");
	    	//setTimeout(function(){$('#hex').val('5s');},1000);
	    	//setTimeout(function(){$('#hex').val('4s');},2000);
	    	//setTimeout(function(){$('#hex').val('3s');},3000);
	    	//setTimeout(function(){$('#hex').val('2s');},4000);
	    	//setTimeout(function(){$('#hex').val('1s');},5000);
	    	//setTimeout(function(){$('#hex').val('0s');},6000);
	    	setTimeout(function(){
	    						  $("#hex").removeAttr("disabled");	
	    							},7000);
	    	///////////////////////////////////////////////
	    	var sjljh = encodeURIComponent(row.sjljh);
			window.location.href="<%=basePath%>/jsp/CarManage/download.jsp?sjljh="+sjljh;
	    }else{
	    	alert("请选择行");
	    }
	
	}
	
	function downloadini(){
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var ecutype = row.ECUType;
	    	var sjljh = encodeURIComponent(row.sjljh);
	    	var iniid = row.INIID;
	    	//var sjljh1 = "想+x";
	    	//var sjljh = encodeURI(sjljh1);
	    	var inifile = encodeURIComponent(row.INIFile);
			window.location.href="<%=basePath%>/jsp/CarManage/DownloadIni.jsp?ecutype="+ecutype+"&sjljh="+ sjljh +"&inifile="+inifile+"&iniid=" + iniid;
	    }else{
	    	alert("请选择行");
	    }
	}
	
	function downloadall(){
		var row = $('#box').datagrid('getSelected');

	    if (row){
	    	var ecutype = row.ECUType;
		    var sjljh = encodeURIComponent(row.sjljh);
		    var inifile = encodeURIComponent(row.INIFile);
			var ecuorder = encodeURIComponent(row.ECUOrder);
			var sbm = encodeURIComponent(row.sbm);
		    var iniid = row.INIID;
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
			window.location.href="<%=basePath%>/jsp/CarManage/DownloadAll_deal.jsp?ecutype="+ecutype+"&sjljh="+sjljh+"&inifile="+inifile+"&ecuorder="+ecuorder+"&sbm="+sbm+"&iniid="+iniid;
		}else{
	    	alert("请选择行");
	    }
	}
	
	function changestate(){
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var ecuorder = encodeURIComponent(row.ECUOrder);
			var sbm = encodeURIComponent(row.sbm);
			var state = row.state;
	    	var right = "<%=session.getAttribute("right")%>";
	    	$.post("./PanDuanEcuorder_shifouzailiuchengzhong?sjljh=" + ecuorder+"&version="+ sbm,null,function(data){
		    	if(data != 1){
				/*	if(state == '正常'){
			    		if(right[0] == '1'){
			    			window.location.href="<%=basePath%>/jsp/Mission/ChangeIni_new.jsp?sjljh="+ecuorder+"&version="+sbm;
			    		}else{
			    			alert("您没有权限修改正常状态下的数据！");
			    		}
			    	}else*/
                                {
			    		window.location.href="<%=basePath%>/jsp/Mission/ChangeIni_new.jsp?sjljh="+ecuorder+"&version="+sbm;
			    	}
		    	}else{
		    		alert("该条目已在申请变更的流程中！");
		    	}			
			},"json");	    	
			
	    	//var hexname = encodeURIComponent(row.HEXFile);
	    	//var id = row.HEXID;
	    	
	    	
	    }else{
	    	alert("请选择要申请的行");
	    }
	}
	
	function lookforsjljh(){
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var sjljh = encodeURIComponent(row.sjljh);
			window.location.href="<%=basePath%>/jsp/CarManage/Lookforsjljh.jsp?sjljh="+sjljh;
	    	
	    	
	    }else{
	    	alert("请选择要查看的行");
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
    				<td>订货号<input name="ecuorder" type="text" value="" id="ecuorder" onkeydown="keydownEvent()"/></td>
    				<%
						EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
						Map<String,String> m = ebii.query4();
						Iterator it = m.entrySet().iterator();
			 		%>
    				<td><%-- ECU型号
						<select name="ecutype" size="1" id="ecutype">
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
					
						</select> --%>
						上传人
						<input name="scr" type="text" value="" id="scr" onkeydown="keydownEvent()"/>
					</td>
    				<td>数据零件号<input name="sjljh" type="text" value="" id="sjljh" onkeydown="keydownEvent()"/></td>
    				
    				<td>识别码状态
    						<select name="shzt" size="1" id="shzt">
    						<!-- 虽然在这ID是审核状态（shzt），但后台查询的是识别码状态（state）。 -->
			    				<option value="">全部</option>
			    				<option value="-1">空</option>
			    				<option value="0">正常</option>
			    				<option value="1">临时</option>
			    				<option value="2">套牌</option>
			    				<option value="3">备份</option>
			    				<option value="4">停用</option>
			    				<option value="5">临时超限</option>
				   			</select>
    				</td>
    				<td></td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    			<td>
    				<input name="cx" type="button" value="查询" onclick="query()" style="height:30; width:100"/>
    				<input name="wdsj" type="button" value="我的数据" onclick="mydata()" style="height:30; width:100"/>
    			</td>
    				 <td><span style="font-size:15px">按照</span><select id="type" onchange="querybyorder()">
    					<option value="">请选择</option>
    					<option value="ECUType">ECU型号</option>
    					<option value="sjljh">数据零件号</option>
    					<option value="ECUOrder">订货号</option>
    					<option value="scrq">上传日期</option>
    					<option value="shrq">审核日期</option>
    					<option value="scr">上传人</option>
    					<option value="xgr">修改人</option>
    				</select>
    				<span style="font-size:15px">进行</span>
    				<select id="shunxu"  onchange="querybyorder()">
    					<option value="asc">正序</option>
    					<option value="desc">倒序</option>
    				</select>
    				<span style="font-size:15px">排序</span>
    			</td>
    				
    				<td><input id="hex" name="hex" type="button" value="下载hex/pfile" onclick="downloadhex()" style="height:30; width:100"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="dc" type="button" value="导出整车信息" onclick="downloadini()" style="height:30; width:100"/></td>
    				<td><input id="dabao" name="xz" type="button" value="打包下载" onclick="downloadall()"style="height:30; width:125"/></td>
    			</tr>
    		</table>
    	</form>	
    </div>
    </td>
    </tr>
    
    <tr>
    	<td>
		    <div style="overflow: auto; width: 84%; height: 270" id="chaxunbiaogediv">
		    	<table height = 270  id="box">
	 
		    	 </table>
		    </div>
	    </td>
    </tr>  
    </table>
    
    
 			<input id="xz" name="xz" type="button" value="新增" onclick="xingzeng()" style="height:30; width:100"/>
    		
    		<script>
    			function mydata(){
				    var ecutype = $("#ecutype").val();
					var ecuorder = $("#ecuorder").val();
					var sjljh = $("#sjljh").val();
					var shzt = $("#shzt option:selected").val();
					//var sbm = $("#sbm").val();
					var type = $("#type option:selected").val();;
					var order = $("#shunxu option:selected").val();; 
					
					$.post("./QueryIni_mydata?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&shzt=" + encodeURI(encodeURI(shzt))
							+ "&ecuorder="+ encodeURI(encodeURI(ecuorder))+ "&order="+ encodeURI(encodeURI(order))+ "&type="+ encodeURI(encodeURI(type)),null,function(data){	
						
						for(var i= 0; i<data.length; i++){
							if(data[i].state == '-1') data[i].state = "空";
							if(data[i].state == '0') data[i].state = "正常";
							if(data[i].state == '1') data[i].state = "临时";
							if(data[i].state == '2') data[i].state = "套牌";
							if(data[i].state == '3') data[i].state = "备份";
							if(data[i].state == '4') data[i].state = "停用";
							if(data[i].state == '5') data[i].state = "临时超限";
							//alert(data[i].state);
						}
					
						$("#box").datagrid({
							  	rownumbers: true,
							    data:data,
							  	singleSelect: true,	
							  	loadMsg:'数据加载中,请稍后...',
							  	title:'查询结果表格',
							  	autoRowHeight:false,
							  	view:scrollview,
							  	pageSize:15,
							  	fitColumns: false,
							    
							    columns:[[
							      
									      {field:'ECUOrder',title:'订货号',width:150,align:'left'},
									      {field:'sbm',title:'识别码',width:150,align:'left'},
									      {field:'state',title:'识别码状态',width:150,align:'left'},
									      {field:'sjljh',title:'数据零件号',width:150,align:'left'},
									      {field:'bz2',title:'发动机型号',width:150,align:'left'},
									      {field:'zcbm',title:'整车编码',width:150,align:'left'},
									      {field:'ECUType',title:'ECU型号',width:150,align:'left'},
									      {field:'times',title:'已刷写数',width:150,align:'left'},
									      {field:'scrgh',title:'上传人工号',width:150,align:'left'},
									      {field:'scr',title:'上传人',width:150,align:'left'},
									      {field:'scrq',title:'上传日期',width:150,align:'left'},
									      {field:'xgr',title:'修改人',width:150,align:'left'},
									      {field:'editDate',title:'修改日期',width:150,align:'left'},
									      {field:'INIFile',title:'INIFILE',width:150,align:'left'},
									      {field:'canWriteTimes',title:'可刷写次数',width:150,align:'left'},
									      {field:'bz1',title:'备注1',width:150,align:'left'}
							    ]]
							  })
					},"json");
    			}
    		
    		
	    		function xingzeng(){
	    			window.location.href="<%=basePath%>/jsp/CarManage/addIni.jsp";
	    		}
	    		function copyadd(){
	    					var row = $('#box').datagrid('getSelected');
						    if (row){
						    	var id = row.INIID;
						    	var ecutype = row.ECUType;
								window.location.href="<%=basePath%>/jsp/CarManage/copyadd_ini_first.jsp?INIID="+id+"&ecutype="+ecutype;
						    }else{
						    	alert("请选择要复制的行");
						    }
	    		}
	    			
    		</script>
    		<input id="xg" name="xg" type="button" value="修改" onclick="modify()" style="height:30; width:100"/>
    		<input id="ck" name="ck" type="button" value="查看" onclick="see()" style="height:30; width:100"/>
    		<!-- <input id="sc" name="sc" type="button" value="停用" onclick="del()" style="height:30; width:100"/> -->
    		<input id="fzxz" name="fzxz" type="button" value="复制新增" onclick="copyadd()" style="height:30; width:100"/>
    		<input id="changestate" name="changestate" type="button" value="状态变更申请" onclick="changestate()" style="height:30; width:120"/>
  			<input id="lookforsjljh" name="lookforsjljh" type="button" value="查看引用数据零件号信息" onclick="lookforsjljh()" style="height:30; width:150"/>
  </body>
  <script>
  	$.post("./PanDuanQuanXian?quanxian=" +  "sc",null,function(data){	
	  	if(data == 0){
	  	
		$("#xz").attr('disabled',"true");
 		$("#xg").attr('disabled',"true");
 		$("#sc").attr('disabled',"true");
 		$("#fzxz").attr('disabled',"true");
	  	$("#changestate").attr('disabled',"true");
	  	}
	},"json");
  

  </script>
  
</html>

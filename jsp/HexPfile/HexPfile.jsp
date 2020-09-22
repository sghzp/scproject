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
  	<script type="text/javascript" src="js/chart_hexfile.js"></script>
	<script>
	function modify(){
		
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var id = row.HEXID;
	    	var ecutype = row.ECUType;
			window.location.href="<%=basePath%>/jsp/HexPfile/modifyWholeCar.jsp?HEXID="+id+"&ecutype="+ecutype;
	    }else{
	    	alert("请选择要修改的行");
	    }
		
	}
	
	function see(){
		
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var id = row.HEXID;
	    	var ecutype = row.ECUType;
			window.location.href="<%=basePath%>/jsp/HexPfile/seeWholeCar.jsp?HEXID="+id+"&ecutype="+ecutype;
	    }else{
	    	alert("请选择要查看的行");
	    }
		
	}
	
	function del(){
	    var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var id = row.HEXID;
	    	var ecutype = row.ECUType;
			window.location.href="<%=basePath%>/jsp/HexPfile/deleteWholeCar.jsp?HEXID="+id+"&ecutype="+ecutype;
	    }else{
	    	alert("请选择要删除的行");
	    }
	
	}
	
	function download(){
	    var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var ecutype = row.ECUType;
	    	var sjljh =	row.sjljh;
	    	var version = row.version;
	    	var hexname = encodeURIComponent(row.HEXFile);
	    	var id = row.HEXID;
	    	window.location.href="<%=basePath%>/jsp/HexPfile/download.jsp?ecutype="+ecutype+"&sjljh="+sjljh+"&version="+version+"&hexname="+hexname+"&HEXID="+id;
	    }else{
	    	alert("请选择要下载的行");
	    }
	}
	function downloadall(){
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var ecutype = row.ECUType;
	    	var sjljh =	row.sjljh;
	    	var version = row.version;
	    	var hexname = encodeURIComponent(row.HEXFile);
	    	var id = row.HEXID;
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
	    	window.location.href="<%=basePath%>/jsp/HexPfile/DownloadAll_deal.jsp?ecutype="+ecutype+"&sjljh="+sjljh+"&version="+version+"&hexname="+hexname+"&HEXID="+id;
	    	
	    }else{
	    	alert("请选择要下载的行");
	    }
	}
	
	function dabaoxiazaiyanshi(time){
		$('#dabao').val(time+''+'s');
		time--;
		if(time >= 0){
			setTimeout(dabaoxiazaiyanshi(time),1000);
		}		

		
	}
	
	function changestate(){
		var row = $('#box').datagrid('getSelected');
	    if (row){
	    	var sjljh =	row.sjljh;
	    	var version = row.version;
	    	var state = row.state;
	    	var right = "<%=session.getAttribute("right")%>";
	    	$.post("./PanDuanSjljh_shifouzailiuchengzhong?sjljh=" + sjljh+"&version="+ version,null,function(data){
		    	if(data != 1){
			
			    		window.location.href="<%=basePath%>/jsp/Mission/ChangeSjljh_new.jsp?sjljh="+sjljh+"&version="+version;
			    
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
	
	function lookfororder(){
		var row = $('#box').datagrid('getSelected');
		
	    if (row){
	    	var sjljh =	row.sjljh;
	    	$.post("./LookForOrderForHex?sjljh=" + sjljh,null,function(data){
		    	if(data != -1){
		    		var id = data[0].INIID;
		    		var ecutype = data[0].ECUType;
		    		//alert(id+"   "+ ecutype +"  "+data[0].scrq);
					window.location.href="<%=basePath%>/jsp/HexPfile/seeIni.jsp?INIID="+id+"&ecutype="+ecutype;
		    	}else{
		    		//alert(data);
		    		alert("没有引用该数据零件号的订货号");
		    	}			
			},"json");
	    }else{
	    	alert("请选择查看的行");
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
    		
    		<%
			EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
			Map<String,String> m = ebii.query4();
			Iterator it = m.entrySet().iterator();
			 %>
    		
    			<tr style="background:#c9c9c9;">
    				<td><span style="font-size:15px">ECU型号</span><select name="ECUType" size="1" id="ecutype">
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
					<td><span style="font-size:15px">发动机型号</span><input name="bz2" type="text" value="" id="bz2" onkeydown="keydownEvent()"/></td>
    				<td><span style="font-size:15px">数据零件号</span><input name="sjljh" type="text" value="" id="sjljh" onkeydown="keydownEvent()"/></td>
    				<td><span style="font-size:15px">状态</span><select name="state" size="1" id="state">
			    				<option value="">全部</option>
							    <option value="-1">空</option>
							    <option value="0">正常</option>
								<option value="1">临时</option>
								<option value="2">套牌</option>
								<option value="3">备份</option>
								<option value="4">停用</option>
								<option value="5">临时超限</option>
				   			</select></td>
    				
    				<td></td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    				<td>
    				<input name="cx" type="button" value="查询" onclick="query()"style="height:30; width:100"/>
    				<input name="wdsj" type="button" value="我的数据" onclick="mydata()"style="height:30; width:100"/>
    				</td>
    				
    				<td><!-- <input name="xz" type="button" value="下载hex/pfile文件" onclick="download()"style="height:30; width:125"/> -->
    					<span style="font-size:15px">上传人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input name="scr" type="text" value="" id="scr" onkeydown="keydownEvent()"/>
    				</td>
    				
    				<td>
	    				<span style="font-size:15px">按照</span><select id="type" onchange="querybyorder()">
	    					<option value="scz">上传人</option>
	    					<option value="sjljh">数据零件号</option>
	    					<option value="ECUType">ECU型号</option>
	    					<option value="bz2">发动机型号</option>
	    					<option value="scrq">上传日期</option>
	    					<option value="editdate">修改日期</option>
	    				</select>
	    				<span style="font-size:15px">进行</span>
	    				<select id="shunxu"  onchange="querybyorder()">
	    					<option value="desc">倒序</option>
	    					<option value="asc">正序</option>
	    				</select>
	    				<span style="font-size:15px">排序</span>
    				</td>
    				

    				<td><input id="dabao" name="xz" type="button" value="下载hex/pfile文件" onclick="downloadall()"style="height:30; width:125"/></td>
    				<td></td>
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
    
    		<input id="xz" name="xz" type="button" value="新增" onclick="xingzeng()"style="height:30; width:100">
    		<script>
    		function mydata(){
    			
			    var ecutype = $("#ecutype").val();
				var sjljh = $("#sjljh").val();
				var state = $("#state option:selected").val();
				//var hclcj = $("#hclcj").val();
				var bz2 = $("#bz2").val();
				var type = $("#type option:selected").val();;
				var order = $("#shunxu option:selected").val();;
				
				$.post("./QueryHex_mydata?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&state=" + encodeURI(encodeURI(state))
						 +"&bz2="+ encodeURI(encodeURI(bz2))+"&type="+ encodeURI(encodeURI(type))+"&order="+ encodeURI(encodeURI(order)),null,function(data){	
					 
					
					for(var i= 0; i<data.length; i++){
						if(data[i].state == '-1') data[i].state = "空";
						if(data[i].state == '0') data[i].state = "正常";
						if(data[i].state == '1') data[i].state = "临时";
						if(data[i].state == '2') data[i].state = "套牌";
						if(data[i].state == '3') data[i].state = "备份";
						if(data[i].state == '4') data[i].state = "停用";
						if(data[i].state == '5') data[i].state = "临时超限";
						data[i].scrq = changedate(data[i].scrq);
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
						      
			
						      {field:'ECUType',title:'ECU型号',width:100,align:'left'},
						      {field:'bz2',title:'发动机型号',width:100,align:'left'},
						      {field:'sjljh',title:'数据零件号',width:100,align:'left'},
						      {field:'version',title:'数据版本',width:100,align:'left'},
						      {field:'state',title:'状态',width:100,align:'left'},
						      {field:'scz',title:'上传者',width:100,align:'left'},
						      {field:'scrq',title:'上传日期',width:120,align:'left'},
						      {field:'times',title:'已刷写数',width:100,align:'left'},
						      {field:'yt',title:'用途',width:160,align:'left'},
						      {field:'HEXFile',title:'HEX文件',width:100,align:'left'},
						      {field:'pfileName',title:'Pfile文件',width:150,align:'left'},
						      {field:'keyDataFileName',title:'Keyfile文件',width:100,align:'left'},
						      {field:'SBLFileName',title:'SBL文件',width:100,align:'left'},
						      {field:'SREFileName',title:'SRE文件',width:100,align:'left'},
						      {field:'zdds',title:'怠速',width:100,align:'left'},
						      {field:'wtdbgdbh',title:'委托单号',width:100,align:'left'},
						      {field:'bh',title:'HEX编号',width:100,align:'left'},
						      {field:'HEXID',title:'ID',width:100,align:'left'}
						    ]]
						  })
				},"json");	
    			
    			
    		}
    		function xingzeng(){
    			window.location.href="<%=basePath%>/jsp/HexPfile/addWholeCar.jsp";
    		}
    		function copyadd(){
    			var row = $('#box').datagrid('getSelected');
    		    if (row){
    		    	var id = row.HEXID;
    		    	var ecutype = row.ECUType;
    		    	var sjljh =	row.sjljh;
        			window.location.href="<%=basePath%>/jsp/HexPfile/copyadd.jsp?HEXID="+id+"&ecutype="+ecutype+"&sjljh="+sjljh;
    		    }else{
    		    	alert("请选择要升级的版本");
    		    }
    		}
    		function realcopyadd(){
    			var row = $('#box').datagrid('getSelected');
    		    if (row){
    		    	var id = row.HEXID;
    		    	var ecutype = row.ECUType;
    		    	var sjljh =	row.sjljh;
        			window.location.href="<%=basePath%>/jsp/HexPfile/realcopyadd.jsp?HEXID="+id+"&ecutype="+ecutype+"&sjljh="+sjljh;
    		    }else{
    		    	alert("请选择要升级的版本");
    		    }
    		}
    		</script>
    		<input id="xg" name="xg" type="button" value="修改" onclick="modify()"style="height:30; width:100"/>
    		<input id="ck" name="ck" type="button" value="查看" onclick="see()"style="height:30; width:100"/>
    		<input id="sc" name="sc" type="button" value="复制新增" onclick="realcopyadd()"style="height:30; width:100"/>
    		<input id="fzxz" name="fzxz" type="button" value="升级版本" onclick="copyadd()"style="height:30; width:100"/>
			<input id="changestate" name="changestate" type="button" value="状态变更申请" onclick="changestate()" style="height:30; width:120"/>
    		<input id="lookfororder" name="lookfororder" type="button" value="查看首用订货号信息" onclick="lookfororder()" style="height:30; width:130"/>
    		<!-- <input name="fzxz" type="button" value="复制新增" />   -->  
  
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

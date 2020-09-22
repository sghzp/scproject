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
	<script>
	function modify(){
		var id = $(".on").find("td").first().text();
		var ecutype = $(".on").find("td").first().next().next().text();
		//alert(id);
		window.location.href="<%=basePath%>/jsp/HexPfile/modifyWholeCar.jsp?HEXID="+id+"&ecutype="+ecutype;
	}
	
	function del(){
		var id = $(".on").find("td").first().text();
		var ecutype = $(".on").find("td").first().next().next().text();
		window.location.href="<%=basePath%>/jsp/HexPfile/deleteWholeCar.jsp?HEXID="+id+"&ecutype="+ecutype;
	
	}
	
	function download(){
	    //var test = "testhehe哈哈";
		var ecutype = $(".on").find("td").first().next().next().text();
		var sjljh = $(".on").find("td").first().next().next().next().text();
		var version = $(".on").find("td").first().next().next().next().next().next().next().next().next().next().next().next().next().text();
		var hexname = $(".on").find("td").first().next().next().next().next().next().next().next().next().text();
		var id = $(".on").find("td").first().text();
		//alert(ecutype+sjljh+version);
		window.location.href="<%=basePath%>/jsp/HexPfile/download.jsp?ecutype="+ecutype+"&sjljh="+sjljh+"&version="+version+"&hexname="+hexname+"&HEXID="+id;
	}
	
	function query(){
	var ecutype = $("#ecutype").val();
	//$("#chexingxuanze option:selected").text();
	var sjljh = $("#sjljh").val();
	var state = $("#state option:selected").val();
	//var wtdbgdbh = $("#wtdbgdbh").val();
	var hclcj = $("#hclcj").val();
	var version = $("#version").val();
	//alert(ecutype+sjljh+state+wtdbgdbh+hclcj+version);
	
		//发送已选信息，接受后台发来的数据，回调函数进行处理
	$.post("./QueryHex1?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&state=" + encodeURI(encodeURI(state))
		+"&hclcj="+ encodeURI(encodeURI(hclcj)) +"&version="+ encodeURI(encodeURI(version)),null,function(data){	
	
	//$("#dongtai").html(data);
		var tableStr = "<table width = 300% id='chaxunbiaoge'>";
		tableStr = tableStr
				+ "<tr id='biaoti'>"
				+ "<td class='xinxi' style='line-height:20px;'>ID</td>"
				+ "<td class='xinxi' style='line-height:20px;'>HEX编号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>ECU型号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>数据零件号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>上传者</td>"
				+ "<td class='xinxi' style='line-height:20px;'>上传日期</td>"
				+ "<td class='xinxi' style='line-height:20px;'>已刷写数</td>"
				+ "<td class='xinxi' style='line-height:20px;'>用途</td>"
				+ "<td class='xinxi' style='line-height:20px;'>HEX文件</td>"
				+ "<td class='xinxi' style='line-height:20px;'>Pfile文件</td>"
				+ "<td class='xinxi' style='line-height:20px;'>Keyfile文件</td>"
				+ "<td class='xinxi' style='line-height:20px;'>SBL文件</td>"
				+ "<td class='xinxi' style='line-height:20px;'>SRE文件</td>"
				+ "<td class='xinxi' style='line-height:20px;'>怠速</td>"
				+ "<td class='xinxi' style='line-height:20px;'>委托单号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>软件版本</td>"
				+ "<td class='xinxi' style='line-height:20px;'>状态</td>"
				+ "</tr>";
			var len = data.length;
			
			for ( var i = 0; i < len; i++) {  
       			tableStr = tableStr + "<tr id='neirong'>"  
                +"<td style='line-height:20px;'>"+  data[i].HEXID + "</td>"   
                +"<td style='line-height:20px;'>"+  data[i].bh + "</td>"  
                +"<td style='line-height:20px;'>"+ data[i].ECUType + "</td>"  
                + "<td style='line-height:20px;'>"+ data[i].sjljh + "</td>"  
                + "<td style='line-height:20px;'>"+ data[i].scz + "</td>"  
                +"<td style='line-height:20px;'>"+data[i].scrq+"</td>"  
                +"<td style='line-height:20px;'>"+data[i].times+"</td>"
                +"<td style='line-height:20px;'>"+data[i].yt+"</td>"
                +"<td style='line-height:20px;'>"+data[i].HEXFile+"</td>"
                +"<td style='line-height:20px;'>"+data[i].pfileName+"</td>"
                +"<td style='line-height:20px;'>"+data[i].keyDataFileName+"</td>"
                +"<td style='line-height:20px;'>"+data[i].SBLFileName+"</td>"
                +"<td style='line-height:20px;'>"+data[i].SREFileName+"</td>"
                +"<td style='line-height:20px;'>"+data[i].zdds+"</td>"
                +"<td style='line-height:20px;'>"+data[i].wtdbgdbh+"</td>"
                +"<td style='line-height:20px;'>"+data[i].version+"</td>"
                +"<td style='line-height:20px;'>"+data[i].state+"</td>"
                +"</tr>";  
    		}
		
		/* if(len==0){  
        tableStr = tableStr + "<tr style='text-align: center'>"  
        +"<td colspan='6'><font color='#cd0a0a'>"+ 暂无记录 + "</font></td>"  
        +"</tr>";  
    	}  	 */
		
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
   <table id ="zhengti" width =110%>
   <tr>
   <td>
    <div id="chaxuntiaojian" style="width : 84%">
    	<p>查询条件</p>
    	<form name="chaxuntiaojian" action="" method="post">
    		
    		<table width = 100%>
    		
    		<%
			EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
			HashSet<String> hs = ebii.query3();
			Iterator<String> it = hs.iterator();
			 %>
    		
    			<tr style="background:#c9c9c9;">
    				<td><span style="font-size:15px">ECU型号</span><select name="ECUType" size="1" id="ecutype">
					<option value="">请选择</option>
					<%
						while(it.hasNext()){
						String temp = it.next();
					%>
					<option value="<%=temp%>"><%=temp%></option>
					<%
					}
					 %>
				
				</select></td>
    				<td><span style="font-size:15px">数据零件号</span><input name="sjljh" type="text" value="" id="sjljh"/></td>
    				<td><span style="font-size:15px">状态</span><select name="state" size="1" id="state">
			    				<option value="">全部</option>
							    <option value="0">正常</option>
								<option value="1">临时</option>
								<option value="2">TP</option>
								<option value="3">备份</option>
								<option value="4">停用</option>
				   			</select></td>
    				<td><span style="font-size:15px">版本号</span><input name="version" type="text" value="" id="version"/></td>
    				<td><span style="font-size:15px">后处理厂家</span><input name="hclcj" type="text" value="" id="hclcj"/></td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    				<td></td>
    				<td></td>
    				<td></td>
    				<td><input name="cx" type="button" value="查询" onclick="query()"/></td>
    				<td><input name="xz" type="button" value="下载" onclick="download()"/></td>
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
		    			<td class="xinxi">ID</td>
		    			<td class="xinxi">HEX编号</td>
		    			<td class="xinxi">ECU型号</td> 
		    			<td class="xinxi">数据零件号</td>
		    			<td class="xinxi">上传者</td>
		    			<td class="xinxi">上传日期</td>
		    			<td class="xinxi">已刷写数</td>
		    			<td class="xinxi">用途</td>
		    			<td class="xinxi">HEX文件</td>
		    			<td class="xinxi">Pfile文件</td>
		    			<td class="xinxi">Keyfile文件</td>
		    			<td class="xinxi">SBL文件</td>
		    			<td class="xinxi">SRE文件</td>
		    			<td class="xinxi">怠速</td>
		    			<td class="xinxi">委托单号</td>
 		    			<td class="xinxi">软件版本</td>
		    			<td class="xinxi">状态</td>
		    		</tr>
		    		
		
		<%
			HexInfoDaoImpl hexInfoDaoImpl = new HexInfoDaoImpl();
		 	String sql = "select * from HEXINFO;";
		 	ArrayList<HexInfo> hexInfos = null;
		 	HexInfo hexInfo = null;	
		 	hexInfos = hexInfoDaoImpl.query(sql);
			for(int i = 0; i<hexInfos.size(); i++){			
				hexInfo = (HexInfo) hexInfos.get(i);	
		 %>
		    	
		    	    <tr height="10" id="neirong">
		    	    	<td class="xinxi"><%=hexInfo.getHEXID()%></td>
		    			<td class="xinxi"><%=hexInfo.getBh()%></td>
		    			<td class="xinxi"><%=hexInfo.getECUType()%></td> 
		    			<td class="xinxi"><%=hexInfo.getSjljh()%></td>
		    			<td class="xinxi"><%=hexInfo.getScz()%></td>
		    			<td class="xinxi"><%=hexInfo.getScrq()%></td>
		    			<td class="xinxi"><%=hexInfo.getTimes()%></td>
		    			<td class="xinxi"><%=hexInfo.getYt()%></td>
		    			<td class="xinxi"><%=hexInfo.getHEXFile()%></td>
		    			<td class="xinxi"><%=hexInfo.getPfileName()%></td>
		    			<td class="xinxi"><%=hexInfo.getKeyDataFileName()%></td>
		    			<td class="xinxi"><%=hexInfo.getSBLFileName()%></td>
		    			<td class="xinxi"><%=hexInfo.getSREFileName()%></td>
		    			<td class="xinxi"><%=hexInfo.getZdds()%></td>
		    			<td class="xinxi"><%=hexInfo.getWtdbgdbh()%></td>
		    			<td class="xinxi"><%=hexInfo.getVersion()%></td>
		    			<td class="xinxi"><%=hexInfo.getState()%></td>
		    		</tr>
		    		
		    <%
		    	}
		    	
		    
		     %>
		    	 
		    	    	
		    	</table>
		    </div>
	    </td>
    </tr>  
    </table>
    
    		<input id="xz" name="xz" type="button" value="新增" onclick="xingzeng()">
    		<script>
    		function xingzeng(){
    			window.location.href="<%=basePath%>/jsp/HexPfile/addWholeCar.jsp";
    		}
    		function copyadd(){
    			var id = $(".on").find("td").first().text();
				var ecutype = $(".on").find("td").first().next().next().text();
    			window.location.href="<%=basePath%>/jsp/HexPfile/copyadd.jsp?HEXID="+id+"&ecutype="+ecutype;
    		}
    		
    		function test(){
    			window.location.href="<%=basePath%>/jsp/HexPfile/HexPfile001.jsp";
    		}
    		</script>
    		<input id="xg" name="xg" type="button" value="修改" onclick="modify()"/>
    		<input id="sc" name="sc" type="button" value="删除" onclick="del()"/>
    		<input id="fzxz" name="fzxz" type="button" value="复制新增" onclick="copyadd()"/>
			<input id="test" name="fzxz" type="button" value="test" onclick="test()"/>
    		
    		
    		<!-- <input name="fzxz" type="button" value="复制新增" />   -->  
  
  
  </body>
  <%if(((String)session.getAttribute("right")).equals("3") || ((String)session.getAttribute("right")).equals("4")){%>
  <script>
  	$("#xz").attr('disabled',"true");
 	$("#xg").attr('disabled',"true");
 	$("#sc").attr('disabled',"true");
 	$("#fzxz").attr('disabled',"true");
  </script>
  <% }%>
</html>


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
	<script src="js/CarManage.js"></script>
	<script>
	function modify(){
		var id = $(".on").find("td").first().text();
		var ecutype = $(".on").find("td").first().next().next().text();
		window.location.href="<%=basePath%>/jsp/CarManage/modifyIni.jsp?INIID="+id+"&ecutype="+ecutype;
	}

	

	
	function del(){
		var iniid = $(".on").find("td").first().text();
		var ecuorder = $(".on").find("td").first().next().text();
		var ecutype = $(".on").find("td").first().next().next().text();
		var sjljh = $(".on").find("td").first().next().next().next().next().next().text();
		var inifile = $(".on").find("td").first().next().next().next().next().next().next().next().next().next().next().next().next().next().next().text();
		//alert(ecutype+sjljh+version);
		window.location.href="<%=basePath%>/jsp/CarManage/Delete_deal.jsp?ecutype="+ecutype+"&sjljh="+sjljh+"&inifile="+inifile+"&iniid="+iniid+"&ecuorder="+ecuorder;
	}
	
	function downloadhex(){
	    var sjljh = $(".on").find("td").first().next().next().next().next().next().text();
		window.location.href="<%=basePath%>/jsp/CarManage/download.jsp?sjljh="+sjljh;
	}
	
	function downloadini(){
		var ecutype = $(".on").find("td").first().next().next().text();
		var sjljh = $(".on").find("td").first().next().next().next().next().next().text();
		var inifile = $(".on").find("td").first().next().next().next().next().next().next().next().next().next().next().next().next().next().next().text();
		//alert(ecutype+sjljh+version);
		window.location.href="<%=basePath%>/jsp/CarManage/DownloadIni.jsp?ecutype="+ecutype+"&sjljh="+sjljh+"&inifile="+inifile;
	}
	
	function query(){
	var ecutype = $("#ecutype").val();
	var ecuorder = $("#ecuorder").val();
	//$("#chexingxuanze option:selected").text();
	var sjljh = $("#sjljh").val();
	var shzt = $("#shzt option:selected").val();
	var sbm = $("#sbm").val();
	
	//alert(ecutype+sjljh+state+wtdbgdbh+hclcj+version);
	
		//发送已选信息，接受后台发来的数据，回调函数进行处理
	$.post("./QueryIni?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&shzt=" + encodeURI(encodeURI(shzt))
		+ "&sbm=" + encodeURI(encodeURI(sbm)) +"&ecuorder="+ encodeURI(encodeURI(ecuorder)),null,function(data){	
	
	//$("#dongtai").html(data);
		var tableStr = "<table width = 300% id='chaxunbiaoge'>";
		tableStr = tableStr
				+ "<tr id='biaoti'>"
				+ "<td class='xinxi' style='line-height:20px;'>INIID</td>"
				+ "<td class='xinxi' style='line-height:20px;'>订货号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>ECU型号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>整车编码</td>"
				+ "<td class='xinxi' style='line-height:20px;'>识别码</td>"
				+ "<td class='xinxi' style='line-height:20px;'>数据零件号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>已刷写数</td>"
				+ "<td class='xinxi' style='line-height:20px;'>上传人工号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>上传人</td>"
				+ "<td class='xinxi' style='line-height:20px;'>上传日期</td>"
				+ "<td class='xinxi' style='line-height:20px;'>修改人</td>"
				+ "<td class='xinxi' style='line-height:20px;'>修改日期</td>"
				+ "<td class='xinxi' style='line-height:20px;'>审核状态</td>"
				+ "<td class='xinxi' style='line-height:20px;'>审核人</td>"
				+ "<td class='xinxi' style='line-height:20px;'>INIFILE</td>"
				+ "<td class='xinxi' style='line-height:20px;'>HEXParentID</td>"
				+ "<td class='xinxi' style='line-height:20px;'>可刷写次数</td>"
				+ "<td class='xinxi' style='line-height:20px;'>备注1</td>"
				+ "<td class='xinxi' style='line-height:20px;'>备注2</td>"			
				+ "</tr>";
			var len = data.length;
			
			for ( var i = 0; i < len; i++) {  
       			tableStr = tableStr + "<tr id='neirong'>"  
                +"<td style='line-height:20px;'>"+  data[i].INIID + "</td>"   
 				+"<td style='line-height:20px;'>"+  data[i].ECUOrder + "</td>"
 				+"<td style='line-height:20px;'>"+  data[i].ECUType + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].zcbm + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].sbm + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].sjljh + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].times + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].scrgh + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].scr + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].scrq + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].xgr + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].editDate + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].shzt + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].shr + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].INIFile + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].HEXParentID + "</td>"   
 				+"<td style='line-height:20px;'>"+  data[i].canWriteTimes + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].bz1 + "</td>" 
 				+"<td style='line-height:20px;'>"+  data[i].bz2 + "</td>" 
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
   <table width = 100%>
   <tr>
   <td>
    <div id="chaxuntiaojian" style="width : 84%">
    	<p>查询条件</p>
    	<form name="chaxuntiaojian" action="" method="post">
    		
    		<table width = 100%>
    			<tr style="background:#c9c9c9;">
    				<td>订货号<input name="ecuorder" type="text" value="" id="ecuorder"/></td>
    				<%
						EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
						HashSet<String> hs = ebii.query3();
						Iterator<String> it = hs.iterator();
			 		%>
    				<td>ECU型号
						<select name="ecutype" size="1" id="ecutype">
						<option value="">请选择</option>
						<%
						while(it.hasNext()){
						String temp = it.next();
						%>
							<option value="<%=temp%>"><%=temp%></option>
						<%
						}
						 %>
					
						</select>
					</td>
    				<td>数据零件号<input name="sjljh" type="text" value="" id="sjljh"/></td>
    				<td>识别码<input name="sbm" type="text" value="" id="sbm"/></td>
    				<td>审核状态
    						<select name="shzt" size="1" id="shzt">
			    				<option value="">全部</option>
							    <option value="未审核">未审核</option>
								<option value="已审核">已审核</option>
								
				   			</select>
    				</td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    				<td></td>
    				<td></td>
    				<td><input name="cx" type="button" value="查询" onclick="query()"/></td>
    				<td><input name="hex" type="button" value="下载hex文件" onclick="downloadhex()"/></td>
    				<td><input name="dc" type="button" value="导出整车信息" onclick="downloadini()"/></td>
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
		    			<td class="xinxi">INIID</td>
		    			<td class="xinxi">订货号</td>
		    			<td class="xinxi">ECU型号</td> 
		    			<td class="xinxi">整车编码</td>
		    			<td class="xinxi">识别码</td>
		    			<td class="xinxi">数据零件号</td>
		    			<td class="xinxi">已刷写数</td>
		    			<td class="xinxi">上传人工号</td>
		    			<td class="xinxi">上传人</td>
		    			<td class="xinxi">上传日期</td>
		    			<td class="xinxi">修改人</td>
		    			<td class="xinxi">修改日期</td>
		    			<td class="xinxi">审核状态</td>
		    			<td class="xinxi">审核人</td>
		    			<td class="xinxi">INIFILE</td>
		    			<td class="xinxi">HEXParentID</td>
		    			<td class="xinxi">可刷写次数</td>
		    			<td class="xinxi">备注1</td>
		    			<td class="xinxi">备注2</td>
		    		</tr>
		    		
		
		<%
			IniInfoDaoImpl iniInfoDaoImpl = new IniInfoDaoImpl();
		 	String sql = "select * from INIINFO;";
		 	ArrayList<IniInfo> iniInfos = null;
		 	IniInfo iniInfo = null;	
		 	iniInfos = iniInfoDaoImpl.query(sql);
			for(int i = 0; i<iniInfos.size(); i++){			
				iniInfo = (IniInfo) iniInfos.get(i);	
		 %>
		    	
		    	    <tr height="10" id="neirong">
		    	    	<td class="xinxi"><%=iniInfo.getINIID()%></td>
		    	    	<td class="xinxi"><%=iniInfo.getECUOrder()%></td>
		    			<td class="xinxi"><%=iniInfo.getECUType()%></td>
		    			<td class="xinxi"><%=iniInfo.getZcbm()%></td> 
		    			<td class="xinxi"><%=iniInfo.getSbm()%></td>
		    			<td class="xinxi"><%=iniInfo.getSjljh()%></td>
		    			<td class="xinxi"><%=iniInfo.getTimes()%></td>
		    			<td class="xinxi"><%=iniInfo.getScrgh()%></td>
		    			<td class="xinxi"><%=iniInfo.getScr()%></td>
		    			<td class="xinxi"><%=iniInfo.getScrq()%></td>
		    			<td class="xinxi"><%=iniInfo.getXgr()%></td>
		    			<td class="xinxi"><%=iniInfo.getEditDate()%></td>
		    			<td class="xinxi"><%=iniInfo.getShzt()%></td>
		    			<td class="xinxi"><%=iniInfo.getShr()%></td>
		    			<td class="xinxi"><%=iniInfo.getINIFile()%></td>
		    			<td class="xinxi"><%=iniInfo.getHEXParentID()%></td>
		    			<td class="xinxi"><%=iniInfo.getCanWriteTimes()%></td>
		    			<td class="xinxi"><%=iniInfo.getBz1()%></td>
		    			<td class="xinxi"><%=iniInfo.getBz2()%></td>
		    		</tr>
		    		
		    <%
		    	}
		    	
		    
		     %>
		    	 
		    	    	
		    	</table>
		    </div>
	    </td>
    </tr>  
    </table>
    
    
 			<input id="xz" name="xz" type="button" value="新增" onclick="xingzeng()"/>
    		
    		<script>
	    		function xingzeng(){
	    			window.location.href="<%=basePath%>/jsp/CarManage/addIni.jsp";
	    		}
	    		function copyadd(){
	    			var id = $(".on").find("td").first().text();
					var ecutype = $(".on").find("td").first().next().next().text();
					window.location.href="<%=basePath%>/jsp/CarManage/copyadd_ini_first.jsp?INIID="+id+"&ecutype="+ecutype;
	    		}
	    			
    		</script>
    		<input id="xg" name="xg" type="button" value="修改" onclick="modify()"/>
    		<input id="sc" name="sc" type="button" value="删除" onclick="del()"/>
    		<input id="fzxz" name="fzxz" type="button" value="复制新增" onclick="copyadd()"/>
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

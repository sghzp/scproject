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

	function changecheck_0(){	
/* 		var count = $(".on").size();
		//alert(count);
		if(count != 0){		
				for(var i=0;i<count;i++){
					var id = $(".on").find("td").first().text();
					$(".on").first().removeClass("on");
					a = new Array();
					a[i] = id; 
					alert(id);
				}
				for(var i=0;i<count;i++){
					alert(a[i]);
				} 
		}*/
		var id = $(".on").find("td").first().text();
		var check = 0;
		window.location.href="<%=basePath%>/jsp/HexPfileExamine/ChangeCheck.jsp?HEXID="+id+"&check="+check;
	}
	
	function changecheck_1(){
		var id = $(".on").find("td").first().text();
		var check = 1;
		window.location.href="<%=basePath%>/jsp/HexPfileExamine/ChangeCheck.jsp?HEXID="+id+"&check="+check;
	}



	function query(){
	var ecutype = $("#ecutype").val();
	//$("#chexingxuanze option:selected").text();
	var sjljh = $("#sjljh").val();
	var state = $("#state option:selected").val();
	var shzt = $("#shzt option:selected").val();
	//var wtdbgdbh = $("#wtdbgdbh").val();
	var hclcj = $("#hclcj").val();
	var version = $("#version").val();
	//alert(ecutype+sjljh+state+wtdbgdbh+hclcj+version);
	
		//发送已选信息，接受后台发来的数据，回调函数进行处理
	$.post("./QueryHex?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&state=" + encodeURI(encodeURI(state))
		+ "&hclcj="+ encodeURI(encodeURI(hclcj)) +"&version="+ encodeURI(encodeURI(version)) +"&shzt="+ encodeURI(encodeURI(shzt)),null,function(data){	
	
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
				+ "<td class='xinxi' style='line-height:20px;'>审核状态</td>"
				+ "<td class='xinxi' style='line-height:20px;'>已刷写数</td>"
				+ "<td class='xinxi' style='line-height:20px;'>用途</td>"
				+ "<td class='xinxi' style='line-height:20px;'>HEX文件</td>"
				+ "<td class='xinxi' style='line-height:20px;'>怠速</td>"
				+ "<td class='xinxi' style='line-height:20px;'>委托单号</td>"
				+ "<td class='xinxi' style='line-height:20px;'>标定转速</td>"
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
                +"<td style='line-height:20px;'>"+data[i].shzt+"</td>" 
                +"<td style='line-height:20px;'>"+data[i].times+"</td>"
                +"<td style='line-height:20px;'>"+data[i].yt+"</td>"
                +"<td style='line-height:20px;'>"+data[i].HEXFile+"</td>"
                +"<td style='line-height:20px;'>"+data[i].zdds+"</td>"
                +"<td style='line-height:20px;'>"+data[i].wtdbgdbh+"</td>"
                +"<td style='line-height:20px;'>"+null+"</td>"
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
   <table width = 110%>
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
    				<td>ECU型号<select name="ECUType" size="1" id="ecutype">
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
    				<td>数据零件号<input name="sjljh" type="text" value="" id="sjljh"/></td>
    				<td>状态<select name="state" size="1" id="state">
			    				<option value="">全部</option>
							    <option value="0">正常</option>
								<option value="1">临时</option>
								<option value="2">TP</option>
								<option value="3">备份</option>
								<option value="4">停用</option>
				   			</select></td>
    				<td>版本号<input name="version" type="text" value="" id="version"/></td>
    				<td>后处理厂家<input name="hclcj" type="text" value="" id="hclcj"/></td>
    			</tr>
    			<tr style="background:#c9c9c9;">
    				
    				<td>审核状态
    						<select name="shzt" size="1" id="shzt">
			    				<option value="">全部</option>
							    <option value="未审核">未审核</option>
								<option value="已审核">已审核</option>
								
				   			</select>
				   	</td>
				   	<td></td>
    				<td></td>
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
		    	<table width = 300%  id="chaxunbiaoge">
		    		<tr height="10" id="biaoti">
		    			<td class="xinxi">ID</td>
		    			<td class="xinxi">HEX编号</td>
		    			<td class="xinxi">ECU型号</td> 
		    			<td class="xinxi">数据零件号</td>
		    			<td class="xinxi">上传者</td>
		    			<td class="xinxi">上传日期</td>
		    			<td class="xinxi">审核状态</td>
		    			<td class="xinxi">已刷写数</td>
		    			<td class="xinxi">用途</td>
		    			<td class="xinxi">HEX文件</td>
		    			<td class="xinxi">怠速</td>
		    			<td class="xinxi">委托单号</td>
		    			<td class="xinxi">标定转速</td>
		    			<td class="xinxi">软件版本</td>
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
		    			<td class="xinxi"><%=hexInfo.getShzt()%></td>
		    			<td class="xinxi"><%=hexInfo.getTimes()%></td>
		    			<td class="xinxi"><%=hexInfo.getYt()%></td>
		    			<td class="xinxi"><%=hexInfo.getHEXFile()%></td>
		    			<td class="xinxi"><%=hexInfo.getZdds()%></td>
		    			<td class="xinxi"><%=hexInfo.getWtdbgdbh()%></td>
		    			<td class="xinxi">null</td>
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
    
    
 			<input id="sh" name="sh" type="button" value="审核" onclick="changecheck_0()"/>
    		<input id="qxsh" name="qxsh" type="button" value="取消审核" onclick="changecheck_1()"/>    
    		<input id="test" name="test" type="button" value="test" onclick="test()"/> 
    		<script>
    function test(){
		window.location.href="<%=basePath%>/jsp/HexPfileExamine/HexPfileExamine001.jsp";
	}
    		
    		</script>
    		<!-- <input name="fzxz" type="button" value="复制新增" />   -->  
  </body>
  <%if(((String)session.getAttribute("right")).equals("2") || ((String)session.getAttribute("right")).equals("4")){%>
  <script>
  	$("#sh").attr('disabled',"true");
 	$("#qxsh").attr('disabled',"true");
  </script>
  <% }%>
</html>


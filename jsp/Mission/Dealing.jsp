<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.seu.beans.MesInfo"%>
<%@ page import="com.seu.dao.MesInfoDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.dao.impl.MesInfoDaoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>

<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");
//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
String num = (String)request.getParameter("num");
//System.out.println(">>>>>>>>>>>"+num);
MesInfoDaoImpl mid = new MesInfoDaoImpl();
MesInfo mesInfo = mid.query_by_num(num);
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
	<script>
		function tongguo(){
		    var clyj = $("#clyj").val();
			var num = "<%=mesInfo.getNum()%>";
			var style = "<%=mesInfo.getStyle()%>";
			var sjljh = "<%=mesInfo.getSjljh()%>";
			var state ="<%=mesInfo.getDststate()%>";
			var check = 1;
			for(var i = 0; i<clyj.length; i++){
				if(clyj.charAt(i) == '-'  || clyj.charAt(i) == ';' || clyj.charAt(i) == '；'){
					check = 0;
					alert("处理意见不能包含特殊字符-与；");
					break;
				}
			}
			
 			if(clyj == ''){
				check = 0;
				alert("处理意见不能为空！");
			} 
			
			if(check == 1){
				//这时可以通过了，可是TM还要再判断，用户是否是误点，我也是醉了！
				//为了让后续人看这段恶心的代码不至于吐出来，我把真正的提交判断，封装成一个函数，realtongguo().
				//要怪就怪那恶心的需求把！fuck me！
				var r=confirm("是否确认通过？");
				if (r==true)
				  {
				  	realtongguo();
				  }
				else
				  {
				  //do nothing!
				  }
			}

		}
		
		function realtongguo(){
			var clyj = $("#clyj").val();
			clyj = encodeURI(encodeURI(clyj));
			var num = "<%=mesInfo.getNum()%>";
			var style = "<%=mesInfo.getStyle()%>";
			var sjljh = "<%=mesInfo.getSjljh()%>";
			var state ="<%=mesInfo.getDststate()%>";
            var version = "<%=mesInfo.getVersion()%>";
			if(style == 0){
					$.post("./PanDuanSjljh_state?sjljh=" + sjljh+"&caozuo="+ "add",null,function(data){
                       if(data == 1 && state == 0){
							show_confirm();
						}else{
							window.location.href="<%=basePath%>/jsp/Mission/Shenhe.jsp?iftongguo=1&num="+num+"&clyj="+clyj;
						}
					},"json");
			}else{
                   // alert("开始 判断");
					$.post("./PanDuanIni_state?ecuorder=" + sjljh+"&caozuo="+"add"+"&sbm="+ version,null,function(data){
                     //   window.location.href="<%=basePath%>/jsp/Mission/Shenhe.jsp?iftongguo=1&num="+num+"&clyj="+clyj;
						//alert("判断完");
                        if(data == 1 && state == 0){
							show_confirm_ini();
						}else{
							window.location.href="<%=basePath%>/jsp/Mission/Shenhe.jsp?iftongguo=1&num="+num+"&clyj="+clyj;
						}
					},"json");			
				}
		}
		
		
		function show_confirm_ini()
		{
			var num = "<%=mesInfo.getNum()%>";
			var clyj = $("#clyj").val();
			var sjljh = "<%=mesInfo.getSjljh()%>";
			var version = "<%=mesInfo.getVersion()%>";
			var r=confirm("已存在同一订货号的正常版本!"+ '\n' + '\n' +"*点击确认将原来的正常版本的数据变为备份状态"+ '\n' + '\n' +"*点击取消不通过审核");
			if (r==true)
			  {
			  //alert("正常提交，并改原来的数据为备份状态！");
			  		$.post("./ChangeTo3_ini?ecuorder=" + sjljh+"&sbm=" + version,null,function(data){
						window.location.href="<%=basePath%>/jsp/Mission/Shenhe.jsp?iftongguo=1&num="+num+"&clyj="+clyj;
					},"json");
			  }
			else
			  {
			  //alert("请重新修改后，再提交！");
			  }
		}
		
		function show_confirm()
		{
			var num = "<%=mesInfo.getNum()%>";
			var clyj = $("#clyj").val();
			var sjljh = "<%=mesInfo.getSjljh()%>";
			var r=confirm("已存在同一数据零件号的正常版本!"+ '\n' + '\n' +"*点击确认将原来的正常版本的数据变为备份状态"+ '\n' + '\n' +"*点击取消不通过审核");
			if (r==true)
			  {
			  //alert("正常提交，并改原来的数据为备份状态！");
			  		$.post("./ChangeTo3?sjljh=" + sjljh,null,function(data){
						window.location.href="<%=basePath%>/jsp/Mission/Shenhe.jsp?iftongguo=1&num="+num+"&clyj="+clyj;
					},"json");
			  }
			else
			  {
			  //alert("请重新修改后，再提交！");
			  }
		}
		
		
		
		function quxiao(){
			var check = 1;
			var clyj = $("#clyj").val();
			var num = "<%=mesInfo.getNum()%>";
			for(var i = 0; i<clyj.length; i++){
				if(clyj.charAt(i) == '-'){
					check = 0;
					alert("处理意见不能包含特殊字符-与；");
					break;
				}
			}
			if(clyj == ''){
				check = 0;
				alert("处理意见不能为空！");
			}
			if(check == 1){
				var r=confirm("确认不通过审核么？");
				if (r==true)
				{
					window.location.href="<%=basePath%>/jsp/Mission/Shenhe.jsp?iftongguo=0&num="+num+"&clyj="+clyj;
				}
				else
				{
				//do nothing!
				}
			}
		}
		function chakan(){
			//alert("全局变量"+num +style +sjljh +state);
		    var sjljh = "<%=mesInfo.getSjljh()%>";
		    var version = "<%=mesInfo.getVersion()%>";
			<%-- if(<%=mesInfo.getStyle()%> == 0){
				window.open('<%=basePath%>/jsp/Mission/seeWholeCar_from_HexPfile.jsp?sjljh='+sjljh+'&version='+version,'Derek','height=600,width=1200,status=yes,toolbar=yes,resizable=yes,scrollbars=yes,menubar=yes,location=yes');
			}else if(<%=mesInfo.getStyle()%> == 1){
				window.open('<%=basePath%>/jsp/Mission/seeIni_from_CarManage.jsp?ecuorder='+sjljh+'&sbm='+version,'Derek','height=600,width=1200,status=yes,toolbar=yes,resizable=yes,scrollbars=yes,menubar=yes,location=yes');
			} --%>
			var url = '';
			if(<%=mesInfo.getStyle()%> == 0){
				url = '<iframe src="<%=basePath%>/jsp/Mission/seeWholeCar_from_HexPfile.jsp?sjljh=' +sjljh+ '&version='+ version +'"'+' frameborder="0" width="100%" height="100%"/>';
			}else if(<%=mesInfo.getStyle()%> == 1){
				url = '<iframe src="<%=basePath%>/jsp/Mission/seeIni_from_CarManage.jsp?ecuorder=' +sjljh+ '&sbm='+ version +'"'+' frameborder="0" width="100%" height="100%"/>';
			}
			$('#win').window({
				content: url
			});
			$('#win').window('open'); 
			//window.location.href="<%=basePath%>/jsp/Mission/Shenhe.jsp?iftongguo=0&num="+num;
		}
		function getfj1(){
		    var num = "<%=mesInfo.getNum()%>";
			var fj1 = $("#fj1").val();
			if(fj1 == ''){
				alert("不存在可下载的附件");
			}else{
				window.location.href="<%=basePath%>/jsp/Mission/FuJianDownload.jsp?whichfile=1&num="+num;
			}
		}
		function getfj2(){
			var num = "<%=mesInfo.getNum()%>";
			var fj2 = $("#fj2").val();
			if(fj2 == ''){
				alert("不存在可下载的附件");
			}else{
				window.location.href="<%=basePath%>/jsp/Mission/FuJianDownload.jsp?whichfile=2&num="+num;
			}
		}
		function getfj3(){
			var num = "<%=mesInfo.getNum()%>";
			var fj3 = $("#fj3").val();
			if(fj3 == ''){
				alert("不存在可下载的附件");
			}else{
				window.location.href="<%=basePath%>/jsp/Mission/FuJianDownload.jsp?whichfile=3&num="+num;
			}
		}
	</script>
	
	
  </head>
  
  <body>
   <table width="90%">
   		<tr><td>
		    <table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="#dddddd">
			    <tr>
			      	<td><a href="jsp/Mission/Mission.jsp"><input type="button" value="待处理事项" style="height: 25px;width: 100px; background:#C6E2FF;"/></a></td>
					<td><a href="jsp/Mission/Tracing.jsp"><input type="button" value="流程追踪" style="height: 25px;width: 100px; background:#C6E2FF;"/></a></td>
					<!-- <td><a href="jsp/Mission/ChangeSjljh_new.jsp"><input type="button" value="数据零件号状态变更申请" style="height: 25px;width: 160px; background:#C6E2FF;"/></a></td>
					<td><a href="jsp/Mission/ChangeIni_new.jsp"><input type="button" value="整车信息状态变更申请" style="height: 25px;width: 160px; background:#C6E2FF;"/></a></td>
					 --><td><a href="jsp/Mission/Proxy.jsp"><input type="button" value="代理人设置" style="height: 25px;width: 160px; background:#C6E2FF;"/></a></td>
			    </tr>
			</table>
		</td></tr>
		
		<tr><td align="center">
			<table bgcolor="#E0EEEE" width="100%" font-size="50">
				<tr>
					<td height="40" class="td" width="100%" colspan="4" align="center"><h1></h1></td>
				</tr>
				
				<tr>
					<td>申请单号：</td>
					<td><input type="text" name="num" value="<%=mesInfo.getNum()%>" disabled="disabled" readonly="readonly"/></td>
					<td>申请人：</td>
					<td><input type="text" name="sqr" value="<%=mesInfo.getSqr()%>" disabled="disabled" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>
						<%
							if(mesInfo.getStyle()==0){
						%>
							数据零件号
						<%}else{
						%>
							订货号
						<%
							}
						%>

					<font color="red">*</font>：</td>
					<td><input type="text" name="sjljh" id="sjljh" value="<%=mesInfo.getSjljh() %>" disabled="disabled" readonly="readonly"/></td>
					<td>
						<%
							if(mesInfo.getStyle()==0){
						%>
							版本号
						<%}else{
						%>
							识别码
						<%
							}
						%>
						
					<font color="red">*</font>：</td>
					<td><input type="text" name="version" id="version" value="<%=mesInfo.getVersion() %>" disabled="disabled" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>处理人<font color="red">*</font>：</td>
						
					<td>
						<select name="clr" id="clr" disabled="disabled" onchange="shengchengrengonghao()">
							<option value=""><%=mesInfo.getClr()%></option>
								
						</select>
					</td>
					<td>处理人工号<font color="red">*</font>：</td>
					<td>
						<select name="clrgh" disabled="disabled" id="clrgh">
							<option value=""><%= mesInfo.getClrgh() %></option>
						</select>
					</td>
				</tr>
				<tr>					
					<td>原状态：</td>
					<td>
						<select name="oristate" size="1" id="oristate" disabled="disabled">
							<option value=""><%=mesInfo.getOristate_zhongwen() %></option>
						</select>
					</td>
					<td>拟变更状态：</td>
					<td>
						<select name="dststate" size="1" id="dststate" disabled="disabled">
							<option value=""><%= mesInfo.getDststate_zhongwen()%></option>

						</select>
					</td>
				</tr>
				<tr>
					<td>申请说明：</td>
					<td colspan="3"><input type="text" id="sqsm" name="sqsm" disabled="disabled" value="<%=mesInfo.getSqsm()%>" width="" style="width: 675px; " readonly="readonly"/></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td colspan="3"><input type="text" name="bz" width="" value="<%=mesInfo.getBz()%>" style="width: 675px; " disabled="disabled" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>附件1</td>
					<td><input type="text" name="fj1" id="fj1" value="<%= mesInfo.getFJ1()%>" readonly="readonly"/></td>
					<td><input class="shangchuanfile" name="browser1" id="browser1" type="button" style="width: 100px; " value="附件1下载" onclick="getfj1()"/></td>
				</tr>
				<tr>
					<td>附件2</td>
					<td><input type="text" name="fj2" id="fj2" value="<%=mesInfo.getFJ2()%>" readonly="readonly"/></td>
					<td><input class="shangchuanfile" name="browser2" id="browser2" type="button" style="width: 100px; " value="附件2下载" onclick="getfj2()"/></td>
				</tr>
				<tr>
					<td>附件3</td>
					<td><input type="text" name="fj3" id="fj3" value="<%=mesInfo.getFJ3()%>" readonly="readonly"/></td>
					<td><input class="shangchuanfile" name="browser3" id="browser3" type="button" style="width: 100px; " value="附件3下载" onclick="getfj3()"/></td>
				</tr>
				<tr>
					<td>处理意见<font style="color:red;font-size:9px" >*必填</font></td>
					<td colspan="3">
						<!-- <input type="text" name="clyj" id="clyj" style="width: 675px; height: 88px;word-break:break-all"/> -->
						<textarea name="clyj" id="clyj" cols="5" rows="2" style="width: 675px; height: 88px"></textarea>
					</td>
				</tr>
				<tr bgcolor="#E0EEEE">
					<td colspan="4" align="center">
						<input type="button" value="查看详细信息" style="height:30; background: #ffffff width:125" onclick="chakan()">
					
						<input type="button" value="审核通过" style="height:30; background: #999999 width:125" onclick="tongguo()">
					
						<input type="button" value="审核不通过" style="height:30; background: #cccccc width:125" onclick="quxiao()">
					</td>
					
				</tr>
			</table>
		</td></tr>
		
		<tr height="40"></tr>
		
		<tr><td>
			<table>
				<tr style="background:#dddddd">
					<td  height="25" class="td" width="2%" >状况</td>
					<td  height="25" class="td" width="5%" >说明</td>
					<td  height="25" class="td" width="2%" >申请人姓名</td>
					<td  height="25" class="td" width="3%" >处理日期时间</td>
					<td  height="25" class="td" width="8%" >意见</td>
				</tr>
				<%
					String[] arr = mesInfo.getClzk().split(";");
					for(String s : arr){
						String[] temp = s.split("-");
					
				 %>
				<tr style="background:#ffffff">
					<td  height="25" class="td" width="2%" ><%= temp[0]%></td>
					<td  height="25" class="td" width="5%" ><%= temp[1]%></td>
					<td  height="25" class="td" width="2%" ><%= temp[2]%></td>
					<td  height="25" class="td" width="3%" ><%= temp[3].substring(0,4)+"-"+temp[3].substring(4,6)+"-"+temp[3].substring(6,8)+" "+temp[3].substring(8,10)+":"+temp[3].substring(10,12)+":"+temp[3].substring(12,14)%></td>
					<td  height="25" class="td" width="8%" ><%= temp[4]%></td>
				</tr>
				
				<%
					} 
				 %>
			</table>
		
		</td></tr>	
	</table>
  	<div id="win" class="easyui-window" title="查看详细信息" style="width:1100px;height:450px"   
        data-options="closed:true,iconCls:'icon-save',modal:true,collapsible:false,minimizable:false,maximizable:false,closable:true"> 
      
     </div>
  </body>
  

</html>

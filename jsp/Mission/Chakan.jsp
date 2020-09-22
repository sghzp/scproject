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
	<!-- <script type="text/javascript" src="js/Mission.js"></script> -->
	<script>
		function fanhui(){
			window.location.href="<%=basePath%>/jsp/Mission/Tracing.jsp";
		}

		function chexiaoshenqing(){
			var chexiaoren = "<%=mesInfo.getSqrgh()%>";
			var dangqianyonghu = "<%=session.getAttribute("bh")%>";
			//alert(chexiaoren == 'superbh');
			var num = "<%=mesInfo.getNum()%>";
			var ifshenhe = "<%=mesInfo.getClzt()%>";
			if(chexiaoren == dangqianyonghu){
				if(ifshenhe == 1 || ifshenhe == 3 || ifshenhe == 4){//下边的1、3、4状态都代表流程结束！
					if(ifshenhe == 1){alert("您的申请已处理，无法撤销！");}
					if(ifshenhe == 3){alert("审核已撤销，流程已结束！");}
					if(ifshenhe == 4){alert("您已撤销申请！");}
				}else{//这里等于2时是被驳回的状态，可以直接结束流程。0或2的情况下可以撤销申请。
						//0代表还未处理
						//2代表被驳回！
					//（0-待处理，1-审核通过，2-驳回状态，3-撤销审核，4-撤销申请）
					window.location.href="<%=basePath%>/jsp/Mission/Chexiaoshenqing.jsp?num="+num;
				}
			}else{
				alert("只有申请人能够撤销申请！");
			}
		}
		function chexiaoshenhe(){
			var chexiaoren = "<%=mesInfo.getClrgh()%>";
			var dangqianyonghu = "<%=session.getAttribute("bh")%>";
			var ifhavechexiao = "<%=mesInfo.getClzt()%>";
			//（0-待处理，1-审核通过，2-驳回状态，3-撤销审核，4-撤销申请）
			//alert(chexiaoren == 'superbh');
			var num = "<%=mesInfo.getNum()%>";
			if(chexiaoren == dangqianyonghu){
				if(ifhavechexiao == 3){
					alert("已撤销过审核！");
				}else if(ifhavechexiao == 0){
					alert("尚未审核！");
				}else if(ifhavechexiao == 2){
					alert("当前流程处于驳回状态！");
				}else if(ifhavechexiao == 4){
					alert("流程已结束！");
				}else{
					$.post("./IfCanchexiaoshenhe?num=" + num,null,function(data){
						if(data == 1){
							window.location.href="<%=basePath%>/jsp/Mission/Chexiaoshenhe.jsp?num="+num;
						}else{
							alert("无法撤销审核！请查看撤销条目的状态！");
						}
					},"json");
				}
			}else{
				alert("只有指定处理人能够撤销审核！");
			}
		}
		
		function chakan(){
		    var sjljh =  "<%=mesInfo.getSjljh()%>";
		    var version =  "<%=mesInfo.getVersion()%>";
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
		
		function xiugai(){//ChangeIni_new_forxiugai.jsp//ChangeSjljh_new_forxiugai.jsp
			var style = "<%=mesInfo.getStyle()%>";
			var num = "<%=mesInfo.getNum()%>";
			//var version = "<%=mesInfo.getVersion()%>";
			if(style == 0){//ChangeSjljh_new_forxiugai.jsp
				window.location.href="<%=basePath%>/jsp/Mission/ChangeSjljh_new_forxiugai.jsp?num="+num;
			}else{//ChangeIni_new_forxiugai.jsp
				window.location.href="<%=basePath%>/jsp/Mission/ChangeIni_new_forxiugai.jsp?num="+num;
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
					<td><input type="text" name="sjljh" id="sjljh" disabled="disabled" value="<%=mesInfo.getSjljh() %>"/></td>
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
					<td><input type="text" name="version" id="version" value="<%=mesInfo.getVersion() %>" disabled="disabled" onchange="yuanzhuangtai()"/></td>
				</tr>
				<tr>
					<td>处理人<font color="red">*</font>：</td>
						
					<td>
						<select name="clr" id="clr" disabled="disabled">
							<option value=""><%=mesInfo.getClr()%></option>
								
						</select>
					</td>
					<td>处理人工号<font color="red">*</font>：</td>
					<td>
						<select name="clrgh" id="clrgh" disabled="disabled" >
							<option value=""><%= mesInfo.getClrgh() %></option>
						</select>
					</td>
				</tr>
				<tr>					
					<td>原状态：</td>
					<td>
						<select name="oristate" size="1" id="oristate" disabled="disabled" >
							<option value=""><%=mesInfo.getOristate_zhongwen() %></option>
						</select>
					</td>
					<td>拟变更状态：</td>
					<td>
						<select name="dststate" size="1" id="dststate" disabled="disabled" >
							<option value=""><%= mesInfo.getDststate_zhongwen()%></option>

						</select>
					</td>
				</tr>
				<tr>
					<td>申请说明：</td>
					<td colspan="3"><input type="text" id="sqsm" name="sqsm" disabled="disabled" value="<%=mesInfo.getSqsm()%>" width="" style="width: 675px; "/></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td colspan="3"><input type="text" name="bz" width="" value="<%=mesInfo.getBz()%>" disabled="disabled" style="width: 675px; "/></td>
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
				<tr bgcolor="#ffffff" height="10px">
					<td colspan="4"></td>
				</tr>
				<tr bgcolor="#E0EEEE">
					<td align="center">
						<input type="button" value="查看详细信息" style="height:30; width:125" onclick="chakan()">
					</td>
					<td align="center">
					<% 
						if(mesInfo.getSqrgh().equals(session.getAttribute("bh"))){
					%>
						<input type="button" value="撤销申请" style="height:30; width:125" onclick="chexiaoshenqing()">
					<%
						}else{
					%>
						<input type="button" value="撤销审核" style="height:30; width:125" onclick="chexiaoshenhe()">
					<%	
						
						}
					%>
						</td>
					<td align="center">
					<% 
						if(mesInfo.getClzt() == 2  &&  mesInfo.getSqrgh().equals(session.getAttribute("bh"))){
					%>
						<input type="button" value="修改后重新提交" style="height:30; width:125" onclick="xiugai()">
				    <%
				    	}
				    %>
					</td>
					<td align="center">
						<input type="button" value="返回" style="height:30; width:125" onclick="fanhui()">
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
					<td  height="25" class="td" width="2%" >姓名</td>
					<td  height="25" class="td" width="3%" >处理日期时间</td>
					<td  height="25" class="td" width="8%" >意见</td>
				</tr>
				<%
					String[] arr = mesInfo.getClzk().split(";");
					//System.out.println(arr.length);
					for(String s : arr){
						String[] temp = s.split("-");
						//System.out.println(s);
						//System.out.println("我是temp的长度"+temp.length);
					
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
        data-options="closed:true,iconCls:'icon-save',modal:true,collapsible:false,minimizable:false,maximizable:false,closable:true"> </div>
  </body>
  

</html>

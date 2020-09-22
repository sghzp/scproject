<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%
request.setCharacterEncoding("utf-8");
String qx="",yhm="",bm="";

if(session.getAttribute("qx")!=null){
qx=(String)session.getAttribute("qx");
yhm=(String)session.getAttribute("yhm");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" id="css" href="css/M1.css">
<script src="js/common.js" type="text/javascript"></script>
<script>
var collapsed = getcookie('cdb_collapse');
function collapse_change(menucount) {
	if($('menu_' + menucount).style.display == 'none') {
		$('menu_' + menucount).style.display = '';collapsed = collapsed.replace('[' + menucount + ']' , '');
		$('menuimg_' + menucount).src = 'images/menu_reduce.gif';
	} else {
		$('menu_' + menucount).style.display = 'none';collapsed += '[' + menucount + ']';
		$('menuimg_' + menucount).src = 'images/menu_add.gif';
	}
	setcookie('cdb_collapse', collapsed, 2592000);
}
</script>
</head>

<body style="margin:5px!important;margin:3px;">
	<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td align="center"><div style="margin-left:48px;"><span style="font-size:15px">导航栏</span></div></td>
		</tr>	
</table>
<div id="home">

<%	String right = (String)session.getAttribute("right");
	char[] arr = right.toCharArray();
	if(arr[0] == '0' && arr[4] == '0'){
		
	}else{
	
	%>
<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/Mission/Mission.jsp" target="main" style="font-size:15px">用户任务栏</a></td>
		</tr>
	
</table>


<table width="86" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist1" style="margin-bottom: 1px;">
		<tr class="leftmenutext">
			<td>&nbsp;<a href="jsp/Mission/Mission.jsp" target="main" style="font-size:12px">待处理事项</a></td>
		</tr>
	
</table>
<table width="86" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist1" style="margin-bottom: 1px;">
		<tr class="leftmenutext">
			<td>&nbsp;<a href="jsp/Mission/Tracing.jsp" target="main" style="font-size:12px">流程追踪</a></td>
		</tr>
	
</table>
<!-- <table width="86" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist1" style="margin-bottom: 1px;">
		<tr class="leftmenutext">
			<td>&nbsp;<a href="jsp/Mission/ChangeSjljh_new.jsp" target="main" style="font-size:11px">零件号状态变更</a></td>
		</tr>
	
</table>
<table width="86" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist1" style="margin-bottom: 1px;">
		<tr class="leftmenutext">
			<td>&nbsp;<a href="jsp/Mission/ChangeIni_new.jsp" target="main" style="font-size:11px">整车信息状态变更</a></td>
		</tr>
	
</table> -->
<table width="86" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist1" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td>&nbsp;<a href="jsp/Mission/Proxy.jsp" target="main" style="font-size:12px">代理人设置</a></td>
		</tr>
	
</table>

<%} %>


<!-- <table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/MessageAlert/MessageAlert.jsp" target="main" style="font-size:13px">消息通知</a></td>
		</tr>
	
</table>
 -->

<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="http://flow.sdec.com/bpmflowportal/MainPortal.aspx" target="_parent" style="font-size:15px">BPMFLOW系统</a></td>
		</tr>
	
</table>

<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/HexPfile/HexPfile.jsp" target="main" style="font-size:15px">HEX/PFILE管理</a></td>
		</tr>
	
</table>

<!-- <table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/HexPfileExamine/HexPfileExamine.jsp" target="main" style="font-size:13px">HEX/PFILE审核</a></td>
		</tr>
	
</table> -->

<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/CarManage/CarManage.jsp" target="main" style="font-size:13px">整车信息文件管理</a></td>
		</tr>
	
</table>

<!-- <table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/CarExamine/CarExamine.jsp" target="main" style="font-size:13px">整车信息文件审核</a></td>
		</tr>
	
</table> -->

<!-- <table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><a href="#" onClick="collapse_change(7)"><img id="menuimg_2" src="images/menu_add.gif" border="0"/></a>&nbsp;<a href="#" onClick="collapse_change(7)">试验监测</a></td>
		</tr>
		<tbody id="menu_7" style="display:none">
			<tr class="leftmenutd">
				<td>
					<table border="0" cellspacing="0" cellpadding="0" class="leftmenuinfo">

						<tr >
						  <td><a href="jiance/datashow.jsp" target="main">数据展示</a></td>
						</tr>
						<tr >
						  <td><a href="jiance/gis.jsp" target="main">GIS显示</a></td>
					  </tr> 
					</table>
			  </td>
			</tr>
		</tbody>
	</table> -->


<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/WriteRecord/WriteRecord.jsp" target="main" style="font-size:15px">刷写记录管理</a></td>
		</tr>
	
</table>


<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/Management_log/Management_log.jsp" target="main" style="font-size:15px">管理日志表</a></td>
		</tr>
	
</table>

<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/obd/obd.jsp" target="main" style="font-size:15px">OBD管理</a></td>
		</tr>
	
</table>


<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/ChangePassword/ChangePassword.jsp" target="main" style="font-size:15px">用户密码管理</a></td>
		</tr>
	
</table>



<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist" style="margin-bottom: 5px;">
		<tr class="leftmenutext">
			<td><img id="menuimg_2" src="images/menu_add.gif" border="0"/>&nbsp;<a href="jsp/UserInfoPro/UserInfoPro.jsp" target="main" style="font-size:15px">用户信息维护</a></td>
		</tr>
	
</table>

</div>

<table width="146" border="0" cellspacing="0" align="center" cellpadding="0" class="leftmenulist">
	<tr class="leftmenutext">
		<td><div style="margin-left:48px;"><a href="out.jsp" target="_parent" style="font-size:15px">退出</a></div></td>
	</tr>
</table>




</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.seu.beans.MesInfo"%>
<%@ page import="com.seu.dao.impl.MesInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.net.URLDecoder"%>

<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");
//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
String lc = (String)request.getParameter("lc");
String clzk = (String)request.getParameter("clzk");
String sjljh1 = (String)request.getParameter("sjljh");
String version1 = (String)request.getParameter("version");
String sjljh =null;
String version = null;
if(sjljh1 != null){
	sjljh =  URLDecoder.decode(sjljh1, "UTF-8");
}
if(version1 != null){
	version =  URLDecoder.decode(version1, "UTF-8");
}

List<MesInfo> arr = null;
if("all".equals(lc)){//my代表我的流程.all代表所有流程
	MesInfoDaoImpl midi = new MesInfoDaoImpl();
	arr = midi.query_alone_fortracing3(sjljh, clzk, version);
}else{//包括my'equals（“lc”）的情况  和   lc为null 的情况
	//System.out.println("lc为："+lc);
	if(clzk == null || sjljh == null){
		MesInfoDaoImpl midi = new MesInfoDaoImpl();
		//arr = midi.query((String)session.getAttribute("bh"));
		//arr.addAll(midi.query_by_sqrgh((String)session.getAttribute("bh")));
		arr = midi.query_by_sqrgh((String)session.getAttribute("bh"));
	}else{
		MesInfoDaoImpl midi = new MesInfoDaoImpl();
		//arr = midi.query_fortracing1((String)session.getAttribute("bh"), sjljh, clzk, version);
		//arr.addAll(midi.queryfor_tracing2((String)session.getAttribute("bh"), sjljh, clzk, version));
		arr = midi.query_by_sqrgh_daitiaojian((String)session.getAttribute("bh"), sjljh, clzk, version);
	}
}
	




//System.out.println(sqsm);

Iterator<MesInfo> it = arr.iterator(); 
//List<MesInfo> arr_temp = new ArrayList<MesInfo>();

/* if(clzk == null || date == null){
	it = arr.iterator(); 
}else{
	if("-1".equals(clzk)){
		for(int i=0;i<arr.size();i++){
			if(arr.get(i).getSqrq().equals(date)){
				arr_temp.add(arr.get(i));
			} 
		}
	}else{
		for(int i=0;i<arr.size();i++){
			if((arr.get(i).getSqrq().equals(date)) && (arr.get(i).getClzt() == Integer.parseInt(clzk))){
				arr_temp.add(arr.get(i));
			} 
		}
	}
	it = arr_temp.iterator();
} */ 


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
		window.parent.topmenu.location.reload();//刷新menu的frame。保证处理好一个任务后，刷新页面。
		function query(){
			var lc = $("#lc").val();
			var clzk = $("#clzk").val();
			var sjljh = encodeURI(encodeURI($("#sjljh").val()));
			var version = encodeURI(encodeURI($("#version").val()));
			//alert(lc);
			window.location.href="<%=basePath%>/jsp/Mission/Tracing.jsp?clzk="+clzk+"&sjljh="+sjljh+"&version="+version+"&lc="+lc;
		}
	</script>
	
	
  </head>
  
  <body>
   <table width="90%">
   		<tr><td>
		    <table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="#dddddd">
			    <tr>
			      	<td><a href="jsp/Mission/Mission.jsp"><input type="button" value="待处理事项" style="height: 25px;width: 100px; background:#C6E2FF;"/></a></td>
					<td><a href="jsp/Mission/Tracing.jsp"><input type="button" value="流程追踪" style="height: 25px;width: 100px; background:red;"/></a></td>
					<!-- <td><a href="jsp/Mission/ChangeSjljh_new.jsp"><input type="button" value="数据零件号状态变更申请" style="height: 25px;width: 160px; background:#C6E2FF;"/></a></td>
					<td><a href="jsp/Mission/ChangeIni_new.jsp"><input type="button" value="整车信息状态变更申请" style="height: 25px;width: 160px; background:#C6E2FF;"/></a></td>
					 --><td><a href="jsp/Mission/Proxy.jsp"><input type="button" value="代理人设置" style="height: 25px;width: 160px; background:#C6E2FF;"/></a></td>
			    </tr>
			</table>
		</td></tr>
		
		<tr>
			<td>
				流程：
				<select id="lc" name="lc">
					<option value="my">我的流程</option>
					<option value="all">所有流程</option>
				</select>
				数据零件号/订货号：<input type="text" id="sjljh" name="sjljh"/>
				版本号/识别码：<input type="text" id="version" name="version"/>
				处理状态：
				<select id="clzk" name="clzk">
					<option value="">所有</option>	
					<option value="0">待处理</option>
					<option value="1">审核通过</option>
					<option value="2">驳回状态</option>
					<option value="3">撤销审核</option>
					<option value="4">撤销申请</option>
				</select>
				<input type="button" id="tijiao" onclick="query()" value="搜索" style="border:1; height: 22px; width: 50px; 
						background: #555555; color:#ffffff">
				
			</td>

		</tr>
		
		<tr><td>
			<table>
				<tr style="background:#1E90FF">
					<td align="center" height="25" class="td" width="3%" ></td>
					<td align="center" height="25" class="td" width="8%" >数据零件号/订货号</td>
					<td align="center" height="25" class="td" width="8%" >版本号/识别码</td>
					<td align="center" height="25" class="td" width="4%" >申请者</td>
					<td align="center" height="25" class="td" width="8%" >申请表单编号</td>
					<td align="center" height="25" class="td" width="6%" >申请日期</td>
					<td align="center" height="25" class="td" width="4%" >目前处理人</td>
					<td align="center" height="25" class="td" width="4%" >处理状况</td>
					<td align="center" height="25" class="td" width="10%">申请说明</td>
				</tr>
				<%
					while(it.hasNext()){
						MesInfo temp = it.next(); 
				%>
					<tr>
						<td align="center" height="15" class="td" width="3%" ><a href="jsp/Mission/Chakan.jsp?num=<%=temp.getNum()%>">查看</a></td>
						<td align="center" height="15" class="td" width="8%" ><%=temp.getSjljh()%></td>
						<td align="center" height="15" class="td" width="8%" ><%=temp.getVersion()%></td>
						<td align="center" height="15" class="td" width="4%" ><%=temp.getSqr()%></td>
						<td align="center" height="25" class="td" width="8%" ><%=temp.getNum()%></td>
						<td align="center" height="25" class="td" width="6%" ><%=temp.getSqrq().substring(0,4)+"-"+temp.getSqrq().substring(4,6)+"-"+temp.getSqrq().substring(6,8)%></td>
						<td align="center" height="25" class="td" width="4%" ><%=temp.getClr()%></td>
						<% String[] clztss = new String[]{"待处理","审核通过","被驳回","撤销审核","撤销申请"};%>
						<td align="center" height="25" class="td" width="4%" >
							<%=clztss[temp.getClzt()]%>
						</td>
						
						<td align="center" height="25" class="td" width="10%"><%=temp.getSqsm()%></td>
					</tr>
				
				
					<%
						}
					 %>
				
				
				
				<!-- 				<tr style="background:#eeeeee">
					<td  height="15" class="td" width="8%" ><a href="jsp/Mission/Dealing.jsp">处理</a></td>
					<td  height="15" class="td" width="8%" >翁伟东</td>
					<td  height="15" class="td" width="8%" >IT资源新增或调整流程</td>
					<td  height="15" class="td" width="8%" >2016/4/27 12:56:04</td>
					<td  height="15" class="td" width="8%" ></td>
					<td  height="15" class="td" width="10%" >已处理完毕</td>
					<td  height="15" class="td" width="10%" >IT资源新增或调整流程，通知，翁伟东（2016/4/27 12:56:04）申请</td>
				</tr> -->


			</table>
		</td></tr>	
	</table>
  	
<%-- <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td height="30" background="../images/bg_list.gif"><div  style="padding-left:10px; display:inline; font-weight:bold; color:#FFFFFF"><span style="font-size:18px">试验管理</span></div>
    <div  style="padding-right:10px; font-weight:bold; color:#F08080;float: right;font-size: medium"><a href="standard.jsp"><font style="font-weight:bold; color:#F08080;font-size: medium">管理规范</font></a>/<a href="manage_add.jsp"><font style="font-weight:bold; color:#F08080;font-size: medium">新建</font></a></div>
    </td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
      <tr>
        <td bgcolor="#FFFFFF">
        </td>
      </tr>
      <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#FFFFFF'" bgcolor="#F1F5F8">
        <td colspan="2"><table width="100%" border="0" cellpadding="5" cellspacing="0">
           
             	 		<tr >
							 <td  height="15" class="td" width="8%" ></td>
							 <td  height="15" class="td" width="8%" >是/否处理</td>
							 <td  height="15" class="td" width="8%" >申请者/填表人</td>
							 <td  height="15" class="td" width="8%" >申请表单</td>
							 <td  height="15" class="td" width="8%" >申请日期</td>
							 <td  height="15" class="td" width="8%" >目前处理单位</td>
							 <td  height="15" width="10%" class="td">处理状况</td>
							 <td  height="15" width="10%" class="td">主旨</td>
						</tr>

          
          </table>
            
        </td>
      </tr>

    <tr onmouseover="style.backgroundColor='#FFFF00'" onmouseout="style.backgroundColor='#F1F5F8'" bgcolor="#FFFFFF">
       <td colspan="2"><table width="100%" border="0" cellpadding="5" cellspacing="0">
 <tr>
 <td height="15" class="td" width="8%"  ></td>
 <td height="15" class="td" width="8%"  ></td>
 <td height="15" class="td" width="8%"  ></td>
 <td height="15" class="td" width="8%"  ></td>
 <td height="15" class="td" width="8%"  ></td>
 <td height="15" class="td" width="8%"  ></td>
 <td height="15" class="td" width="8%"  ></td>
 <td height="15" class="td" width="8%"  ></td>
 <td class="td" width="10%"><a href="manageview.jsp?keyid=<%=%>">查看</a>/<a href="managemodify.jsp?keyid=<%=%>">修改</a>/<a href="managedelete.jsp?keyid=<%=%>">删除</a></td>
</tr>
</table>
</td>
</tr>
				 	 <tr>
    <td height="38" width="100%"></td>
  </tr>
</table>



 --%>
















<!--    <table id ="zhengti" width =110% align="center" >

    
    <tr>
    	<td>
		    <div style="overflow: auto; width: 84%; height: 300" id="chaxunbiaogediv">
		    	<table height = 290  id="box">
	 
		    	 </table>
		    </div>
	    </td>
    </tr>  
    </table> -->
 
  
  </body>
  

</html>

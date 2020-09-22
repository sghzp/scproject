<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.seu.beans.UserInfo"%>
<%@ page import="com.seu.dao.impl.UserInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.seu.jdbc.JdbcUtils"%>

<%
request.setCharacterEncoding("UTF-8");//设置页面字符集
response.setCharacterEncoding("UTF-8");
//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
	String dstname = null;
	String dstnum = null;
	String startdate = null;
	String enddate = null;

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	try{
		conn = JdbcUtils.getConnection();
		String sql = "select * from OTHERUSERINFO where orinum ='"+ session.getAttribute("bh") +"'";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()){
			dstnum = rs.getString("dstnum");
			dstname = rs.getString("dstname");
			startdate = rs.getString("startdate");
			enddate = rs.getString("enddate");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JdbcUtils.free(rs, ps, conn);
	}

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
	<script type="text/javascript" src="js/adddate.js"></script>
	<script>
		function tijiao000(){
			var startdate = $("#startdate").val();
			var enddate = $("#enddate").val();
			var dstnum = $("#dstnum").val();
			var dstname = $("#dstname").val();
			var check = 1;
			if(startdate == "" || enddate =="" || dstnum =="" || dstname ==""){
				alert("请填写完整表单");
				check = 0;
			} 
			if(startdate >= enddate){
				alert("起止时间晚于结束时间！");
				check = 0;
			}
			if(check == 1){
				form.action="<%=basePath%>/jsp/Mission/Proxy_deal.jsp";
				form.submit();
			}
			
		}
		
		function quxiao(){
			window.location.href="<%=basePath%>/jsp/Mission/Proxy_delete.jsp";
		}
		
		function shengchengrengonghao(){
			var dstname = encodeURI(encodeURI($("#dstname").val()));
			$.post("./QueryRengonghao?clr=" + dstname,null,function(data){
				//得到一个字符串数组，把这个数组里的值更新到发动机这个select中。
				var str = '<option value="">请选择</option>';
				for(var i=0;i<data.length;i++){
					str = str + '<option value='+data[i]+'>'+data[i]+'</option>';
				}
				$("#dstnum").html(str);
			},"json");
		
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
			    	 --><td><a href="jsp/Mission/Proxy.jsp"><input type="button" value="代理人设置" style="height: 25px;width: 160px; background:red;"/></a></td>
			    </tr>
			</table>
		</td></tr>
  <tr>
  	<td>
  
	  <form name="form" action="" method="post">
	   <table style=" font-size: 13px;border: 1px solid #000000;cellspacing: 0px; border-collapse:collapse;cellspacing:0px;height:30%;width:100%;background: #E0EEEE;">
	  
	    <tr>
	    	<td>
			    <span style="font-size:15px">需代理工号：</span>
		    </td>
		    <td>
		    	<input type="text" id="orinum" name="orinum" value="<%=session.getAttribute("bh")%>" readonly="readonly"/>
		    </td>
	    </tr> 
	    <tr>
	    	<td>
			    <span style="font-size:15px">需代理姓名：</span>
		    </td>
		    <td>
		    	<input type="text" id="oriname" name="oriname" value="<%=session.getAttribute("username")%>"  readonly="readonly"/>
		    </td>
	    </tr>
	    <tr>
	    	<td>
			    <span style="font-size:15px">代理人姓名：</span>
		    </td>
		    <%
				UserInfoDaoImpl uidi = new UserInfoDaoImpl();
				HashSet<String> names = uidi.query_clr();
				Iterator<String> it = names.iterator();
			%>
		    
		    <td>
		    	<select name="dstname" id="dstname" onchange="shengchengrengonghao()">
							<option value="">请选择</option>
								<%
								while(it.hasNext()){
									String temp1 = it.next();
									%>
										<option value="<%=temp1%>"><%=temp1%></option>
									<%
								}
								%>
				</select>
		    </td>
	    </tr>
	    <tr>
	    	<td>
			    <span style="font-size:15px">代理人工号：</span>
		    </td>
		    <td>
		    	<select name="dstnum" id="dstnum">
							
				</select>
		    </td>
	    </tr>
	    <tr>
	    	<td>
			    <span style="font-size:15px">代理开始日期：</span>
		    </td>
		    <td>
		    	<input type="text" id="startdate" name="startdate" onclick="SelectDate(this,'yyyyMMdd')"/>
		    </td>
	    </tr>
	    <tr>
	    	<td>
			    <span style="font-size:15px">代理结束日期：</span>
		    </td>
		    <td>
		    	<input type="text" id="enddate" name="enddate" onclick="SelectDate(this,'yyyyMMdd')"/>
		    </td>
	    </tr>
	    
	    
	    
	    <tr>
	    	<td></td>
	    	<td>
	    		<input type="button" id="tijiao" onclick="tijiao000()" value="提交" style=" height: 22px; width: 50px; 
						 color:#000000">
				 <input type="button" id="quxiaodaili" onclick="quxiao()" value="取消代理" style=" height: 22px; width: 100px; 
						 color:#000000"> 
	    	</td>
	    </tr> 
	    </table>
	    </form>
    	</td>
    </tr>
    
    <tr>
    	<td>已设置代理信息：<br/>
    		代理人姓名:<%=dstname==null ? "无" :dstname %><br />
    		代理人工号:<%=dstnum==null ? "无" :dstnum %><br/>
    		代理开始时间:<%=startdate==null ? "无" : startdate.substring(0,4)+"-"+startdate.substring(4,6)+"-"+startdate.substring(6,8)%><br/>
    		代理结束时间:<%=enddate==null ? "无" : enddate.substring(0,4)+"-"+enddate.substring(4,6)+"-"+enddate.substring(6,8) %><br/>
    		</td>
    		
    </tr>
    
    <tr><td>
    		<table>
				<tr style="background:#dddddd">
					<td  height="25" class="td" width="8%" >代理人姓名</td>
					<td  height="25" class="td" width="8%" >代理人工号</td>
					<td  height="25" class="td" width="8%" >代理开始时间</td>
					<td  height="25" class="td" width="8%" >代理结束时间</td>
				</tr>
				<%
					ArrayList<String[]> arr = new ArrayList<String[]>();
					
					Connection conn1 = null;
					PreparedStatement ps1 = null;
					ResultSet rs1 = null;
					try{
						conn1 = JdbcUtils.getConnection();
						String sql1 = "select * from OTHERUSERINFOBACK where orinum ='"+ session.getAttribute("bh") +"'";
						ps1 = conn1.prepareStatement(sql1);
						rs1 = ps1.executeQuery();
						while(rs1.next()){
							String[] strs = new String[4];
							strs[0] = rs1.getString("dstnum");
							strs[1] = rs1.getString("dstname");
							strs[2] = rs1.getString("startdate");
							strs[3] = rs1.getString("enddate");
							arr.add(strs);
						}
					}catch(Exception e){
						e.printStackTrace();
					}finally{
						JdbcUtils.free(rs1, ps1, conn1);
					}
					for(String[] s : arr){
					
				 %>
				<tr style="background:#ffffff">
					<td  height="25" class="td" width="8%" ><%= s[0]%></td>
					<td  height="25" class="td" width="8%" ><%= s[1]%></td>
					<td  height="25" class="td" width="8%" ><%= s[2].substring(0,4)+"-"+ s[2].substring(4,6)+"-"+ s[2].substring(6,8)%></td>
					<td  height="25" class="td" width="8%" ><%= s[3].substring(0,4)+"-"+ s[3].substring(4,6)+"-"+ s[3].substring(6,8)%></td>
				</tr>
				
				<%
					} 
				 %>
			</table>
    </td></tr>
    
    </table>
    		   
  </body>
  

</html>

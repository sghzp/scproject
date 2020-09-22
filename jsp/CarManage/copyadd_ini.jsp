<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%@ page import="com.seu.beans.IniInfo"%>
<%@ page import="com.seu.ioutils.IniToHashMap"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8");//设置页面字符集
response.setCharacterEncoding("utf-8");
String ecutype = (String)request.getParameter("ecutype");
System.out.println("*******"+ecutype+"*******");

%>


<%
	String INIID = request.getParameter("INIID");
	System.out.println(INIID);
	IniInfoDaoImpl iniInfoDaoImpl = new IniInfoDaoImpl();
	String sql = "select * from INIINFO where INIID="+INIID; 
	ArrayList<IniInfo> iniInfos = null;
	IniInfo iniInfo = null;	
	iniInfos = iniInfoDaoImpl.query(sql);
	iniInfo = (IniInfo)iniInfos.get(0);

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" id="css" href="css/addWholeCar.css"></link>
<script src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script language="javascript">
/**
*getClass()方法为网上down的方法。返回同一个类的，同一个标签（如：input）的一个dom元素的“数组”。
*/
function getClass(tagName,className) //获得标签名为tagName,类名className的元素
{
    if(document.getElementsByClassName) //支持这个函数
    {        return document.getElementsByClassName(className);
    }
    else
    {       var tags=document.getElementsByTagName(tagName);//获取标签
        var tagArr=[];//用于返回类名为className的元素
        for(var i=0;i < tags.length; i++)
        {
            if(tags[i].class == className)
            {
                tagArr[tagArr.length] = tags[i];//保存满足条件的元素
            }
        }
        return tagArr;
    }

}



$(function(){
	var ecutype = "<%=ecutype%>";
	if(ecutype!="null")
	{
		//alert(ecutype);
		$("#ecutype").find("option[value='"+ecutype+"']").attr("selected",true);
	
	}
	
});

function checkDo(){

	var ecuorder = $("#ecuorder").val();
	var sbm = $("#sbm").val();
	var check = 1;
	if($("#ecuorder").val()==""){
    alert("订货号不能为空");
    check = 0;
	}
	
	if($("#sjljh").val()==""){
    alert("数据零件号不能为空");
    check = 0;
	}
	if($("#sbm").val()==""){
    alert("识别码不能为空");
    check = 0;
	}
	if($("#ecutype").val() == ""){
	alert("请选择ECU型号");
	check = 0;
	}

	if(check == 1){
		$.post("./IfHaveIni?ecuorder=" + ecuorder+"&sbm="+ sbm+"&caozuo=add",null,function(data){
			if(data == 0){
				form.submit();
			}else{
				alert("数据库中已存在相同的订货号+识别码！");
			}
		},"json");
		
		
		
		
	}	
}

function zuhelujing(){
		var a = "inifile/";
		var b = $("#ecutype").val();
		var c = $("#sjljh").val();
		var fenge = "/";
		var lujing= a + b + fenge + c;
		$("#cflj").val(lujing);		
}

function zuhewenjianming(){
	var a = $("#ecuorder").val();
	var b = $("#sbm").val();
	
	var wenjianming = a + "_" + b + ".ini";
	$("#inifile").val(wenjianming);
}

/**
*动态生成表格的方法，每次都要重载页面。判断接受的ecutype是否有值！
*/
function dongtaibiaoge(){
	var ecutype = $("#ecutype").val();
	var INIID = "<%=INIID%>";
	
	window.location.href="<%=basePath%>/jsp/CarManage/copyadd_ini.jsp?ecutype="+ecutype+"&INIID="+INIID;
	
	
	
}

function fanhui(){
window.location.href="<%=basePath%>/jsp/CarManage/CarManage.jsp";
}

function checkdaxiao(a,b,c,d){
	if(a>=b && a<=c){
		//alert("true");
		return;
	}else{
		alert(d + "---范围有误，请重新填写！");
	}
}

</script>

</head>
<body>

	<form name="form" method="post" action="AddIni_deal">
	<div style="width:100%">
		<table width="80%">
			<tr>
				<td>订货号<span style="color:red;font-size:12px">*</span>
				</td><td>
				<input class="bunengweikong" name="ecuorder" id="ecuorder" type="text" onchange="zuhewenjianming()" value="<%=iniInfo.getECUOrder()%>"/></td>
			<%
						EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
						Map<String,String> m = ebii.query4();
						Iterator it = m.entrySet().iterator();
			 %>
				<td>ECU型号<span style="color:red;font-size:12px">*</span>
				</td><td>
				<select name="ecutype" size="1" id="ecutype" onchange="dongtaibiaoge()">
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
				
				</select>
				</td>
				
				</tr><tr>
				<td>识别码<span style="color:red;font-size:12px">*</span>
				</td><td>
				<input class="bunengweikong" name="sbm" id="sbm" type="text" onchange="zuhewenjianming()" value="<%=iniInfo.getSbm()%>"/></td>
				
				<td>存放路径
				</td><td>
				<input class="bunengweikong" name="cflj" id="cflj" type="text" readonly="readonly" value="<%=iniInfo.getCflj()%>"/></td>
				<td></td>
			</tr>
			<tr>
						<%
						HexInfoDaoImpl hidi = new HexInfoDaoImpl();
						HashSet<String> hs_sjljh = hidi.query_sjljh(ecutype);
						Iterator<String> it_sjljh = hs_sjljh.iterator();
			 			%>
			
				<td>数据零件号<span style="color:red;font-size:12px">*</span>
				<!-- <input class="bunengweikong" name="sjljh" id="sjljh" type="text" onchange="zuhelujing()"/> -->
				</td><td>
				<select name="sjljh" size="1" id="sjljh" onchange="zuhelujing()">
					<option value="">请选择</option>
					<%
					while(it_sjljh.hasNext()){
					String temp = it_sjljh.next();
					%>
						<option value="<%=temp%>"><%=temp%></option>
					<%
					}
					 %>
				
				</select>
				</td>
				<td>识别码状态
				</td><td>
					<select name="state" size="1" id="state">
			    		<option value="-1">空</option>
				   	</select>
				</td>
				</tr>
				<tr>
				<td>整车编码
				</td><td>
				<input class="bunengweikong" name="zcbm" id="zcbm" type="text" value="<%=iniInfo.getZcbm()%>"/></td>
				<td>INI文件名
				</td><td>
				<input class="bunengweikong" name="inifile" id="inifile" type="text"  readonly="readonly" value="<%=iniInfo.getINIFile()%>"/></td>
				<td></td>
			</tr>
			<tr>
			<td>
				备注1
				</td><td colspan="3">
				<input name="bz1" id="bz1" type="text" style="width: 600px; " value="<%=iniInfo.getBz1()%>"/>
			</td>
			</tr>
			<tr>
			<td>
				备注2
				</td><td colspan="3">
				<input name="bz2" id="bz2" type="text" style="width: 600px; " value="<%=iniInfo.getBz2()%>"/>
			</td>
			</tr>
			<tr>
			<td colspan="4">
				<span style="color:red;font-size:12px">(*号标注项为必填或必选项)</span>
			</td>
			</tr>
		</table>
	
	</div>

	<%
		HashMap<String,Integer> hm = ebii.query2();
		String tablename = null;
		ResultSet rs = null;
		if(ecutype!=null && ecutype !=""){
		//测试用，要加上条件判断

			if(hm.get(ecutype)==1 || hm.get(ecutype)==2){
			tablename = ecutype+"_iniinfo_"+"can";
			}
			if(hm.get(ecutype)==0){
			tablename = ecutype+"_iniinfo_"+"k";
			}
			
		
			//System.out.println("^_^" + JdbcUtils.HasTable(tablename));
		
		//System.err.println(tablename);
		String sql1 = "select * from "+tablename+" where style=0";
		String sql2 = "select * from "+tablename+" where style=2";
		String sql3 = "select * from "+tablename+" where style=4";	
		if(JdbcUtils.HasTable(tablename)){
	 %>

	<div style="width:100%">
		<table width="80%">
			<%
				
				rs = JdbcUtils.query(sql2);
				if(rs != null){
								rs.last();
								int rowCount = rs.getRow();
								for(int i = 1;i<=rowCount;i=i+2){
									rs.absolute(i);
									%>
									<tr>
										<td><%=rs.getString("name")%></td>
										<td>
											<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>"  value="1"/>开
											<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>"  value="0" checked="true"/>关
										</td>
										
									<%if(i+1<=rowCount){
									rs.absolute(i+1);
									
									
									%>
										<td><%=rs.getString("name")%></td>
										<td>
											<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>"  value="1"/>开
											<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>"  value="0" checked="true"/>关
										</td>
									</tr>
									<%
									}else{
									%>
										<td></td><td></td>
										</tr>
									<%
									}
								}
				}

				JdbcUtils.free();//一定记得加这句
			 	%>
			 		
<!-- ****************************华丽分割线*****************************************************	 -->	 		
			 		
		<%			
				rs = JdbcUtils.query(sql1);//sql1  对应 style=0
				if(rs != null){
								rs.last();
								int rowCount = rs.getRow();
								for(int i = 1;i<=rowCount;i=i+2){
									rs.absolute(i);
									%>
									<tr>
										<td><%=rs.getString("name")%><span style="color:red;font-size:12px">(<%=rs.getString("Minvalue")%>-<%=rs.getString("Maxvalue")%><%=rs.getString("unitname")==null ? "" : rs.getString("unitname")%>)</span></td><td>
											<input class="bunengweikong" name="<%=rs.getString("englishname")%>" type="text" value="<%=rs.getString("Minvalue")%>" id="<%=rs.getString("englishname")%>" onchange="checkdaxiao(this.value,<%=rs.getString("Minvalue")%>,<%=rs.getString("Maxvalue")%>,'<%=rs.getString("name")%>')"/>
										</td>
										
									<%if(i+1<=rowCount){
									rs.absolute(i+1);
									
									
									%>
										<td><%=rs.getString("name")%><span style="color:red;font-size:12px">(<%=rs.getString("Minvalue")%>-<%=rs.getString("Maxvalue")%><%=rs.getString("unitname")==null ? "" : rs.getString("unitname")%>)</span></td><td>
											<input class="bunengweikong" name="<%=rs.getString("englishname")%>" type="text" value="<%=rs.getString("Minvalue")%>" id="<%=rs.getString("englishname")%>" onchange="checkdaxiao(this.value,<%=rs.getString("Minvalue")%>,<%=rs.getString("Maxvalue")%>,'<%=rs.getString("name")%>')"/>
										</td>
									</tr>
									<%
									}else{
									%>
										<td></td><td></td>
										</tr>
									<%
									}
								}
				}

				JdbcUtils.free();//一定记得加这句
			 	%>
				
<!-- ****************************华丽分割线*****************************************************	 -->	 		
			 		
		<%			
				rs = JdbcUtils.query(sql3);//sql3  对应 style=4
				if(rs != null){
								rs.last();
								int rowCount = rs.getRow();
								for(int i = 1;i<=rowCount;i=i+2){
									rs.absolute(i);
									%>
									<tr>
										<td><%=rs.getString("name")%><span style="color:red;font-size:12px">(<%=rs.getString("Minvalue")%>-<%=rs.getString("Maxvalue")%>位)</span></td><td>
											<input class="bunengweikong" name="<%=rs.getString("englishname")%>" type="text" value="<%=rs.getString("Minvalue")%>" id="<%=rs.getString("englishname")%>"/>
										</td>
										
									<%if(i+1<=rowCount){
									rs.absolute(i+1);									
									%>
										<td><%=rs.getString("name")%><span style="color:red;font-size:12px">(<%=rs.getString("Minvalue")%>-<%=rs.getString("Maxvalue")%>位)</span></td><td>
											<input class="bunengweikong" name="<%=rs.getString("englishname")%>" type="text" value="<%=rs.getString("Minvalue")%>" id="<%=rs.getString("englishname")%>"/>
										</td>
									</tr>
									<%
									}else{
									%>
										<td></td><td></td>
										</tr>
									<%
									}
								}
				}

				JdbcUtils.free();//一定记得加这句
			 	%>
				
						 		
		</table>
	</div>
	
	<%
		}}//后边的这个“}”是外围判断if(表是否存在的){  >--"}"  
		if(!JdbcUtils.HasTable(tablename)){%>
		<script>alert("不存在对应数据表");</script>
		<%
		}
	 %>
	
	<input type="button" value="保存" onclick="checkDo()"/>
	<input type="button" value="返回" onclick="fanhui()"/>
	


</form>
</body>
</html>



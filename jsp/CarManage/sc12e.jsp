<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.seu.ioutils.IniToHashMap"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="com.seu.Global.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8");//设置页面字符集
response.setCharacterEncoding("utf-8");
String ecutype = (String)request.getParameter("ecutype");
System.out.println(ecutype);
String yidu = (String)request.getParameter("yidu");
String ecuorder = (String)request.getParameter("ecuorder");
String sbm = (String)request.getParameter("sbm");
String cflj= (String)request.getParameter("cflj");
String sjljh = (String)request.getParameter("sjljh");
String state = (String)request.getParameter("state");
String zcbm= (String)request.getParameter("zcbm");
String inifile = (String)request.getParameter("inifile");
String bz1 = (String)request.getParameter("bz1");
String bz2 = (String)request.getParameter("bz2");

if(ecuorder != null){
	ecuorder = new String(ecuorder.getBytes("iso8859-1"),"utf-8"); 
}

if(sbm != null){
	sbm = new String(sbm.getBytes("iso8859-1"),"utf-8"); 
}

if(cflj != null){
	cflj = new String(cflj.getBytes("iso8859-1"),"utf-8"); 
}

if(sjljh != null){
	sjljh = new String(sjljh.getBytes("iso8859-1"),"utf-8"); 
}

if(state != null){
	state = new String(state.getBytes("iso8859-1"),"utf-8"); 
}

if(zcbm != null){
	zcbm = new String(zcbm.getBytes("iso8859-1"),"utf-8"); 
}

if(inifile != null){
	inifile = new String(inifile.getBytes("iso8859-1"),"utf-8"); 
}

if(bz1 != null){
	bz1 = new String(bz1.getBytes("iso8859-1"),"utf-8"); 
}

if(bz2 != null){
	bz2 = new String(bz2.getBytes("iso8859-1"),"utf-8"); 
}



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" id="css" href="css/addWholeCar.css"></link>
<link rel="stylesheet" type="text/css" id="css" href="css/easyui.css"></link>
<script src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/jquery.easyui.min.js"></script>
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

function AddRunningDiv() {
    $("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: $(document).height() }).appendTo("body");
    $("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候...").appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(document).height() - 45) / 2 });
} 

function MoveRunningDiv() {
    $("div[class='datagrid-mask']").remove();
    $("div[class='datagrid-mask-msg']").remove();
} 

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
				AddRunningDiv();
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

//fromhex()
function hex(){
	var ecutype = "<%=ecutype%>";
	var yes = "yes";
	var sjljh = $("#sjljh").val();
	var ecuorder = $("#ecuorder").val();
	var sbm = $("#sbm").val();
	var cflj = $("#cflj").val();
	var sjljh = $("#sjljh").val();
	var state = $("#state").val();
	var zcbm = $("#zcbm").val();
	var inifile = $("#inifile").val();
	var bz1 = $("#bz1").val();
	var bz2 = $("#bz2").val();
	//alert(bz1);
	if(sjljh == ""){
		alert("请先选择数据零件号");
	}else{
		AddRunningDiv();
		$.post("./FromHexToSC12E?sjljh="+sjljh,null,function(data){
			if(data == 1){
				MoveRunningDiv();
				window.location.href="<%=basePath%>/jsp/CarManage/sc12e.jsp?ecutype="+ecutype+"&yidu="+yes+"&ecuorder="+ecuorder+"&sbm="+sbm+"&cflj="+cflj+"&sjljh="+sjljh+"&state="+state+"&zcbm="+zcbm+"&inifile="+inifile+"&bz1="+bz1+"&bz2="+bz2;	
			}else{
				MoveRunningDiv();
				alert("加载失败！");
				//window.location.href="<%=basePath%>/jsp/CarManage/sc12e.jsp?ecutype="+ecutype+"&yidu="+yes+"&ecuorder="+ecuorder+"&sbm="+sbm+"&cflj="+cflj+"&sjljh="+sjljh+"&state="+state+"&zcbm="+zcbm+"&inifile="+inifile+"&bz1="+bz1+"&bz2="+bz2;	
			}
			
	},"json");
}
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
	window.location.href="<%=basePath%>/jsp/CarManage/addIni.jsp?ecutype="+ecutype;
}

function gaibiansjljh(){
	var ecutype = $("#ecutype").val();
	var fadongji = $("#bz2").val();
	
		//发送一个请求，带参数的哟！ecutype+fadongji
		$.post("./UseFadongjiToMin?ecutype=" + ecutype+"&fadongji="+ fadongji,null,function(data){
			//得到一个字符串数组，把这个数组里的值更新到发动机这个select中。
			var str = '<option value="">请选择</option>';
			for(var i=0;i<data.length;i++){
				str = str + '<option value='+data[i]+'>'+data[i]+'</option>';
			}
			$("#sjljh").html(str);
		},"json");
		
	
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
			<%
						EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
						Map<String,String> m = ebii.query4();
						Iterator it = m.entrySet().iterator();
			 %>
			 		<%
						HexInfoDaoImpl hidi = new HexInfoDaoImpl();
						HashSet<String> hs_sjljh = hidi.query_sjljh(ecutype);
						Iterator<String> it_sjljh = hs_sjljh.iterator();
						HashSet<String> hs_bz2 = hidi.query_bz2_fadongji(ecutype);
						
						ArrayList<String> arr = new ArrayList<String>();
						Iterator<String> it_a = hs_bz2.iterator();
						while(it_a.hasNext()){
							String temp2 = it_a.next();
							arr.add(temp2);
						}
						
						Iterator<String> it_fadongji = arr.iterator();
			 		%>
				<td>ECU型号
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
				<td>
				发动机型号
				</td><td>
				<select name="bz2" size="1" id="bz2" onchange="gaibiansjljh()">
					<option value="">请选择</option>
					<%
					while(it_fadongji.hasNext()){
					String temp1 = it_fadongji.next();
					%>
						<option value="<%=temp1%>"><%=temp1%></option>
					<%
					}
					 %>
				
				</select>
				</td>
				</tr>
				<tr>
				<td>订货号
				</td><td>
				<input class="bunengweikong" name="ecuorder" id="ecuorder" type="text" onkeyup="this.value = this.value.toUpperCase();" onblur="zuhewenjianming()"/></td>
			
				<td>识别码
				</td><td>
				<input class="bunengweikong" name="sbm" id="sbm" type="text" onkeyup="this.value = this.value.toUpperCase();" onblur="zuhewenjianming()"/></td>
				
				
				<td><input id="fromhex" name="fromhex" type="button" value="从HEX文件导入" onclick="hex()"/></td>
			</tr>
			<tr>

			
				<td>数据零件号</td><td>
				<!-- <input class="bunengweikong" name="sjljh" id="sjljh" type="text" onchange="zuhelujing()"/> -->
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
				<td>识别码状态</td><td>
					<select name="state" size="1" id="state">
			    				<option value="-1">空</option>
				   	</select>
				</td>
				</tr>
				<tr>
				<td>整车编码
				</td><td>
				<input class="bunengweikong" name="zcbm" id="zcbm" type="text"/></td>
				<td>INI文件名
				</td><td>
				<input class="bunengweikong" name="inifile" id="inifile" type="text"  readonly="readonly"/></td>
				<td></td>
			</tr>
			
<!-- 			<tr>
			<td>
				存放路径
				</td><td colspan="3">
				<input class="bunengweikong" name="cflj" id="cflj" type="text" readonly="readonly" style="width: 600px; "/>
			</td>
			</tr> -->
			
			<tr>
			<td>
				备注
				</td><td colspan="3">
				<input name="bz1" id="bz1" type="text" style="width: 600px; "/>
			</td>
			</tr>

		</table>
	
	</div>













	<%if(yidu == null){
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
											<%-- <select name="<%=rs.getString("englishname")%>" size="1" id="<%=rs.getString("englishname")%>">
							    				<option value="0">关</option>
											    <option value="1">开</option>
								   			</select> --%>
								   			<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>" class="all_radio" value="1"/>开
											<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>" class="all_radio" value="0"  checked="true"/>关
										</td>
										
									<%if(i+1<=rowCount){
									rs.absolute(i+1);
									
									
									%>
										<td><%=rs.getString("name")%></td>
										<td><%-- <select name="<%=rs.getString("englishname")%>" size="1" id="<%=rs.getString("englishname")%>">
							    				<option value="0">关</option>
											    <option value="1">开</option>
								   			</select> --%>
								   			<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>" class="all_radio" value="1"/>开
											<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>" class="all_radio" value="0"  checked="true"/>关
										
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
		}
	 %>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 	<%if(yidu != null){
	 		%>
	 		<script>
	 		
	 		var sjljh = "<%=sjljh%>";
	 		var sbm= "<%=sbm%>";
	 		var cflj = "<%=cflj%>";
	 		var ecuorder = "<%=ecuorder%>";
	 		var state = "<%=state%>";
	 		var zcbm = "<%=zcbm%>";
	 		var inifile = "<%=inifile%>";
	 		var bz1 = "<%=bz1%>";
	 		var bz2 = "<%=bz2%>";
	 		//alert(bz1);
	 		
	 		
	 		if(sjljh!="null")
	 		{
	 			$("#sjljh").find("option[value='"+sjljh+"']").attr("selected",true);
	 		}
	 		if(state!="null")
	 		{
	 			$("#state").find("option[value='"+state+"']").attr("selected",true);
	 		}
	 		if(ecuorder!="null"){
	 			$("#ecuorder").val(ecuorder);
	 		}
	 		if(cflj!="null"){
	 			$("#cflj").val(cflj);
	 		}
	 		if(sbm!="null"){
	 			$("#sbm").val(sbm);
	 		}
	 		if(zcbm!="null"){
	 			$("#zcbm").val(zcbm);
	 		}
	 		if(inifile!="null"){
	 			$("#inifile").val(inifile);
	 		}
	 		if(bz1!="null"){
	 			$("#bz1").val(bz1);
	 		}
	 		if(bz2!="null"){
	 			$("#bz2").val(bz2);
	 		}
	 		
	 		
	 		
	 		
	 		</script>
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
		HashMap<String,String> hm1 = IniToHashMap.getHashMap(Path.ROOT_EOL+"/sc12e.ini");
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
										<td><%=rs.getString("name")%></td><td>
											<%-- <select name="<%=rs.getString("englishname")%>" size="1" id="<%=rs.getString("englishname").replace(' ','_')%>">
							    				<option value="0">关</option>
											    <option value="1">开</option>
								   			</select> --%>
								   			<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>" class="all_radio" value="1"/>开
											<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>" class="all_radio" value="0"  checked="true"/>关
										
										</td>
										<script language="javascript" type="text/javascript">
										temp2 ="<%=hm1.get(rs.getString("englishname"))%>";
										if(temp2 == 1){
												temp2 = 0;
												}else if(temp2 ==0){
												temp2 = 1;
												}
										<%-- $("#<%=rs.getString("englishname").replace(' ','_')%>").find("option[value='"+temp2+"']").attr("selected",true); --%>
										$("input[id=<%=rs.getString("englishname").replace(' ','_')%>]:eq("+temp2+")").attr("checked",'checked');
										</script>
									
									<%if(i+1<=rowCount){
									rs.absolute(i+1);
									
									
									%>
										<td><%=rs.getString("name")%></td><td>
											<%-- <select name="<%=rs.getString("englishname")%>" size="1" id="<%=rs.getString("englishname").replace(' ','_')%>">
							    				<option value="0">关</option>
											    <option value="1">开</option>
								   			</select> --%>
								   			<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>" class="all_radio" value="1"/>开
											<input type="radio" name="<%=rs.getString("englishname")%>" id="<%=rs.getString("englishname").replace(' ','_')%>" class="all_radio" value="0"  checked="true"/>关
										
										</td>
						<script language="javascript" type="text/javascript">
										temp2 ="<%=hm1.get(rs.getString("englishname"))%>";
										if(temp2 == 1){
												temp2 = 0;
												}else if(temp2 ==0){
												temp2 = 1;
												}
										//alert(temp2);
										//alert("<%=rs.getString("englishname")%>");
										<%-- $("#<%=rs.getString("englishname").replace(' ','_')%>").find("option[value='"+temp2+"']").attr("selected",true); --%>
										$("input[id=<%=rs.getString("englishname").replace(' ','_')%>]:eq("+temp2+")").attr("checked",'checked');
										</script>
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
											<input class="bunengweikong" name="<%=rs.getString("englishname")%>" type="text" value="<%=hm1.get(rs.getString("englishname"))%>" id="<%=rs.getString("englishname")%>" onchange="checkdaxiao(this.value,<%=rs.getString("Minvalue")%>,<%=rs.getString("Maxvalue")%>,'<%=rs.getString("name")%>')"/>
										</td>
										
									<%if(i+1<=rowCount){
									rs.absolute(i+1);
									
									
									%>
										<td><%=rs.getString("name")%><span style="color:red;font-size:12px">(<%=rs.getString("Minvalue")%>-<%=rs.getString("Maxvalue")%><%=rs.getString("unitname")==null ? "" : rs.getString("unitname")%>)</span></td><td>
											<input class="bunengweikong" name="<%=rs.getString("englishname")%>" type="text" value="<%=hm1.get(rs.getString("englishname"))%>" id="<%=rs.getString("englishname")%>" onchange="checkdaxiao(this.value,<%=rs.getString("Minvalue")%>,<%=rs.getString("Maxvalue")%>,'<%=rs.getString("name")%>')"/>
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
											<input class="bunengweikong" name="<%=rs.getString("englishname")%>" type="text" value="<%=hm1.get(rs.getString("englishname"))%>" id="<%=rs.getString("englishname")%>"/>
										</td>
										
									<%if(i+1<=rowCount){
									rs.absolute(i+1);									
									%>
										<td><%=rs.getString("name")%><span style="color:red;font-size:12px">(<%=rs.getString("Minvalue")%>-<%=rs.getString("Maxvalue")%>位)</span></td><td>
											<input class="bunengweikong" name="<%=rs.getString("englishname")%>" type="text" value="<%=hm1.get(rs.getString("englishname"))%>" id="<%=rs.getString("englishname")%>"/>
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
		}
	 %>
	 
	 
	 
	 
	 
	
	<input type="button" value="保存" onclick="checkDo()"/>
	<input type="button" value="返回" onclick="fanhui()"/>
	
	
	
			
			<!-- <tr>
				<td colspan="4">
				<input type="button" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff" value="保存" onclick="checkDo()"/>
				<a href="HexPfile.jsp"><input type="button" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff" value="返回"/></a>
				</td>
			</tr> -->

</form>
</body>
</html>



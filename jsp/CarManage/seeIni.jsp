<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%@ page import="com.seu.beans.IniInfo"%>
<%@ page import="com.seu.beans.HexInfo"%>
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
	ResultSet rs = null;
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

	if(check == 1){
	
			$.post("./IfHaveIni?ecuorder=" + ecuorder+"&sbm="+ sbm+"&caozuo=modify"+"&INIID="+ <%=INIID%>,null,function(data){
			if(data == 0){
				$("#ecutype").removeAttr("disabled");
				form.submit();
			}else{
				alert("数据库中已存在相同的订货号+识别码！");
			}
		},"json");
	
	
	

	}

}

function fanhui(){
window.location.href="<%=basePath%>/jsp/CarManage/CarManage.jsp";
}

function zuhelujing(){
	
		var a = "inifile/";
		var b = $("#ecutype").val();
		var c = $("#sjljh").val();
		var fenge = "/";
		var lujing= a + b + fenge + c;
		$("#cflj").val(lujing);		
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

function zuhewenjianming(){
	var a = $("#ecuorder").val();
	var b = $("#sbm").val();
	
	var wenjianming = a + "_" + b + ".ini";
	$("#inifile").val(wenjianming);
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


<script>
	window.onload =function() { 
		var ecutype ="<%=iniInfo.getECUType()%>";
		var state ="<%=iniInfo.getState()%>";
		var sjljh ="<%=iniInfo.getSjljh()%>";
		var bz2 ="<%=iniInfo.getBz2()%>";
		$("#bz2").find("option[value='"+bz2+"']").attr("selected",true);
		$("#ecutype").find("option[value='"+ecutype+"']").attr("selected",true);
		$("#state").find("option[value='"+state+"']").attr("selected",true);
		$("#sjljh").find("option[value='"+sjljh+"']").attr("selected",true);
		
		var inputs= document.getElementsByTagName('input');
		//alert(inputs.length);
		for(var i=0; i<inputs.length; i++){
    		if(inputs[i].type=='text' || inputs[i].type == 'radio'){
      			inputs[i].disabled = "disabled";
    		}
    	}
    	var selects = document.getElementsByTagName('select');
    	for(var i = 0; i<selects.length; i++){
    		selects[i].disabled = "disabled";
    	}
	};	
	var temp2 = "3";			
</script>



</head>
<body>

	<form name="form" method="post" action="ModifyIni_deal?INIID=<%=INIID%>">
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
						Iterator<String> it_fadongji = hs_bz2.iterator();
			 		%>
				<td>ECU型号
				</td><td>
				<select name="ecutype" size="1" id="ecutype" disabled="disabled">
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
				
				<td>发动机型号</td><td>
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
				<input class="bunengweikong" name="ecuorder" id="ecuorder" type="text" value="<%=iniInfo.getECUOrder()%>" onchange="zuhewenjianming()"/></td>

				<td>识别码
				</td><td>
				<input class="bunengweikong" name="sbm" id="sbm" type="text" value="<%=iniInfo.getSbm()%>" onchange="zuhewenjianming()"/></td>
				
				<td></td>
			</tr>
			<tr>
				<td>数据零件号
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
					<%
						String sjljh_1 = iniInfo.getSjljh();
						//该数据零件号的所有正常、临时、套牌、备份的（即-1<state<4）版本数据，
						//若有正常状态的数据，则显示正常状态数据的版本号，若无正常状态的数据，
						//则显示版本号最大的那个
						ArrayList<HexInfo> hexInfos3 = null;
						String sql_temp3 = "select * from HEXINFO where sjljh="+"'"+sjljh_1+"'"+" and state=0 and shzt='已审核'";
						hexInfos3 = hidi.query(sql_temp3);
							
						String sql_temp4 = "select * from HEXINFO where sjljh="+"'"+sjljh_1+"'"+" and state>-1 and state<2 and shzt='已审核' order by version desc";
						ArrayList<HexInfo> hexInfos4 = null;
						hexInfos4 = hidi.query(sql_temp4);
						
						String moren = "无";
						if(hexInfos3.size() != 0 ){//正常的
							moren = hexInfos3.get(0).getVersion();
						}else if(hexInfos4.size() != 0){
							moren = hexInfos4.get(0).getVersion();
						}
					 %>
				刷写默认版本号：<%=moren%>
				</td>
				<td>识别码状态
				</td><td>
					<select name="state" size="1" id="state">
			    				<option value="-1">空</option>
			    				<option value="0">正常</option>
							    <option value="1">临时</option>
							    <option value="2">套牌</option>
							    <option value="3">备份</option>
							    <option value="4">停用</option>
							    <option value="5">临时超限</option>
				   	</select>
				</td>
				</tr>
				<tr>
				<td>整车编码
				</td><td>
				<input class="bunengweikong" name="zcbm" id="zcbm" type="text" value="<%=iniInfo.getZcbm()%>"/></td>
				<td>INI文件名
				</td><td>
				<input class="bunengweikong" name="inifile" id="inifile" type="text" value="<%=iniInfo.getINIFile()%>" readonly="readonly"/></td>
				<td></td>
			</tr>
			
			
			<tr>
				<td>可刷写次数
				</td><td>
				<input class="bunengweikong" name="canwritetimes" id="canwritetimes" type="text" value="<%=iniInfo.getCanWriteTimes()%>" readonly="readonly"/></td>
				<td>临时状态有效期
				</td><td>
				<input class="bunengweikong" name="yxq" id="yxq" type="text" value="<%=iniInfo.getYxq()%>" readonly="readonly"/></td>
				<td></td>
			</tr>
			
			<tr>
			<td>
			存放路径
			</td><td colspan="3">
			<input class="bunengweikong" name="cflj" id="cflj" type="text" style="width: 600px; " value="<%=iniInfo.getCflj()%>" readonly="readonly"/>
			</td>
			</tr>
			
			
			<tr>
			<td>
				备注
				</td><td colspan="3">
				<input name="bz1" id="bz1" type="text" style="width: 600px; "value="<%=iniInfo.getBz1()%>"/>
			</td>
			</tr>

		</table>
	
	</div>

	<%
		HashMap<String,Integer> hm = ebii.query2();
		String tablename = null;
		ResultSet rs1 = null;
		if(ecutype!=null){
		//测试用，要加上条件判断

			if(hm.get(ecutype)==1 || hm.get(ecutype)==2){
			tablename = ecutype+"_iniinfo_"+"can";
			}
			if(hm.get(ecutype)==0){
			tablename = ecutype+"_iniinfo_"+"k";
			}
		String sql1 = "select * from "+tablename+" where style=0";
		String sql2 = "select * from "+tablename+" where style=2";
		String sql3 = "select * from "+tablename+" where style=4";
		//IniToHashMap是编写的一个工具类。为了读ini文件做准备。
		HashMap<String,String> hm1 = IniToHashMap.getHashMap(IniToHashMap.getInifile(Integer.parseInt(INIID)));
	 %>
<!-- rs1______rs1______rs1______rs1______rs1______rs1______rs1 -->
	<div style="width:100%">
		<table width="80%">
			<%
				rs1 = JdbcUtils.query(sql2);
				if(rs1 != null){
								rs1.last();
								int rowCount = rs1.getRow();
								for(int i = 1;i<=rowCount;i=i+2){
									rs1.absolute(i);
									
									
									if(rs1.getString("cannotwrite")!=null){
										if(rs1.getString("cannotwrite").equals("1")){
												%>
											<tr>
											<td><%=rs1.getString("name")%></td>
											
											<td>
														<select name="<%=rs1.getString("englishname")%>" size="1" id="<%=rs1.getString("englishname")%>">
										    				<option value="0">无</option>
														   
											   			</select>
											</td>
												<%
										}
										if(rs1.getString("cannotwrite").equals("no")){
										%>
											<tr>
											<td></td>
											<td></td>
										<%
										}
										if(rs1.getString("cannotwrite").equals("")){
											%>
											<tr>
												<td><%=rs1.getString("name")%></td><td>
													<input type="radio" name="<%=rs1.getString("englishname")%>" id="<%=rs1.getString("englishname").replace(' ','_')%>"  value="1"/>开
													<input type="radio" name="<%=rs1.getString("englishname")%>" id="<%=rs1.getString("englishname").replace(' ','_')%>"  value="0"/>关
												</td>
												<script language="javascript" type="text/javascript">
												temp2 ="<%=hm1.get(rs1.getString("englishname"))%>";
												if(temp2 == 1){
												temp2 = 0;
												}else if(temp2 ==0){
												temp2 = 1;
												}
												//alert(temp2);
												//alert("<%=rs1.getString("englishname")%>");
												$("input[id=<%=rs1.getString("englishname").replace(' ','_')%>]:eq("+temp2+")").attr("checked",'checked');
												</script>
											
											<%
										}
									}
									else{
									%>
									<tr>
										<td><%=rs1.getString("name")%></td><td>
											<input type="radio" name="<%=rs1.getString("englishname")%>" id="<%=rs1.getString("englishname").replace(' ','_')%>"  value="1"/>开
													<input type="radio" name="<%=rs1.getString("englishname")%>" id="<%=rs1.getString("englishname").replace(' ','_')%>"  value="0"/>关
												</td>
												<script language="javascript" type="text/javascript">
												temp2 ="<%=hm1.get(rs1.getString("englishname"))%>";
												if(temp2 == 1){
												temp2 = 0;
												}else if(temp2 ==0){
												temp2 = 1;
												}
												//alert(temp2);
												//alert("<%=rs1.getString("englishname")%>");
												$("input[id=<%=rs1.getString("englishname").replace(' ','_')%>]:eq("+temp2+")").attr("checked",'checked');
												</script>
									
									<%
									}
									if(i+1<=rowCount){
										rs1.absolute(i+1);
										
										if(rs1.getString("cannotwrite")!=null){
											if(rs1.getString("cannotwrite").equals("1")){
													%>
												
												<td><%=rs1.getString("name")%></td>
												
												<td>
															<select name="<%=rs1.getString("englishname")%>" size="1" id="<%=rs1.getString("englishname")%>">
																<option value="0">无</option>
															   
															</select>
												</td></tr>
													<%
											}
											if(rs1.getString("cannotwrite").equals("no")){
											%>
												
												<td></td>
												<td></td></tr>
											<%
											}
											if(rs1.getString("cannotwrite").equals("")){
												%>
													<td><%=rs1.getString("name")%></td><td>
														<input type="radio" name="<%=rs1.getString("englishname")%>" id="<%=rs1.getString("englishname").replace(' ','_')%>"  value="1"/>开
													<input type="radio" name="<%=rs1.getString("englishname")%>" id="<%=rs1.getString("englishname").replace(' ','_')%>"  value="0"/>关
												</td>
												<script language="javascript" type="text/javascript">
												temp2 ="<%=hm1.get(rs1.getString("englishname"))%>";
												if(temp2 == 1){
												temp2 = 0;
												}else if(temp2 ==0){
												temp2 = 1;
												}
												//alert(temp2);
												//alert("<%=rs1.getString("englishname")%>");
												$("input[id=<%=rs1.getString("englishname").replace(' ','_')%>]:eq("+temp2+")").attr("checked",'checked');
												</script>
												</tr>
												<%
											}
										}
										else{
											%>
												<td><%=rs1.getString("name")%></td><td>
													<input type="radio" name="<%=rs1.getString("englishname")%>" id="<%=rs1.getString("englishname").replace(' ','_')%>"  value="1"/>开
													<input type="radio" name="<%=rs1.getString("englishname")%>" id="<%=rs1.getString("englishname").replace(' ','_')%>"  value="0"/>关
												</td>
												<script language="javascript" type="text/javascript">
												temp2 ="<%=hm1.get(rs1.getString("englishname"))%>";
												if(temp2 == 1){
												temp2 = 0;
												}else if(temp2 ==0){
												temp2 = 1;
												}
												//alert(temp2);
												//alert("<%=rs1.getString("englishname")%>");
												$("input[id=<%=rs1.getString("englishname").replace(' ','_')%>]:eq("+temp2+")").attr("checked",'checked');
												</script>
											</tr>
											<%
										}
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
				rs1 = JdbcUtils.query(sql1);//sql1  对应 style=0
				if(rs1 != null){
								rs1.last();
								int rowCount = rs1.getRow();
								for(int i = 1;i<=rowCount;i=i+2){
									rs1.absolute(i);
									
									if(rs1.getString("cannotwrite")!=null){
										if(rs1.getString("cannotwrite").equals("1")){
												%>
											<tr>
											<td><%=rs1.getString("name")%></td>
											
											<td>
														<select name="<%=rs1.getString("englishname")%>" size="1" id="<%=rs1.getString("englishname")%>">
										    				<option value="0">无</option>
														   
											   			</select>
											</td>
												<%
										}
										if(rs1.getString("cannotwrite").equals("no")){
										%>
											<tr>
											<td></td>
											<td></td>
										<%
										}
										if(rs1.getString("cannotwrite").equals("")){
											%>
											<tr>
												<td><%=rs1.getString("name")%><span style="color:red;font-size:12px">(<%=rs1.getString("Minvalue")%>-<%=rs1.getString("Maxvalue")%><%=rs1.getString("unitname")==null ? "" : rs1.getString("unitname")%>)</span></td><td>
													<input class="bunengweikong" name="<%=rs1.getString("englishname")%>" type="text" value="<%=hm1.get(rs1.getString("englishname"))%>" id="<%=rs1.getString("englishname")%>" onchange="checkdaxiao(this.value,<%=rs1.getString("Minvalue")%>,<%=rs1.getString("Maxvalue")%>,'<%=rs1.getString("name")%>')"/>
												</td>
												
											<%
										}
									}
									else{
									%>
									<tr>
										<td><%=rs1.getString("name")%><span style="color:red;font-size:12px">(<%=rs1.getString("Minvalue")%>-<%=rs1.getString("Maxvalue")%><%=rs1.getString("unitname")==null ? "" : rs1.getString("unitname")%>)</span></td><td>
											<input class="bunengweikong" name="<%=rs1.getString("englishname")%>" type="text" value="<%=hm1.get(rs1.getString("englishname"))%>" id="<%=rs1.getString("englishname")%>" onchange="checkdaxiao(this.value,<%=rs1.getString("Minvalue")%>,<%=rs1.getString("Maxvalue")%>,'<%=rs1.getString("name")%>')"/>
										</td>
										
									<%
									}
									if(i+1<=rowCount){
										rs1.absolute(i+1);
										
										if(rs1.getString("cannotwrite")!=null){
											if(rs1.getString("cannotwrite").equals("1")){
													%>
												
												<td><%=rs1.getString("name")%></td>
												
												<td>
															<select name="<%=rs1.getString("englishname")%>" size="1" id="<%=rs1.getString("englishname")%>">
																<option value="0">无</option>
															   
															</select>
												</td></tr>
													<%
											}
											if(rs1.getString("cannotwrite").equals("no")){
											%>
												
												<td></td>
												<td></td></tr>
											<%
											}
											if(rs1.getString("cannotwrite").equals("")){
												%>
												<td><%=rs1.getString("name")%><span style="color:red;font-size:12px">(<%=rs1.getString("Minvalue")%>-<%=rs1.getString("Maxvalue")%><%=rs1.getString("unitname")==null ? "" : rs1.getString("unitname")%>)</span></td><td>
													<input class="bunengweikong" name="<%=rs1.getString("englishname")%>" type="text" value="<%=hm1.get(rs1.getString("englishname"))%>" id="<%=rs1.getString("englishname")%>" onchange="checkdaxiao(this.value,<%=rs1.getString("Minvalue")%>,<%=rs1.getString("Maxvalue")%>,'<%=rs1.getString("name")%>')"/>
												</td>
												</tr>
												<%
											}
										}
										
										else{
										%>
											<td><%=rs1.getString("name")%><span style="color:red;font-size:12px">(<%=rs1.getString("Minvalue")%>-<%=rs1.getString("Maxvalue")%><%=rs1.getString("unitname")==null ? "" : rs1.getString("unitname")%>)</span></td><td>
												<input class="bunengweikong" name="<%=rs1.getString("englishname")%>" type="text" value="<%=hm1.get(rs1.getString("englishname"))%>" id="<%=rs1.getString("englishname")%>" onchange="checkdaxiao(this.value,<%=rs1.getString("Minvalue")%>,<%=rs1.getString("Maxvalue")%>,'<%=rs1.getString("name")%>')"/>
											</td>
										</tr>
										<%
										}
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
				rs1 = JdbcUtils.query(sql3);//sql3  对应 style=4
				if(rs1 != null){
								rs1.last();
								int rowCount = rs1.getRow();
								for(int i = 1;i<=rowCount;i=i+2){
									rs1.absolute(i);
									
									if(rs1.getString("cannotwrite")!=null){
										if(rs1.getString("cannotwrite").equals("1")){
												%>
											<tr>
											<td><%=rs1.getString("name")%></td>
											
											<td>
														<select name="<%=rs1.getString("englishname")%>" size="1" id="<%=rs1.getString("englishname")%>">
										    				<option value="0">无</option>
														   
											   			</select>
											</td>
												<%
										}
										if(rs1.getString("cannotwrite").equals("no")){
										%>
											<tr>
											<td></td>
											<td></td>
										<%
										}
										if(rs1.getString("cannotwrite").equals("")){
											%>
											<tr>
												<td><%=rs1.getString("name")%><span style="color:red;font-size:12px">(<%=rs1.getString("Minvalue")%>-<%=rs1.getString("Maxvalue")%>位)</span></td><td>
													<input class="bunengweikong" name="<%=rs1.getString("englishname")%>" type="text" value="<%=hm1.get(rs1.getString("englishname"))%>" id="<%=rs1.getString("englishname")%>"/>
												</td>
												
											<%
										}
									}
									
									else{
										%>
										<tr>
											<td><%=rs1.getString("name")%><span style="color:red;font-size:12px">(<%=rs1.getString("Minvalue")%>-<%=rs1.getString("Maxvalue")%>位)</span></td><td>
												<input class="bunengweikong" name="<%=rs1.getString("englishname")%>" type="text" value="<%=hm1.get(rs1.getString("englishname"))%>" id="<%=rs1.getString("englishname")%>"/>
											</td>
											
										<%
									}
									if(i+1<=rowCount){
										rs1.absolute(i+1);									
										
										if(rs1.getString("cannotwrite")!=null){
											if(rs1.getString("cannotwrite").equals("1")){
													%>
												
												<td><%=rs1.getString("name")%></td>
												
												<td>
															<select name="<%=rs1.getString("englishname")%>" size="1" id="<%=rs1.getString("englishname")%>">
																<option value="0">无</option>
															   
															</select>
												</td></tr>
													<%
											}
											if(rs1.getString("cannotwrite").equals("no")){
											%>
												
												<td></td>
												<td></td></tr>
											<%
											}
											if(rs1.getString("cannotwrite").equals("")){
												%>
													<td><%=rs1.getString("name")%><span style="color:red;font-size:12px">(<%=rs1.getString("Minvalue")%>-<%=rs1.getString("Maxvalue")%>位)</span></td><td>
														<input class="bunengweikong" name="<%=rs1.getString("englishname")%>" type="text" value="<%=hm1.get(rs1.getString("englishname"))%>" id="<%=rs1.getString("englishname")%>"/>
													</td>
												</tr>
												<%

											}
										}
										
										
										else{
											%>
												<td><%=rs1.getString("name")%><span style="color:red;font-size:12px">(<%=rs1.getString("Minvalue")%>-<%=rs1.getString("Maxvalue")%>位)</span></td><td>
													<input class="bunengweikong" name="<%=rs1.getString("englishname")%>" type="text" value="<%=hm1.get(rs1.getString("englishname"))%>" id="<%=rs1.getString("englishname")%>"/>
												</td>
											</tr>
											<%
										}
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
		} 

	 %>
	
	<!-- <input type="button" value="保存" onclick="checkDo()"/> -->
	<input type="button" value="返回" onclick="fanhui()"/>
	


</form>
</body>
</html>



<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.Global.*"%>
<%
request.setCharacterEncoding("gbk");//设置页面字符集
response.setCharacterEncoding("gbk");
String ecutype = (String)request.getParameter("ecutype");
System.out.println("我是ECUtype>-----"+ecutype);
//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" id="css" href="css/addWholeCar.css"></link>
<link rel="stylesheet" type="text/css" id="css" href="css/easyui.css"></link>
<%
	String HEXID = request.getParameter("HEXID");
	//System.out.println(HEXID);
	HexInfoDaoImpl hexInfoDaoImpl = new HexInfoDaoImpl();
	String sql = "select * from HEXINFO where HEXID="+HEXID; 
	ResultSet rs = null;
	ArrayList<HexInfo> hexInfos = null;
	HexInfo hexInfo = null;	
	hexInfos = hexInfoDaoImpl.query(sql);
	hexInfo = (HexInfo)hexInfos.get(0);

 %>


<script src="js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/jquery.easyui.min.js"></script>
<script src="js/adddate.js"></script>
<%if(ecutype!=null){ %>
<script language="javascript">
//用Ajax访问后台，判断该上传哪些文件。将不必上传的文件input设为disabled。
window.onload =function(){
		var ecutype1 ="<%=hexInfo.getECUType()%>";
		var state ="<%=hexInfo.getState()%>";
		var ysflywkg ="<%=hexInfo.getYsflywkg()%>";
		var sgkkg = "<%=hexInfo.getSgkkg()%>";
		
		var gdclhqd = "<%=hexInfo.getGdclhqd()%>";
		var hclcj = "<%=hexInfo.getHclcj()%>";
		var jqyawdcgq = "<%=hexInfo.getJqyawdcgq()%>";
		var jqyl = "<%=hexInfo.getJqyl()%>";
		var ggg = "<%=hexInfo.getGgg()%>";
		
		var times = "<%=hexInfo.getTimes()%>";
		var downloadtimes = "<%=hexInfo.getDownloadtimes()%>";
		
		$("#state").find("option[value='"+state+"']").attr("selected",true);
		$("#ysflywkg").find("option[value='"+ysflywkg+"']").attr("selected",true);
		$("#sgkkg").find("option[value='"+sgkkg+"']").attr("selected",true);
		$("#ECUType").find("option[value='"+ecutype1+"']").attr("selected",true);
		
		$("#gdclhqd").find("option[value='"+gdclhqd+"']").attr("selected",true);
		$("#hclcj").find("option[value='"+hclcj+"']").attr("selected",true);
		$("#jqyawdcgq").find("option[value='"+jqyawdcgq+"']").attr("selected",true);
		$("#jqyl").find("option[value='"+jqyl+"']").attr("selected",true);
		$("#ggg").find("option[value='"+ggg+"']").attr("selected",true);
		
		
		if(state == -1){
			
		}else{
			$("#Bz2").attr('disabled',"true");
			$("#wtdbgdbh").attr('disabled',"true");
			$("#jqyawdcgq").attr('disabled',"true");
			//$("#yt").attr('disabled',"true");
			//$("#ggg").attr('disabled',"true");
			//$("#zdnj").attr('disabled',"true");
			//$("#dsnj").attr('disabled',"true");
			//$("#zyqxh").attr('disabled',"true");
			//$("#pyqxh").attr('disabled',"true");
			//$("#Zdds").attr('disabled',"true");
			//$("#ysflywkg").attr('disabled',"true");
			//$("#sgk").attr('disabled',"true");
			//$("#sgkkg").attr('disabled',"true");
			//$("#jqyl").attr('disabled',"true");
			//$("#gdclhqd").attr('disabled',"true");
			//$("#Bh").attr('disabled',"true");
			//$("#hclcj").attr('disabled',"true");
			$("#Browse1").attr('disabled',"true");
			$("#Browse2").attr('disabled',"true");
			$("#Browse3").attr('disabled',"true");
			$("#Browse4").attr('disabled',"true");
			$("#Browse5").attr('disabled',"true");
			//$("#Bz5").attr('disabled',"true");
		}
		
		
		
		
		
		if(state == -1){
			$.post("./PanDuanWenJian?ecutype=" + ecutype1,null,function(data){
				
					$("#Browse1").attr('disabled',"true");
					$("#Browse2").attr('disabled',"true");
					$("#Browse3").attr('disabled',"true");
					$("#Browse4").attr('disabled',"true");
					$("#Browse5").attr('disabled',"true");
				
				if(data==1||data==3||data==5){
					$("#Browse1").removeAttr("disabled");
				}
		
		 		if(data==0){
					$("#Browse2").removeAttr("disabled");
					$("#Browse3").removeAttr("disabled");
					$("#Browse4").removeAttr("disabled");
				}
				if(data==4){
					$("#Browse5").removeAttr("disabled"); 
				}
                                                                if(data==6){
                                                                                $("#Browse1").removeAttr("disabled");
					$("#Browse5").removeAttr("disabled"); 
				}
				
			},"json");
		}else{
			$("#Browse1").attr('disabled',"true");
			$("#Browse2").attr('disabled',"true");
			$("#Browse3").attr('disabled',"true");
			$("#Browse4").attr('disabled',"true");
			$("#Browse5").attr('disabled',"true");
		}
	};
</script>
<%} %>

<script language="javascript">

function panduanshuaxie(){
	$("#canwritetimes").attr('disabled',"true");
	var temp = $("#state").val();
	if( temp == "1"){
		alert("临时状态下，请填写可刷写次数！");
		$("#canwritetimes").removeAttr("disabled");
	}
	
}

function panduanwenjian(){
	var ecutype = $("#ECUType").val();
	window.location.href="<%=basePath%>/jsp/HexPfile/modifyWholeCar.jsp?ecutype="+ecutype+"&HEXID="+<%=HEXID%>;
}

function zuhelujing(){
<%-- 	var temp = "<%=Path.ROOT_FTP%>";
	var a = temp+"/hexfile/";
	var b = "<%=ecutype%>";
	var c = $("#sjljh").val();
	var d = $("#Version").val();
	var fenge = "/";
	var lujing= a + b + fenge + c + fenge + d;
	$("#cflj").val(lujing); --%>
}
//以下五个function 监听五个<上传input>，用户上传后，自动得到文件名，并将文件名赋值给对应的<input——text>。
//另外还触发（iffile（））函数。修改标志位，提交时判断是否上传了文件。
function gethexname(name){
	 var pos=name.lastIndexOf("\\");
     var filename = name.substring(pos+1);
     
     document.getElementById("HEXFile").value=filename; 
}

function getpfilename(name){
	 var pos=name.lastIndexOf("\\");
     var filename = name.substring(pos+1);
     
      document.getElementById("PfileName").value=filename; 
}

function getkeyfilename(name){
	 var pos=name.lastIndexOf("\\");
     var filename = name.substring(pos+1);
     
      document.getElementById("KeyDataFileName").value=filename; 
}

function getsblname(name){
	 var pos=name.lastIndexOf("\\");
     var filename = name.substring(pos+1);
     
      document.getElementById("SBLFileName").value=filename; 
}

function getsrename(name){
	 var pos=name.lastIndexOf("\\");
     var filename = name.substring(pos+1);
     
      document.getElementById("SREFileName").value=filename; 
}

function AddRunningDiv() {
    $("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: $(document).height() }).appendTo("body");
    $("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候...").appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(document).height() - 45) / 2 });
} 

function MoveRunningDiv() {
    $("div[class='datagrid-mask']").remove();
    $("div[class='datagrid-mask-msg']").remove();
}


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

//判断该填的是否为空。
function checkDo(){

	var sjljh = $("#sjljh").val();
	var version = $("#Version").val();
	var state = $("#state").val();
	var check = 1;
	if($("#Version").val()==""){
    alert("版本号不能为空");
    check = 0;
	}
	
	if($("#sjljh").val()==""){
    alert("数据零件号不能为空");
    check = 0;
	}
	
	if($("#Bz2").val()==""){
	    alert("发动机型号不能为空");
	    check = 0;
	}
	

	if($("#ECUType").val() == ""){
	alert("请选择所属机型");
	check = 0;
	}


	if(check == 1){
		//alert("可以提交");
		$.post("./IfHaveHex?sjljh=" + sjljh+"&version="+ version+"&caozuo="+ "modify"+"&HEXID="+ <%=HEXID%>,null,function(data){
			if(data == 0){
			
				AddRunningDiv();
				form.action="<%=basePath%>/jsp/HexPfile/modifyWholeCar_deal.jsp?HEXID=<%=HEXID%>";
				form.submit();


			}else{
				alert("数据库中已存在相同的数据零件号+版本号！");
			}
		},"json");

	}
}

function iffile(){
	fileFlag = true;
}

function show_confirm()
{
	var sjljh = $("#sjljh").val();
	var r=confirm("已存在同一数据零件号的正常或临时版本!"+ '\n' + '\n' +"*点击确认将原来的正常或临时版本的数据变为备份状态"+ '\n' + '\n' +"*点击取消请重新进行修改再提交");
	if (r==true)
	  {
	  //alert("正常提交，并改原来的数据为备份状态！");
	  $.post("./ChangeTo3?sjljh=" + sjljh,null,function(data){
	  		//alert("提交ing");
	  		AddRunningDiv();
			form.action="<%=basePath%>/jsp/HexPfile/modifyWholeCar_deal.jsp?HEXID=<%=HEXID%>";
			form.submit();
		},"json");
	  }
	else
	  {
	  alert("请重新修改后，再提交！");
	  }
}


function fanhui(){
window.location.href="<%=basePath%>/jsp/HexPfile/HexPfile.jsp";
}

</script>

</head>
<body>
<form name="form" action="" method="post" enctype="multipart/form-data">

	<div align="center">
		<h1>修改</h1>
		<table id="dataintable" >
			
			<tr>
				
			<%
					EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
					Map<String,String> m = ebii.query4();
					Iterator it = m.entrySet().iterator();
			 %>
				
				<td class="num1">所属机型</td>
				<td class="num2"><select name="ECUType" size="1" id="ECUType" onchange="panduanwenjian()" disabled="disabled">
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
				发动机型号
				<input name="Bz2" id="Bz2" type="text" value="<%=hexInfo.getBz2()%>"/>
				
				</td>
				<td class="num3">委托单/变更单编号</td>
				<td class="num4"><input class="bunengweikong" name="wtdbgdbh" id="wtdbgdbh" type="text" value="<%=hexInfo.getWtdbgdbh()%>"/></td>
			</tr>
			
			<tr>
				<td class="num1">状态</td>
				<td class="num2"><select name="state" size="1" id="state" onchange="panduanshuaxie()" disabled="disabled">
					<option value="-1">空</option>
					<option value="0">正常</option>
					<option value="1">临时</option>
					<option value="2">套牌</option>
					<option value="3">备份</option>
					<option value="4">停用</option>
					<option value="5">临时超限</option>
					</select>
					可刷写次数：<input class="" type="text" name="canwritetimes" id="canwritetimes" style="width: 65px; " value="<%=hexInfo.getCanWriteTimes()%>" disabled="disabled"/>
				</td>
				<td class="num3">进气压力/温度传感器</td>
				<td class="num4"><select name="jqyawdcgq" size="1" id="jqyawdcgq">
					<option value="">请选择</option>
					<option value="西门子一体式">西门子一体式</option>
					<option value="电装分体式">电装分体式</option>
					<option value="博世一体式">博世一体式</option>
					
					</select></td>
			</tr>

			<tr>
				
				
				<td class="num1">版本号</td>
				<td class="num2"><input class="bunengweikong" name="Version" id="Version" type="text" style="width: 213px; " value="<%=hexInfo.getVersion()%>" onchange="zuhelujing()" disabled="disabled"/></td>
				
				<td class="num3">数据零件号</td>
				<td class="num4"><input class="bunengweikong" name="sjljh" id="sjljh" type="text"  value="<%=hexInfo.getSjljh()%>" onchange="zuhelujing()" disabled="disabled"/></td>
			</tr>
			
			<tr>
				<td class="num1">用途</td>
				<td class="num2"><input class="bunengweikong" name="yt" id="yt" type="text" style="width: 213px; "  value="<%=hexInfo.getYt()%>"/></td>
				<td class="num3">共轨管</td>
				<td class="num4">
					<select name="ggg" size="1" id="ggg">
					<option value="">请选择</option>
					<option value="带FD">带FD</option>
					<option value="不带FD">不带FD</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td class="num1">最大扭矩</td>
				<td class="num2"><input class="bunengweikong" name="zdnj" id="zdnj" type="text" style="width: 213px; "  value="<%=hexInfo.getZdnj()%>"/>单位：N.m</td>
				<td class="num3">低速扭矩</td>
				<td class="num4"><input class="bunengweikong" name="dsnj" id="dsnj" type="text" style="width: 213px; "  value="<%=hexInfo.getDsnj()%>"/>单位：N.m</td>
			</tr>
			
			<tr>
				<td class="num1">增压器型号</td>
				<td class="num2"><input class="bunengweikong" name="zyqxh" id="zyqxh" type="text" style="width: 213px; "  value="<%=hexInfo.getZyqxh()%>"/></td>
				<td class="num3">喷油器型号</td>
				<td class="num4"><input class="bunengweikong" name="pyqxh" id="pyqxh" type="text" style="width: 213px; "   value="<%=hexInfo.getPyqxh()%>"/></td>
			</tr>
			
			<tr>
				<td class="num1">最低怠速</td>
				<td class="num2"><input class="bunengweikong" name="Zdds" id="Zdds" type="text" style="width: 213px; "  value="<%=hexInfo.getZdds()%>"/>rpm</td>
				<td class="num3">油水分离液位开关</td>
				<td class="num4"><select name="ysflywkg" size="1" id="ysflywkg">
				<option value="">请选择</option>
				<option value="带">带</option>
				<option value="不带">不带</option>
				
				</select></td>
			</tr>
			
			<tr>
				<td class="num1">双工况</td>
				<td class="num2"><input class="bunengweikong" name="sgk" id="sgk" type="text" style="width: 213px; "  value="<%=hexInfo.getSgk()%>"/></td>
				<td class="num3">双工况开关</td>
				<td class="num4">
					<select name="sgkkg" size="1" id="sgkkg">
				<option value="">请选择</option>
				<option value="自复位">自复位</option>
				<option value="翘板式">翘板式</option>
				</select>
				
				</td>
			</tr>
			
			<tr>
				<td class="num1">进气压力</td>
				<td class="num2">
					<select name="jqyl" size="1" id="jqyl">
					<option value="">请选择</option>
					<option value="PIM">PIM</option>
					<option value="PIMR">PIMR</option>
					</select>
				
				</td>
				<td class="num3">挂档踩离合起动</td>
				<td class="num4">
					<select name="gdclhqd" id="gdclhqd" size="1">
				<option value="">请选择</option>
				<option value="允许">允许</option>
				<option value="禁止">禁止</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td class="num1">HEX编号</td>
				<td class="num2"><input class="bunengweikong" name="Bh" id="Bh" type="text" style="width: 213px; "  value="<%=hexInfo.getBh()%>"/></td>
				<td class="num3">后处理厂家</td>
				<td class="num4">
				<select name="hclcj" id="hclcj" size="1">
				<option value="">请选择</option>
				<option value="凯龙">凯龙</option>
				<option value="力达">力达</option>
				<option value="天纳克">天纳克</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td class="num1">软件版本</td>
				<td class="num2"><input name="Bz5" id="Bz5" type="text" style="width: 213px"  value="<%=hexInfo.getBz5()%>"/></td>
				<td class="num3"></td>
				<td class="num4">
					<%-- <input class="" type="text" name="Yxq" style="width: 213px" value="<%=hexInfo.getYxq()%>>" onclick="SelectDate(this,'yyyyMMddhhmmss')"/>
				 --%></td>
			
			</tr>
			
<%-- 			<tr>
				<td class="num1">存放路径</td>
				<td class="num2" colspan="3"><input class="bunengweikong" id="cflj" name="cflj" type="text" style="width: 662px; "   value="<%=hexInfo.getCflj()%>" readonly="readonly"/></td>
			</tr> --%>
			
			
			
			<tr>
				<td class="num1">HEX文件(数据文件)</td>
				<td class="num5" colspan="3">
				
				<!-- <select name="HEXFile" id="HEXFile">
					<option value="bosch">BOSCH</option>
					<option value="kailong">kailong</option>
				</select> -->
				
				<input class="shangchuan" name="HEXFile" id="HEXFile" type="text"  value="<%=hexInfo.getHEXFile()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse1" id="Browse1" accept=".hex,.mdt,.s19" type="file" style="width: 600px; " value="浏览..." onchange="gethexname(this.value)"/>
				</td>
			</tr>
			
			<tr>
				<td class="num1">Pfile文件(数据文件)</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="PfileName" id="PfileName" type="text"  value="<%=hexInfo.getPfileName()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse2" id="Browse2" type="file" accept=".sob,.hex,.s19" style="width: 600px; " value="浏览..." onchange="getpfilename(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">KeyFile文件(底层文件)</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="KeyDataFileName" id="KeyDataFileName" type="text"  value="<%=hexInfo.getKeyDataFileName()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse3" id="Browse3" type="file" accept=".key,.hex,.s19" style="width: 600px; " value="浏览..." onchange="getkeyfilename(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">SBL文件(程序文件)</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="SBLFileName" id="SBLFileName" type="text"  value="<%=hexInfo.getSBLFileName()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse4" id="Browse4" type="file" accept=".sob,.hex,.s19" style="width: 600px; " value="浏览..." onchange="getsblname(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">SRE文件</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="SREFileName" id="SREFileName" type="text"  value="<%=hexInfo.getSREFileName()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse5" id="Browse5" type="file" accept=".sre" style="width: 600px; " value="浏览..." onchange="getsrename(this.value)"/>
				</td>
			</tr>
			
			

		

			
			<tr style="height: 50px">
				<td>备注1</td>
				<td colspan="3"><input name="Bz1" id="Bz1" type="text" style="height: 40px; width: 500px"  value="<%=hexInfo.getBz1()%>"/></td>
			</tr>
			

			
				<tr style="height: 50px">
				<td>备注2</td>
				<td colspan="3"><input name="Bz3" id="Bz3" type="text" style="height: 40px; width: 500px"  value="<%=hexInfo.getBz3()%>"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>备注3</td>
				<td colspan="3"><input name="Bz4" id="Bz4" type="text" style="height: 40px; width: 500px"  value="<%=hexInfo.getBz4()%>"/></td>
			</tr>
			
	
			
			<tr>
				<td colspan="4">
				<input type="button" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff" value="保存" onclick="checkDo()"/>
				<input type="button" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff" value="返回" onclick="fanhui()"/>
				</td>
			</tr>
			
		</table>
	</div>

</form>
<script>
	var state = <%=hexInfo.getState()%>;
	if(state != 1 || state != "1"){
		$("#canwritetimes").attr('disabled',"true");
	}
</script>
</body>
</html>



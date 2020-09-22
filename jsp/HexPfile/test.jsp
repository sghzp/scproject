<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>
<%
request.setCharacterEncoding("gbk");//设置页面字符集
response.setCharacterEncoding("GBK");
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
<script src="js/jquery-1.9.1.min.js"></script>
<%if(ecutype!=null){ %>
<script language="javascript">
//用Ajax访问后台，判断该上传哪些文件。将不必上传的文件input设为disabled。
window.onload =function(){
		var ecutype1 ="<%=ecutype%>";
		$("#ECUType").find("option[value='"+ecutype1+"']").attr("selected",true);
		$.post("./PanDuanWenJian?ecutype=" + ecutype1,null,function(data){
				//alert(data);
					
		 			var shangchuans = getClass('input','shangchuan');
					for(var i=0;i<$(".shangchuan").length;i++){
						shangchuans[i].value="";
					} 
		/* 			var shangchuanfiles = getClass('input','shangchuanfile');
					for(var i=0;i<$(".shangchuanfile").length;i++){
						shangchuanfiles[i].selection.clear();
					} */
					
					
					
					
				   $("#HEXFile").attr('disabled',"true");
					$("#PfileName").attr('disabled',"true");
					$("#KeyDataFileName").attr('disabled',"true");
					$("#SBLFileName").attr('disabled',"true");
					$("#SREFileName").attr('disabled',"true");
					$("#Browse1").attr('disabled',"true");
					$("#Browse2").attr('disabled',"true");
					$("#Browse3").attr('disabled',"true");
					$("#Browse4").attr('disabled',"true");
					$("#Browse5").attr('disabled',"true");
				
				if(data==1||data==3){
					$("#HEXFile").removeAttr("disabled");
					$("#Browse1").removeAttr("disabled");
		
				}
		
		 		if(data==0){
					$("#PfileName").removeAttr("disabled");
					$("#KeyDataFileName").removeAttr("disabled");
					$("#SBLFileName").removeAttr("disabled");
					$("#Browse2").removeAttr("disabled");
					$("#Browse3").removeAttr("disabled");
					$("#Browse4").removeAttr("disabled");
				}
				if(data==4){
					$("#SREFileName").removeAttr("disabled");
					$("#Browse5").removeAttr("disabled"); 
				}
				
			},"json");
			
		};
</script>
<%} %>

<script language="javascript">


function panduanwenjian(){
	var ecutype = $("#ECUType").val();
	window.location.href="<%=basePath%>/jsp/HexPfile/test.jsp?ecutype="+ecutype;
}



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
    var check = 1;
	var topMenus = getClass('input','bunengweikong');
	for(var i=0;i<$(".bunengweikong[type=text]").length;i++){
		if(topMenus[i].value.length==0){
		//alert(topMenus[i].value);
		check = 0;
		}
	}

	if($("#ECUType").val() == ""){
	check = 2;
	}
	if(check == 2){
	 alert("请选择所属机型");
	}
	
 	if(check == 0){
 		alert("存在未填写的表单选项");
 	}
	if(check == 1){
		//alert("可以提交");
		form.action="<%=basePath%>/jsp/HexPfile/addWholeCar_deal.jsp";
		form.submit();
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
		<h1>test</h1>
		<table id="dataintable" >
			
			<tr>
				<td class="num1">版本号</td>
				<td class="num2"><input class="bunengweikong" name="Version" type="text" style="width: 213px; "/></td>
				<td class="num3">委托单/变更单编号</td>
				<td class="num4"><input class="bunengweikong" name="wtdbgdbh"type="text"/></td>
			</tr>
			
			<tr>
				<td class="num1">状态</td>
				<td class="num2"><select name="state" size="1" id="state">
					<option value="0">正常</option>
					<option value="1">临时</option>
					<option value="2">TP</option>
					<option value="3">备份</option>
					<option value="4">停用</option>
					</select>
				</td>
				<td class="num3">进气压力/温度传感器</td>
				<td class="num4"><input class="bunengweikong" type="text" name="jqyawdcgq"/></td>
			</tr>
			<%
			EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
			HashSet<String> hs = ebii.query3();
			Iterator<String> it = hs.iterator();
			 %>
			<tr>
				<td class="num1">所属机型</td>
				<td class="num2"><select name="ECUType" size="1" id="ECUType" onchange="panduanwenjian()">
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
				<td class="num3">数据零件号</td>
				<td class="num4"><input class="bunengweikong" name="sjljh" type="text"/></td>
			</tr>
			
			<tr>
				<td class="num1">用途</td>
				<td class="num2"><input class="bunengweikong" name="yt" type="text" style="width: 213px; "/></td>
				<td class="num3">共轨管</td>
				<td class="num4"><input class="bunengweikong" name="ggg" type="text"/></td>
			</tr>
			
			<tr>
				<td class="num1">最大扭矩</td>
				<td class="num2"><input class="bunengweikong" name="zdnj" type="text" style="width: 213px; "/>单位：N.m</td>
				<td class="num3">低速扭矩</td>
				<td class="num4"><input class="bunengweikong" name="dsnj"type="text" style="width: 213px; "/>单位：N.m</td>
			</tr>
			
			<tr>
				<td class="num1">增压器型号</td>
				<td class="num2"><input class="bunengweikong" name="zyqxh" type="text" style="width: 213px; "/></td>
				<td class="num3">喷油器型号</td>
				<td class="num4"><input class="bunengweikong" name="pyqxh" type="text" style="width: 213px; "/></td>
			</tr>
			
			<tr>
				<td class="num1">最低怠速</td>
				<td class="num2"><input class="bunengweikong" name="Zdds" type="text" style="width: 213px; "/>rpm</td>
				<td class="num3">油水分离液位开关</td>
				<td class="num4"><select name="ysflywkg" size="1" id="ysflywkg">
				<option value="on">开</option>
				<option value="off">关</option>
				
				</select></td>
			</tr>
			
			<tr>
				<td class="num1">双工况</td>
				<td class="num2"><input class="bunengweikong" name="sgk" type="text" style="width: 213px; "/>rpm</td>
				<td class="num3">双工况开关</td>
				<td class="num4"><select name="sgkkg" size="1" id="sgkkg">
				<option value="on">开</option>
				<option value="off">关</option>
				</select></td>
			</tr>
			
			<tr>
				<td class="num1">进气压力</td>
				<td class="num2"><input class="bunengweikong" name="jqyl" type="text" style="width: 213px; "/></td>
				<td class="num3">挂档踩离合起动</td>
				<td class="num4"><input class="bunengweikong" name="gdclhqd" type="text" style="width: 213px; "/></td>
			</tr>
			
			<tr>
				<td class="num1">HEX编号</td>
				<td class="num2"><input class="bunengweikong" name="Bh" type="text" style="width: 213px; "/></td>
				<td class="num3">后处理厂家</td>
				<td class="num4"><input class="bunengweikong" name="hclcj" type="text" style="width: 213px; "/></td>
			</tr>
			
			<tr>
				<td class="num1">存放路径</td>
				<td class="num5" colspan="3"><input class="bunengweikong" name="cflj" type="text" style="width: 662px; "/></td>
			</tr>
			
			<tr>
				<td class="num1">HEX文件</td>
				<td class="num5" colspan="3">
				
				<!-- <select name="HEXFile" id="HEXFile">
					<option value="bosch">BOSCH</option>
					<option value="kailong">kailong</option>
				</select> -->
				
				<input class="shangchuan" name="HEXFile" id="HEXFile" type="text"/>
											
					<input class="shangchuanfile" name="Browse1" id="Browse1" type="file" style="width: 600px; " value="浏览..." onchange="gethexname(this.value)"/>
				</td>
			</tr>
			
			<tr>
				<td class="num1">Pfile文件</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="PfileName" id="PfileName" type="text"/>
											
					<input class="shangchuanfile" name="Browse2" id="Browse2" type="file" style="width: 600px; " value="浏览..." onchange="getpfilename(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">KeyFile文件</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="KeyDataFileName" id="KeyDataFileName" type="text"/>
											
					<input class="shangchuanfile" name="Browse3" id="Browse3" type="file" style="width: 600px; " value="浏览..." onchange="getkeyfilename(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">SBL文件</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="SBLFileName" id="SBLFileName" type="text"/>
											
					<input class="shangchuanfile" name="Browse4" id="Browse4" type="file" style="width: 600px; " value="浏览..." onchange="getsblname(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">SRE文件</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="SREFileName" id="SREFileName" type="text"/>
											
					<input class="shangchuanfile" name="Browse5" id="Browse5" type="file" style="width: 600px; " value="浏览..." onchange="getsrename(this.value)"/>
				</td>
			</tr>
			
			

		

			
			<tr style="height: 50px">
				<td>备注1</td>
				<td colspan="3"><input name="Bz1" type="text" style="height: 40px; width: 500px"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>备注2</td>
				<td colspan="3"><input name="Bz2" type="text" style="height: 40px; width: 500px"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>备注3</td>
				<td colspan="3"><input name="Bz3" type="text" style="height: 40px; width: 500px"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>备注4</td>
				<td colspan="3"><input name="Bz4" type="text" style="height: 40px; width: 500px"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>备注5</td>
				<td colspan="3"><input name="Bz5" type="text" style="height: 40px; width: 500px"/></td>
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

</body>
</html>



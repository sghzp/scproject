<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.seu.beans.UserInfo"%>
<%@ page import="com.seu.dao.impl.UserInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="com.seu.beans.HexInfo"%>

<%
request.setCharacterEncoding("gbk");//设置页面字符集
response.setCharacterEncoding("gbk");
String date = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());


//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
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
	
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
	
	<script src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/datagrid-scrollview.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script>
	$(function() {
	       //返回json方式，{source:["c","c++","java", "php", "coldfusion","javascript"]}
	
	       $("#sjljh").autocomplete({
	         source: function(request, response) {
	            $.ajax({
	                url: "Autocomplete?type=sjljh&sjljhecuorder=" + $("#sjljh").val(),
	                data: {term: request.term,},
	                dataType: "json",
	                success: function(data) {
	                    response($.map(data[0], function(item) {
	                        return {
	                            value: item.sjljh
	                        };
	                    }));
	                }
	            });
	        }
	    },{  
	   		 minLength:1,
	//      	 max:10,
	         matchSubset: false,//缓存问题，默认为true，在缓存中读取
	         autoFill: true, 
	         //width: 310, 
	         matchContains: true, 
	         autoFill: false,
	         dataType:'json',//返回数据类型
	  });
	  
	  
	   $("#version").autocomplete({
	         source: function(request, response) {
	            $.ajax({
	                url: "Autocomplete?type=version&sjljhecuorder=" + $("#sjljh").val(),
	                data: {term: request.term},
	                dataType: "json",
	                success: function(data) {
	                    response($.map(data[0], function(item) {
	                        return {
	                            value: item.version
	                        };
	                    }));
	                }
	            });
	        }
	    },{  
	   		 minLength:0,
	//      	 max:10,
	         matchSubset: false,//缓存问题，默认为true，在缓存中读取
	         autoFill: true, 
	         width: 100, 
	         matchContains: true, 
	         autoFill: false,
	         dataType:'json',//返回数据类型
        
	  });
	  
	  
	   $("#clr").autocomplete({
	         source: function(request, response) {
	            $.ajax({
	                url: "Autocomplete?type=clr&sjljhecuorder=" + encodeURI(encodeURI($("#clr").val())),
	                data: {term: request.term,},
	                dataType: "json",
	                success: function(data) {
	                    response($.map(data[0], function(item) {
	                        return {
	                            value: item.name
	                        };
	                    }));
	                }
	            });
	        }
	    },{  
	   		 minLength:1,
	//      	 max:10,
	         matchSubset: false,//缓存问题，默认为true，在缓存中读取
	         autoFill: true, 
	         //width: 310, 
	         matchContains: true, 
	         autoFill: false,
	         dataType:'json',//返回数据类型
	  });
	  
	    $("#clrgh").autocomplete({
	         source: function(request, response) {
	            $.ajax({
	                url: "Autocomplete?type=clrgh&sjljhecuorder=" + encodeURI(encodeURI($("#clr").val())),
	                data: {term: request.term},
	                dataType: "json",
	                success: function(data) {
	                    response($.map(data[0], function(item) {
	                        return {
	                            value: item.num
	                        };
	                    }));
	                }
	            });
	        }
	    },{  
	   		 minLength:0,
	//      	 max:10,
	         matchSubset: false,//缓存问题，默认为true，在缓存中读取
	         autoFill: true, 
	         width: 100, 
	         matchContains: true, 
	         autoFill: false,
	         dataType:'json',//返回数据类型
        
	  });
	  
});
function versionclick(){
		if($("#version").val() == ""){
		$("#version").autocomplete( "search", "" );
		}
}
function clrghclick(){
		if($("#clrgh").val() == ""){
		
		$("#clrgh").autocomplete( "search", "" );
		//alert(0);
		}
}
	
		function yuanzhuangtai(){
			//alert("yuanzhuangtai");
			var sjljh = $("#sjljh").val();
			var version = $("#version").val();
			$.post("./QueryStatebysjljhversion?sjljh=" + sjljh +"&version=" + version,null,function(data){
				var str = '';
				if(data == -2){
					//alert(-2);
					str = '<option value="">请选择</option>';
				}else if(data == -1){
					str = '<option value='+data+'>空</option>';
					var str1 = '<option value="">请选择</option><option value="1">临时</option>';
					$("#dststate").html(str1);
				}else if(data == 0){
					str = '<option value='+data+'>正常</option>';
					var str1 = '<option value="">请选择</option>';
					$("#dststate").html(str1);
				}else if(data == 1){
					str = '<option value='+data+'>临时</option>';
					var str1 = '<option value="">请选择</option><option value="0">正常</option><option value="3">备份</option><option value="4">停用</option><option value="5">临时超限</option>';
					$("#dststate").html(str1);
				}else if(data == 2){
					str = '<option value='+data+'>TP</option>';
					var str1 = '<option value="">请选择</option><option value="0">正常</option><option value="1">临时</option><option value="3">备份</option>';
					$("#dststate").html(str1);
				}else if(data == 3){
					str = '<option value='+data+'>备份</option>';
					var str1 = '<option value="">请选择</option><option value="4">停用</option>';
					$("#dststate").html(str1);
				}else if(data == 4){
					str = '<option value='+data+'>停用</option>';
					var str1 = '<option value="">请选择</option>';
					$("#dststate").html(str1);
				}else if(data == 5){
					str = '<option value='+data+'>临时超限</option>';
					var str1 = '<option value="">请选择</option><option value="0">正常</option><option value="1">临时</option><option value="4">停用</option>';
					$("#dststate").html(str1);
				}
				$("#oristate").html(str);
			},"json");
			
			
			
		}
		function getfj1name(name){
			 var pos=name.lastIndexOf("\\");
		     var filename = name.substring(pos+1);
		     
		     document.getElementById("fj1").value=filename; 
		}
		function getfj2name(name){
			 var pos=name.lastIndexOf("\\");
		     var filename = name.substring(pos+1);
		     
		     document.getElementById("fj2").value=filename; 
		}
		function getfj3name(name){
			 var pos=name.lastIndexOf("\\");
		     var filename = name.substring(pos+1);
		     
		     document.getElementById("fj3").value=filename; 
		}
	
		function shengchengrengonghao(){
			var clr = encodeURI(encodeURI($("#clr").val()));
			$.post("./QueryRengonghao?clr=" + clr,null,function(data){
				//得到一个字符串数组，把这个数组里的值更新到发动机这个select中。
				var str = '<option value="">请选择</option>';
				for(var i=0;i<data.length;i++){
					str = str + '<option value='+data[i]+'>'+data[i]+'</option>';
				}
				$("#clrgh").html(str);
			},"json");
		
		}
		function shenqing(){
			var check = 1;
			if($("#sjljh").val() == ""){
		    	alert("数据零件号不能为空");
		    	check = 0;
			}
			if($("#version").val() == ""){
				alert("版本号不能为空");
				check = 0;
			}
			if($("#clr").val() == ""){
				alert("处理人不能为空");
				check = 0;
			}
			if($("#clrgh").val() == ""){
				alert("处理人工号不能为空");
				check = 0;
			}
			if($("#oristate").val() == ""){
				alert("原状态不能为空");
				check = 0;
			}
			if($("#dststate").val() == ""){
				alert("拟变更状态不能为空");
				check = 0;
			}
			if($("#sqsm").val() == ""){
				alert("申请说明不能为空");
				check = 0;
			}
			
			var aaa = $("#sqsm").val();
				//alert(a);
			for(var i = 0; i<aaa.length; i++){
				if(aaa.charAt(i) == '-'){
					check = 0;
					alert("申请说明不能包含特殊字符-与；");
				}
			}
			
			if($("#clrgh").val() == "<%=session.getAttribute("bh")%>"){
				alert("处理人不能为自己！");
				check = 0;
			}
			

						
			if($("#oristate").val() == $("#dststate").val()){
				alert("原状态与变更状态相同！");
				check = 0;
			}
			
			
			if($("#bz1").val() != "" && $("#bz2").val() != ""){
				if($("#bz1").val()>99 || $("#bz1").val()<1 ||$("#bz2").val()<1 || $("#bz2").val()>180 ||$("#bz2").val().length>3||$("#bz1").val().length>2){
					alert("请注意临时状态有效期与可刷写次数的范围！");
					check = 0;
				}
			}
			if( check == 1){
				var sjljh = $("#sjljh").val();
				var version = $("#version").val();
				var oristate = $("#oristate").val();
				var dststate = $("#dststate").val();
				$.post("./PanDuanWtdInfo_Tiqian?sjljh=" + sjljh+"&version="+version+"&oristate="+oristate+"&dststate="+dststate+"&style=0",null,function(data){
						if(data == 1){
							form.action="<%=basePath%>/jsp/Mission/ChangeSjljh_deal_new.jsp";
							form.submit();
						}else{
							alert("根据BMPFLOW系统信息，暂时不能申请");
						}
					},"json");
			}else{
				alert("不能提交，请检查表单信息");
			}
			
		}
		
		function panduanshuaxie(){
			$("#bz1").attr('disabled',"true");
			$("#bz2").attr('disabled',"true");
			var temp = $("#dststate").val();
			if( temp == "1"){
				alert("临时状态下，请填写可刷写次数！");
				$("#bz1").removeAttr("disabled");
				$("#bz2").removeAttr("disabled");
			}
		}
		
		function checkdaxiao99(value){
			if(value<=99 && value>0){
				
			}else{
				alert("请在可刷写次数中填写01-99范围内的数！");
			}
			if(value<=9 && value>0 && value.length==1){
				$("#bz1").val("0" + value);
			}
		}
		function checkdaxiao180(value){
			if(value<=180 && value>0){
				
			}else{
				alert("请在临时状态有效期中填写1-180范围内的数！");
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
					<!-- <td><a href="jsp/Mission/ChangeSjljh.jsp"><input type="button" value="数据零件号状态变更申请" style="height: 25px;width: 160px; background:red;"/></a></td>
					<td><a href="jsp/Mission/ChangeIni.jsp"><input type="button" value="整车信息状态变更申请" style="height: 25px;width: 160px; background:#C6E2FF;"/></a></td>
			    	 --><td><a href="jsp/Mission/Proxy.jsp"><input type="button" value="代理人设置" style="height: 25px;width: 160px; background:#C6E2FF;"/></a></td>
			    </tr>
			</table>
		</td></tr>
		
		<tr><td align="center">
		<form name="form" action="" method="post" enctype="multipart/form-data">
			<table bgcolor="#E0EEEE" width="100%" font-size="50">
				<tr>
					<td height="40" class="td" width="100%" colspan="4" align="center"><h1></h1></td>
				</tr>
				
				<tr>
					<td>申请单号：</td>
					<td><input type="text" name="num" value="<%=date%>" readonly="readonly"/></td>
					<td>申请人：</td>
					<td><input type="text" name="sqr" value="<%=session.getAttribute("username")%>" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>数据零件号<font color="red">*</font>：</td>
					<%
						if(request.getParameter("sjljh") != null){
					%>
						<td><input type="text" name="sjljh" id="sjljh" value="<%=(String)request.getParameter("sjljh")%>" readonly="readonly"/></td>		
					<%
						}else{
					%>
						<td><input type="text" name="sjljh" id="sjljh" onkeyup="this.value = this.value.toUpperCase();" onchange="yuanzhuangtai()"/></td>	
					<%
						}
					 %>
					
					<td>版本号<font color="red">*</font>：</td>
					
					<%
						if(request.getParameter("version") != null){
					%>
						<td><input type="text" name="version" id="version" value="<%=(String)request.getParameter("version")%>" readonly="readonly"/></td>		
					<%
						}else{
					%>
						<td><input type="text" name="version" id="version" value="" onchange="yuanzhuangtai()" onclick="versionclick()"/></td>	
					<%
						}
					 %>
					
					
				</tr>
				<tr>
					<td>审核人<font color="red">*</font>：</td>
					<td><input type="text" name="clr" id="clr" />
					</td>
					<td>审核人工号<font color="red">*</font>：</td>
					<td><input type="text" name="clrgh" id="clrgh" value=""  onclick="clrghclick()"/>
					</td>
				</tr>
				<tr>					
					<td>原状态：</td>
					<td>
						<select name="oristate" size="1" id="oristate" onclick="yuanzhuangtai()">
							<option value="">请选择</option>
						</select>
					</td>
					<td>拟变更状态：</td>
					<td>
						<select name="dststate" size="1" id="dststate" onchange="panduanshuaxie()">
							<option value="">请选择</option>
							<option value="-1">空</option>
							<option value="0">正常</option>
							<option value="1">临时</option>
							<option value="2">TP</option>
							<option value="3">备份</option>
							<option value="4">停用</option>
							<option value="5">临时超限</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>可刷写次数<font color="red">*(01-99)</font>：</td>
					<td><input type="text" id="bz1" name="bz1" onchange="checkdaxiao99(this.value)"/></td>
					<td>临时状态有效期<font color="red">*(1-180)</font>：</td>
					<td><input type="text" id="bz2" name="bz2" onchange="checkdaxiao180(this.value)"/></td>
				</tr>
				<tr>
					<td>申请说明：</td>
					<td colspan="3"><input type="text" id="sqsm" name="sqsm" width="" style="width: 675px; "/></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td colspan="3"><input type="text" name="bz" width="" style="width: 675px; "/></td>
				</tr>
				<tr>
					<td>附件1</td>
					<td><input type="text" name="fj1" id="fj1" readonly="readonly"/></td>
					<td colspan="2"><input class="shangchuanfile" name="browser1" id="browser1" type="file" style="width: 600px; " value="fujian" onchange="getfj1name(this.value)"/></td>
				</tr>
				<tr>
					<td>附件2</td>
					<td><input type="text" name="fj2" id="fj2" readonly="readonly"/></td>
					<td colspan="2"><input class="shangchuanfile" name="browser2" id="browser2" type="file" style="width: 600px; " value="fujian" onchange="getfj2name(this.value)"/></td>
				</tr>
				<tr>
					<td>附件3</td>
					<td><input type="text" name="fj3" id="fj3" readonly="readonly"/></td>
					<td colspan="2"><input class="shangchuanfile" name="browser3" id="browser3" type="file" style="width: 600px; " value="fujian" onchange="getfj3name(this.value)"/></td>
				</tr>
				<tr bgcolor="#E0EEEE"><td colspan="4" align="center"><input type="button" value="申请" style="height:30; width:125" onclick="shenqing()"></td></tr>
			</table>
			</form>
		</td></tr>	
	</table>
  	
  </body>
  

</html>

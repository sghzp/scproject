<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>
<%
request.setCharacterEncoding("gbk");//����ҳ���ַ���
response.setCharacterEncoding("GBK");
String ecutype = (String)request.getParameter("ecutype");
System.out.println("����ECUtype>-----"+ecutype);
//DBO db=new DBO();//��ʼ��������
/*
֪ͨ��Ϣ���ҳ��
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
//��Ajax���ʺ�̨���жϸ��ϴ���Щ�ļ����������ϴ����ļ�input��Ϊdisabled��
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
*getClass()����Ϊ����down�ķ���������ͬһ����ģ�ͬһ����ǩ���磺input����һ��domԪ�صġ����顱��
*/
function getClass(tagName,className) //��ñ�ǩ��ΪtagName,����className��Ԫ��
{
    if(document.getElementsByClassName) //֧���������
    {        return document.getElementsByClassName(className);
    }
    else
    {       var tags=document.getElementsByTagName(tagName);//��ȡ��ǩ
        var tagArr=[];//���ڷ�������ΪclassName��Ԫ��
        for(var i=0;i < tags.length; i++)
        {
            if(tags[i].class == className)
            {
                tagArr[tagArr.length] = tags[i];//��������������Ԫ��
            }
        }
        return tagArr;
    }

}

//�жϸ�����Ƿ�Ϊ�ա�
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
	 alert("��ѡ����������");
	}
	
 	if(check == 0){
 		alert("����δ��д�ı�ѡ��");
 	}
	if(check == 1){
		//alert("�����ύ");
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
				<td class="num1">�汾��</td>
				<td class="num2"><input class="bunengweikong" name="Version" type="text" style="width: 213px; "/></td>
				<td class="num3">ί�е�/��������</td>
				<td class="num4"><input class="bunengweikong" name="wtdbgdbh"type="text"/></td>
			</tr>
			
			<tr>
				<td class="num1">״̬</td>
				<td class="num2"><select name="state" size="1" id="state">
					<option value="0">����</option>
					<option value="1">��ʱ</option>
					<option value="2">TP</option>
					<option value="3">����</option>
					<option value="4">ͣ��</option>
					</select>
				</td>
				<td class="num3">����ѹ��/�¶ȴ�����</td>
				<td class="num4"><input class="bunengweikong" type="text" name="jqyawdcgq"/></td>
			</tr>
			<%
			EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
			HashSet<String> hs = ebii.query3();
			Iterator<String> it = hs.iterator();
			 %>
			<tr>
				<td class="num1">��������</td>
				<td class="num2"><select name="ECUType" size="1" id="ECUType" onchange="panduanwenjian()">
				<option value="">��ѡ��</option>
				<%
				while(it.hasNext()){
				String temp = it.next();
				%>
					<option value="<%=temp%>"><%=temp%></option>
				<%
				}
				 %>
				
				</select></td>
				<td class="num3">���������</td>
				<td class="num4"><input class="bunengweikong" name="sjljh" type="text"/></td>
			</tr>
			
			<tr>
				<td class="num1">��;</td>
				<td class="num2"><input class="bunengweikong" name="yt" type="text" style="width: 213px; "/></td>
				<td class="num3">�����</td>
				<td class="num4"><input class="bunengweikong" name="ggg" type="text"/></td>
			</tr>
			
			<tr>
				<td class="num1">���Ť��</td>
				<td class="num2"><input class="bunengweikong" name="zdnj" type="text" style="width: 213px; "/>��λ��N.m</td>
				<td class="num3">����Ť��</td>
				<td class="num4"><input class="bunengweikong" name="dsnj"type="text" style="width: 213px; "/>��λ��N.m</td>
			</tr>
			
			<tr>
				<td class="num1">��ѹ���ͺ�</td>
				<td class="num2"><input class="bunengweikong" name="zyqxh" type="text" style="width: 213px; "/></td>
				<td class="num3">�������ͺ�</td>
				<td class="num4"><input class="bunengweikong" name="pyqxh" type="text" style="width: 213px; "/></td>
			</tr>
			
			<tr>
				<td class="num1">��͵���</td>
				<td class="num2"><input class="bunengweikong" name="Zdds" type="text" style="width: 213px; "/>rpm</td>
				<td class="num3">��ˮ����Һλ����</td>
				<td class="num4"><select name="ysflywkg" size="1" id="ysflywkg">
				<option value="on">��</option>
				<option value="off">��</option>
				
				</select></td>
			</tr>
			
			<tr>
				<td class="num1">˫����</td>
				<td class="num2"><input class="bunengweikong" name="sgk" type="text" style="width: 213px; "/>rpm</td>
				<td class="num3">˫��������</td>
				<td class="num4"><select name="sgkkg" size="1" id="sgkkg">
				<option value="on">��</option>
				<option value="off">��</option>
				</select></td>
			</tr>
			
			<tr>
				<td class="num1">����ѹ��</td>
				<td class="num2"><input class="bunengweikong" name="jqyl" type="text" style="width: 213px; "/></td>
				<td class="num3">�ҵ��������</td>
				<td class="num4"><input class="bunengweikong" name="gdclhqd" type="text" style="width: 213px; "/></td>
			</tr>
			
			<tr>
				<td class="num1">HEX���</td>
				<td class="num2"><input class="bunengweikong" name="Bh" type="text" style="width: 213px; "/></td>
				<td class="num3">������</td>
				<td class="num4"><input class="bunengweikong" name="hclcj" type="text" style="width: 213px; "/></td>
			</tr>
			
			<tr>
				<td class="num1">���·��</td>
				<td class="num5" colspan="3"><input class="bunengweikong" name="cflj" type="text" style="width: 662px; "/></td>
			</tr>
			
			<tr>
				<td class="num1">HEX�ļ�</td>
				<td class="num5" colspan="3">
				
				<!-- <select name="HEXFile" id="HEXFile">
					<option value="bosch">BOSCH</option>
					<option value="kailong">kailong</option>
				</select> -->
				
				<input class="shangchuan" name="HEXFile" id="HEXFile" type="text"/>
											
					<input class="shangchuanfile" name="Browse1" id="Browse1" type="file" style="width: 600px; " value="���..." onchange="gethexname(this.value)"/>
				</td>
			</tr>
			
			<tr>
				<td class="num1">Pfile�ļ�</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="PfileName" id="PfileName" type="text"/>
											
					<input class="shangchuanfile" name="Browse2" id="Browse2" type="file" style="width: 600px; " value="���..." onchange="getpfilename(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">KeyFile�ļ�</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="KeyDataFileName" id="KeyDataFileName" type="text"/>
											
					<input class="shangchuanfile" name="Browse3" id="Browse3" type="file" style="width: 600px; " value="���..." onchange="getkeyfilename(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">SBL�ļ�</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="SBLFileName" id="SBLFileName" type="text"/>
											
					<input class="shangchuanfile" name="Browse4" id="Browse4" type="file" style="width: 600px; " value="���..." onchange="getsblname(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">SRE�ļ�</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="SREFileName" id="SREFileName" type="text"/>
											
					<input class="shangchuanfile" name="Browse5" id="Browse5" type="file" style="width: 600px; " value="���..." onchange="getsrename(this.value)"/>
				</td>
			</tr>
			
			

		

			
			<tr style="height: 50px">
				<td>��ע1</td>
				<td colspan="3"><input name="Bz1" type="text" style="height: 40px; width: 500px"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>��ע2</td>
				<td colspan="3"><input name="Bz2" type="text" style="height: 40px; width: 500px"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>��ע3</td>
				<td colspan="3"><input name="Bz3" type="text" style="height: 40px; width: 500px"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>��ע4</td>
				<td colspan="3"><input name="Bz4" type="text" style="height: 40px; width: 500px"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>��ע5</td>
				<td colspan="3"><input name="Bz5" type="text" style="height: 40px; width: 500px"/></td>
			</tr>
			
			<tr>
				<td colspan="4">
				<input type="button" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff" value="����" onclick="checkDo()"/>
				<input type="button" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff" value="����" onclick="fanhui()"/>
				</td>
			</tr>
			
		</table>
	</div>

</form>

</body>
</html>



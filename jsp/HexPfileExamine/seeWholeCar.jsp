<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.beans.HexInfo"%>
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
<%if(ecutype!=null){ %>
<script language="javascript">
//��Ajax���ʺ�̨���жϸ��ϴ���Щ�ļ����������ϴ����ļ�input��Ϊdisabled��
window.onload =function(){
		var ecutype1 ="<%=hexInfo.getECUType()%>";
		var state ="<%=hexInfo.getState()%>";
		var ysflywkg ="<%=hexInfo.getYsflywkg()%>";
		var sgkkg = "<%=hexInfo.getSgkkg()%>";
		
		var gdclhqd = "<%=hexInfo.getGdclhqd()%>";
		var hclcj = "<%=hexInfo.getHclcj()%>";
		$("#state").find("option[value='"+state+"']").attr("selected",true);
		$("#ysflywkg").find("option[value='"+ysflywkg+"']").attr("selected",true);
		$("#sgkkg").find("option[value='"+sgkkg+"']").attr("selected",true);
		$("#ECUType").find("option[value='"+ecutype1+"']").attr("selected",true);
		
		$("#gdclhqd").find("option[value='"+gdclhqd+"']").attr("selected",true);
		$("#hclcj").find("option[value='"+hclcj+"']").attr("selected",true);
		$.post("./PanDuanWenJian?ecutype=" + ecutype1,null,function(data){
				
					$("#Browse1").attr('disabled',"true");
					$("#Browse2").attr('disabled',"true");
					$("#Browse3").attr('disabled',"true");
					$("#Browse4").attr('disabled',"true");
					$("#Browse5").attr('disabled',"true");
				
				if(data==1||data==3){
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
				
			},"json");
			
		};
</script>
<%} %>

<script language="javascript">

function panduanshuaxie(){
	$("#canwritetimes").attr('disabled',"true");
	var temp = $("#state").val();
	if( temp == "1"){
		alert("��ʱ״̬�£�����д��ˢд������");
		$("#canwritetimes").removeAttr("disabled");
	}
	
}

function panduanwenjian(){
	var ecutype = $("#ECUType").val();
	window.location.href="<%=basePath%>/jsp/HexPfile/modifyWholeCar.jsp?ecutype="+ecutype+"&HEXID="+<%=HEXID%>;
}

function zuhelujing(){
	var a = "d:/ftproot/hexfile/";
	var b = "<%=ecutype%>";
	var c = $("#sjljh").val();
	var d = $("#Version").val();
	var fenge = "/";
	var lujing= a + b + fenge + c + fenge + d;
	$("#cflj").val(lujing);
}
//�������function �������<�ϴ�input>���û��ϴ����Զ��õ��ļ����������ļ�����ֵ����Ӧ��<input����text>��
//���⻹������iffile�������������޸ı�־λ���ύʱ�ж��Ƿ��ϴ����ļ���
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

	var sjljh = $("#sjljh").val();
	var version = $("#Version").val();
	var state = $("#state").val();
	var check = 1;
	if($("#Version").val()==""){
    alert("�汾�Ų���Ϊ��");
    check = 0;
	}
	
	if($("#sjljh").val()==""){
    alert("��������Ų���Ϊ��");
    check = 0;
	}
	
	if($("#Bz2").val()==""){
	    alert("�������ͺŲ���Ϊ��");
	    check = 0;
	}
	

	if($("#ECUType").val() == ""){
	alert("��ѡ����������");
	check = 0;
	}


	if(check == 1){
		//alert("�����ύ");
		$.post("./IfHaveHex?sjljh=" + sjljh+"&version="+ version+"&caozuo="+ "modify"+"&HEXID="+ <%=HEXID%>,null,function(data){
			if(data == 0){
			
				$.post("./PanDuanSjljh_state?sjljh=" + sjljh+"&caozuo="+ "modify"+"&HEXID="+ <%=HEXID%>,null,function(data){
			
					if(data == 1 && state <= 1){
						show_confirm();
					}else{
						form.action="<%=basePath%>/jsp/HexPfile/modifyWholeCar_deal.jsp?HEXID=<%=HEXID%>";
						form.submit();
					}
				},"json");

			}else{
				alert("���ݿ����Ѵ�����ͬ�����������+�汾�ţ�");
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
	var r=confirm("�Ѵ���ͬһ��������ŵ���������ʱ�汾!"+ '\n' + '\n' +"*���ȷ�Ͻ�ԭ������������ʱ�汾�����ݱ�Ϊ����״̬"+ '\n' + '\n' +"*���ȡ�������½����޸����ύ");
	if (r==true)
	  {
	  //alert("�����ύ������ԭ��������Ϊ����״̬��");
	  $.post("./ChangeTo3?sjljh=" + sjljh,null,function(data){
	  		//alert("�ύing");
			form.action="<%=basePath%>/jsp/HexPfile/modifyWholeCar_deal.jsp?HEXID=<%=HEXID%>";
			form.submit();
		},"json");
	  }
	else
	  {
	  alert("�������޸ĺ����ύ��");
	  }
}


function fanhui(){
window.location.href="<%=basePath%>/jsp/HexPfileExamine/HexPfileExamine.jsp";
}

</script>

</head>
<body>
<form name="form" action="" method="post" enctype="multipart/form-data">

	<div align="center">
		<h1>�鿴</h1>
		<table id="dataintable" >
			
			<tr>
				
			<%
					EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
					Map<String,String> m = ebii.query4();
					Iterator it = m.entrySet().iterator();
			 %>
				
				<td class="num1">��������</td>
				<td class="num2"><select name="ECUType" size="1" id="ECUType" onchange="panduanwenjian()" disabled="disabled">
				<option value="">��ѡ��</option>
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
				�������ͺ�
				<input name="Bz2" id="Bz2" type="text" value="<%=hexInfo.getBz2()%>"/>
				
				</td>
				<td class="num3">ί�е�/��������</td>
				<td class="num4"><input class="bunengweikong" name="wtdbgdbh"type="text" value="<%=hexInfo.getWtdbgdbh()%>"/></td>
			</tr>
			
			<tr>
				<td class="num1">״̬</td>
				<td class="num2"><select name="state" size="1" id="state" onchange="panduanshuaxie()">
					<option value="0">����</option>
					<option value="1">��ʱ</option>
					<option value="2">TP</option>
					<option value="3">����</option>
					<option value="4">ͣ��</option>
					</select>
					��ˢд������<input class="" type="text" name="canwritetimes" id="canwritetimes" style="width: 65px; " value="<%=hexInfo.getCanWriteTimes()%>"/>
				</td>
				<td class="num3">����ѹ��/�¶ȴ�����</td>
				<td class="num4"><input class="bunengweikong" type="text" name="jqyawdcgq"  value="<%=hexInfo.getJqyawdcgq()%>"/></td>
			</tr>

			<tr>
				
				
				<td class="num1">�汾��</td>
				<td class="num2"><input class="bunengweikong" name="Version" id="Version" type="text" style="width: 213px; " value="<%=hexInfo.getVersion()%>" onchange="zuhelujing()" disabled="disabled"/></td>
				
				<td class="num3">���������</td>
				<td class="num4"><input class="bunengweikong" name="sjljh" id="sjljh" type="text"  value="<%=hexInfo.getSjljh()%>" onchange="zuhelujing()" disabled="disabled"/></td>
			</tr>
			
			<tr>
				<td class="num1">��;</td>
				<td class="num2"><input class="bunengweikong" name="yt" type="text" style="width: 213px; "  value="<%=hexInfo.getYt()%>"/></td>
				<td class="num3">�����</td>
				<td class="num4"><input class="bunengweikong" name="ggg" type="text"  value="<%=hexInfo.getGgg()%>"/></td>
			</tr>
			
			<tr>
				<td class="num1">���Ť��</td>
				<td class="num2"><input class="bunengweikong" name="zdnj" type="text" style="width: 213px; "  value="<%=hexInfo.getZdnj()%>"/>��λ��N.m</td>
				<td class="num3">����Ť��</td>
				<td class="num4"><input class="bunengweikong" name="dsnj"type="text" style="width: 213px; "  value="<%=hexInfo.getDsnj()%>"/>��λ��N.m</td>
			</tr>
			
			<tr>
				<td class="num1">��ѹ���ͺ�</td>
				<td class="num2"><input class="bunengweikong" name="zyqxh" type="text" style="width: 213px; "  value="<%=hexInfo.getZyqxh()%>"/></td>
				<td class="num3">�������ͺ�</td>
				<td class="num4"><input class="bunengweikong" name="pyqxh" type="text" style="width: 213px; "   value="<%=hexInfo.getPyqxh()%>"/></td>
			</tr>
			
			<tr>
				<td class="num1">��͵���</td>
				<td class="num2"><input class="bunengweikong" name="Zdds" type="text" style="width: 213px; "  value="<%=hexInfo.getZdds()%>"/>rpm</td>
				<td class="num3">��ˮ����Һλ����</td>
				<td class="num4"><select name="ysflywkg" size="1" id="ysflywkg">
				<option value="on">��</option>
				<option value="off">��</option>
				
				</select></td>
			</tr>
			
			<tr>
				<td class="num1">˫����</td>
				<td class="num2"><input class="bunengweikong" name="sgk" type="text" style="width: 213px; "  value="<%=hexInfo.getSgk()%>"/>rpm</td>
				<td class="num3">˫��������</td>
				<td class="num4"><select name="sgkkg" size="1" id="sgkkg">
				<option value="on">��</option>
				<option value="off">��</option>
				</select></td>
			</tr>
			
			<tr>
				<td class="num1">����ѹ��</td>
				<td class="num2"><input class="bunengweikong" name="jqyl" type="text" style="width: 213px; "   value="<%=hexInfo.getJqyl()%>"/></td>
				<td class="num3">�ҵ��������</td>
				<td class="num4">
				<select name="gdclhqd" id="gdclhqd" size="1">
				<option value="yes">��</option>
				<option value="no">����</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td class="num1">HEX���</td>
				<td class="num2"><input class="bunengweikong" name="Bh" type="text" style="width: 213px; "  value="<%=hexInfo.getBh()%>"/></td>
				<td class="num3">������</td>
				<td class="num4">
				<select name="hclcj" id="hclcj" size="1">
				<option value="����">����</option>
				<option value="����">����</option>
				<option value="���ɿ�">���ɿ�</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td class="num1">���·��</td>
				<td class="num5" colspan="3"><input class="bunengweikong" id="cflj" name="cflj" type="text" style="width: 662px; "   value="<%=hexInfo.getCflj()%>" readonly="readonly"/></td>
			</tr>
			
			<tr>
				<td class="num1">HEX�ļ�</td>
				<td class="num5" colspan="3">
				
				<!-- <select name="HEXFile" id="HEXFile">
					<option value="bosch">BOSCH</option>
					<option value="kailong">kailong</option>
				</select> -->
				
				<input class="shangchuan" name="HEXFile" id="HEXFile" type="text"  value="<%=hexInfo.getHEXFile()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse1" id="Browse1" type="file" style="width: 600px; " value="���..." onchange="gethexname(this.value)"/>
				</td>
			</tr>
			
			<tr>
				<td class="num1">Pfile�ļ�</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="PfileName" id="PfileName" type="text"  value="<%=hexInfo.getPfileName()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse2" id="Browse2" type="file" style="width: 600px; " value="���..." onchange="getpfilename(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">KeyFile�ļ�</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="KeyDataFileName" id="KeyDataFileName" type="text"  value="<%=hexInfo.getKeyDataFileName()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse3" id="Browse3" type="file" style="width: 600px; " value="���..." onchange="getkeyfilename(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">SBL�ļ�</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="SBLFileName" id="SBLFileName" type="text"  value="<%=hexInfo.getSBLFileName()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse4" id="Browse4" type="file" style="width: 600px; " value="���..." onchange="getsblname(this.value)"/>
				</td>
			</tr>
			
						<tr>
				<td class="num1">SRE�ļ�</td>
				<td class="num5" colspan="3">				
				<input class="shangchuan" name="SREFileName" id="SREFileName" type="text"  value="<%=hexInfo.getSREFileName()%>" readonly="readonly"/>
											
					<input class="shangchuanfile" name="Browse5" id="Browse5" type="file" style="width: 600px; " value="���..." onchange="getsrename(this.value)"/>
				</td>
			</tr>
			
			

		

			
			<tr style="height: 50px">
				<td>��ע1</td>
				<td colspan="3"><input name="Bz1" type="text" style="height: 40px; width: 500px"  value="<%=hexInfo.getBz1()%>"/></td>
			</tr>
			

			
				<tr style="height: 50px">
				<td>��ע2</td>
				<td colspan="3"><input name="Bz3" type="text" style="height: 40px; width: 500px"  value="<%=hexInfo.getBz3()%>"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>��ע3</td>
				<td colspan="3"><input name="Bz4" type="text" style="height: 40px; width: 500px"  value="<%=hexInfo.getBz4()%>"/></td>
			</tr>
			
				<tr style="height: 50px">
				<td>��ע4</td>
				<td colspan="3"><input name="Bz5" type="text" style="height: 40px; width: 500px"  value="<%=hexInfo.getBz5()%>"/></td>
			</tr>
			
			<tr>
				<td colspan="4">

				<input type="button" style="border:1; height: 22px; width: 50px; 
					background: #555555; color:#ffffff" value="����" onclick="fanhui()"/>
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



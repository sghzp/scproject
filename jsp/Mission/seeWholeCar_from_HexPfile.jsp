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
	String sjljh = (String)request.getParameter("sjljh");
	String version = (String)request.getParameter("version");
	System.out.println(sjljh+"----"+version);
	//System.out.println(HEXID);
	HexInfoDaoImpl hexInfoDaoImpl = new HexInfoDaoImpl();
	
	ResultSet rs = null;
	ArrayList<HexInfo> hexInfos = null;
	HexInfo hexInfo = null;	
	//System.out.println(sjljh+version);
	hexInfo = hexInfoDaoImpl.queryby_sjljh_version(sjljh, version);
	String HEXID = hexInfo.getHEXID()+"";

 %>


<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/adddate.js"></script>

<script language="javascript">
//��Ajax���ʺ�̨���жϸ��ϴ���Щ�ļ����������ϴ����ļ�input��Ϊdisabled��
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
		
		$("#state").find("option[value='"+state+"']").attr("selected",true);
		$("#ysflywkg").find("option[value='"+ysflywkg+"']").attr("selected",true);
		$("#sgkkg").find("option[value='"+sgkkg+"']").attr("selected",true);
		$("#ECUType").find("option[value='"+ecutype1+"']").attr("selected",true);
		
		$("#gdclhqd").find("option[value='"+gdclhqd+"']").attr("selected",true);
		$("#hclcj").find("option[value='"+hclcj+"']").attr("selected",true);
		$("#jqyawdcgq").find("option[value='"+jqyawdcgq+"']").attr("selected",true);
		$("#jqyl").find("option[value='"+jqyl+"']").attr("selected",true);
		$("#ggg").find("option[value='"+ggg+"']").attr("selected",true);
		
		$("#Browse1").attr('disabled',"true");
		$("#Browse2").attr('disabled',"true");
		$("#Browse3").attr('disabled',"true");
		$("#Browse4").attr('disabled',"true");
		$("#Browse5").attr('disabled',"true");
		
		
		
		var inputs= document.getElementsByTagName('input');
		//alert(inputs.length);
		for(var i=0; i<inputs.length; i++){
    		if(inputs[i].type=='text'){
      			inputs[i].disabled = "disabled";
    		}
    	}
    	var selects = document.getElementsByTagName('select');
    	for(var i = 0; i<selects.length; i++){
    		selects[i].disabled = "disabled";
    	}
	};
</script>


<script language="javascript">

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
					<option value="-1">��</option>
					<option value="0">����</option>
					<option value="1">��ʱ</option>
					<option value="2">����</option>
					<option value="3">����</option>
					<option value="4">ͣ��</option>
					<option value="5">��ʱ����</option>
					</select>
					��ˢд������<input class="" type="text" name="canwritetimes" id="canwritetimes" style="width: 65px; " value="<%=hexInfo.getCanWriteTimes()%>"/>
				</td>
				<td class="num3">����ѹ��/�¶ȴ�����</td>
				<td class="num4"><select name="jqyawdcgq" size="1" id="jqyawdcgq">
					<option value="">��ѡ��</option>
					<option value="������һ��ʽ">������һ��ʽ</option>
					<option value="��װ����ʽ">��װ����ʽ</option>
					<option value="����һ��ʽ">����һ��ʽ</option>
					
					</select></td>
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
				<td class="num4">
					<select name="ggg" size="1" id="ggg">
					<option value="">��ѡ��</option>
					<option value="��FD">��FD</option>
					<option value="����FD">����FD</option>
					</select>
				</td>
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
				<option value="">��ѡ��</option>
				<option value="��">��</option>
				<option value="����">����</option>
				
				</select></td>
			</tr>
			
			<tr>
				<td class="num1">˫����</td>
				<td class="num2"><input class="bunengweikong" name="sgk" type="text" style="width: 213px; "  value="<%=hexInfo.getSgk()%>"/></td>
				<td class="num3">˫��������</td>
				<td class="num4">
					<select name="sgkkg" size="1" id="sgkkg">
				<option value="">��ѡ��</option>
				<option value="�Ը�λ">�Ը�λ</option>
				<option value="�̰�ʽ">�̰�ʽ</option>
				</select>
				
				</td>
			</tr>
			
			<tr>
				<td class="num1">����ѹ��</td>
				<td class="num2">
					<select name="jqyl" size="1" id="jqyl">
					<option value="">��ѡ��</option>
					<option value="PIM">PIM</option>
					<option value="PIMR">PIMR</option>
					</select>
				
				</td>
				<td class="num3">�ҵ��������</td>
				<td class="num4">
					<select name="gdclhqd" id="gdclhqd" size="1">
				<option value="">��ѡ��</option>
				<option value="����">����</option>
				<option value="��ֹ">��ֹ</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td class="num1">HEX���</td>
				<td class="num2"><input class="bunengweikong" name="Bh" type="text" style="width: 213px; "  value="<%=hexInfo.getBh()%>"/></td>
				<td class="num3">������</td>
				<td class="num4">
				<select name="hclcj" id="hclcj" size="1">
				<option value="">��ѡ��</option>
				<option value="����">����</option>
				<option value="����">����</option>
				<option value="���ɿ�">���ɿ�</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td class="num1">����汾</td>
				<td class="num2"><input name="Bz5" type="text" style="width: 213px"  value="<%=hexInfo.getBz5()%>"/></td>
				<td class="num3">��ʱ״̬��Ч��</td>
				<td class="num4">
					<input class="" type="text" name="Yxq" style="width: 213px" value="<%=hexInfo.getYxq()%>"/>
				</td>
			
			</tr>
			
			<tr>
				<td class="num1">���·��</td>
				<td class="num2" colspan="3"><input class="bunengweikong" id="cflj" name="cflj" type="text" style="width: 662px; "   value="<%=hexInfo.getCflj()%>" readonly="readonly"/></td>
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
			
	
			
			<tr>
				<td colspan="4">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="button" value="�ر�" style="width:200px" onclick="guanbi()"/>
				</td>
			</tr>
		</table>
	</div>

</form>

<script>
function guanbi(){
	//alert("guanbi");
	parent.$('#win').window('close');
	//$('#win').window('close');  
}

var state = <%=hexInfo.getState()%>;
if(state != 1 || state != "1"){
$("#canwritetimes").attr('disabled',"true");
}



</script>
</body>
</html>



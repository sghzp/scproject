<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.MesInfoDaoImpl"%>
<%@ page import="com.seu.beans.MesInfo"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%@ page import="com.seu.beans.IniInfo"%>

<%
request.setCharacterEncoding("utf-8");//设置页面字符集
response.setCharacterEncoding("utf-8");
%>

<%
	String chuliriqi = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
	//String clyj = new String(request.getParameter("clyj").getBytes("ISO-8859-1"), "UTF-8");
	String num = (String)request.getParameter("num");
	String dangqianyonghu = (String) session.getAttribute("username");
	//System.out.println("我是来撤销审核的：但我要改变哪些参数呢？"+num);
	
	//得到必须的对象
	MesInfoDaoImpl midi = new MesInfoDaoImpl();
	MesInfo mesInfo = midi.query_by_num(num);//先得到对象
	
	mesInfo.setClzt(3);//要变回未处理状态----改为变为已处理，意味着流程结束。（0-待处理，1-审核通过，2-驳回状态，3-撤销审核，4-撤销申请）。
	//本来是mesInfo.setClzt（0）-未处理状态。
	//现在TM要把审核通过变为TM三种状况。。。。WTF？？？？
	midi.updatemesInfo(mesInfo);//将处理状态改变
	
		if(mesInfo.getStyle() == 0){//更改hexInfo
			HexInfoDaoImpl hidi = new HexInfoDaoImpl();
			HexInfo hexInfo = hidi.queryby_sjljh_version(mesInfo.getSjljh(), mesInfo.getVersion());
			hexInfo.setState(mesInfo.getOristate());//变为特定的状态
			hexInfo.setShzt("未审核");//已审核
			hexInfo.setShrq(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
			hexInfo.setShr((String)session.getAttribute("username"));//审核人
			
			//改变规则后，这里算流程结束。
			hexInfo.setBz6("0");//0代表不在流程里
			
			hidi.updateHexInfo(hexInfo);
		}else if(mesInfo.getStyle() == 1){//更改INIinfo
			IniInfoDaoImpl indi = new IniInfoDaoImpl();
			IniInfo iniInfo = indi.queryby_ecuorder_sbm(mesInfo.getSjljh(), mesInfo.getVersion());
			iniInfo.setState(mesInfo.getOristate());
			iniInfo.setShzt("未审核");
			iniInfo.setShrq(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
			iniInfo.setShr((String)session.getAttribute("username"));
			
			//同上！流程结束标志
			iniInfo.setBz3("0");
			
			indi.updateIniInfo(iniInfo);
		}
	
	String clzk = "撤销审核-"+mesInfo.getSqsm()+"-"+dangqianyonghu+"-"+chuliriqi+"-"+" ";
	midi.update_clzk(mesInfo, clzk);
	
	//接下来要根据mesInfo中的style位，得到是去改变Hexinfo还是IniInfo？ */
	
	
		
	
	boolean check2=true;
	if (check2) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='Tracing.jsp'");
		out.println("</script>");
	} else {//操作失败
		out.println("<script>");
		out.println("alert('操作失败');");
		out.println("window.location='Tracing.jsp'");
		out.println("</script>");
	}

	
%>
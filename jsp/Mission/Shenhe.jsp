<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.jdbc.*"%>
<%@ page import="com.seu.dao.impl.MesInfoDaoImpl"%>
<%@ page import="com.seu.beans.MesInfo"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.dao.impl.UserInfoDaoImpl"%>
<%@ page import="com.seu.beans.UserInfo"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%@ page import="com.seu.beans.IniInfo"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="com.seu.thread.MailThread"%>
<%@ page import="java.net.URLDecoder" %>

<%
request.setCharacterEncoding("utf-8");//设置页面字符集
response.setCharacterEncoding("utf-8");
%>

<%
	//得到必须的参数
	String dangqianchuliren = (String)session.getAttribute("username");
	String chuliriqi = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
	//String clyj = new String(request.getParameter("clyj").getBytes("ISO-8859-1"), "UTF-8");
	String clyj = URLDecoder.decode(request.getParameter("clyj"), "UTF-8");
	String iftongguo = (String)request.getParameter("iftongguo");//1或0//0是不通过，1是通过
	String num = (String)request.getParameter("num");
	
	//System.out.println("在shenhe.jsp中，测试clyj不填时会发生异常么？"+clyj);
	if("".equals(clyj)){
		clyj = " ";
	}
	
	//得到必须的对象
	MesInfoDaoImpl midi = new MesInfoDaoImpl();
	MesInfo mesInfo = midi.query_by_num(num);//先得到对象

	//分两种情况进行操作
	String clzk = null;
	
	UserInfoDaoImpl uidi = new UserInfoDaoImpl();
	UserInfo userInfo = uidi.query(mesInfo.getClrgh());
	UserInfo userInfo1 = uidi.query(mesInfo.getSqrgh());
	
	if("1".equals(iftongguo)){//表示通过
		//改变处理状态为，已处理的状态。流程结束
		mesInfo.setClzt(1);
		midi.updatemesInfo(mesInfo);//将处理状态改变
		//流程结束，给参与人员发邮件
		Thread t1 = new Thread(new MailThread(userInfo.getMail(),"EOL系统流程结束-数据零件号为"+mesInfo.getSjljh()+"-版本号为"+mesInfo.getVersion(),"数据零件号为"+mesInfo.getSjljh()+",版本号为"+mesInfo.getVersion()+"的状态变更申请已处理完毕。"));
		Thread t2 = new Thread(new MailThread(userInfo1.getMail(),"EOL系统流程结束-数据零件号为"+mesInfo.getSjljh()+"-版本号为"+mesInfo.getVersion(),"数据零件号为"+mesInfo.getSjljh()+",版本号为"+mesInfo.getVersion()+"的状态变更申请已处理完毕。"));
		Thread t3 = new Thread(new MailThread(userInfo.getMail(),"EOL系统流程结束-订货号为"+mesInfo.getSjljh()+"-识别码为"+mesInfo.getVersion(),"订货号为"+mesInfo.getSjljh()+",识别码为"+mesInfo.getVersion()+"的状态变更申请已处理完毕。"));
		Thread t4 = new Thread(new MailThread(userInfo1.getMail(),"EOL系统流程结束-订货号为"+mesInfo.getSjljh()+"-识别码为"+mesInfo.getVersion(),"订货号为"+mesInfo.getSjljh()+",识别码为"+mesInfo.getVersion()+"的状态变更申请已处理完毕。"));
		///////////////////////////////////////////////////////////
		clzk = "申请通过-"+mesInfo.getSqsm() +"-"+dangqianchuliren+"-"+chuliriqi+"-"+clyj;
		if(mesInfo.getStyle() == 0){//更改hexInfo
			t1.start();
			t2.start();
			HexInfoDaoImpl hidi = new HexInfoDaoImpl();
			HexInfo hexInfo = hidi.queryby_sjljh_version(mesInfo.getSjljh(), mesInfo.getVersion());
			hexInfo.setState(mesInfo.getDststate());//变为特定的状态
			hexInfo.setShzt("已审核");//已审核
			hexInfo.setShrq(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
			hexInfo.setShr((String)session.getAttribute("username"));//审核人
			if(mesInfo.getBz2() != null && mesInfo.getBz1() != null && mesInfo.getDststate() == 1){
				hexInfo.setYxq(mesInfo.getBz2());//临时状态有效期
				hexInfo.setCanWriteTimes(mesInfo.getBz1());//可刷写次数
			}
			hexInfo.setBz6("0");//流程结束
			hexInfo.setBz7("0");//可以判断临时状态下，临时状态有效期与可刷写次数是否小于10
			hidi.updateHexInfo(hexInfo);
		}else if(mesInfo.getStyle() == 1){//更改INIinfo
			t3.start();
			t4.start();
			IniInfoDaoImpl indi = new IniInfoDaoImpl();
			IniInfo iniInfo = indi.queryby_ecuorder_sbm(mesInfo.getSjljh(), mesInfo.getVersion());
			iniInfo.setState(mesInfo.getDststate());
			iniInfo.setShzt("已审核");
			iniInfo.setShrq(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
			iniInfo.setShr((String)session.getAttribute("username"));
			if(mesInfo.getBz2() != null && mesInfo.getBz1() != null && mesInfo.getDststate() == 1){
				iniInfo.setYxq(mesInfo.getBz2());
				iniInfo.setCanWriteTimes(mesInfo.getBz1());
			}
			iniInfo.setBz3("0");//流程结束
			iniInfo.setBz4("0");//可以判断临时状态下，临时状态有效期与可刷写次数是否小于10
			indi.updateIniInfo(iniInfo);
		}
		LogInfoDaoImpl lidi = new LogInfoDaoImpl();
		lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+dangqianchuliren+"通过了"+mesInfo.getSjljh()+"_"+mesInfo.getVersion()+"由"+mesInfo.getOristate_zhongwen()+"到"+mesInfo.getDststate_zhongwen()+"的状态变更");
	}else if("0".equals(iftongguo)){//表示审核不通过
		//改变处理状态为，被驳回状态。流程暂未结束
		mesInfo.setClzt(2);
		midi.updatemesInfo(mesInfo);//将处理状态改变
		
		//流程结束，给参与人员发邮件，（这里只给申请者发一条邮件即可！）
		Thread t5 = new Thread(new MailThread(userInfo1.getMail(),"EOL系统流程结束-数据零件号为"+mesInfo.getSjljh()+"-版本号为"+mesInfo.getVersion(),"数据零件号为"+mesInfo.getSjljh()+",版本号为"+mesInfo.getVersion()+"的状态变更申请没有通过审核。"));
		Thread t6 = new Thread(new MailThread(userInfo1.getMail(),"EOL系统流程结束-订货号为"+mesInfo.getSjljh()+"-识别码为"+mesInfo.getVersion(),"订货号为"+mesInfo.getSjljh()+",识别码为"+mesInfo.getVersion()+"的状态变更申请没有通过审核。"));
		if(mesInfo.getStyle() == 0){
			t5.start();
		}else{
			t6.start();
		}
		///////////////////////////////////////////////////////////
		
		clzk = "申请被驳回-"+mesInfo.getSqsm()+"-"+dangqianchuliren+"-"+chuliriqi+"-"+clyj;
		LogInfoDaoImpl lidi = new LogInfoDaoImpl();
		lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+dangqianchuliren+"未通过"+mesInfo.getSjljh()+"_"+mesInfo.getVersion()+"由"+mesInfo.getOristate_zhongwen()+"到"+mesInfo.getDststate_zhongwen()+"的状态变更");
	}
	 
	midi.update_clzk(mesInfo, clzk);
	
	//接下来要根据mesInfo中的style位，得到是去改变Hexinfo还是IniInfo？
	
	
		
	
	boolean check2=true;
	if (check2) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='Mission.jsp'");
		out.println("</script>");
	} else {//操作失败
		out.println("<script>");
		out.println("alert('操作失败');");
		out.println("window.location='Mission.jsp'");
		out.println("</script>");
	}

	
%>
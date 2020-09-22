<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.JdbcUtils"%>
<%@ page import="com.seu.beans.MesInfo"%>
<%@ page import="com.seu.dao.impl.MesInfoDaoImpl"%>
<%@ page import="com.seu.beans.UserInfo"%>
<%@ page import="com.seu.dao.impl.UserInfoDaoImpl"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.ioutils.HandleFolder"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="com.seu.mailutil.*"%>
<%@ page import="com.seu.Global.*"%>
<%@ page import="com.seu.thread.MailThread"%>

<%
	/*
	 通知添加后台
	 */
	Connection conn = JdbcUtils.getConnection();
	request.setCharacterEncoding("gbk");//设置字符集
	ResultSet rs = null;//声明结果集
	
	//新建一个smartupload对象
	SmartUpload su = new SmartUpload();
	//上传初始化
	su.initialize(pageContext);//pageContext是JSP九大内置对象之一
	//设定允许上传的文件类型
	su.setAllowedFilesList("");
	//上传文件
	su.upload();
	//将上传文件保存到指定目录
	String num = (String) su.getRequest().getParameter("num");
	String style = "1";//0为数据零件号，1为整车信息申请、、 int的
	String sqrq = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	String sqr = (String)session.getAttribute("username");
	String sqrgh = (String)session.getAttribute("bh");
	String sjljh= (String) su.getRequest().getParameter("sjljh");
	String version= (String) su.getRequest().getParameter("version");
	String oristate= (String) su.getRequest().getParameter("oristate");//int的
	String dststate= (String) su.getRequest().getParameter("dststate");//int的
	String sqsm= (String) su.getRequest().getParameter("sqsm");
	String bz = (String) su.getRequest().getParameter("bz");
	String bz1 = (String) su.getRequest().getParameter("bz1");
	String bz2 = (String) su.getRequest().getParameter("bz2");
	String bz3 = "";
	String bz4 = "";
	String bz5 = "";
	String clrgh = (String) su.getRequest().getParameter("clrgh");
	String clr = (String) su.getRequest().getParameter("clr");
	String clzt = "0";//0为待处理，1为处理完毕   int 
	String clzk = "申请待处理-"+sqsm+"-"+sqr+"-"+num+"-"+" ";

	String fj1 = (String) su.getRequest().getParameter("fj1");
	String fj2 = (String) su.getRequest().getParameter("fj2");
	String fj3 = (String) su.getRequest().getParameter("fj3");
	
	//System.out.println("ChangeSjljh_deal.jsp如果没有上传fj3，那么附件三是："+ fj3);
	
	//System.out.println(clr+clzk+fj1);
	
	//设置路径，合成路径名
	StringBuffer path = new StringBuffer("");
	path.append(Path.ROOT_EOL);
	//path.append("eol");
	path.append("/");
	path.append("fujian");
	path.append("/");
	path.append(num);

	//String path = sb.toString();
    //用合成的路径名，上传文件	
    System.out.println(path);
    //先建立目录
    HandleFolder.newDir(path.toString());
    //再往目录里存，因为存，必须先建立好对应的目录
	su.save(path.toString(),SmartUpload.SAVE_PHYSICAL);
	
	MesInfo mesInfo = new MesInfo();

	mesInfo.setNum(num);
	mesInfo.setStyle(Integer.parseInt(style));//
	mesInfo.setSqrq(sqrq);
	mesInfo.setSqr(sqr);
	mesInfo.setSqrgh(sqrgh);
	mesInfo.setSjljh(sjljh);
	mesInfo.setVersion(version);
	mesInfo.setOristate(Integer.parseInt(oristate));//
	mesInfo.setDststate(Integer.parseInt(dststate));//
	mesInfo.setSqsm(sqsm);
	mesInfo.setBz(bz);
	mesInfo.setBz1(bz1);
	mesInfo.setBz2(bz2);
	mesInfo.setBz3(bz3);
	mesInfo.setBz4(bz4);
	mesInfo.setBz5(bz5);
	mesInfo.setClrgh(clrgh);
	mesInfo.setClr(clr);
	mesInfo.setClzt(Integer.parseInt(clzt));//
	mesInfo.setClzk(clzk);
	mesInfo.setFJ1(fj1);
	mesInfo.setFJ2(fj2);
	mesInfo.setFJ3(fj3);
	
	//*******上边是上传到本机目录*********
	//************下边是存到数据库***************************
	MesInfoDaoImpl mesInfoDaoImpl = new MesInfoDaoImpl();
	
	boolean check = mesInfoDaoImpl.addmesInfo(mesInfo);
 	//boolean check = true;
	
	//******************下面是发邮件的代码******
	UserInfoDaoImpl uidi = new UserInfoDaoImpl();
	UserInfo userInfo = uidi.query(mesInfo.getClrgh());
	
	//换为多线程
	Thread t = new Thread(new MailThread(userInfo.getMail(),"您有待处理事项","订货号为"+mesInfo.getSjljh()+",识别码为"+mesInfo.getVersion()+",请登录以下网址进行处理。"));
	t.start();
	//MailUtil.sendmail(userInfo.getMail(), "您有待处理事项", "请登录Eol系统处理您的事项！http://s60:8080/scprojecttest");
	//******************上面是发邮件的代码******
	
	
	/*  //**************下边是写日志*****************************
	LogInfoDaoImpl lidi = new LogInfoDaoImpl();
	lidi.addLogInfo(hexInfo.getScrq(), "用户"+shangchuanren+"上传HEX数据零件号"+hexInfo.getSjljh()+"成功");
 	*/
 	LogInfoDaoImpl lidi = new LogInfoDaoImpl();
	lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+mesInfo.getSqr()+"提交了"+mesInfo.getSjljh()+"_"+mesInfo.getVersion()+"由"+mesInfo.getOristate_zhongwen()+"到"+mesInfo.getDststate_zhongwen()+"的状态变更申请");
	
	


	if (check) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='ChangeSjljh.jsp'");
		out.println("</script>");
	} else {//操作失败
			out.println("<script>");
			out.println("alert('申请失败');");
			out.println("history.go(-1)");
			//out.println("window.location='HexPfile.jsp'");
			out.println("</script>");
	}
	
%>
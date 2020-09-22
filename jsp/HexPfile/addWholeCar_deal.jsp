<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.JdbcUtils"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.ioutils.HandleFolder"%>
<%@ page import="com.seu.service.Ftpservice"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="com.seu.Global.*"%>

<%
	/*
	 通知添加后台
	 */
	Connection conn = JdbcUtils.getConnection();
	request.setCharacterEncoding("GBK");//设置字符集
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
	
	String shangchuanren = (String)session.getAttribute("username");
	
	String Version = (String) su.getRequest().getParameter("Version");
	String wtdbgdbh = (String) su.getRequest().getParameter("wtdbgdbh");
	String state1 = (String) su.getRequest().getParameter("state");
	int state = -1;
	/* if("空".equals(state1)){
		state = -1;
	}else{
		state = Integer.parseInt(state1);
	} */
	
	String jqyawdcgq = (String) su.getRequest().getParameter("jqyawdcgq");
	String ECUType = (String) su.getRequest().getParameter("ECUType");
	String sjljh = ((String) su.getRequest().getParameter("sjljh")).toUpperCase();
	String yt = (String) su.getRequest().getParameter("yt");
	String ggg = (String) su.getRequest().getParameter("ggg");
	String zdnj = (String) su.getRequest().getParameter("zdnj");
	String dsnj = (String) su.getRequest().getParameter("dsnj");
	String zyqxh = (String) su.getRequest().getParameter("zyqxh");
	String pyqxh =(String) su.getRequest().getParameter("pyqxh");
	String Zdds = (String) su.getRequest().getParameter("Zdds");
	String ysflywkg = (String) su.getRequest().getParameter("ysflywkg");
	String sgk = (String) su.getRequest().getParameter("sgk");
	String sgkkg = (String) su.getRequest().getParameter("sgkkg");
	String jqyl = (String) su.getRequest().getParameter("jqyl");
	String gdclhqd = (String) su.getRequest().getParameter("gdclhqd");
	String Bh = (String) su.getRequest().getParameter("Bh");
	String hclcj = (String) su.getRequest().getParameter("hclcj");
	String cflj = "";//因为后来也没有用到，用到路径时，都是按照规则，再组装的。
	String HEXFile = (String) su.getRequest().getParameter("HEXFile");
	String PfileName = (String) su.getRequest().getParameter("PfileName");
	String KeyDataFileName = (String) su.getRequest().getParameter("KeyDataFileName");
	String SBLFileName = (String) su.getRequest().getParameter("SBLFileName");
	String SREFileName = (String) su.getRequest().getParameter("SREFileName");
    String Bz1 = (String) su.getRequest().getParameter("Bz1");
   	String Bz2 = (String) su.getRequest().getParameter("Bz2");
    if(Bz2 != null){
    	Bz2 = Bz2.trim();
    }
	String Bz3 = (String) su.getRequest().getParameter("Bz3");
	String Bz4 = (String) su.getRequest().getParameter("Bz4");
	String Bz5 = (String) su.getRequest().getParameter("Bz5");
	//String Yxq = (String) su.getRequest().getParameter("Yxq");

	
	
	String canwritetimes = (String) su.getRequest().getParameter("canwritetimes");
	String canwritetimes1 = null;
	if(canwritetimes == null || canwritetimes == "" || canwritetimes == "null"){
		canwritetimes1 = "";
	}else{
		canwritetimes1 = canwritetimes;
	}
	
	System.out.println("可刷写次数为：" + canwritetimes);
	//设置路径，合成路径名
	StringBuffer path = new StringBuffer("");
	path.append(Path.ROOT_FTP);
	//path.append("ftproot");
	path.append("/");
	path.append("hexfile");
	path.append("/");
	path.append(ECUType);
	path.append("/");
	path.append(sjljh);
	path.append("/");
	path.append(Version);
	//String path = sb.toString();
    //用合成的路径名，上传文件	
    System.out.println(path);
    //先建立目录
    HandleFolder.newDir(path.toString());
    //再往目录里存，因为存，必须先建立好对应的目录
	su.save(path.toString(),SmartUpload.SAVE_PHYSICAL);
	
	HexInfo hexInfo = new HexInfo();
	hexInfo.setVersion(Version);
    hexInfo.setWtdbgdbh(wtdbgdbh);
    hexInfo.setState(state);
    hexInfo.setJqyawdcgq(jqyawdcgq);
    hexInfo.setECUType(ECUType);
    hexInfo.setSjljh(sjljh);
    hexInfo.setYt(yt);
    hexInfo.setGgg(ggg);
    hexInfo.setZdnj(zdnj);
    hexInfo.setDsnj(dsnj);
    hexInfo.setZyqxh(zyqxh);
    hexInfo.setPyqxh(pyqxh);
    hexInfo.setZdds(Zdds);
    hexInfo.setYsflywkg(ysflywkg);
    hexInfo.setSgk(sgk);
    hexInfo.setSgkkg(sgkkg);
    hexInfo.setJqyl(jqyl);
    hexInfo.setGdclhqd(gdclhqd);
    hexInfo.setBh(Bh);
    hexInfo.setHclcj(hclcj);
    hexInfo.setCflj(cflj);
    hexInfo.setHEXFile(HEXFile);
	hexInfo.setPfileName(PfileName);
	hexInfo.setKeyDataFileName(KeyDataFileName);
	hexInfo.setSBLFileName(SBLFileName);
	hexInfo.setSREFileName(SREFileName);
	hexInfo.setBz1(Bz1);
	hexInfo.setBz2(Bz2);
	hexInfo.setBz3(Bz3);
	hexInfo.setBz4(Bz4);
	hexInfo.setBz5(Bz5);
	hexInfo.setYxq("");//新增加的有效期。
	
	
	
	hexInfo.setDownloadtimes(0);//新建时，下载次数设为0
	
	hexInfo.setBz6("");//预留的几个备注，设为“”空。
	hexInfo.setBz7("");//预留的几个备注，设为“”空。
	hexInfo.setBz8("");//预留的几个备注，设为“”空。
	hexInfo.setBz9("");//预留的几个备注，设为“”空。
	
	hexInfo.setShzt("未审核");
	
	hexInfo.setScz(shangchuanren);
	
	hexInfo.setCanWriteTimes(canwritetimes1);
	
	hexInfo.setScrq(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
	
	hexInfo.setTimes(0);
	
	hexInfo.setEditDate(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
	
	//*******上边是上传到本机目录*********下边是上传到ftp***********************
	boolean checkftp = false;
    Ftpservice ftpservice = new Ftpservice();
    if((hexInfo.getHEXFile() == null &&hexInfo.getSREFileName() == null)|| (hexInfo.getHEXFile().equals("") &&hexInfo.getSREFileName().equals(""))){
    	checkftp=ftpservice.ToFtp(hexInfo.getECUType(), hexInfo.getSjljh(), hexInfo.getVersion(), hexInfo.getPfileName(), hexInfo.getKeyDataFileName(), hexInfo.getSBLFileName());
    }
    
    if(!hexInfo.getHEXFile().equals("")){
    	checkftp=ftpservice.ToFtp(hexInfo.getECUType(), hexInfo.getSjljh(), hexInfo.getVersion(), hexInfo.getHEXFile(), null, null);
    }
    
    if(!hexInfo.getSREFileName().equals("") ){
    	checkftp=ftpservice.ToFtp(hexInfo.getECUType(), hexInfo.getSjljh(), hexInfo.getVersion(), hexInfo.getSREFileName(), null, null);
    }   
	//************下边是存到数据库***************************
	 if(checkftp){ 
		HexInfoDaoImpl hexInfoDaoImpl = new HexInfoDaoImpl();
		boolean check = hexInfoDaoImpl.addHexInfo(hexInfo);
	   //**************下边是写日志*****************************
		LogInfoDaoImpl lidi = new LogInfoDaoImpl();
		lidi.addLogInfo(hexInfo.getScrq(), "用户"+shangchuanren+"上传HEX数据零件号"+hexInfo.getSjljh()+"_"+hexInfo.getVersion()+"成功");
 	} 

	

	if(checkftp){
	//if (checkftp) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='HexPfile.jsp'");
		out.println("</script>");
	} else {//操作失败
			out.println("<script>");
			out.println("alert('ftp上传失败');");
			out.println("history.go(-1)");
			//out.println("window.location='HexPfile.jsp'");
			out.println("</script>");
	}
	
%>
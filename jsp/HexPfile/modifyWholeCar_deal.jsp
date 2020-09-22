<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.JdbcUtils"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.ioutils.*"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="com.seu.service.Ftpservice"%>
<%@ page import="com.seu.dao.impl.EcuBasicInfoImpl"%>
<%@ page import="java.util.HashMap"%>
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
	//su.setAllowedFilesList("hex");
	//上传文件
	su.upload();
	//将上传文件保存到指定目录
	
	String HEXID1 = (String) request.getParameter("HEXID");
	int HEXID = Integer.parseInt(HEXID1);
	
	String Version = (String) su.getRequest().getParameter("Version");
	String wtdbgdbh = (String) su.getRequest().getParameter("wtdbgdbh");
	//String state1 = (String) su.getRequest().getParameter("state");
	//int state =  Integer.parseInt(state1);
	String jqyawdcgq = (String) su.getRequest().getParameter("jqyawdcgq");
	String ECUType = (String) su.getRequest().getParameter("ECUType");
	String sjljh = (String) su.getRequest().getParameter("sjljh");
	if(sjljh != null){
		sjljh = sjljh.toUpperCase();
	}
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
	String cflj ="";
	String HEXFile = (String) su.getRequest().getParameter("HEXFile");
	String PfileName = (String) su.getRequest().getParameter("PfileName");
	String KeyDataFileName = (String) su.getRequest().getParameter("KeyDataFileName");
	String SBLFileName = (String) su.getRequest().getParameter("SBLFileName");
	String SREFileName = (String) su.getRequest().getParameter("SREFileName");
    String Bz1 = (String) su.getRequest().getParameter("Bz1");
	String Bz2 = (String) su.getRequest().getParameter("Bz2");
	String Bz3 = (String) su.getRequest().getParameter("Bz3");
	String Bz4 = (String) su.getRequest().getParameter("Bz4");
	String Bz5 = (String) su.getRequest().getParameter("Bz5");
	String Yxq = (String) su.getRequest().getParameter("Yxq");
	

	
	String canwritetimes = (String) su.getRequest().getParameter("canwritetimes");
	
	String canwritetimes1 = null;
	if(canwritetimes == null || canwritetimes == "" || canwritetimes == "null"){
		canwritetimes1 = "";
	}else{
		canwritetimes1 = canwritetimes;
	}
	

	
	HexInfo hexInfo = new HexInfoDaoImpl().query(HEXID);
	//更新操作要设定hexid的值。插入操作不用加入hexid的值，因为插入新行时，数据库的HEXID会自增
	//hexInfo.setHEXID(HEXID);
	//hexInfo.setVersion(Version);//版本号不可修改
    if(hexInfo.getState() == -1){//若为空状态，可以任意修改
	    hexInfo.setWtdbgdbh(wtdbgdbh);
		//System.out.println("我是state："+state);
	    //hexInfo.setState(state);
	    hexInfo.setJqyawdcgq(jqyawdcgq);
	    //hexInfo.setECUType(ECUType);//所属机型不可修改
	    //hexInfo.setSjljh(sjljh);//数据零件号不可修改
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
		hexInfo.setYxq("");
		hexInfo.setEditDate(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
		hexInfo.setCanWriteTimes(canwritetimes1);
    	////}else if(hexInfo.getState() == 0 || hexInfo.getState() == 1 || hexInfo.getState() == 5){//临时、临时超限、正常状态时的除备注外信息只有未被刷写和下载过才能修改
    }else{
    	hexInfo.setBz1(Bz1);
    	hexInfo.setBz3(Bz3);
    	hexInfo.setBz4(Bz4);
    	
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
		 hexInfo.setBz5(Bz5);
    	/* if(hexInfo.getTimes() == 0 && hexInfo.getDownloadtimes() == 0){//注意这里的逻辑，与界面显示的逻辑有区别
	    	hexInfo.setWtdbgdbh(wtdbgdbh);
		    //hexInfo.setState(state);
		    hexInfo.setJqyawdcgq(jqyawdcgq);
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
			hexInfo.setBz2(Bz2);
			hexInfo.setBz5(Bz5);
			hexInfo.setYxq(Yxq);
			hexInfo.setEditDate(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
			hexInfo.setCanWriteTimes(canwritetimes1);
    	} */
    }

	

    
    
    	//设置路径，合成路径名
	StringBuffer path = new StringBuffer("");
	
	path.append(Path.ROOT_FTP);
	//path.append("ftproot");
	path.append("/");
	path.append("hexfile");
	path.append("/");
	path.append(hexInfo.getECUType());
	path.append("/");
	path.append(hexInfo.getSjljh());
	path.append("/");
	path.append(hexInfo.getVersion());
	//String path = sb.toString();
	HandleFolder.newDir(path.toString());
    //用合成的路径名，上传文件	
	su.save(path.toString(),SmartUpload.SAVE_PHYSICAL);
  //*****以上是存到本机目录****以下是上传到ftp**************************************  
    Ftpservice ftpservice = new Ftpservice();
    EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
	HashMap<String,Integer> hm = ebii.query1();
	Integer shangchuannaxiewenjian = new Integer(hm.get(hexInfo.getECUType()));
    boolean checkftp = false;
	 if(shangchuannaxiewenjian == 0){
    	checkftp=ftpservice.ToFtp(hexInfo.getECUType(), hexInfo.getSjljh(), hexInfo.getVersion(), hexInfo.getPfileName(), hexInfo.getKeyDataFileName(), hexInfo.getSBLFileName());
    }
    
    if(shangchuannaxiewenjian == 1 || shangchuannaxiewenjian == 3 || shangchuannaxiewenjian == 5){
    	checkftp=ftpservice.ToFtp(hexInfo.getECUType(), hexInfo.getSjljh(), hexInfo.getVersion(), hexInfo.getHEXFile(), null, null);
    }
    
    if(shangchuannaxiewenjian == 4){
    	checkftp=ftpservice.ToFtp(hexInfo.getECUType(), hexInfo.getSjljh(), hexInfo.getVersion(), hexInfo.getSREFileName(), null, null);
    } 
    //****若上传不成功**就不进行数据库操作***************************
    if(checkftp){
    	HexInfoDaoImpl hexInfoDaoImpl = new HexInfoDaoImpl();
    	boolean check = hexInfoDaoImpl.updateHexInfo(hexInfo);
        LogInfoDaoImpl lidi = new LogInfoDaoImpl();
    	lidi.addLogInfo(hexInfo.getEditDate(), "用户"+(String)session.getAttribute("username")+"修改HEX数据零件号"+hexInfo.getSjljh()+"_"+hexInfo.getVersion()+"成功");
        
    }
	

	if (checkftp) {//操作成功
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
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="com.seu.Global.*"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%@ page import="com.seu.beans.IniInfo"%>
<%
request.setCharacterEncoding("utf-8");//设置页面字符集
response.setCharacterEncoding("utf-8");
//DBO db=new DBO();//初始数据链接
/*
通知信息添加页面
*/
%>

<%
	//新建一个smartupload对象
	SmartUpload su = new SmartUpload();
	//上传初始化
	su.initialize(pageContext);//pageContext是JSP九大内置对象之一
	//设定允许上传的文件类型
	//su.setAllowedFilesList("hex");
	su.setContentDisposition(null);
	//下载文件
	//先组合路径字符串
	
	String ECUType1 = (String) request.getParameter("ecutype");
	String sjljh1 = (String) request.getParameter("sjljh");
	String inifile1 = (String) request.getParameter("inifile");
	
	String iniid1 = (String) request.getParameter("iniid");
	//对传来的参数“解码”。why?
	String iniid = new String( iniid1.getBytes("iso-8859-1"), "UTF-8");
	String sjljh= new String( sjljh1.getBytes("iso-8859-1"), "UTF-8"); 
	String ECUType= new String( ECUType1.getBytes("iso-8859-1"), "UTF-8"); 
	String inifile= new String( inifile1.getBytes("iso-8859-1"), "UTF-8"); 
	//String test = (String) request.getParameter("test");
	//System.out.println(test);
	//设置路径，合成路径名
	
	//累加下载次数
	IniInfoDaoImpl iidi = new IniInfoDaoImpl();
	IniInfo iniInfo = iidi.query(Integer.parseInt(iniid));
	iidi.addDownloadtimes(iniInfo);
	
	
	StringBuffer path = new StringBuffer("");
	path.append(Path.ROOT_FTP);
	//path.append("ftproot");
	path.append("/");
	path.append("inifile");
	path.append("/");
	path.append(ECUType);
	path.append("/");
	path.append(sjljh);
	System.out.println(sjljh1);
	path.append("/");
	path.append(inifile);
	//path.append(".ini");
	//String path = sb.toString();
    //用合成的路径名，上传文件	
   //System.out.println("hehe");
    System.out.println("下载路径："+path);
    
	
	LogInfoDaoImpl lidi = new LogInfoDaoImpl();
    lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"下载INI文件"+ inifile +"成功");
      
	
	//su.save(path.toString(),SmartUpload.SAVE_PHYSICAL);
	su.downloadFile(path.toString());
	
	boolean check=true;
	if (check) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='HexPfile.jsp'");
		out.println("</script>");
	} else {//操作失败
		out.println("<script>");
		out.println("alert('操作失败');");
		out.println("window.location='HexPfile.jsp'");
		out.println("</script>");
	}
	out.clear();
    out = pageContext.pushBody();
%>
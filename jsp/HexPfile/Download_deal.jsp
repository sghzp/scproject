<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.beans.Util1"%>
<%@ page import="com.seu.ioutils.FileToZip"%>
<%@ page import="com.seu.Global.*"%>
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
	String HEXID1 = (String)request.getParameter("HEXID");
	String HEXID= new String(HEXID1.getBytes("iso-8859-1"), "UTF-8"); 
	int hexid = Integer.parseInt(HEXID);
	System.out.println(hexid);
	String whichfile1 = (String)request.getParameter("whichfile");
	String whichfile2= new String( whichfile1.getBytes("iso-8859-1"), "UTF-8"); 
	int check = Integer.parseInt(whichfile2);
	
	//System.out.println(hexid + check);
	HexInfoDaoImpl hidi = new HexInfoDaoImpl();
	HexInfo hi = hidi.query(hexid);
	hidi.addDownloadtimes(hi);//下载次数的递增
	
	/* String ECUType1 = (String) request.getParameter("ecutype");
	String sjljh1 = (String) request.getParameter("sjljh");
	String Version1 = (String) request.getParameter("version");
	String hexname1 = (String) request.getParameter("hexname");
	
	//对传来的参数“解码”。why?
	String Version= new String( Version1.getBytes("iso-8859-1"), "UTF-8"); 
	String sjljh= new String( sjljh1.getBytes("iso-8859-1"), "UTF-8"); 
	String ECUType= new String( ECUType1.getBytes("iso-8859-1"), "UTF-8"); 
	String hexname= new String( hexname1.getBytes("iso-8859-1"), "UTF-8");  */
	//String test = (String) request.getParameter("test");
	//System.out.println(test);
	//设置路径，合成路径名
	StringBuffer path = new StringBuffer("");
	path.append(Path.ROOT_FTP);
	//path.append("ftproot");
	path.append("/");
	path.append("hexfile");
	path.append("/");
	path.append(hi.getECUType());
	path.append("/");
	path.append(hi.getSjljh());
	path.append("/");
	path.append(hi.getVersion());
	path.append("/");
	
	//对下载不了的情况做 异常捕获。
	
	
	
	try{
	
			//用一个bean判断是下哪些文件？返回几个值。
			if(check == 1){
				//下hex文件
			
			path.append(hi.getHEXFile());
			//String path = sb.toString();
		    //用合成的路径名，上传文件	
		    System.out.println("下载路径："+path);   
			//su.save(path.toString(),SmartUpload.SAVE_PHYSICAL);
			
			LogInfoDaoImpl lidi = new LogInfoDaoImpl();
    		lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"下载HexFile文件"+ hi.getHEXFile() +"成功");
        
			
			su.downloadFile(path.toString());
			}
			if(check == 2){
				//下三个文件(pfile、key、sbl)
				path.append(hi.getPfileName());
				
				LogInfoDaoImpl lidi = new LogInfoDaoImpl();
    			lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"下载PFile文件"+ hi.getPfileName() +"成功");
        
				
				su.downloadFile(path.toString());
				
				
			}
			if(check ==3){
				path.append(hi.getKeyDataFileName());
				
				LogInfoDaoImpl lidi = new LogInfoDaoImpl();
    			lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"下载KeyDataFile文件"+ hi.getKeyDataFileName() +"成功");
        
				
				su.downloadFile(path.toString());
			}
			if(check ==4){
				path.append(hi.getSBLFileName());
				
				LogInfoDaoImpl lidi = new LogInfoDaoImpl();
    			lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"下载SBLFile文件"+ hi.getSBLFileName() +"成功");
        
				
				su.downloadFile(path.toString());
			}
			
			if(check == 5){
				//下sre文件
				
				path.append(hi.getSREFileName());
				
				LogInfoDaoImpl lidi = new LogInfoDaoImpl();
    			lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"下载SREFile文件"+ hi.getSREFileName() +"成功");
        
				
				System.out.println("下载路径："+path);   
				su.downloadFile(path.toString());
			}

		}catch(Exception e){
			
			out.println("<script>");
			out.println("alert('文件不存在，请联系管理员！');");
			out.println("history.go(-1)");
			out.println("</script>");
			out = pageContext.pushBody();
		}	












	
	boolean check1=true;
	if (check1) {//操作成功
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
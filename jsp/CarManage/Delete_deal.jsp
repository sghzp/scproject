<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.seu.ioutils.HandleFolder"%>
<%@ page import="com.seu.beans.IniInfo"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
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
	
	String ECUType1 = (String) request.getParameter("ecutype");
	String sjljh1 = (String) request.getParameter("sjljh");
	String inifile1 = (String) request.getParameter("inifile");
	String iniid1 = (String) request.getParameter("iniid");
	String ecuorder1 = (String) request.getParameter("ecuorder");
	String sbm1 = (String) request.getParameter("sbm");
	//对传来的参数“解码”。why?
	String sjljh= new String( sjljh1.getBytes("iso-8859-1"), "UTF-8"); 
	String ECUType= new String( ECUType1.getBytes("iso-8859-1"), "UTF-8"); 
	String inifile= new String( inifile1.getBytes("iso-8859-1"), "UTF-8"); 
	String iniid= new String( iniid1.getBytes("iso-8859-1"), "UTF-8");
	String ecuorder= new String( ecuorder1.getBytes("iso-8859-1"), "UTF-8");
	String sbm= new String( sbm1.getBytes("iso-8859-1"), "UTF-8");
	
	LogInfoDaoImpl lidi = new LogInfoDaoImpl();
	lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"删除INI订货号"+ecuorder+"_"+sbm+"成功");
	
	int iniid_int = Integer.parseInt(iniid);
	
	
	
	//设置路径，合成路径名
	StringBuffer path = new StringBuffer("");
	path.append(Path.ROOT_FTP);
	//path.append("ftproot");
	path.append("/");
	path.append("inifile");
	path.append("/");
	path.append(ECUType);
	path.append("/");
	path.append(sjljh);
	path.append("/");
	path.append(inifile);
	path.append(".ini");
	//String path = sb.toString();
    //用合成的路径名，上传文件	
   //System.out.println("hehe");
    System.out.println("删除路径："+path);
    
    
    //要求不删除相关文件了
	/* HandleFolder.removeFile(path.toString()); */
	
	
	
	//删除数据库中的数据
	IniInfoDaoImpl iidi = new IniInfoDaoImpl();
	//iidi.delete(iniid_int);
	//删除数据改为 修改状态
	iidi.changestateTo4(iniid_int);
	
	IniInfo ii = iidi.query(iniid_int);
	ii.setXgr((String)session.getAttribute("username"));
	ii.setEditDate(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
	iidi.updateIniInfo(ii);
	
	boolean check=true;
	if (check) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='CarManage.jsp'");
		out.println("</script>");
	} else {//操作失败
		out.println("<script>");
		out.println("alert('操作失败');");
		out.println("window.location='CarManage.jsp'");
		out.println("</script>");
	}
	out.flush();

%>
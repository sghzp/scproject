<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.seu.ioutils.HandleFolder"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
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
	String hexid1 = (String) request.getParameter("HEXID");
	
	//对传来的参数“解码”。why?
	String ECUType= new String( ECUType1.getBytes("iso-8859-1"), "UTF-8"); 
	String hexid= new String( hexid1.getBytes("iso-8859-1"), "UTF-8");
	int hexid_int = Integer.parseInt(hexid);
	HexInfoDaoImpl hidi = new HexInfoDaoImpl();
	HexInfo hi = hidi.query(hexid_int);
	
	hi.setEditDate(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
	
	hidi.updateHexInfo(hi);
	
	LogInfoDaoImpl lidi = new LogInfoDaoImpl();
	lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"删除HEX数据零件号"+hi.getSjljh()+"成功");
	
	
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
	System.out.println("删除路径："+path);
	//String path = sb.toString();
    //用合成的路径名，上传文件	
   //System.out.println("hehe");
  
  /*  //又不删除文件了，改为修改状态了
   if(hi.getHEXFile()!=null || hi.getHEXFile()!="null"){
   		HandleFolder.removeFile(path.toString()+"/"+hi.getHEXFile());
   }
   if(hi.getPfileName()!=null || hi.getPfileName()!="null"){
   		HandleFolder.removeFile(path.toString()+"/"+hi.getPfileName());
   }
   if(hi.getKeyDataFileName()!=null || hi.getKeyDataFileName()!="null"){
   		HandleFolder.removeFile(path.toString()+"/"+hi.getKeyDataFileName());
   }
   if(hi.getSBLFileName()!=null || hi.getSBLFileName()!="null"){
   		HandleFolder.removeFile(path.toString()+"/"+hi.getSBLFileName());
   }
   if(hi.getSREFileName()!=null || hi.getSREFileName()!="null"){
   		HandleFolder.removeFile(path.toString()+"/"+hi.getSREFileName());
   } */
   
    
    
	
	
	//删除数据库中的数据
	//hidi.delete(hexid_int);
	
	//变为修改状态了
	hidi.changestateTo4(hexid_int);
	
	
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
	out.flush();
    
%>
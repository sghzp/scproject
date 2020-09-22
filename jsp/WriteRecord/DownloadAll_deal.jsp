<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.dao.impl.HexInfoDaoImpl"%>
<%@ page import="com.seu.beans.IniInfo"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="com.seu.beans.HexInfo"%>
<%@ page import="com.seu.beans.Util1"%>
<%@ page import="com.seu.ioutils.HandleFolder"%>
<%@ page import="com.seu.ioutils.FileToZip"%>
<%@ page import="java.io.File"%>
<%@ page import="com.seu.Global.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	String ecuorder1 = (String) request.getParameter("ecuorder");
	String sbm1 = (String) request.getParameter("sbm");
	String ECUType1 = (String) request.getParameter("ecutype");
	String sjljh1 = (String) request.getParameter("sjljh");
	String inifile1 = (String) request.getParameter("inifile");
	String version1 = (String) request.getParameter("version");
	
	//对传来的参数“解码”。why?
	String sbm =  new String( sbm1.getBytes("iso-8859-1"), "UTF-8");
	String ecuorder =  new String( ecuorder1.getBytes("iso-8859-1"), "UTF-8");
	String sjljh= new String( sjljh1.getBytes("iso-8859-1"), "UTF-8"); 
	String ECUType= new String( ECUType1.getBytes("iso-8859-1"), "UTF-8"); 
	String inifile= new String( inifile1.getBytes("iso-8859-1"), "UTF-8"); 
	String version= new String( version1.getBytes("iso-8859-1"), "UTF-8"); 
	//String test = (String) request.getParameter("test");
	//System.out.println(test);
	//设置路径，合成路径名
	 
	//累加下载次数
	IniInfoDaoImpl iidi = new IniInfoDaoImpl();
	IniInfo iniInfo = iidi.queryby_ecuorder_sbm(ecuorder, sbm);
	iidi.addDownloadtimes(iniInfo);
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		
	HexInfoDaoImpl hidi = new HexInfoDaoImpl();
	ArrayList<HexInfo> hexInfos = null;
	String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and version="+"'"+version+"'";
	hexInfos = hidi.query(sql);
	String whichfile = null;
	if(hexInfos.size() != 0){
		int hexid = hexInfos.get(0).getHEXID();
		//累加下载次数
		HexInfo hi = hidi.query(hexid);
		hidi.addDownloadtimes(hi);
		int check = Util1.WhichToDownload(hi.getECUType());
		
		StringBuffer pathofhex = new StringBuffer("");
		pathofhex.append(Path.ROOT_FTP);
		//pathofhex.append("ftproot");
		pathofhex.append("/");
		pathofhex.append("hexfile");
		pathofhex.append("/");
		pathofhex.append(hi.getECUType());
		pathofhex.append("/");
		pathofhex.append(hi.getSjljh());
		pathofhex.append("/");
		pathofhex.append(hi.getVersion());
		//pathofhex.append("/");
		
		
		
		
		
		StringBuffer pathofini = new StringBuffer("");
		pathofini.append(Path.ROOT_FTP);
		//pathofini.append("ftproot");
		pathofini.append("/");
		pathofini.append("inifile");
		pathofini.append("/");
		pathofini.append(ECUType);
		pathofini.append("/");
		pathofini.append(sjljh);
		pathofini.append("/");
		pathofini.append(inifile);
	//path.append(".ini");
	//String path = sb.toString();
    //用合成的路径名，上传文件	
   //System.out.println("hehe");
    //System.out.println("下载路径："+path);
    
	//su.save(path.toString(),SmartUpload.SAVE_PHYSICAL);
	
	HandleFolder.cleanDir(new File(Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp"));
	
	
	if(hi.getPfileName()!=null && !("".equals(hi.getPfileName())) && !"null".equals(hi.getPfileName())){
		System.out.println(hi.getPfileName());
			HandleFolder.copy1(pathofhex.toString()+"/"+hi.getPfileName(),Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp/"+hi.getPfileName());
	}
	if(hi.getKeyDataFileName()!=null && !("".equals(hi.getKeyDataFileName())) && !"null".equals(hi.getKeyDataFileName())){
			HandleFolder.copy1(pathofhex.toString()+"/"+hi.getKeyDataFileName(),Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp/"+hi.getKeyDataFileName());
	}
	if(hi.getSBLFileName()!=null && !("".equals(hi.getSBLFileName())) && !"null".equals(hi.getSBLFileName())){
			HandleFolder.copy1(pathofhex.toString()+"/"+hi.getSBLFileName(),Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp/"+hi.getSBLFileName());
	}
	if(hi.getHEXFile()!=null && !("".equals(hi.getHEXFile())) && !"null".equals(hi.getHEXFile())){
			HandleFolder.copy1(pathofhex.toString()+"/"+hi.getHEXFile(),Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp/"+hi.getHEXFile());
	}
	if(hi.getSREFileName()!=null && !("".equals(hi.getSREFileName())) && !"null".equals(hi.getSREFileName())){
			HandleFolder.copy1(pathofhex.toString()+"/"+hi.getSREFileName(),Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp/"+hi.getSREFileName());
	}
	
	//HandleFolder.copy(pathofhex.toString()+"/"+hi.getPfileName(),"d:/eol/initmp/"+hi.getPfileName());
	//HandleFolder.copy(pathofhex.toString()+"/"+hi.getKeyDataFileName(),"d:/eol/initmp/"+hi.getKeyDataFileName());
	//HandleFolder.copy(pathofhex.toString()+"/"+hi.getSBLFileName(),"d:/eol/initmp/"+hi.getSBLFileName());
	
	
	
	
	
	
	
	HandleFolder.copy1(pathofini.toString(),Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp/"+inifile);
	
	//HandleFolder.copy1("f:/t.txt","d:/eol/initmp/"+"t.txt");
	
	FileToZip.fileToZip(Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp",Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp",ecuorder+"_"+sbm);
	
	LogInfoDaoImpl lidi = new LogInfoDaoImpl();
    lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"打包下载订货号"+ ecuorder+"_"+sbm +"文件成功");
        
	
	su.downloadFile(Path.ROOT_EOL+"/"+ session.getAttribute("bh")+"/initmp"+"/"+ecuorder+"_"+sbm+".zip");
	
	
	
	boolean check3=true;
	if (check3) {//操作成功
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
		
		
		
		
		}else{
		%>
			<script>
			 alert('不存在可下载的Hex文件！')
			 window.location.href="<%=basePath%>/jsp/WriteRecord/WriteRecord.jsp";
			 </script>
		<%	
		}
		
	
	
	
	
	
	
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
%>
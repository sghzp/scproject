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
	String iniid1 = (String) request.getParameter("iniid");
	
	//对传来的参数“解码”。why?
	String sbm =  new String( sbm1.getBytes("iso-8859-1"), "UTF-8");
	String ecuorder =  new String( ecuorder1.getBytes("iso-8859-1"), "UTF-8");
	String sjljh= new String( sjljh1.getBytes("iso-8859-1"), "UTF-8"); 
	String ECUType= new String( ECUType1.getBytes("iso-8859-1"), "UTF-8"); 
	String inifile= new String( inifile1.getBytes("iso-8859-1"), "UTF-8"); 
	String iniid= new String( iniid1.getBytes("iso-8859-1"), "UTF-8"); 
	String version = (String) request.getParameter("version");
	//String test = (String) request.getParameter("test");
	//System.out.println(test);
	//设置路径，合成路径名
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	IniInfoDaoImpl iidi = new IniInfoDaoImpl();
	IniInfo iniInfo = iidi.query(Integer.parseInt(iniid));
	iidi.addDownloadtimes(iniInfo);
	
		
	HexInfoDaoImpl hidi = new HexInfoDaoImpl();
	/* ArrayList<HexInfo> hexInfos = null;
	String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state=0 and shzt='已审核'";
	hexInfos = hidi.query(sql);
	
	//后续改为，若不存在正常状态的文件，则找临时状态的文件，若有多个临时状态的文件，
	//则弹出对话框让用户选择打包的数据零件号的版本，选择完毕后再打包  
	String sql2 = "select * from HEXINFO where sjljh="+"'"+sjljh+"'"+" and state=1 and shzt='已审核'";
	ArrayList<HexInfo> hexInfos2 = null;
	hexInfos2 = hidi.query(sql2); */ 
	
	
	String whichfile = null;
	//System.out.println("识别码："+sbm+"  订货号："+ecuorder+"   数据零件号："+sjljh+
		//"   版本号："+version+"  iniID:"+iniid+"  inifile:"+inifile +"   ecutype:"+ ECUType);
	if(true){
		HexInfo hi = hidi.queryby_sjljh_version(sjljh, version);
		//累加下载次数
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
	
	try{
		
	
	
			HandleFolder.cleanDir(new File(Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp"));
			
			System.out.println("我是新路径："+Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp");
			if(hi.getPfileName()!=null && !("".equals(hi.getPfileName())) && !"null".equals(hi.getPfileName())){
				System.out.println(hi.getPfileName());
					HandleFolder.copy1(pathofhex.toString()+"/"+hi.getPfileName(),Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp/"+hi.getPfileName());
			}
			if(hi.getKeyDataFileName()!=null && !("".equals(hi.getKeyDataFileName())) && !"null".equals(hi.getKeyDataFileName())){
					HandleFolder.copy1(pathofhex.toString()+"/"+hi.getKeyDataFileName(),Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp/"+hi.getKeyDataFileName());
			}
			if(hi.getSBLFileName()!=null && !("".equals(hi.getSBLFileName())) && !"null".equals(hi.getSBLFileName())){
					HandleFolder.copy1(pathofhex.toString()+"/"+hi.getSBLFileName(),Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp/"+hi.getSBLFileName());
			}
			if(hi.getHEXFile()!=null && !("".equals(hi.getHEXFile())) && !"null".equals(hi.getHEXFile())){
					HandleFolder.copy1(pathofhex.toString()+"/"+hi.getHEXFile(),Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp/"+hi.getHEXFile());
			}
			if(hi.getSREFileName()!=null && !("".equals(hi.getSREFileName())) && !"null".equals(hi.getSREFileName())){
					HandleFolder.copy1(pathofhex.toString()+"/"+hi.getSREFileName(),Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp/"+hi.getSREFileName());
			}
			
			//HandleFolder.copy(pathofhex.toString()+"/"+hi.getPfileName(),"d:/eol/initmp/"+hi.getPfileName());
			//HandleFolder.copy(pathofhex.toString()+"/"+hi.getKeyDataFileName(),"d:/eol/initmp/"+hi.getKeyDataFileName());
			//HandleFolder.copy(pathofhex.toString()+"/"+hi.getSBLFileName(),"d:/eol/initmp/"+hi.getSBLFileName());
			
			
			
			
			
			
			
			HandleFolder.copy1(pathofini.toString(),Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp/"+inifile);
			
			//HandleFolder.copy1("f:/t.txt","d:/eol/initmp/"+"t.txt");
			
			FileToZip.fileToZip(Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp",Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp",ecuorder+"_"+sbm);
			
			LogInfoDaoImpl lidi = new LogInfoDaoImpl();
		    lidi.addLogInfo(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()), "用户"+(String)session.getAttribute("username")+"打包下载订货号"+ ecuorder +"_"+sbm+"文件成功");
		        
			
			su.downloadFile(Path.ROOT_EOL+"/"+session.getAttribute("bh")+"/initmp"+"/"+ecuorder+"_"+sbm+".zip");
	}catch(Exception e){
			out.println("<script>");
			out.println("alert('文件不存在，请联系管理员！');");
			out.println("window.location.href="+"\""+basePath+"/jsp/CarManage/CarManage.jsp"+"\"");
			out.println("</script>");
			out = pageContext.pushBody();
	}	//这里如果出问题，去看看秦老师办公室的那个版本	
	
	
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
				<%-- <script>
					 alert('不存在正常状态的数据零件号文件！')
					 window.location.href="<%=basePath%>/jsp/CarManage/CarManage.jsp";
				 </script> --%>
			<%	
		}
		
	
	
	
	
	
	
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
%>
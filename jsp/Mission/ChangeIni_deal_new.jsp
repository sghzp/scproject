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
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.util.List"%>
<%@ page import="com.seu.beans.IniInfo"%>
<%@ page import="com.seu.dao.impl.IniInfoDaoImpl"%>
<%
	String num = null;
	String sqr = (String)session.getAttribute("username");
	String sqrgh = (String)session.getAttribute("bh");
	String sjljh= null;
	String version= null;
	String oristate= null;
	String dststate= null;
	String sqsm= null;
	String bz = null;
	String bz1 = null;
	String bz2 = null;
	String bz3 = "";
	String bz4 = "";
	String bz5 = "";
	String clrgh = null;
	String clr = null;
	String fj1 = null;
	String fj2 = null;
	String fj3 = null;
	

                //消息提示
                String message = "";
                try{
                    //使用Apache文件上传组件处理文件上传步骤：
                    //1、创建一个DiskFileItemFactory工厂
                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    //2、创建一个文件上传解析器
                    ServletFileUpload upload = new ServletFileUpload(factory);
                     //解决上传文件名的中文乱码
                    upload.setHeaderEncoding("UTF-8"); 
                    //3、判断提交上来的数据是否是上传表单的数据
                    if(!ServletFileUpload.isMultipartContent(request)){
                        //按照传统方式获取数据
                        return;
                    }
                    //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
                    List<FileItem> list = upload.parseRequest(request);
                    for(FileItem item : list){
                        //如果fileitem中封装的是普通输入项的数据
                        if(item.isFormField()){
                            String name = item.getFieldName();
                            //解决普通输入项的数据的中文乱码问题
                            String value = item.getString("UTF-8");
                            //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                            System.out.println(name + "=" + value);
                            if("num".equals(name)){
                            	num = value;
                            }

                            if("sjljh".equals(name)){
                            	sjljh = value;
                            }
                            if("version".equals(name)){
                            	version = value;
                            }
                            if("oristate".equals(name)){
                            	oristate = value;
                            }
                            if("dststate".equals(name)){
                            	dststate = value;
                            }
                            
                            if("sqsm".equals(name)){
                            	sqsm = value;
                            }
                            if("bz".equals(name)){
                            	bz = value;
                            }
                            if("bz1".equals(name)){
                            	bz1 = value;
                            }
                            if("bz2".equals(name)){
                            	bz2 = value;
                            }
 
                            if("clrgh".equals(name)){
                            	clrgh = value;
                            }
                            if("clr".equals(name)){
                            	clr = value;
                            }
                            if("fj1".equals(name)){
                            	fj1 = value;
                            }
                            if("fj2".equals(name)){
                            	fj2 = value;
                            }
                            if("fj3".equals(name)){
                            	fj3 = value;
                            }
                            
                        }
                        }
                        /*************************保存路径生成*********************************/
					                        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
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
					                File file = new File(path.toString());
					                //判断上传文件的保存目录是否存在
					                if (!file.exists() && !file.isDirectory()) {
					                    System.out.println(path.toString()+"目录不存在，需要创建");
					                    //创建目录
					                    file.mkdir();
					                }
					                
					                
					                
					                
					                
                        for(FileItem item : list){
                        //如果fileitem中封装的不是普通输入项的数据
                        if(!item.isFormField()){//如果fileitem中封装的是上传文件
                            //得到上传的文件名称，
                            String filename = item.getName();
                            System.out.println(filename);
                            if(filename==null || filename.trim().equals("")){
                                continue;
                            }
                            //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                            //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                            filename = filename.substring(filename.lastIndexOf("\\")+1);
                            //获取item中的上传文件的输入流
                            InputStream in = item.getInputStream();
                            //创建一个文件输出流
                            FileOutputStream outFile = new FileOutputStream(path.toString() + "\\" + filename);
                            //创建一个缓冲区
                            byte buffer[] = new byte[1024];
                            //判断输入流中的数据是否已经读完的标识
                            int len = 0;
                            //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                            while((len=in.read(buffer))>0){
                                //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                                outFile.write(buffer, 0, len);
                            }
                            //关闭输入流
                            in.close();
                            //关闭输出流
                            outFile.close();
                            //删除处理文件上传时生成的临时文件
                            item.delete();
                            message = "文件上传成功！";
                        }
                    }
                }catch (Exception e) {
                    message= "文件上传失败！";
                    e.printStackTrace();
                    
                }
		String style = "1";//0为数据零件号，1为整车信息申请、、 int的
		String sqrq = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		String clzt = "0";//0为待处理，1为处理完毕  ,2为驳回状态 int 
		String clzk = "申请待处理-"+sqsm+"-"+sqr+"-"+num+"-"+" ";




















/* 

	
	Connection conn = JdbcUtils.getConnection();
	request.setCharacterEncoding("utf-8");//设置字符集
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
	num = URLDecoder.decode(num,"utf-8");
System.out.println(num + "8888888888888888888");
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
	clr = URLDecoder.decode(clr,"utf-8");
System.out.println(clr + "********************");
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
	 */
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
	
	//****************下面是改变原hexinfo状态*******
	IniInfoDaoImpl iidi = new IniInfoDaoImpl();
	IniInfo iniInfo = iidi.queryby_ecuorder_sbm(mesInfo.getSjljh(), mesInfo.getVersion());
	iniInfo.setBz3("1");//在流程中了！
	iidi.updateIniInfo(iniInfo);
	
	
	//******************下面是发邮件的代码******
	UserInfoDaoImpl uidi = new UserInfoDaoImpl();
	UserInfo userInfo = uidi.query(mesInfo.getClrgh());
	
	//换为多线程
	Thread t = new Thread(new MailThread(userInfo.getMail(),"您有待处理事项-订货号为"+mesInfo.getSjljh()+"-识别码为"+mesInfo.getVersion(),"订货号为"+mesInfo.getSjljh()+",识别码为"+mesInfo.getVersion()+",请登录以下网址进行处理。"));
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
		out.println("window.location='../CarManage/CarManage.jsp'");
		out.println("</script>");
	} else {//操作失败
			out.println("<script>");
			out.println("alert('申请失败');");
			out.println("history.go(-1)");
			//out.println("window.location='HexPfile.jsp'");
			out.println("</script>");
	}
	
%>
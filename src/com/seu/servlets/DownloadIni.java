package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.seu.Global.Path;
import com.seu.beans.IniInfo;
import com.seu.dao.impl.IniInfoDaoImpl;

public class DownloadIni extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println("进来了,get请求");
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		System.out.println("hello DownloadIni!");
		
		SmartUpload su = new SmartUpload();
		//上传初始化
		su.initialize(getServletConfig(), request, response);//pageContext是JSP九大内置对象之一
		//设定允许上传的文件类型
		//su.setAllowedFilesList("hex");
		su.setContentDisposition(null);
		//下载文件
		//先组合路径字符串
		
		String ECUType1 = (String) request.getParameter("ecutype");
		String sjljh1 = (String) request.getParameter("sjljh");
		String inifile1 = (String) request.getParameter("inifile");
		
		//对传来的参数“解码”。why?
		String sjljh= new String( sjljh1.getBytes("iso-8859-1"), "UTF-8"); 
		String ECUType= new String( ECUType1.getBytes("iso-8859-1"), "UTF-8"); 
		String inifile= new String( inifile1.getBytes("iso-8859-1"), "UTF-8"); 
		
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
		//path.append(".ini");
		//String path = sb.toString();
	    //用合成的路径名，上传文件	
	    System.out.println("下载路径："+path);
	    
		//su.save(path.toString(),SmartUpload.SAVE_PHYSICAL);
		try {
			su.downloadFile(path.toString());
		} catch (SmartUploadException e) {
			System.err.println("下载ini文件失败！");
			e.printStackTrace();
		}
		
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
		//System.out.println(version.length());
		//System.out.println(ecutype+"***"+sjljh+"***"+state+"***"+wtdbgdbh+"***"+hclcj+"***"+version);
		out.flush();
		out.close();
			
	}
	
	
	
}

package com.seu.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.seu.Global.Path;
import com.seu.ioutils.HandleFolder;
import com.seu.service.Loginservice;

public class CeshiLogin extends HttpServlet {
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
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		System.out.println("用户登录服务");

		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");

		System.out.println("测试用户名：" + username);
		System.out.println("测试密码：" + password);

		if("16844".equals(username) && "16844".equals(password)){
			
			File file = new File(Path.ROOT_EOL+"/"+"16844");
			if(file.exists()){
				System.out.println("曾经登录过，已创建好了打包下载的文件夹");
			}else{
				HandleFolder.newDir(Path.ROOT_EOL+"/"+"16844" +"/hextmp");
				HandleFolder.newDir(Path.ROOT_EOL+"/"+"16844" +"/initmp");
			}
			
			
			session.setAttribute("bh", "16844");
			session.setAttribute("username", "翁伟东");
			session.setAttribute("password", password);
			/**
			 * 1000000:全部权限    1000100:上传和修改权限    1000010:审核权限     1000001:查询权限
			 */
			session.setAttribute("right", "1000000");// 设置权限
		}
		else if("17503".equals(username) && "17503".equals(password)){
			
			File file = new File(Path.ROOT_EOL+"/"+"17503");
			if(file.exists()){
				System.out.println("曾经登录过，已创建好了打包下载的文件夹");
			}else{
				HandleFolder.newDir(Path.ROOT_EOL+"/"+"17503" +"/hextmp");
				HandleFolder.newDir(Path.ROOT_EOL+"/"+"17503" +"/initmp");
			}			
			
			
			
			session.setAttribute("bh", "17503");
			session.setAttribute("username", "汪荣会");
			session.setAttribute("password", password);
			/**
			 * 1000000:全部权限    1000100:上传和修改权限    1000010:审核权限     1000001:查询权限
			 */
			session.setAttribute("right", "1000000");// 设置权限
		}
		else if("super".equals(username) && "super".equals(password)){
			
			File file = new File(Path.ROOT_EOL+"/"+"superbh");
			if(file.exists()){
				System.out.println("曾经登录过，已创建好了打包下载的文件夹");
			}else{
				HandleFolder.newDir(Path.ROOT_EOL+"/"+"superbh" +"/hextmp");
				HandleFolder.newDir(Path.ROOT_EOL+"/"+"superbh" +"/initmp");
			}
			
			
			
			session.setAttribute("bh", "superbh");
			session.setAttribute("username", "super");
			session.setAttribute("password", password);
			/**
			 * 1000000:全部权限    1000100:上传和修改权限    1000010:审核权限     1000001:查询权限
			 */
			session.setAttribute("right", "1000000");// 设置权限
		}else{
			out.println("<script>");
			out.println("alert('用户名和密码相同：super---super,17503---17503,16844---16844');");
			out.println("window.location='login.jsp'");
			out.println("</script>");
		}
				
				
				
		out.println("<script>");
				//out.println("alert('登录成功！');");
		out.println("window.location='index.jsp'");
		out.println("</script>");


		// out.write(jsonArray.toString());
		out.flush();
		out.close();

	}



}

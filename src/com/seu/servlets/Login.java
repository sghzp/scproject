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

public class Login extends HttpServlet {
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
		Map<String, String> loginmap = null;
		PrintWriter out = response.getWriter();
		System.out.println("用户登录服务");

		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");

		System.out.println("用户名：" + username);
		System.out.println("密码：" + password);

		Loginservice loginservice = new Loginservice();
		loginservice.write(username, password);// 先把用户登录填入的信息写入login.ini以供UserWebservice.exe读取。
		//确定是否是管理员。
		if((username.equals("super") && password.equals("super"))) {
			loginmap = loginservice.manager();//管理员身份登录
		}
		else if( username.equals("16844") ){
			loginmap = loginservice.login16844();//管理员身份登录
		}
		else{
			loginmap = loginservice.checking();//再调用UserWebservice.exe做判断，将判断结果写入到一个map中。
		}
		

		if (!loginmap.isEmpty()) {
			// *****根据返回的map做登录后的判断***************
			for (String name : loginmap.keySet()) {
				System.out.println(name + "=" + loginmap.get(name));
			}

			// *****根据返回的map做登录后的判断****************

			//String check = panduanquanxian(loginmap.get("YHGN"));

			//System.out.println("权限：" + check);

			if (loginmap.get("YHDLJG").equals("0")) {

				session.setAttribute("password", password);
				session.setAttribute("bh", loginmap.get("YHBH"));
				session.setAttribute("username", loginmap.get("YHMC"));
				//session.setAttribute("bh", "16844");
				//session.setAttribute("username", "翁伟东");
				//session.setAttribute("bh", "17503");
				//session.setAttribute("username", "汪荣会");
				
				/**
				 * 1000000:全部权限    1000100:上传和修改权限    1000010:审核权限     1000001:查询权限
				 */
				session.setAttribute("right", loginmap.get("YHGN"));// 设置权限
				//session.setAttribute("right", "0000000");//测试用
				
				
				File file = new File(Path.ROOT_EOL+"/"+loginmap.get("YHBH"));
				if(file.exists()){
					System.out.println("曾经登录过，已创建好了打包下载的文件夹");
				}else{
					HandleFolder.newDir(Path.ROOT_EOL+"/"+loginmap.get("YHBH") +"/hextmp");
					HandleFolder.newDir(Path.ROOT_EOL+"/"+loginmap.get("YHBH") +"/initmp");
				}
				
				
				
				
				out.println("<script>");
				//out.println("alert('登录成功！');");
				out.println("window.location='index.jsp'");
				out.println("</script>");

			} else if (loginmap.get("YHDLJG").equals("1")) {
				out.println("<script>");
				out.println("alert('用户编号错误');");
				out.println("window.location='login.jsp'");
				out.println("</script>");
			} else if (loginmap.get("YHDLJG").equals("2")) {
				out.println("<script>");
				out.println("alert('用户已停用');");
				out.println("window.location='login.jsp'");
				out.println("</script>");
			} else if (loginmap.get("YHDLJG").equals("3")) {
				out.println("<script>");
				out.println("alert('用户已锁定');");
				out.println("window.location='login.jsp'");
				out.println("</script>");
			} else if (loginmap.get("YHDLJG").equals("4")) {
				
				session.setAttribute("password", password);
				
				session.setAttribute("username", loginmap.get("YHMC"));
				/**
				 * 1000000:全部权限    1000100:上传和修改权限    1000010:审核权限     1000001:查询权限
				 */
				session.setAttribute("right", loginmap.get("YHGN"));// 设置权限
				//session.setAttribute("right", "0000000");//测试用
				session.setAttribute("bh", loginmap.get("YHBH"));
				
				File file = new File(Path.ROOT_EOL+"/"+loginmap.get("YHBH"));
				if(file.exists()){
					System.out.println("曾经登录过，已创建好了打包下载的文件夹");
				}else{
					HandleFolder.newDir(Path.ROOT_EOL+"/"+loginmap.get("YHBH") +"/hextmp");
					HandleFolder.newDir(Path.ROOT_EOL+"/"+loginmap.get("YHBH") +"/initmp");
				}
				
				
				
				out.println("<script>");
				out.println("alert('最后一次修改口令超过80天未超过90天');");
				out.println("window.location='index.jsp'");
				out.println("</script>");
			} else if (loginmap.get("YHDLJG").equals("5")) {
                session.setAttribute("password", password);
				
				session.setAttribute("username", loginmap.get("YHMC"));
				
				session.setAttribute("right", loginmap.get("YHGN"));// 设置权限
			
				session.setAttribute("bh", loginmap.get("YHBH"));
				out.println("<script>");
				out.println("alert('最后一次修改口令超过90天');");
				out.println("window.location='jieguo4yaoxiugaimima.jsp'");
				out.println("</script>");
			} else if (loginmap.get("YHDLJG").equals("6")) {
				out.println("<script>");
				out.println("alert('口令错误');");
				out.println("window.location='login.jsp'");
				out.println("</script>");
			}
			
			else if (loginmap.get("YHDLJG").equals("")) {
				out.println("<script>");
				out.println("alert('WebService没有返回登录信息');");
				out.println("window.location='login.jsp'");
				out.println("</script>");
			}
			
		} else if (loginmap.isEmpty()) {
			out.println("<script>");
			out.println("alert('WebService未响应，请重试');");
			out.println("window.location='login.jsp'");
			out.println("</script>");
		}

		// out.write(jsonArray.toString());
		out.flush();
		out.close();

	}

/*	private String panduanquanxian(String YHGN) {
		char[] yhgn = YHGN.toCharArray();
		if (yhgn[0] == '0') {
			if (yhgn[4] == '1') {
				return "2";
			}
			if (yhgn[5] == '1') {
				return "3";
			}
			if (yhgn[6] == '1') {
				return "4";
			}
			return null;
		} else if (yhgn[0] == '1') {
			if (yhgn[4] == '1') {
				return "2";
			}
			if (yhgn[5] == '1') {
				return "3";
			}
			if (yhgn[6] == '1') {
				return "4";
			}
			return "1";
		}

		return null;
	}*/

	/*
	 * public static void main(String[] args){ System.out.println(new
	 * Login().panduanquanxian("0000000")); }
	 */

}

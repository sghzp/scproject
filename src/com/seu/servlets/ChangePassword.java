package com.seu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.seu.service.Changeservice;

public class ChangePassword extends HttpServlet {
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
		Map<String, String> changemap = null;
		PrintWriter out = response.getWriter();

		String old = (String) request.getParameter("old");
		String new_1 = (String) request.getParameter("new_1");
		//String new_2 =  (String) request.getParameter("new_2");

		Changeservice changeservice = new Changeservice();
		changeservice.write((String)session.getAttribute("bh"),(String)session.getAttribute("password"),old,new_1);// 先把用户填入的信息写入login.ini以供UserWebservice.exe读取。

		changemap = changeservice.checking();//再调用UserWebservice.exe做判断，将判断结果写入到一个map中。
		
		int check = 7;
		

		if (!changemap.isEmpty()) {
			// *****根据返回的map做登录后的判断***************
			for (String name : changemap.keySet()) {
				System.out.println(name + "=" + changemap.get(name));
			}

			// *****根据返回的map做登录后的判断****************

			//String check = panduanquanxian(loginmap.get("YHGN"));

			//System.out.println("权限：" + check);

			if (changemap.get("YHXGJG").equals("0")) {
				//先把新密码改了。防止他改了又改，造成没有更改成功的假象。
				session.setAttribute("password", new_1);
				check = 0;
				/*out.println("<script>");
				out.println("alert('登录成功！');");
				out.println("window.location='jsp/ChangePassword/ChangePassword.jsp'");
				out.println("</script>");*/

			} else if (changemap.get("YHXGJG").equals("1")) {
				check = 1;
				/*out.println("<script>");
				out.println("alert('未查询到该用户信息');");
				out.println("window.location='jsp/ChangePassword/ChangePassword.jsp'");
				out.println("</script>");*/
			} else if (changemap.get("YHXGJG").equals("2")) {
				check = 2;
				/*out.println("<script>");
				out.println("alert('新密码在前次已经使用过');");
				out.println("window.location='jsp/ChangePassword/ChangePassword.jsp'");
				out.println("</script>");*/
			} else if (changemap.get("YHXGJG").equals("3")) {
				check = 3;
				/*out.println("<script>");
				out.println("alert('新密码长度太短');");
				out.println("window.location='jsp/ChangePassword/ChangePassword.jsp'");
				out.println("</script>");*/
			} else if (changemap.get("YHXGJG").equals("4")) {
				check = 4;
				/*out.println("<script>");
				out.println("alert('新密码复杂度不符合要求同时包含数字、字母、及特殊符号');");
				out.println("window.location='jsp/ChangePassword/ChangePassword.jsp'");
				out.println("</script>");*/
			} else if (changemap.get("YHXGJG").equals("5")) {
				check = 5;
				/*out.println("<script>");
				out.println("alert('新口令不一致');");
				out.println("window.location='jsp/ChangePassword/ChangePassword.jsp'");
				out.println("</script>");*/
			} else if (changemap.get("YHXGJG").equals("6")) {
				check = 6;
				/*out.println("<script>");
				out.println("alert('原密码错误');");
				out.println("window.location='jsp/ChangePassword/ChangePassword.jsp'");
				out.println("</script>");*/
			}
		} else if (changemap.isEmpty()) {
			check = 8;
			/*out.println("<script>");
			out.println("alert('WebService未响应，请重试');");
			out.println("window.location='login.jsp'");
			out.println("</script>");*/
		}

		
		
		JSONArray jsonArray = new JSONArray();	
		jsonArray=JSONArray.fromObject(check);
		
		
		//System.out.println("PanDuanSjljh_state:"+jsonArray.toString()+"---"+jsonArray.size());
		out.write(jsonArray.toString());
		out.flush();
		out.close();

	}



}


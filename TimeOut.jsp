<%@ page language="java" contentType="text/html; charset=GB2312"  pageEncoding="GB2312"%>
<%
		//request.getSession().invalidate();
		//System.out.println("成功推出1");
		out.println("<script>");
		out.println("alert('连接超时！请点击退出，然后重新登录！')");
		out.println("</script>");
		//System.out.println("成功推出2");
		
		//response.sendRedirect("login.jsp");
/* 		out.flush();
		out.close(); */
		//System.out.println("成功推出3");
 %>
<html>
		<a href="out.jsp" target="_parent" style="font-size:40px">重新登录</a>
</html>
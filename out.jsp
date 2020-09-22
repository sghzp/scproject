<%@ page language="java" contentType="text/html; charset=GB2312"  pageEncoding="GB2312"%>
<%
		request.getSession().invalidate();
		//System.out.println("成功推出1");
		out.println("<script>");
		out.println("alert('成功退出');");
		out.println("</script>");
		//System.out.println("成功推出2");
		
		response.sendRedirect("login.jsp");
/* 		out.flush();
		out.close(); */
		//System.out.println("成功推出3");
 %>

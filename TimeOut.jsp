<%@ page language="java" contentType="text/html; charset=GB2312"  pageEncoding="GB2312"%>
<%
		//request.getSession().invalidate();
		//System.out.println("�ɹ��Ƴ�1");
		out.println("<script>");
		out.println("alert('���ӳ�ʱ�������˳���Ȼ�����µ�¼��')");
		out.println("</script>");
		//System.out.println("�ɹ��Ƴ�2");
		
		//response.sendRedirect("login.jsp");
/* 		out.flush();
		out.close(); */
		//System.out.println("�ɹ��Ƴ�3");
 %>
<html>
		<a href="out.jsp" target="_parent" style="font-size:40px">���µ�¼</a>
</html>
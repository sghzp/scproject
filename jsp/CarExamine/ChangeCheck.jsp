<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.seu.jdbc.*"%>

<%
request.setCharacterEncoding("utf-8");//设置页面字符集
response.setCharacterEncoding("utf-8");
%>

<%
	String INIID = (String)request.getParameter("INIID");
	String check = (String)request.getParameter("check");
	Connection conn = null;
	PreparedStatement ps = null;
	int iniid = Integer.parseInt(INIID);
	int check1 = Integer.parseInt(check);
	System.out.println(iniid);
	try{
		conn = JdbcUtils.getConnection();
		
		String sql1 = "update INIINFO set Shzt=?,Shr=?,Shrq=? where INIID="+iniid;
		ps = conn.prepareStatement(sql1);
		
		if(check1 == 0){
			ps.setString(1, "已审核");
			ps.setString(2, (String)session.getAttribute("username"));
			ps.setString(3, new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
		}else if(check1 == 1){
			ps.setString(1, "未审核");
			ps.setString(2, "");
			ps.setString(3, "");
		}
		
		ps.executeUpdate();
		}catch(SQLException e){
		e.printStackTrace();
		System.out.println("审核时出错");
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		
	
	boolean check2=true;
	if (check2) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='CarExamine.jsp'");
		out.println("</script>");
	} else {//操作失败
		out.println("<script>");
		out.println("alert('操作失败');");
		out.println("window.location='CarExamine.jsp'");
		out.println("</script>");
	}

	
%>
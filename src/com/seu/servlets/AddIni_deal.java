package com.seu.servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.seu.Global.Path;
import com.seu.beans.IniInfo;
import com.seu.dao.impl.EcuBasicInfoImpl;
import com.seu.dao.impl.IniInfoDaoImpl;
import com.seu.dao.impl.LogInfoDaoImpl;
import com.seu.ioutils.HandleFolder;
import com.seu.jdbc.JdbcUtils;
import com.seu.service.Ftpservice;

public class AddIni_deal extends HttpServlet {
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
		String shangchuanren = (String)session.getAttribute("username");
		
		String ecuorder = ((String) request.getParameter("ecuorder")).toUpperCase();
		String ecutype = (String) request.getParameter("ecutype");
		String sbm = ((String) request.getParameter("sbm")).toUpperCase();
		//String hexparentid = (String) request.getParameter("hexparentid");
		String cflj = "";
		String sjljh = (String) request.getParameter("sjljh");
		String state1 = (String) request.getParameter("state");
		//int state = Integer.parseInt(state1);
		
		int state = -1;

		
		
		
		String zcbm = (String) request.getParameter("zcbm");

		
		String inifile = ecuorder+"_"+sbm+".ini";
		String bz1 = (String) request.getParameter("bz1");
		String bz2 = (String) request.getParameter("bz2");
		String bz3 = "";
		String bz4 = "";
		String bz5 = "";
		String bz6 = "";
		String bz7 = "";
		String bz8 = "";
		String bz9 = "";
		String yxq = "";
		

		IniInfo iniInfo = new IniInfo();

		iniInfo.setECUOrder(ecuorder);
		iniInfo.setECUType(ecutype);
		iniInfo.setSbm(sbm);
		//iniInfo.setHEXParentID(hexparentid);
		iniInfo.setCflj(cflj);
		iniInfo.setSjljh(sjljh);
		iniInfo.setState(state);
		iniInfo.setZcbm(zcbm);
		iniInfo.setINIFile(inifile);
		iniInfo.setBz1(bz1);
		iniInfo.setBz2(bz2);
		iniInfo.setBz3(bz3);
		iniInfo.setBz4(bz4);
		iniInfo.setBz5(bz5);
		iniInfo.setBz6(bz6);
		iniInfo.setBz7(bz7);
		iniInfo.setBz8(bz8);
		iniInfo.setBz9(bz9);
		iniInfo.setYxq(yxq);
		iniInfo.setTimes(0);
		
		iniInfo.setCanWriteTimes("10000");
		
		iniInfo.setScrq(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
		
		iniInfo.setScr(shangchuanren);
		
		iniInfo.setScrgh((String)session.getAttribute("bh"));
		
		iniInfo.setShzt("未审核");
		
		iniInfo.setXgr(shangchuanren);
		
		iniInfo.setEditDate(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
		iniInfo.setDownloadtimes(0);
		//*******以上为包装对象**************
		
		// 存放参数名的集合
		ArrayList<String> arr1 = new ArrayList<String>();
		// 存放参数值的集合
		ArrayList<String> arr2 = new ArrayList<String>();
		ResultSet rs = null;
		String sql = "select englishname,cannotwrite from" + " "+ getTableName(ecutype);

		// 查询出所有要输出的englishname---即ini文件的参数名,
		// 将结果放入rs结果集当中，
		// 最后别忘了把结果集关闭
		rs = JdbcUtils.query(sql);
		// 利用循环，将所有参数名（englishname）放入一个ArrayList
		// 这里ArrayList可事先定义大小（若可预估），防止自动扩容时降低效率。
		try {
			while (rs.next()) {
				//cannotwrite 有两个特殊情况，为1时，页面显示为“无”
				//为no时，页面不显示。
				//其他情况均放入ini文件
				if(rs.getString("cannotwrite") != null){
					if(rs.getString("cannotwrite").equals("no") || rs.getString("cannotwrite").equals("1")){
						continue;
					}else{
						arr1.add(rs.getString("englishname"));
					}
				}else{
					arr1.add(rs.getString("englishname"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("查询englishname结果集出问题");
		}
		// 释放工具里的Connection和PreparedStatement
		JdbcUtils.free();// 一定记得加这句
		// 利用循环得到参数值，并将参数值放入另一个ArrayList中
		for (int i = 0; i < arr1.size(); i++) {
			//新建整车信息ini文件时，不对不显示的信息生成null值，应为不生成这几个不显示的量
			if(request.getParameter(arr1.get(i)) == null){
				arr2.add("");
				//arr1.remove(i);
			}else{
				arr2.add((String) request.getParameter(arr1.get(i)));
			}
			
		}
		// 后台输出下，测试用。
		System.out.println("arr1的大小:" + arr1.size());
		System.out.println("arr2的大小:" + arr2.size());
		//for (int i = 0; i < arr1.size(); i++) {
			//System.out.print(arr1.get(i) + "   " + arr2.get(i));
			//System.out.println();
		//}
		saveIni(ecutype, sjljh, inifile, arr1, arr2);
		
		
		
		// 888888****以上为生成INI文件操作***************************8888888888888888888888888888888888888888888
		Ftpservice ftpservice = new Ftpservice();
		boolean checkftp = ftpservice.ToFtp(iniInfo.getECUType(), iniInfo.getSjljh(), null, iniInfo.getINIFile(), null, null);
		//boolean checkftp = true;
		
		if(checkftp){
			IniInfoDaoImpl iniInfoDaoImpl = new IniInfoDaoImpl();
			boolean check = iniInfoDaoImpl.addIniInfo(iniInfo);
			
			LogInfoDaoImpl lidi = new LogInfoDaoImpl();
			lidi.addLogInfo(iniInfo.getScrq(), "用户"+shangchuanren+"上传INI订货号"+iniInfo.getECUOrder()+"_"+iniInfo.getSbm()+"成功");
			
		}
		// *********以上为数据库存储************************************************
		// 88888888888888888888888888888888888888888888888888888888888888888888
		
		
		
		
		PrintWriter out = response.getWriter();
		//System.out.println("hello AddINI_deal!");
		if (checkftp) {//操作成功
			out.println("<script>");
			out.println("alert('操作成功');");
			out.println("window.location='jsp/CarManage/CarManage.jsp'");
			out.println("</script>");
		} else {//操作失败
				out.println("<script>");
				out.println("alert('ftp上传失败');");
				out.println("history.go(-1)");
				//out.println("window.location='HexPfile.jsp'");
				out.println("</script>");
		}
		out.flush();
		out.close();

	}

	/**
	 * 传入两个String（所属机型+数据零件号），组合路径 传入两个ArrayList，利用其中的String对象，生成ini文件 并存入到指定目录中
	 * 
	 * @author xuanbusi
	 * @param String
	 *            String String ArrayList ArrayList
	 */
	public void saveIni(String ecutype, String sjljh, String inifile,
			ArrayList<String> arr1, ArrayList<String> arr2) {
		StringBuffer path = new StringBuffer("");
		path.append(Path.ROOT_FTP);
		//path.append("ftproot");
		path.append("/");
		path.append("inifile");
		path.append("/");
		path.append(ecutype);
		path.append("/");
		path.append(sjljh);

		HandleFolder.newDir(path.toString());
		
		path.append("/");
		path.append(inifile);
		//path.append(".ini");

		FileOutputStream fos = null;
		PrintStream ps = null;
		try {

			fos = new FileOutputStream(path.toString());
			ps = new PrintStream(fos);
			ps.println("[变型量]");
			for(int i=0,length = arr1.size();i<length;i++){
				ps.println(arr1.get(i) + "=" +arr2.get(i));
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}

			try {
				if (fos != null) {
					fos.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
	/**
	 * 根据传来的ecutype参数组合表名
	 */
	public String getTableName(String ecutype){
		StringBuffer tablename = new StringBuffer("");
		EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
		HashMap<String,Integer> hm = ebii.query2();
		
		if(hm.get(ecutype)==1 || hm.get(ecutype)==2){
			tablename.append(ecutype);
			tablename.append("_iniinfo_can");
		}
		if(hm.get(ecutype)==0){
			tablename.append(ecutype);
			tablename.append("_iniinfo_k");
		}
		
		return tablename.toString();
	}

}

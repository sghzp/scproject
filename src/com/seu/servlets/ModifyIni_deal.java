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

public class ModifyIni_deal extends HttpServlet {
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
		String xiugairen = (String)session.getAttribute("username");

		String INIID1 = (String) request.getParameter("INIID");
		int INIID = Integer.parseInt(INIID1);
		String ecuorder = (String) request.getParameter("ecuorder");
		String sbm = (String) request.getParameter("sbm");
		if(ecuorder != null && sbm !=null ){
			ecuorder = ecuorder.toUpperCase();
			sbm = sbm.toUpperCase();
		}
		String ecutype = (String) request.getParameter("ecutype");
		String hexparentid = (String) request.getParameter("hexparentid");
		String cflj = "";
		String sjljh = (String) request.getParameter("sjljh");
		//String state1 = (String) request.getParameter("state");	
		//int state = Integer.parseInt(state1);
		String zcbm = (String) request.getParameter("zcbm");
		String inifile = ecuorder+"_"+sbm+".ini";;
		String bz1 = (String) request.getParameter("bz1");
		String bz2 = (String) request.getParameter("bz2");

		IniInfo iniInfo = new IniInfoDaoImpl().query(INIID);
		
		
		if(iniInfo.getState() == -1){//若为空状态，可以任意修改
			iniInfo.setBz2(bz2);//发动机型号
			iniInfo.setECUOrder(ecuorder);
			iniInfo.setSbm(sbm);
			iniInfo.setSjljh(sjljh);
			iniInfo.setZcbm(zcbm);
			iniInfo.setINIFile(inifile);
			iniInfo.setCflj(cflj);
			iniInfo.setBz1(bz1);
			iniInfo.setXgr(xiugairen);
			iniInfo.setEditDate(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
			//*******以上为包装对象***********************
			// 存放参数名的集合
			ArrayList<String> arr1 = new ArrayList<String>();
			// 存放参数值的集合
			ArrayList<String> arr2 = new ArrayList<String>();
			ResultSet rs = null;
			String sql = "select englishname from" + " "+ getTableName(ecutype);

			// 查询出所有要输出的englishname---即ini文件的参数名,
			// 将结果放入rs结果集当中，
			// 最后别忘了把结果集关闭
			rs = JdbcUtils.query(sql);
			// 利用循环，将所有参数名（englishname）放入一个ArrayList
			// 这里ArrayList可事先定义大小（若可预估），防止自动扩容时降低效率。
			try {
				while (rs.next()) {
					arr1.add(rs.getString("englishname"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("查询englishname结果集出问题");
			}
			// 释放工具里的Connection和PreparedStatement
			JdbcUtils.free();// 一定记得加这句
			// 利用循环得到参数值，并将参数值放入另一个ArrayList中
			for (int i = 0; i < arr1.size(); i++) {
				arr2.add((String) request.getParameter(arr1.get(i)));//注意这句话，在这里那些动态生成的元素还没有被禁用
			}
			// 后台输出下，测试用。
			System.out.println("arr1的大小:" + arr1.size());
			System.out.println("arr2的大小:" + arr2.size());
			for (int i = 0; i < arr1.size(); i++) {
				//System.out.print(arr1.get(i) + "   " + arr2.get(i));
				//System.out.println();
			}
			saveIni(iniInfo.getECUType(), iniInfo.getSjljh(), iniInfo.getINIFile(), arr1, arr2);
		}else{//临时、临时超限、正常状态时的除备注外信息只有未被刷写和下载过才能修改
			iniInfo.setBz1(bz1);
			iniInfo.setXgr(xiugairen);
			iniInfo.setEditDate(new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));

		}
		
		

				
				// 888888888888888888888888888888888888888888888888888888888888888888
				
				
				Ftpservice ftpservice = new Ftpservice();
				boolean checkftp = ftpservice.ToFtp(iniInfo.getECUType(), iniInfo.getSjljh(), null, iniInfo.getINIFile(), null, null);
				//boolean checkftp = true;
				
				if(checkftp){
					IniInfoDaoImpl iniInfoDaoImpl = new IniInfoDaoImpl();
					iniInfoDaoImpl.updateIniInfo(iniInfo);
					
					LogInfoDaoImpl lidi = new LogInfoDaoImpl();
					lidi.addLogInfo(iniInfo.getEditDate(), "用户"+xiugairen+"修改INI订货号"+iniInfo.getECUOrder()+"_"+iniInfo.getSbm()+"成功");
				}
				
				
				// *********以上为数据库存储**********以下为生成INI文件操作**************************************
				// 88888888888888888888888888888888888888888888888888888888888888888888
				PrintWriter out = response.getWriter();
				
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
				// out.write(jsonArray.toString());
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
				System.out.println(ecutype);
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

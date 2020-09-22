package com.seu.ioutils;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;



import com.seu.Global.Path;
import com.seu.beans.IniInfo;
import com.seu.dao.impl.IniInfoDaoImpl;
/**
 * 为modifyini编写的工具类
 * 要的到inifile的具体路径，才能读它的键值对。存入一个hashmap，然后动态生成。
 * @author acer
 *
 */
public class IniToHashMap {
	public static String getInifile(int iniid){
		IniInfoDaoImpl iniInfoDaoImpl = new IniInfoDaoImpl();
		String sql = "select * from INIINFO where INIID="+iniid; 
		ArrayList<IniInfo> iniInfos = null;
		IniInfo iniInfo = null;	
		iniInfos = iniInfoDaoImpl.query(sql);
		iniInfo = (IniInfo)iniInfos.get(0);
		StringBuffer path = new StringBuffer("");
		path.append(Path.ROOT_FTP);
		path.append("/");
		path.append("inifile");
		path.append("/");
		path.append(iniInfo.getECUType());
		path.append("/");
		path.append(iniInfo.getSjljh());
		path.append("/");
		path.append(iniInfo.getINIFile());
		//path.append(".ini");
		//System.out.println(path);	
		return path.toString();
	}
	
	public static HashMap<String,String> getHashMap(String inifile) throws IOException{
		BufferedReader br = null;
		HashMap<String,String> hm = new HashMap<String,String>();
		try {
			
			//注意的这里的utf-8！！！！！！
			br = new BufferedReader(new InputStreamReader(new FileInputStream(inifile),"utf-8"));
			br.readLine();//!!!!!!因为第一行一般是标头[xxx]，固定格式，要事先说好！
			String temp = null;	
			String[] ss = null;
			while((temp = br.readLine()) != null){
				ss = temp.split("=");
				if(ss.length == 1){
					hm.put(ss[0], "");//因为有可能，用户在填写表单的时候，有些数据，没有填写。
									   //在ini文件中的表现就是“vin=”。
									   //“vin=”.split（"="）得到的引用型数组长度就是1.
									   //经测试：即使预先定义好了String[] ss = new String[2];
									   //ss = new String("vin=").split("=");
									   //数组ss的length也变成了1！！！！！！！！！！
				}else{
					hm.put(ss[0], ss[1]);
				}
				
			}

			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(br!=null){
				br.close();
			}
		}	
		return hm;
	}
	
/*	public static void main(String[] args) throws IOException{
		 getHashMap(getInifile(14));
		
	}*/
}

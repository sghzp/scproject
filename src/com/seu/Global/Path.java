package com.seu.Global;

import java.util.Map;

import com.seu.dao.impl.EcuBasicInfoImpl;

public interface Path {
	public static String ROOT_FTP = "e:/eolroot/ftprootreal";
	public static String ROOT_EOL = "e:/eolroot/eolreal";
	//public static String ROOT_FTP = "d:/ftproottest";//xr
	//public static String ROOT_EOL = "d:/eoltest";//xr
	//public static String ROOT_FTP = "d:/ftprootreal";//上柴测试机
	//public static String ROOT_EOL = "d:/eolreal";//上柴测试机
	public static Map<String,String> map1 = new EcuBasicInfoImpl().query4();//enginename作为键
	public static Map<String,String> map2 = new EcuBasicInfoImpl().query5();//engineenglishname作为键
}

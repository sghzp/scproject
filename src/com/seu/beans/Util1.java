package com.seu.beans;

import java.util.HashMap;

import com.seu.dao.impl.EcuBasicInfoImpl;

public class Util1 {
/**
 * 判断下载哪些文件。
 * 返回几个int，接收端根据得到的值，组合字符串。
 * @param ecutype
 * @return
 */
	public static int WhichToDownload(String ecutype) {
		EcuBasicInfoImpl ebii = new EcuBasicInfoImpl();
		HashMap<String, Integer> hm = ebii.query1();
		// System.out.println(version.length());
		Integer check = new Integer(hm.get(ecutype));
		return check;
	}

}

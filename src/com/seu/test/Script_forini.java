package com.seu.test;

import java.util.ArrayList;

import com.seu.beans.IniInfo;
import com.seu.dao.impl.IniInfoDaoImpl;

public class Script_forini {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		IniInfoDaoImpl iidi = new IniInfoDaoImpl();
		ArrayList<IniInfo> arr = iidi.query("select * from iniinfo where iniid=2215");
		//System.out.println(arr.size());
		//System.out.println(arr.get(0));
		IniInfo ii = arr.get(0);
		ii.setEditDate("19920226");//20161116104843
		//iidi.addIniInfo(ii);
	}

}

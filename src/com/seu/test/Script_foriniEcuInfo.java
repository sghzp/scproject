package com.seu.test;

import java.util.ArrayList;

import com.seu.beans.IniInfo;
import com.seu.beans.WriteRecordInfo;
import com.seu.dao.impl.IniInfoDaoImpl;
import com.seu.dao.impl.WriteRecordInfoDaoImpl;

public class Script_foriniEcuInfo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		WriteRecordInfoDaoImpl wridi = new WriteRecordInfoDaoImpl();
		IniInfoDaoImpl iidi = new IniInfoDaoImpl();
		ArrayList<WriteRecordInfo> list = null;
		list = (ArrayList<WriteRecordInfo>)wridi.query_ecuorder_ecusn();//这行对应的新方法要该数据库表名
		for(int i = 0; i<list.size(); i++){
			WriteRecordInfo temp = list.get(i);
			if(temp.getEcuorder() != null && temp.getEcusn() != null){
				IniInfo ii = iidi.queryby_ecuorder_sbm20161119(temp.getEcuorder(), temp.getEcusn());//这个方法是新加的，也要改数据表名
				wridi.updateWriteRecord(temp.getEcuorder(), temp.getEcusn(), ii.getSjljh());//这个也要改！
				
			}
		}
	}

}

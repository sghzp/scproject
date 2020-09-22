package com.seu.thread;

import java.util.*;

import com.seu.dao.impl.HexInfoDaoImpl;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		PanDuanSendMail p = new PanDuanSendMail();
		Thread t = new Thread(p);
		//t.start();
		Date date = new Date();
		Calendar calendar = new GregorianCalendar(); 
		calendar.setTime(date); 
		calendar.add(calendar.DATE,10);//把日期往后增加一天.整数往后推,负数往前移动 
		date=calendar.getTime();   //这个时间就是日期往后推一天的结果
		String current = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		//int i =p.compare_date(current,"2017-03-20 09:02:08");
		//System.out.println(i);
	}

}

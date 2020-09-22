package com.seu.thread;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.seu.beans.HexInfo;
import com.seu.beans.IniInfo;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.dao.impl.IniInfoDaoImpl;

public class PanDuanLinShiTime extends Thread{


	
	public void run1(){
		while(true){
			try {
				sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("延时1秒");
		}
	}
	@Override
	public void run() { 
		while(true){
				
					//每一个小时遍历一次数据表HEXINFO与表INIINFO，找出其中状态为临时的数据
					System.out.println(">>>>>>一小时到了！开始判断临时状态有效期是否超时！<<<<<<<<");
					String sqlhex = "select * from HEXINFO where state=1";//临时状态
					String sqlini = "select * from INIINFO where state=1";
					
					//先找HEXINFO吧
					HexInfoDaoImpl hidi = new HexInfoDaoImpl();
					ArrayList<HexInfo> arrhex = hidi.query(sqlhex);
					//再找INIINFO
					IniInfoDaoImpl iidi = new IniInfoDaoImpl();
					ArrayList<IniInfo> arrini = iidi.query(sqlini);
					
					String current = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
					
					//System.out.println("当前"+current);
					//String test = "2016-11-19 14:44:57";
					//System.out.println("test"+compare_date(current, test));
					
					
					//还是先hex吧，判断是否时间超期
					for(int i = 0; i<arrhex.size() ;i++){
						HexInfo hi = arrhex.get(i);
						String yxq = null;
						if(hi.getYxq() != null ){
							if(hi.getYxq() != ""){
								yxq = hi.getYxq();
								if(compare_date(current, yxq) == 1){//说明当前时间已经超过有效期，变更状态为临时超限
									hi.setState(5);
									hidi.updateHexInfo(hi);
								}
								//System.out.println("hex"+compare_date(current,yxq)+"----"+yxq);
								//System.out.println("hex---"+yxq+hi.getHEXID());
							}
						}
						
						
					}
					
					//再ini
					for(int i = 0; i<arrini.size() ;i++){
						IniInfo ii = arrini.get(i);
						String yxq = null;
						if(ii.getYxq() != null ){
							if(ii.getYxq() != ""){
								yxq = ii.getYxq();
								if(compare_date(current, yxq) == 1){//说明当前时间已经超过有效期，变更状态为临时超限
									ii.setState(5);
									iidi.updateIniInfo(ii);
								}
								//System.out.println("ini"+compare_date(current,yxq)+"----"+yxq);
								//System.out.println("ini---"+yxq+ii.getINIID());
							}
						}
					}
					//定时一个小时一次
					try {
						sleep(3600*1000);//一小时一次
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		}
	}
	
	private int compare_date(String date1,String date2){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			Date dt1 = df.parse(date1);
			Date dt2 = df.parse(date2);
			if(dt1.getTime() > dt2.getTime()){
				return 1;
			}else if(dt1.getTime() < dt2.getTime()){
				return -1;
			}else{
				return 0;
			}
		}catch(Exception e){//ParseException就是他
			//e.printStackTrace();
		}
		return 0;
	}
	
}
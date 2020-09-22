package com.seu.thread;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.seu.beans.HexInfo;
import com.seu.beans.IniInfo;
import com.seu.beans.UserInfo;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.dao.impl.IniInfoDaoImpl;
import com.seu.dao.impl.UserInfoDaoImpl;

public class PanDuanSendMail extends Thread{


	
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
					System.out.println(">>>>>>两个小时到了！开始判断是否要发邮件提醒！有效期小于十天，<<<<<<<<");
					String sqlhex = "select * from HEXINFO where state=1 and bz7 !='1'";//临时状态
					String sqlini = "select * from INIINFO where state=1 and bz4 !='1'";
					
					//先找HEXINFO吧
					HexInfoDaoImpl hidi = new HexInfoDaoImpl();
					ArrayList<HexInfo> arrhex = hidi.query(sqlhex);
					//再找INIINFO
					IniInfoDaoImpl iidi = new IniInfoDaoImpl();
					ArrayList<IniInfo> arrini = iidi.query(sqlini);
					
					
					
					Date date = new Date();
					Calendar calendar = new GregorianCalendar(); 
					calendar.setTime(date); 
					calendar.add(calendar.DATE,10);//把日期往后增加一天.整数往后推,负数往前移动 
					date=calendar.getTime();   //这个时间就是日期往后推一天的结果
					String current = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
					String realcurrent = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
					//System.out.println("当前"+current);
					//String test = "2016-11-19 14:44:57";
					//System.out.println("test"+compare_date(current, test));
					
					
					//还是先hex吧，判断是否时间超期
					for(int i = 0; i<arrhex.size() ;i++){
						HexInfo hi = arrhex.get(i);
						//System.out.println("HEXID:"+hi.getHEXID());
						String yxq = null;
						String canwritetimes = null; 
						int times = 0;
						if(hi.getYxq() != null && hi.getCanWriteTimes() != null){
							boolean ifyxq = false;
							boolean ifcanwrite = false;
							if(hi.getYxq() != ""){
								yxq = hi.getYxq();
								if(compare_date(current, yxq,realcurrent) == 1){//说明当前时间少于十天
									ifyxq = true;
								}
							}
							if(hi.getCanWriteTimes() != ""){
								canwritetimes = hi.getCanWriteTimes();
								times = hi.getTimes();
								if(Integer.parseInt(canwritetimes) - times <=10){
									ifcanwrite = true;
								}
							}
							
							
							
							
							if(ifyxq && ifcanwrite){
								sendmail(hi.getScz(),hi.getSjljh(),hi.getVersion(),"hex",0);
								sendmail(hi.getShr(),hi.getSjljh(),hi.getVersion(),"hex",0);
								//发邮件说时间不够了，次数也不够了
								hi.setBz7("1");//已发送邮件的标志位
								hidi.updateHexInfo(hi);
							}else if(ifyxq && !ifcanwrite){
								sendmail(hi.getScz(),hi.getSjljh(),hi.getVersion(),"hex",1);
								sendmail(hi.getShr(),hi.getSjljh(),hi.getVersion(),"hex",1);
								//有效期不够了
								hi.setBz7("1");//已发送邮件的标志位
								hidi.updateHexInfo(hi);
							}else if(!ifyxq && ifcanwrite){
								sendmail(hi.getScz(),hi.getSjljh(),hi.getVersion(),"hex",2);
								sendmail(hi.getShr(),hi.getSjljh(),hi.getVersion(),"hex",2);
								//刷写次数不够了
								hi.setBz7("1");//已发送邮件的标志位
								hidi.updateHexInfo(hi);
							}else{
								//不发邮件了
							}
							
						}
						
						
					}
					
					//再ini
					for(int i = 0; i<arrini.size() ;i++){
						IniInfo ii = arrini.get(i);
						//System.out.println("INIID："+ii.getINIID());
						String yxq = null;
						String canwritetimes = null; 
						int times = 0;
						if(ii.getYxq() != null && ii.getCanWriteTimes() != null){
							boolean ifyxq = false;
							boolean ifcanwrite = false;
							if(ii.getYxq() != ""){
								yxq = ii.getYxq();
								if(compare_date(current, yxq,realcurrent) == 1){//说明当前时间少于十天
									ifyxq = true;
								}
							}
							if(ii.getCanWriteTimes() != ""){
								canwritetimes = ii.getCanWriteTimes();
								times = ii.getTimes();
								if(Integer.parseInt(canwritetimes) - times <=10){
									ifcanwrite = true;
								}
							}
							
							
							
							
							if(ifyxq && ifcanwrite){
								sendmail(ii.getScr(),ii.getECUOrder(),ii.getSbm(),"ini",0);
								sendmail(ii.getShr(),ii.getECUOrder(),ii.getSbm(),"ini",0);
								//发邮件说时间不够了，次数也不够了
								ii.setBz4("1");//已发送邮件的标志位
								iidi.updateIniInfo(ii);
							}else if(ifyxq && !ifcanwrite){
								sendmail(ii.getScr(),ii.getECUOrder(),ii.getSbm(),"ini",1);
								sendmail(ii.getShr(),ii.getECUOrder(),ii.getSbm(),"ini",1);
								//有效期不够了
								ii.setBz4("1");//已发送邮件的标志位
								iidi.updateIniInfo(ii);
							}else if(!ifyxq && ifcanwrite){
								sendmail(ii.getScr(),ii.getECUOrder(),ii.getSbm(),"ini",2);
								sendmail(ii.getShr(),ii.getECUOrder(),ii.getSbm(),"ini",2);
								//刷写次数不够了
								ii.setBz4("1");//已发送邮件的标志位
								iidi.updateIniInfo(ii);
							}else{
								//不发邮件了
							}
							
						}
						
						
					}
					//定时六个小时一次
					try {
						sleep(3600*1000*2);//2小时一次
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		}
	}
	
	public int compare_date(String date1,String date2,String date3){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//System.out.println(date1);
		//System.out.println(date2);
		try{
			Date dt1 = df.parse(date1);
			Date dt2 = df.parse(date2);
			Date dt3 = df.parse(date3);
			if(dt1.getTime() > dt2.getTime() && dt3.getTime() < dt2.getTime()){
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
	
	public void sendmail(String name,String sjljh,String version,String hexorini,int statement){
		//String email = null;
		UserInfoDaoImpl uidi = new UserInfoDaoImpl();
		UserInfo userInfo = uidi.query_byname(name);
		Thread t = null;
		if("hex".equals(hexorini)){
			if(statement == 0){//既小于十天，又小于十次
				t = new Thread(new MailThread(userInfo.getMail(),"EOL系统提醒-数据零件号为"+sjljh+"-版本号为"+version,"数据零件号为"+sjljh+",版本号为"+version+"的临时状态有效期小于十天，且可刷写次数小于十次。"));
			}else if(statement == 1){//小于十天
				t = new Thread(new MailThread(userInfo.getMail(),"EOL系统提醒-数据零件号为"+sjljh+"-版本号为"+version,"数据零件号为"+sjljh+",版本号为"+version+"的临时状态有效期小于十天。"));
			}else if(statement == 2){//小于十次
				t = new Thread(new MailThread(userInfo.getMail(),"EOL系统提醒-数据零件号为"+sjljh+"-版本号为"+version,"数据零件号为"+sjljh+",版本号为"+version+"的临时状态可刷写次数小于十次。"));
			}else{
				
			}
		}else{
			if(statement == 0){//既小于十天，又小于十次
				t = new Thread(new MailThread(userInfo.getMail(),"EOL系统提醒-订货号为"+sjljh+"-识别码为"+version,"订货号为"+sjljh+",识别码为"+version+"的临时状态有效期小于十天，且可刷写次数小于十次。"));
			}else if(statement == 1){//小于十天
				t = new Thread(new MailThread(userInfo.getMail(),"EOL系统提醒-订货号为"+sjljh+"-识别码为"+version,"订货号为"+sjljh+",识别码为"+version+"的临时状态有效期小于十天。"));
			}else if(statement == 2){//小于十次
				t = new Thread(new MailThread(userInfo.getMail(),"EOL系统提醒-订货号为"+sjljh+"-识别码为"+version,"订货号为"+sjljh+",识别码为"+version+"的临时状态可刷写次数小于十次。"));
			}else{
				
			}
		}
		t.start();
	}
	
}
package com.seu.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import com.seu.Global.Path;
import com.seu.ioutils.HandleFolder;
import com.seu.ioutils.IniToHashMap;

public class Ftpservice{
	public boolean ToFtp1(String ecutype,String sjljh,String version,String filename1,String filename2,String filename3){
		for(int i = 0 ;i<5;i++){
			System.out.println("倒计时："+ i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return true;
	};
	public boolean ToFtp(String ecutype,String sjljh,String version,String filename1,String filename2,String filename3){
		int wenjianshu = panduanjigekong(filename1,filename2,filename3);
		
		Map<String,String> map = new HashMap<String,String>();//存放ftp.exe返回的上传结果
		
		HandleFolder.removeFile(Path.ROOT_EOL+"/ftp.ini");//先删除上次写入的信息（delphi上传ftp需要的参数文件）。
		HandleFolder.removeFile(Path.ROOT_EOL+"/result-ftp.ini");
		
		Runtime rt = Runtime.getRuntime();
		FileOutputStream fos = null;
		PrintStream ps = null;
		
		StringBuffer localdir = new StringBuffer("");
		StringBuffer dir = new StringBuffer("");
		StringBuffer direction = new StringBuffer("0");
		StringBuffer filenum = new StringBuffer(""+wenjianshu);
		
		//组合localdir和dir
		if(version != null){//说明是hex文件的上传
			dir.append("\\hexfile");
			dir.append("\\"+ecutype);
			dir.append("\\"+sjljh);
			dir.append("\\"+version);
			localdir.append(Path.ROOT_FTP);
			localdir.append(dir);
			localdir.append("\\");
		}else{
			dir.append("\\inifile");
			dir.append("\\"+ecutype);
			dir.append("\\"+sjljh);
			localdir.append(Path.ROOT_FTP);
			localdir.append(dir);
			localdir.append("\\");
		}
		
		//开始写ftp.ini文件
		

		
		try {

			fos = new FileOutputStream(Path.ROOT_EOL+"/ftp.ini");
			ps = new PrintStream(fos);
			ps.println("[ftp]");
			
			ps.println("localdir" + "=" +localdir.toString());
			ps.println("dir" + "=" +dir.toString());	
			ps.println("direction" + "=" +direction.toString());
			ps.println("filenum" + "=" +filenum.toString());
			//filename要仔细判断是否为空。
			if(filename1 != null){
				ps.println("filename1" + "=" +filename1.toString());
			}
			if(filename2 != null){
				ps.println("filename2" + "=" +filename2.toString());
			}
			
			if(filename3 != null){
				ps.println("filename3" + "=" +filename3.toString());
			}
			
		} catch (FileNotFoundException e) {
			System.err.println("新建ftp.ini时发生异常");
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
		
		try {
			rt.exec(Path.ROOT_EOL+"/ftp.exe");
		} catch (IOException e) {
			System.err.println("启动ftp.exe时，发生异常！");
			e.printStackTrace();
		}
		//读取exe返回的上传结果：result-ftp.ini。result=1时上传成功！
		int count = 0;
		while(true){
			yanshi();//延时一秒后再查找
			count++;
			if(new File(Path.ROOT_EOL+"/result-ftp.ini").exists()){
				try {
					map = IniToHashMap.getHashMap(Path.ROOT_EOL+"/result-ftp.ini");//将读取的结果放入map中。
				} catch (IOException e) {
					System.out.println("result-ftp.ini转map时出错");
					e.printStackTrace();
				}//包装map,ioutils包中有写好的工具
				break;
			}
			if(count>5){
				System.err.println("未得到ftp.exe反馈");
				break;
			}
		}
		//System.out.println("result:"+map.get("result"));
		if(map.isEmpty()){
			return false;
		}else{
			if(map.get("result").equals("0")){
				return false;
			}
			if(map.get("result").equals("1")){
				return true;
			}
		}
		return false;
	}
	
	private void yanshi(){
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private int panduanjigekong(String file1,String file2,String file3){
		int count = 3;
		if(file1 == null){
			count--;
		}
		if(file2 == null){
			count--;
		}
		if(file3 == null){
			count--;
		}
		
		return count;
	}
	
/*	public static void main(String[] args){
		Ftpservice f = new Ftpservice();
		f.ToFtp("ecutype", "sjljh", null, "filename1.ini", "ddd", "rtwer");
		
	}*/
	
}

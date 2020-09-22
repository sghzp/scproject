package com.seu.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import com.seu.ftp.MyFtpUtils;

public class s {
	public static void main(String args[]) throws Exception {
		/*MyFtpUtils mfu = new MyFtpUtils();
		
		File file = new File("E:\\我是Hex文件.hex");
		InputStream is = new FileInputStream(file);
		//System.out.println(file.getName());
		mfu.uploadFile("223.3.35.86", 21, "xuanbusi", "00000000", "", file.getName(), is);*/
		try{
			int i = 1/0;
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}finally{
			System.out.println("finally");
		}
		
		
	}
}

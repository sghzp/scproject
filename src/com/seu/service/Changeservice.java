package com.seu.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import com.seu.Global.Path;
import com.seu.ioutils.*;

public class Changeservice {
	
	/**
	 * 修改密码，需要调用exe，并等待exe处理结果。
	 * @return
	 * @throws IOException
	 */
	public Map<String,String> checking() throws IOException{
		Runtime rt = Runtime.getRuntime();
		File file = new File(Path.ROOT_EOL+"/result-login.ini");
		Map<String,String> map = new HashMap<String,String>();//存放exe返回的用户登录结果。
		HandleFolder.removeFile(Path.ROOT_EOL+"/result-login.ini");//先删除上次的登录结果。
		//System.out.println(file.exists());
		try {
			rt.exec(Path.ROOT_EOL+"/UserWebservice.exe");
		} catch (IOException e) {
			System.err.println("启动登录的UserWebservice.exe时，发生异常！");
			e.printStackTrace();
		}//启动UserWebservice.exe得到返回的登录结果：result-login.ini
		int count = 0;
		while(true){
			yanshi();//延时一秒后再查找
			count++;
			if(file.exists()){
				map = IniToHashMap.getHashMap(Path.ROOT_EOL+"/result-login.ini");//包装map,ioutils包中有写好的工具
				break;
			}
			if(count>5){
				System.err.println("未得到UserWebservice.exe反馈");
				break;
			}
		}
		//System.out.println(file.exists());
		return map;
	}
	
	private void yanshi(){
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 先把用户登录填入的信息写入login.ini以供UserWebservice.exe读取。
	 * @param bh
	 * @param password
	 * @param old
	 * @param new_1
	 * 
	 */
	public void write(String bh, String password, String old, String new_1){
		HandleFolder.removeFile(Path.ROOT_EOL+"/login.ini");//先删除上次的登录信息。
		FileOutputStream fos = null;
		PrintStream ps = null;
		try {

			fos = new FileOutputStream(Path.ROOT_EOL+"/login.ini");
			ps = new PrintStream(fos);
			ps.println("[YHXX]");
			ps.println("YHBH" + "=" +bh);
			ps.println("YHMM" + "=" +password);
			ps.println("XKL1" + "=" +new_1);
			ps.println("XKL2" + "=" +new_1);
			ps.println("mark" + "=" +"1");
		} catch (FileNotFoundException e) {
			System.err.println("新建login.ini时发生异常");
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
	}
	
	/*public static void main(String[] args){
		Loginservice l = new Loginservice();
		l.checking();
	}*/
}

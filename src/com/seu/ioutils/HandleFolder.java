package com.seu.ioutils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

public class HandleFolder {

	/**
	 * 删除指定文件夹，可用来删除hex与ini的文件夹
	 * 
	 * @param dir
	 * @author xuanbusi
	 */
	public static void removeDir(File dir) {
		//System.out.println("kaishi   removing");
		File[] files = dir.listFiles();

		for (File file : files) { // 遍历
			if (file.isDirectory()) { // 判断是否为文件夹？
				removeDir(file); // 递归
				//System.out.println("递归ing");
			} else
				deleteFile(file); // 如果不是文件夹，就删除。

		}
		deleteFile(dir); // 从最里层开始删除文件夹。
		while(true){
			if(!dir.exists()){
				break;
			}else{
				yanshi();
			}
			System.out.println("removeing");
		}
	}
	/**
	 * 清空指定文件夹，可用来清空文件夹
	 * 
	 */
	public static void cleanDir(File dir) {
		//File dir = new File(filepath);
		//System.out.println("开始clean");
		File[] files = dir.listFiles();
		for (File file : files) { // 遍历
			if (file.isDirectory()) { // 判断是否为文件夹？
				cleanDir(file); // 递归
			} else{
				testdeleteFile(file); // 如果不是文件夹，就删除。
				//System.out.println("删除几次？");
			}
		}
		//System.out.println("判断是否清空前");
		//System.out.println(dir + "----" + dir.delete()); // 从最里层开始删除文件夹。
		while(true){
			if(dir.listFiles().length < 1 || dir.listFiles() == null){
				break;
			}else{
				System.out.println("HandleFolder.cleanDir()---文件夹还没有清空！");
			}
		}
	}
	
	/**
	 * 测试删除虚拟机占用的文件。
	 * 利用System.gc();
	 */
	
	public static void testdeleteFile(File file){
		//File file = new File(filepath);
		if(file.exists()){//这句很有意义哟！程序健壮了一些。
			boolean res = file.delete();
			System.out.println("我是testdeleteFile()函数，是否删除了文件？---"+res);
			if(!res){
				System.gc();
				System.out.println("现在能删除了把？"+file.delete()); 
			}
		}
		while(true){
			if(file.exists()){
				System.out.println("我是testdeleteFile()函数，是否还存在文件？---"+file.exists());
				yanshi();
			}else{
				break;
			}
		}
	}
	
	
	
	/**
	 * 新建文件夹，根据路径建立文件夹。若父目录存在的话，在原目录基础上新建。
	 * @param String
	 * @author xuanbusi
	 */
	
	public static void newDir(String path){
		File file = new File(path);
		if(!file.isFile()){
			file.mkdirs();
		}
		while(true){
			if(file.exists()){
				break;
			}else{
				yanshi();
			}
		}
	}
	
	/**
	 * 删除指定文件（ini）
	 * @author xuanbusi
	 * @param filepath
	 */
	public static void removeFile(String filepath){
		File file = new File(filepath);
		if(file.exists())//这句很有意义哟！程序健壮了一些。
			file.delete();
		while(true){
			if(file.exists()){
				yanshi();
			}else{
				break;
			}
		}
	}
	
/**
 * 同上一个函数
 * 
 * 
 */
	public static void deleteFile(File file){
		//File file = new File(filepath);
		if(file.exists())//这句很有意义哟！程序健壮了一些。
			file.delete();
		while(true){
			if(file.exists()){
				System.out.println("我是deleteFile()函数，是否删除了文件？---"+file.delete());
				yanshi();
			}else{
				break;
			}
		}
	}
	
	/**
	 * 判断文件是否存在
	 * @author xuanbusi
	 * @param filepath
	 */
	
	
/*	public static void main(String[] args){
		removeFile("d:/ftproot/a/b/c/ini.ini");
	}*/
	
	/**
	 * 
	 * @param f1
	 * @param f2
	 * @return
	 * @throws Exception
	 */
	public static boolean copy(String s1,String s2) throws Exception {
		File f1 = new File(s1);
		File f2 = new File(s2);
		if(f1.exists()){
			//long time = new Date().getTime();
			int length = 1;
			FileInputStream in = new FileInputStream(f1);
			FileOutputStream out = new FileOutputStream(f2);
			byte[] buffer = new byte[length];
			while (true) {
				int ins = in.read(buffer);
				if (ins == -1) {
					in.close();
					out.flush();
					out.close();
					break;
				} else
					out.write(buffer, 0, ins);
			}
			while (true){
				if(!f2.exists()){
					yanshi();
				}else{
					break;
				}
			}
		}

		return f2.exists();
	}

	public static void copy1(String s1,String s2){
		FileInputStream in =null;
		FileOutputStream out = null;
		try{
			if(new File(s1).exists()){
				in = new FileInputStream(s1);
				out = new FileOutputStream(s2);
				byte[] buffer = new byte[1024];
				while(true){
					int temp = in.read(buffer, 0, buffer.length);
					if(temp == -1){
						break;
					}
					out.write(buffer, 0, temp);
				}
				while (true){
					if(!new File(s2).exists()){
						yanshi();
					}else{
						break;
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				in.close();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	
    private static void yanshi(){
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
	
	
}

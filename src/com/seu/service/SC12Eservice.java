package com.seu.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.seu.Global.Path;
import com.seu.beans.HexInfo;
import com.seu.dao.impl.HexInfoDaoImpl;
import com.seu.ioutils.*;

public class SC12Eservice {
	
	public Map<String,String> checking() throws IOException{
		Runtime rt = Runtime.getRuntime();
		File file = new File(Path.ROOT_EOL+"/result-ftp.ini");
		Map<String,String> map = new HashMap<String,String>();//存放exe返回的"下载sc12e.ini文件"结果。
		HandleFolder.removeFile(Path.ROOT_EOL+"/result-ftp.ini");//先删除上次的ftp结果。
		HandleFolder.removeFile(Path.ROOT_EOL+"/sc12e.ini");
		System.out.println(file.exists());
		try {
			rt.exec(Path.ROOT_EOL+"/ftp.exe");
		} catch (IOException e) {
			System.err.println("启动登录的ftp.exe时，发生异常！");
			e.printStackTrace();
		}//启动ftp.exe得到返回的登录结果：result-ftp.ini
		int count = 0;
		while(true){
			yanshi();//延时一秒后再查找
			count++;
			if(file.exists()){
				map = IniToHashMap.getHashMap(Path.ROOT_EOL+"/result-ftp.ini");//包装map,ioutils包中有写好的工具
				break;
			}
			if(count>50){//好久好久~~~~~~~~~~~~~
				System.err.println("未得到ftp.exe反馈");
				break;
			}
		}
		System.out.println(file.exists());
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
	 * 先把得到ini文件的信息写入.ini以供UserWebservice.exe读取。
	 */
	public void write(String sjljh){

		
		//查询数据库，查找到相应的数据零件号，状态又为<=1 的 对应的对象！！！（好麻烦）
		String sql = "select * from HEXINFO where ecutype='sc12e' and sjljh="+"'"+sjljh+"'"+" and (state=1 or state=0)";
		
		ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>();
		hexInfos = new HexInfoDaoImpl().query(sql);
		
		
		//HexInfo hi = hexInfos.get(0);
		
/*
* 修改该代码,取正常状态导入;无正常状态,取版本最大的临时状态
* @RenS 2016.11.23
*/	
		HexInfo hi = new HexInfo();
		int versionMax = 0;
		int versionCurrent = 0;
		int indexMaxVersion = 0;
		for(int i = 0;i < hexInfos.size(); i++){
			//取当前最大的版本号的索引号index
			versionCurrent = Integer.parseInt(hexInfos.get(i).getVersion());
			if(versionCurrent > versionMax)
			{
				indexMaxVersion = i;
				versionMax = Math.max(versionMax, versionCurrent);
			}
		}
		
		for(int j = 0; j < hexInfos.size();j++){
			//若有正常状态，则取正常状态，否则，取临时状态中版本最高的
			if(hexInfos.get(j).getState() == 0)
			{
				hi = hexInfos.get(j);
				//System.out.println("got normal state："+hexInfos.get(j).getVersion());
				break;
			}
			else
			{	
				hi = hexInfos.get(indexMaxVersion);
				//System.out.println("got MaxVersion ："+hexInfos.get(indexMaxVersion).getVersion());
				continue;
			}
		}
		//System.out.println("最终上传的版本为："+hi.getVersion());
		
//@RenS end--
		
		//组合字符串
		StringBuffer localdir = new StringBuffer("");
		StringBuffer dir = new StringBuffer("");
		StringBuffer direction = new StringBuffer("3");
		StringBuffer filenum = new StringBuffer("1");
		
		dir.append("\\hexfile");
		dir.append("\\"+"sc12e");
		dir.append("\\"+sjljh);
		dir.append("\\"+hi.getVersion());
		
		localdir.append(Path.ROOT_FTP.replace('/', '\\'));
		localdir.append(dir);
		localdir.append("\\");
		
		HandleFolder.removeFile(Path.ROOT_EOL+"/ftp.ini");//先删除上次的ftp相关信息。
		FileOutputStream fos = null;
		PrintStream ps = null;
		try {

			fos = new FileOutputStream(Path.ROOT_EOL+"/ftp.ini");
			ps = new PrintStream(fos);
			ps.println("[ftp]");
			ps.println("localdir" + "=" +localdir.toString());
			ps.println("dir" + "=" +dir.toString());
			ps.println("direction" + "=" +direction.toString());
			ps.println("filenum" + "=" +filenum.toString());
			ps.println("filename1" + "=" +hi.getHEXFile());
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
	}
	
	/*public static void main(String[] args){
		Loginservice l = new Loginservice();
		l.checking();
	}*/
}

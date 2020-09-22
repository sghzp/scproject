package com.seu.ftp;

import org.apache.commons.net.ftp.*;

import java.io.IOException;
import java.io.InputStream;

public class MyFtpUtils {

	/**
	 * 根据重名判断的结果 生成新的文件的名称
	 */
	public static String changeName(String filename, FTPFile[] fs) {

		int n = 0;
		// 创建一个可变的字符串对象 即StringBuffer对象，把filename值付给该对象
		StringBuffer filename1 = new StringBuffer("");
		filename1 = filename1.append(filename);//这两句把一个String赋给一个StringBuffer
		System.out.println(filename1);
		while (isDirExist(filename1.toString(), fs)) {
			n++;
			String a = "[" + n + "]";
			System.out.println("字符串a的值是：" + a);
			int b = filename1.lastIndexOf(".");// 最后一出现小数点的位置
			int c = filename1.lastIndexOf("[");// 最后一次"["出现的位置
			if (c < 0) {
				c = b;
			}
			StringBuffer name = new StringBuffer(filename1.substring(0, c));// 文件的名字
			StringBuffer suffix = new StringBuffer(filename1.substring(b + 1));// 后缀的名称
			filename1 = name.append(a).append(".").append(suffix);
		}
		return filename1.toString();
	}

	/**
	 * 判断是否重名的方法
	 * 
	 */

	public static boolean isDirExist(String fileName, FTPFile[] fs) {
		for (int i = 0; i < fs.length; i++) {
			FTPFile ff = fs[i];
			if (ff.getName().equals(fileName)) {
				return true; // 如果存在返回 正确信号
			}
		}
		return false; // 如果不存在返回错误信号
	}

	/**
	 * 上传程序的方法
	 * @author xuanbusi
	 */

	public boolean uploadFile(String url, int port, String username,
			String password, String path, String filename, InputStream input) {
		// filename:要上传的文件
		// path：上传的路径
		// 初始表示上传失败
		boolean success = false;
		// 创建FTPClient对象
		FTPClient ftp = new FTPClient();
		try {
			int reply;
			// 连接FTP服务器
			// 如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器
			ftp.connect(url, port);
			// 下面三行代码必须要，而且不能改变编码格式，否则不能正确下载中文文件
			ftp.setControlEncoding("GBK");
			FTPClientConfig conf = new FTPClientConfig(FTPClientConfig.SYST_NT);
			conf.setServerLanguageCode("zh");
			// 登录
			ftp.login(username, password);
			// 看返回值是不是230，如果是，表示登录成功
			reply = ftp.getReplyCode();
			// 以2开头的返回值就会为真
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
				System.err.println("连接服务器失败");
				return success;
			}

			System.out.println("连接服务器成功");
			ftp.changeWorkingDirectory(path);// 转移到FTP服务器目录
			FTPFile[] fs = ftp.listFiles();// 得到目录的相应文件列表

			System.out.println(fs.length);
			System.out.println(filename);

			String filename1 = MyFtpUtils.changeName(filename, fs);

			String filename2 = new String(filename1.getBytes("GBK"),
					"ISO-8859-1");
			String path1 = new String(path.getBytes("GBK"), "ISO-8859-1");
			// 转到指定上传目录
			ftp.changeWorkingDirectory(path1);
			// 将上传文件存储到指定目录
			// ftp.appendFile(new
			// String(filename.getBytes("GBK"),"ISO-8859-1"),input);
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			// 如果缺省该句 传输TXT正常 但图片和其他格式的文件传输出现乱码
			ftp.storeFile(filename2, input);
			// 关闭输入流
			input.close();
			// 退出FTP
			ftp.logout();
			// 表示上传成功
			success = true;
			System.out.println("------上传成功-------");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return success;
	}

}

package com.seu.servlets;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import com.seu.thread.PanDuanLinShiTime;
import com.seu.thread.PanDuanSendMail;


public class QiDongThread extends HttpServlet{
	public QiDongThread(){};
	
	public void init(){
		System.out.println("我在QiDongThread里！ 我只启动一个线程的servlet，在程序初始化时启动了");
		new PanDuanLinShiTime().start();
		new PanDuanSendMail().start();//到十天的时候，就发邮件提醒的线程。
	}
	
	public void doGet(HttpServletRequest hsq,HttpServletResponse hsp)throws ServletException,IOException{
		
	}
	
	public void destory(){
		
	}
}

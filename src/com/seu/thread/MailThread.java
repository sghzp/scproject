package com.seu.thread;

import com.seu.mailutil.*;

public class MailThread implements Runnable{
	private String to ;
	private String subject;
	private String content;
	
	public MailThread(String to,String subject,String content){
		this.to = to;
		this.subject = subject;
		this.content = content;
	}
	@Override
	public void run() {
	    MailUtil.sendmail(to, subject, content+"http://s89:8080/eol");
	}
	
}

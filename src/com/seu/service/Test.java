package com.seu.service;

public class Test {
	public static void main(String[] args) throws InterruptedException{
		EncodeService es = new EncodeService();
		String s = es.encode("5CD4645CF63E3E3E");
		System.out.println(s);
	}
}

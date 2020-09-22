package com.seu.test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import com.seu.dao.impl.LogInfoDaoImpl;
import com.seu.jdbc.MaxId;



class test{
    public String convert(String s, int numRows) {
        int length = s.length();
        char[] c = s.toCharArray();
        StringBuilder sb = new StringBuilder("");
        for(int i=0;i<numRows;i++){
        	int temp = i;
        	while(temp<length && i<numRows-1){
        		sb.append(c[temp]);
        		temp+=(numRows-(i+1))*2;
        	}
        }
        return sb.toString();
    }
	
	
	
	public static void main(String[] args){
		String s = "null";
		boolean a = false;
		a = "null".equals(s);
		System.out.println(a);
	}
}



/*String date = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
System.out.println(date);*/
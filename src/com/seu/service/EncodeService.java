package com.seu.service;

public class EncodeService {
	public String encode(String password){
		StringBuilder result = new StringBuilder("");
		int length = password.length();
		
		if(length % 2 != 0){
			throw new RuntimeException("密码是奇数");
		}
		
		String[] arrString = new String[length/2];
		int[] arrInt = new int[length/2];
		
		for(int i = 0; i < length; i+=2){
			StringBuilder sb = new StringBuilder("");
			arrString[i/2] = sb.append(password.charAt(i)).append(password.charAt(i+1)).toString();
		}

		for(int i = 0; i < length/2; i++){
			arrInt[i] = 255-Integer.valueOf(loopRight(hexString2binaryString(arrString[i])),2);
			//System.out.println(arrInt[i]);
		}
		
		for(int i = 0; i < length/2; i++){
			result.append((char) arrInt[i]);
		}
		System.out.println(result);
		return result.toString();
	}
	
	
	private String hexString2binaryString(String hexString) {
		if (hexString == null || hexString.length() % 2 != 0)
			return null;
		String bString = "", tmp;
		for (int i = 0; i < hexString.length(); i++) {
			tmp = "0000"
					+ Integer.toBinaryString(Integer.parseInt(
							hexString.substring(i, i + 1), 16));
			bString += tmp.substring(tmp.length() - 4);
		}
		return bString;
	} 
	
	private String loopRight(String bString){
		char[] ccc = new char[bString.length()];
		char[] cc = bString.toCharArray();
		ccc[0] = cc[5];
		ccc[1] = cc[6];
		ccc[2] = cc[7];
		ccc[3] = cc[0];
		ccc[4] = cc[1];
		ccc[5] = cc[2];
		ccc[6] = cc[3];
		ccc[7] = cc[4];
		return new String(ccc);
	}
}

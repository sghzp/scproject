package com.seu.service;

import javax.xml.namespace.QName;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;

public class WebService {

	public static void main(String[] args) throws Exception {

		String endpoint = "http://210.22.172.28:801/Webservice/WS_URMSInterFace.asmx?wsdl";
		Service service = new Service();
		Call call = (Call) service.createCall();
		call.setTargetEndpointAddress(new java.net.URL(endpoint));
		call.setOperationName("VerifyUserInfoDS");

		String mobile = "16499";
		String name = "16499";
		String openDate = "0";
		String doorId = "";


		Object result = (String) call.invoke(new Object[] { mobile, name, openDate,
				doorId});
		System.out.println(result);

	}

}

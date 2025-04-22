package com.ict.edu02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TestMain {
	public static void main(String[] args) {
		// DI�� Spring Container���� ��ü(Bean)�����ϰ� �����Ѵ�.
		// Spring Container���� �ʿ��� ������ �����ؾ� �Ѵ�. 
		//    => ��������(Configuration Metadata)
		//        �ش� ���� ������ �⺻�����δ� XML ���� ���� 
		//        �߰�������  Annotation�� �̿���
		//        (Spring boot������ ������  Annotation ���)
				
		//  Spring Container => BeanFactory => ApplicationContext    (Web X)
		//                                     WebApplicationContext (Web O)
				
		// ApplicationContext context = 
		//		new GenericXmlApplicationContext("����������ġ");
				
		ApplicationContext context = 
			new GenericXmlApplicationContext("com/ict/edu02/config.xml");
		
		// config.xml���� ������ ���� ���� Bean�� id
		Service service = (Service)context.getBean("service");
		service.biz();
	
	}
}

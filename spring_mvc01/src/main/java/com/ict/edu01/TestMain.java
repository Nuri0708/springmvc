package com.ict.edu01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.ict.edu02.MySQLDAO;
import com.ict.edu02.OracleDAO;
import com.ict.edu02.Service;

public class TestMain {
	public static void main(String[] args) {
		// setter 이용 
		Service service = new Service();
		service.setDao(new MySQLDAO());
		service.biz();
		System.out.println("================");
		
		// 생성자를 이용
		Service service2 = new Service(new OracleDAO());
		service2.biz();
	}
}

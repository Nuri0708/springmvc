package com.ict.edu04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Service {
	// 자동 연결
    // @Autowired 만 사용하려면  
	// Qualifier 는 참조하는 클래스의 id와 변수이름 같을때
	@Autowired
	
	// 참조하는 클래스의 id 호출
	// 아이디가 없을때는 클래스이름을 사용하는데 첫글자를 소문자로 만든다.
	// Qualifier 는 참조하는 클래스의 id와 변수이름 다를때 
	// @Qualifier("mySQLDAO")
	private DAO dao ;
	
	public Service() {
	   System.out.println("Service 기본생성자");
	}

	public Service(DAO dao) {
		this.dao = dao;
	}

	public void biz() {
		dao.prn();
	}
	
	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	
	
}

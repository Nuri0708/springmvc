package com.ict.edu04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Service {
	// �ڵ� ����
    // @Autowired �� ����Ϸ���  
	// Qualifier �� �����ϴ� Ŭ������ id�� �����̸� ������
	@Autowired
	
	// �����ϴ� Ŭ������ id ȣ��
	// ���̵� �������� Ŭ�����̸��� ����ϴµ� ù���ڸ� �ҹ��ڷ� �����.
	// Qualifier �� �����ϴ� Ŭ������ id�� �����̸� �ٸ��� 
	// @Qualifier("mySQLDAO")
	private DAO dao ;
	
	public Service() {
	   System.out.println("Service �⺻������");
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

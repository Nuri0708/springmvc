package com.ict.edu04;

import org.springframework.stereotype.Component;

@Component
public class OracleDAO implements DAO{
	public OracleDAO() {
		System.out.println("OracleDAO �⺻ ������");
	}
	@Override
	public void prn() {
	    System.out.println("OracleDAO�� prn()�޼���");		
	}
}

package com.ict.edu04;

import org.springframework.stereotype.Component;

@Component("dao")
public class MySQLDAO implements DAO{
    public MySQLDAO() {
		System.out.println("MySQLDAO �⺻ ������");
	}
	@Override
    public void prn() {
	  System.out.println("MySQLDAO�� prn()�޼���");
    }
}

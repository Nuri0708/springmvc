package com.ict.edu02;

public class MySQLDAO implements DAO{
	public MySQLDAO() {
		System.out.println("MySQLDAO  ������");
	}
	@Override
	public void prn() {
		System.out.println("MySQLDAO prn()");		
	}
}

package com.ict.edu01;

public class MySQLDAO implements DAO{
	public MySQLDAO() {
		System.out.println("MySQLDAO  default constr");
	}
	@Override
	public void prn() {
		System.out.println("MySQLDAO prn() Method");		
	}
}

package com.ict.edu02;

public class OracleDAO implements DAO{
	public OracleDAO() {
		System.out.println("OracleDAO ������");
	}
	@Override
	public void prn() {
		System.out.println("OracleDAO prn()");	
	}
}

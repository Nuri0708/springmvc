package com.ict.edu03;

public class TestMain {
	public static void main(String[] args) {
		MyProcess process = new MyProcess();
		process.prn();
		
		System.out.println("-------------------");
		
		MyProcess process2 = new MyProcess("�Ѹ�", 4);
		process2.prn();
		
		System.out.println("-------------------");
		
		MyProcess process3 = new MyProcess();
		process3.setName("����");
		process3.setAge(6);
		
		process3.prn();
	}
}

package com.ict.edu03;

public class MyProcess {
	private String name = "ȫ�浿";
	private int age = 17;
	
	public MyProcess() {
		System.out.println("MyProcess �⺻ ������");
	}
	public MyProcess(String name, int age) {
		System.out.println("MyProcess �⺻ ������ �ƴ�");
		this.name = name;
		this.age = age;
	}
	
	public void prn() {
		System.out.println("�̸� : " + name);
		System.out.println("���� : " + age);
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
	
	
}

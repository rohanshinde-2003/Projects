package com.code.entity;


public class User {
	private String name;
	private String mobile_number1;
	private String email;
	private String password;
	private String city;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMobile_Number1() {
		return mobile_number1;
	}
	public void setMobile_Number1(String mobile_number) {
		this.mobile_number1 = mobile_number;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

	
	public User(String name,  String mobile_number1,String email,String password,String city) {
		super();
		this.name = name;
		this.mobile_number1 = mobile_number1;
		this.email = email;
		this.password = password;
		this.city = city;
		
	}
//	public Customer(String name, double balance) {
//		super();
//		this.name = name;
//		this.balance = balance;
//	}
//	public Customer() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	
}

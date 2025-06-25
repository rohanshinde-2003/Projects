package com.code.entity;

import java.sql.Time;

public class PumpOwner {
	private String pump_name;
	private String email;
	private String mobile_number;
	private String password;
	private String city;
	private String taluka;
	private String district;
	private Time opening_time;
	private Time closing_time;
	private int gas_limit;
	private String status;
	
	public String getPump_Name() {
		return pump_name;
	}
	public void setPump_Name(String pump_name) {
		this.pump_name = pump_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile_Number() {
		return mobile_number;
	}
	public void setMobile_Number(String mobile_number) {
		this.mobile_number = mobile_number;
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
	public String getTaluka() {
		return taluka;
	}
	public void setTaluka(String taluka) {
		this.taluka = taluka;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public Time getOpening_time() {
		return opening_time;
	}
	public void setOpening_time(Time opening_time) {
		this.opening_time = opening_time;
	}
	public Time getClosing_time() {
		return closing_time;
	}
	public void setClosing_time(Time closing_time) {
		this.closing_time = closing_time;
	}
	public int getGas_Limit() {
		return gas_limit;
	}
	public void setGas_Limit(int gas_limit) {
		this.gas_limit = gas_limit;
	}
	public String getStatus() {
		// TODO Auto-generated method stub
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public PumpOwner(String pump_name, String email, String mobile_number,String password,String city,String taluka,String district,
			Time sqlOTime,Time sqlCTime,int gas_limit) {
		super();
		this.pump_name = pump_name;
		this.email = email;
		this.mobile_number = mobile_number;
		this.password = password;
		this.city = city;
		this.taluka = taluka;
		this.district = district;
		this.closing_time = sqlCTime;
		this.opening_time = sqlOTime;
		this.gas_limit = gas_limit;
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
	public PumpOwner() {
		// TODO Auto-generated constructor stub
	}
	
}

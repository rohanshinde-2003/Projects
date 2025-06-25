package com.code.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.code.entity.PumpOwner;
public class PumpDao {
	private Connection con;

	public PumpDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean registerPump(PumpOwner cust) {
		boolean f = false;
		try {
			cust.setStatus("pending"); 
			String sql = "insert into pump_owner (pump_name, email, mobile_number, password, city, taluka, district, opening_time, closing_time, gas_limit, status) values (?,?,?,?,?,?,?,?,?,?,?)";
					   
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cust.getPump_Name());
			ps.setString(2, cust.getEmail());
			ps.setString(3, cust.getMobile_Number());
			ps.setString(4, cust.getPassword());
			ps.setString(5, cust.getCity());
			ps.setString(6, cust.getTaluka());
			ps.setString(7, cust.getDistrict());
			ps.setTime(8, cust.getOpening_time());
			ps.setTime(9, cust.getClosing_time());
			ps.setInt(10, cust.getGas_Limit());
			ps.setString(11, cust.getStatus());
			int i = ps.executeUpdate();
			if(i>0) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
}

package com.code.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.code.dao.PumpDao;
import com.code.database.DBConnect;
import com.code.entity.PumpOwner;

/**
 * Servlet implementation class RegisterPump
 */
@WebServlet("/registerPump")
public class RegisterPumpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterPumpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    String pump_name = req.getParameter("name");
	    String email = req.getParameter("email");
	    String mobile_number = req.getParameter("mobile_number");
	    String password = req.getParameter("password");
	    String city = req.getParameter("City");
	    String taluka = req.getParameter("Taluka");
	    String district = req.getParameter("District");

	    String opening_time = req.getParameter("OTime") + ":00";  // correct way to append seconds
	    java.sql.Time sqlOTime = java.sql.Time.valueOf(opening_time);

	    String closing_time = req.getParameter("CTime") + ":00";  // correct way to append seconds
	    java.sql.Time sqlCTime = java.sql.Time.valueOf(closing_time);

	    int gas_limit = Integer.parseInt(req.getParameter("CNG"));
	    String status = req.getParameter("Status");

	    PumpOwner cust = new PumpOwner(pump_name, email, mobile_number, password, city, taluka, district, sqlOTime, sqlCTime, gas_limit);
	    PumpDao dao = new PumpDao(DBConnect.getConnection());
	    boolean f = dao.registerPump(cust);
	    HttpSession session = req.getSession();

	    if (f) {
	        session.setAttribute("succMsg", "Value Inserted Successfully");
	        resp.sendRedirect("registerPump.jsp");
	        System.out.println("Insert value Successfully");
	    } else {
	        session.setAttribute("errorMsg", "Value Not Inserted");
	        resp.sendRedirect("registerPump.jsp");
	        System.out.println("Not Inserted");
	    }
	}

	}



package com.code.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.code.dao.UserDao;
import com.code.database.DBConnect;
import com.code.entity.User;

/**
 * Servlet implementation class RegisterPump
 */
@WebServlet("/registerUser")
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUserServlet() {
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

	    String name = req.getParameter("name");
	    String mobile_number1 = req.getParameter("mobile_number1");
	    String email = req.getParameter("email");
	    String password = req.getParameter("password");
	    String city = req.getParameter("city");


	     User user= new User(name,mobile_number1,email, password, city);
	    UserDao dao = new UserDao(DBConnect.getConnection());
	    boolean f = dao.registerUser(user);
	    HttpSession session = req.getSession();

	    if (f) {
	        session.setAttribute("succMsg", "Value Inserted Successfully");
	        resp.sendRedirect("registerUser.jsp");
	        System.out.println("Insert value Successfully");
	    } else {
	        session.setAttribute("errorMsg", "Value Not Inserted");
	        resp.sendRedirect("registerUser.jsp");
	        System.out.println("Not Inserted");
	    }
	}

	}



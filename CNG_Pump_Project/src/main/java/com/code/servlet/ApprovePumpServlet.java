package com.code.servlet;

import com.code.database.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ApprovePump")
public class ApprovePumpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mobile_number =request.getParameter("mobile_number");
        try {
            Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE pump_owner SET status='approved' WHERE mobile_number=?");
            ps.setString(1, mobile_number);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("adminDashboard.jsp");
    }
}

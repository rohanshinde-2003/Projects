package com.code.servlet;

import com.code.database.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/DeletePump")
public class DeletePumpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double mobile_number =Double.parseDouble(request.getParameter("mobile_number"));
        try {
            Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM pump_owner WHERE mobile_number=?");
            ps.setDouble(1, mobile_number);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("adminDashboard.jsp");
    }
}

package com.code.servlet;

import com.code.database.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/BookSlot")
public class BookSlotServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pumpName = request.getParameter("pump_name");
        String userEmail = request.getParameter("user_email");
        String timeSlot = request.getParameter("time_slot");

        try {
            Connection con = DBConnect.getConnection();
            String sql = "INSERT INTO booking (user_email, pump_name, time_slot) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);
            ps.setString(2, pumpName);
            ps.setString(3, timeSlot);
            ps.executeUpdate();
            ps.close();
            con.close();

            request.getSession().setAttribute("successMsg", "Slot booked successfully for " + pumpName);
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMsg", "Failed to book slot.");
        }

        response.sendRedirect("userDashboard.jsp");
    }
}

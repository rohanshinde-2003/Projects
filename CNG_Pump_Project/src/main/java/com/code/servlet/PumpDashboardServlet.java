package com.code.servlet;

import com.code.database.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/PumpDashboard")
public class PumpDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String ownerEmail = (String) session.getAttribute("pump_owner_email");

        if (ownerEmail == null) {
            response.sendRedirect("pumpLogin.jsp");
            return;
        }

        try (Connection con = DBConnect.getConnection()) {

            // Get pump details
            PreparedStatement ps = con.prepareStatement("SELECT * FROM pump_owner WHERE email = ?");
            ps.setString(1, ownerEmail);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                request.setAttribute("error", "No pump found for this email.");
                request.getRequestDispatcher("pumpDashboard.jsp").forward(request, response);
                return;
            }

            String pumpName = rs.getString("pump_name");
            request.setAttribute("pump_name", pumpName);
            request.setAttribute("city", rs.getString("city"));
            request.setAttribute("taluka", rs.getString("taluka"));
            request.setAttribute("district", rs.getString("district"));
            request.setAttribute("opening_time", rs.getString("opening_time"));
            request.setAttribute("closing_time", rs.getString("closing_time"));
            request.setAttribute("gas_limit", rs.getString("gas_limit"));

            // Get bookings
            PreparedStatement bps = con.prepareStatement(
                "SELECT b.user_email, b.time_slot, b.booking_time, u.name, u.mobile_number1, u.city " +
                "FROM booking b JOIN user_data u ON b.user_email = u.email " +
                "WHERE b.pump_name = ?"
            );
            bps.setString(1, pumpName);
            ResultSet brs = bps.executeQuery();

            List<Map<String, String>> bookings = new ArrayList<>();
            while (brs.next()) {
                Map<String, String> booking = new HashMap<>();
                booking.put("user_name", brs.getString("name"));
                booking.put("user_email", brs.getString("user_email"));
                booking.put("user_mobile", brs.getString("mobile_number1"));
                booking.put("user_city", brs.getString("city"));
                booking.put("time_slot", brs.getString("time_slot"));
                booking.put("booking_time", brs.getString("booking_time"));
                bookings.add(booking);
            }

            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("pumpDashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

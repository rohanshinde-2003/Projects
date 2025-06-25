package com.code.servlet;

import com.code.database.DBConnect;
import com.code.entity.PumpOwner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/pumpLogin")
public class PumpLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT * FROM pump_owner WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login successful, set session
                PumpOwner owner = new PumpOwner();
                owner.setPump_Name(rs.getString("pump_name"));
                owner.setEmail(rs.getString("email"));
                owner.setMobile_Number(rs.getString("mobile_number"));
                owner.setCity(rs.getString("city"));
                owner.setStatus(rs.getString("status"));

                HttpSession session = request.getSession();
                session.setAttribute("pump_owner", owner);
                session.setAttribute("pump_owner_email", email);

                response.sendRedirect("PumpDashboard");
            } else {
                // Login failed
                request.setAttribute("errorMsg", "Invalid email or password");
                request.getRequestDispatcher("pumpLogin.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Server error: " + e.getMessage());
            request.getRequestDispatcher("pumpLogin.jsp").forward(request, response);
        }
    }
}

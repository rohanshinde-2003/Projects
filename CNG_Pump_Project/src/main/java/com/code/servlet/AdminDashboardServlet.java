package com.code.servlet;

import com.code.database.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT * FROM pump_data"; // fetch all pumps
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            request.setAttribute("pumpResultSet", rs);

            // Forward to JSP page to display
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);

            // Note: Do NOT close connection or ResultSet here; the JSP will consume it
            // but for production code, you'd better fetch into a list and close here.
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

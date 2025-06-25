package com.code.servlet;

import com.code.database.DBConnect;
import com.code.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT * FROM user_data WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login successful, set session
                User user = new User();
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setMobile_Number1(rs.getString("mobile_number1"));
                user.setCity(rs.getString("city"));;

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("userDashboard.jsp");
            } else {
                // Login failed
                request.setAttribute("errorMsg", "Invalid email or password");
                request.getRequestDispatcher("userLogin.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
           
        }
    }
}

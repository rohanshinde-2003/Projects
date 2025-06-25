package com.code.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cng_app",
                "root",
                "rohan"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}

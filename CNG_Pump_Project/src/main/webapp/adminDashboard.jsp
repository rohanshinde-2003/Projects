<%@ page import="java.sql.*" %>
<%@ page import="com.code.database.DBConnect" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f8;
        }
        .dashboard {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .btn-approve {
            background-color: #198754;
            color: white;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        h2 {
            color: #343a40;
        }
    </style>
</head>
<body>

<div class="container dashboard">
    <h2 class="mb-4">Admin Dashboard - Registered Pumps</h2>

    <table class="table table-bordered table-hover">
        <thead class="table-dark text-center">
            <tr>
                <th>Pump Name</th>
                <th>City</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Opening</th>
                <th>Closing</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody class="text-center">
        <%
            try {
                Connection con = DBConnect.getConnection();
                String sql = "SELECT * FROM pump_owner";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String status = rs.getString("status");
                    String mobile = rs.getString("mobile_number");
        %>
            <tr>
                <td><%= rs.getString("pump_name") %></td>
                <td><%= rs.getString("city") %></td>
                <td><%= mobile %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("opening_time") %></td>
                <td><%= rs.getString("closing_time") %></td>
                <td>
                    <span class="badge bg-<%= status.equals("approved") ? "success" : "secondary" %>">
                        <%= status %>
                    </span>
                </td>
                <td>
                    <div class="d-flex justify-content-center gap-2">
                        <% if (!status.equals("approved")) { %>
                        <form method="post" action="ApprovePump">
                            <input type="hidden" name="mobile_number" value="<%= mobile %>">
                            <button class="btn btn-approve btn-sm">Approve</button>
                        </form>
                        <% } %>
                        <form method="post" action="DeletePump">
                            <input type="hidden" name="mobile_number" value="<%= mobile %>">
                            <button class="btn btn-delete btn-sm" onclick="return confirm('Are you sure you want to delete this pump?')">Delete</button>
                        </form>
                    </div>
                </td>
            </tr>
        <%
                }
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>

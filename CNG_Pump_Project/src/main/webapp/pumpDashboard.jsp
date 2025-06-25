<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pump Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h2>Your Pump Dashboard</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="alert alert-danger"><%= error %></div>
    <%
        } else {
    %>

    <div class="card mb-4">
        <div class="card-header bg-primary text-white">Pump Details</div>
        <div class="card-body">
            <p><strong>Pump Name:</strong> <%= request.getAttribute("pump_name") %></p>
            <p><strong>City:</strong> <%= request.getAttribute("city") %></p>
            <p><strong>Taluka:</strong> <%= request.getAttribute("taluka") %></p>
            <p><strong>District:</strong> <%= request.getAttribute("district") %></p>
            <p><strong>Opening Time:</strong> <%= request.getAttribute("opening_time") %></p>
            <p><strong>Closing Time:</strong> <%= request.getAttribute("closing_time") %></p>
            <p><strong>Gas Limit:</strong> <%= request.getAttribute("gas_limit") %></p>
        </div>
    </div>

    <h4 class="mb-3">Bookings</h4>
    <table class="table table-bordered">
        <thead class="table-light">
        <tr>
            <th>User Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>City</th>
            <th>Time Slot</th>
            <th>Booking Time</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Map<String, String>> bookings = (List<Map<String, String>>) request.getAttribute("bookings");
            if (bookings == null || bookings.isEmpty()) {
        %>
            <tr><td colspan="6" class="text-center">No bookings yet.</td></tr>
        <%
            } else {
                for (Map<String, String> b : bookings) {
        %>
            <tr>
                <td><%= b.get("user_name") %></td>
                <td><%= b.get("user_email") %></td>
                <td><%= b.get("user_mobile") %></td>
                <td><%= b.get("user_city") %></td>
                <td><%= b.get("time_slot") %></td>
                <td><%= b.get("booking_time") %></td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

    <% } %>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>

<html>
<head>

<meta charset="ISO-8859-1">

<title>Vehicle CNG Booking App</title>
<style>
    /* Global Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                    url('image/cngbg.jpg');
        background-size: cover;
        background-position: center;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        color: white;
    }

    header {
        text-align: center;
        padding: 40px 20px;
        font-size: 2.5rem;
        background: rgba(0, 121, 107, 0.9);
        font-weight: bold;
        letter-spacing: 1px;
        box-shadow: 0 5px 10px rgba(0,0,0,0.3);
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 30px;
        margin: 60px auto;
        max-width: 1200px;
    }

    .box {
        background-color: rgba(255, 255, 255, 0.95);
        width: 280px;
        border-radius: 15px;
        padding: 25px;
        text-align: center;
        color: #333;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    }

    .box:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.25);
    }

    .box h2 {
        margin-bottom: 20px;
        color: #004d40;
    }

    .box a {
        display: block;
        margin: 12px 0;
        padding: 12px;
        text-decoration: none;
        background-color: #009688;
        color: white;
        border-radius: 8px;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .box a:hover {
        background-color: #00796B;
    }

    footer {
        margin-top: auto;
        padding: 20px;
        text-align: center;
        background-color: rgba(33, 33, 33, 0.95);
        color: #ccc;
        font-size: 0.95rem;
    }

    footer a {
        color: #80cbc4;
        text-decoration: none;
    }

    footer a:hover {
        text-decoration: underline;
    }

    @media (max-width: 768px) {
        .container {
            flex-direction: column;
            align-items: center;
        }
    }
</style>
</head>
<body>

<header>Welcome to Vehicle CNG Booking App</header>

<div class="container">
    <!-- Admin Section -->
    <div class="box">
        <h2>Admin</h2>
        <a href="adminlogin.jsp?role=admin">Admin Login</a>
    </div>

    <!-- User Section -->
    <div class="box">
        <h2>User</h2>
        <a href="registerUser.jsp">Register as User</a>
        <a href="userLogin.jsp?role=user">User Login</a>
    </div>

    <!-- CNG Pump Section -->
    <div class="box">
        <h2>CNG Pump</h2>
        <a href="registerPump.jsp">Register as Pump</a>
        <a href="pumpLogin.jsp?role=pump">Pump Login</a>
    </div>
</div>

<footer>
    Contact us at 
    <a href="mailto:support@cngapp.com">support@cngapp.com</a> | 
    <a href="tel:+919999999999">+91 99999 99999</a><br>
    &copy; 2025 Vehicle CNG Booking App. All rights reserved.
</footer>

</body>
</html>

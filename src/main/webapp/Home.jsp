<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FuelPro</title>
    <link rel="stylesheet" href="CSS/Home.css"> <!-- Link to external CSS file -->
</head>
<body>

    <div class="wrapper">
        <div class="header">
            <img src="${pageContext.request.contextPath}/CSS/Images/Logo.png" alt="FuelPro Logo" class="logo"> <!-- Add your logo here -->
            FuelPro
        </div>

        <div class="navbar">
            <div class="navbar-items">
                <a href="Help.jsp">Help</a>
            </div>
        </div>

        <div class="description">
            <h2>Us</h2>
            <p>FuelPro: Empowering efficient journeys, one drop at a time.</p>
        </div>

        <div class="container">
            <div class="box" onclick="window.location.href='login.jsp';">
                <h2>Sign In</h2>
                <p>→</p>
                <p>Access your account and manage your vehicle needs with ease.</p>
            </div>
            <div class="box" onclick="window.location.href='register.jsp';">
                <h2>Sign Up</h2>
                <p>→</p>
                <p>Don't have an account? Join Us!</p>
            </div>
        </div>
        
        <div class="container">
            <div class="box" onclick="window.location.href='Help.jsp';">
                <h2>Help</h2>
                <p>Need assistance? Click here!</p>
            </div>
        </div>

        <div class="footer">
            <p>&copy; 2024 FuelPro. All rights reserved.</p>
        </div>
    </div>

</body>
</html>

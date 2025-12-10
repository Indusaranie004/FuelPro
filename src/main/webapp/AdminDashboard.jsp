<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
    if(session.getAttribute("admin")==null){
    	response.sendRedirect("AdminUI.jsp");
    }
 %>       
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - View Bookings</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-container {
            margin: 50px auto;
            padding: 20px;
            background-color: #e0f7fa;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 90%;
        }
        .welcome-header {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5rem;
            font-weight: bold;
            color: #343a40;
        }
        .table-container {
            margin-top: 30px;
        }
        .table-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: #343a40;
        }
        .btn-custom {
            background-color: #343a40;
            color: white;
        }
        .navbar-custom {
            background-color: #343a40;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: white;
        }
        .logout-btn {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar with Logout Button -->
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="AdminUI.jsp">Admin Dashboard</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="logout" class="btn logout-btn">Admin Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container dashboard-container">
    <h1 class="welcome-header">Welcome to the Administrator Dashboard</h1>
    <div class="text-start">
       <a href="AdminInsert.jsp" class="btn btn-info mx-2">Add New Customer</a>
       <a href="CardGetAll" class="btn btn-info mx-2">View Payment Table</a>
    </div>

    <div class="table-container">
        <h2 class="table-title">Service Booking Data</h2>
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Booking ID</th>
                    <th scope="col">Vehicle Number</th>
                    <th scope="col">Service Type</th>
                    <th scope="col">Service Station</th>
                    <th scope="col">Date</th>
                    <th scope="col">Time</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through the inserted booking data here -->
                <c:forEach var="relist" items="${relist}">
                <tr>
                    <td>${relist.id}</td>
                    <td>${relist.vehiclenumber}</td>
                    <td>${relist.servicetype}</td>
                    <td>${relist.servicestation}</td>
                    <td>${relist.date}</td>
                    <td>${relist.time}</td>
                    <td>
                    
                        <a href="update?id=${relist.id}" class="btn btn-success btn-sm">Update</a>
                        <a href="delete?id=${relist.id}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

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
    <title>Service Booking Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            margin: 50px auto;
            padding: 20px;
            background-color: #e0f7fa; /* Light blue background */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 60%;
        }
        .welcome-header {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
            color: #343a40;
        }
        .form-title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/form-theme.css">
</head>
<body class="refill-page">
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="dashboard">Back to Dashboard</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="logout" class="btn logout-btn">Admin Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="refill-wrapper">
<div class="container form-container">
    <h1 class="welcome-header">Welcome to the Fuel-Pro Vehicle Service Booking</h1>

    <form action="insertService" >
        <h2 class="form-title">Add New Service</h2>
        <div class="mb-3">
            <label for="vehiclenumber" class="form-label">Vehicle Number</label>
            <input type="text" class="form-control" id="vehiclenumber" name="vehiclenumber" placeholder="Enter your vehicle number">
        </div>
        <div class="mb-3">
            <label for="servicetype" class="form-label">Service Type</label>
            <select class="form-select" id="servicetype" name="servicetype">
                <option selected>Select service type</option>
                <option value="General Service">General Service</option>
                <option value="Oil Change">Oil Change</option>
                <option value="Brake Inspection">Brake Inspection</option>
                <option value="Tyre Rotation">Tyre Rotation</option>
                <option value="Engine Repair">Engine Repair</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="servicestation" class="form-label">Service Station</label>
            <select class="form-select" id="servicestation" name="servicestation">
                <option selected>Select service station</option>
                <option value="Colombo">Colombo</option>
                <option value="Gampaha">Gampaha</option>
                <option value="Galle">Galle</option>
                <option value="Kandy">Kandy</option>
                <option value="Matara">Matara</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="date" class="form-label">Date</label>
            <input type="date" class="form-control" id="date" name="date">
        </div>
        <div class="mb-3">
            <label for="time" class="form-label">Time</label>
            <input type="time" class="form-control" id="time" name="time">
        </div>

        <button type="submit" class="btn btn-custom w-100">Insert Service</button>
    </form>
</div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

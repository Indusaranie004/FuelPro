<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Refill Fuel</title>
    <link rel="stylesheet" href="CSS/Refill.css">
    
</head>
<body>

    <div class="container">
        <h1>Fuel Up From Here </h1>
        <form action="RefillServlet" method="post">
            <label for="FuelStation">Select Fuel Station:</label>
            <select id="FuelStation" name="FuelStation" required>
                <option value="">--Select a Station--</option>
                <option value="City Center Fuel Station">City Center Fuel Station</option>
                <option value="Northside Gas">Northside Gas</option>
                <option value="Westend Fuel Depot">Westend Fuel Depot</option>
                <option value="East Highway Fuel">East Highway Fuel</option>
                <option value="South Valley Station">South Valley Station</option>
            </select>
            
            <label for="FuelType">Select Fuel Type:</label>
            <select id="FuelType" name="FuelType" required>
                <option value="">--Select Fuel Type--</option>
                <option value="Petrol">Petrol</option>
                <option value="Diesel">Diesel</option>
                <option value="CNG">CNG</option>
                <option value="Electric">Electric</option>
                <option value="Hybrid">Hybrid</option>
            </select>
            
            <label for="amount">Enter Amount (In Dollars):</label>
            <input type="number" id="amount" name="amount" min="1" required>
            
            <input type="submit" value="Submit">
        </form>
    </div>

</body>
</html>

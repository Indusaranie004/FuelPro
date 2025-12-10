<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Refill Fuel</title>
    <link rel="stylesheet" href="../../assets/css/Refill.css">
    
</head>
<body>

    <div class="container">
        <h1>Fuel Up From Here </h1>
        <form id="refillForm" onsubmit="handleRefill(event)">
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
        <div id="refillMessage" style="display:none; margin-top: 20px; padding: 10px; border-radius: 5px;"></div>
    </div>

    <script>
        async function handleRefill(event) {
            event.preventDefault();
            const formData = new FormData(event.target);
            
            try {
                const contextPath = '<%= request.getContextPath() %>';
                const response = await fetch(contextPath + '/api/refill/', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: new URLSearchParams(formData)
                });
                
                const data = await response.json();
                console.log('API Response:', data); // Debug log
                const messageDiv = document.getElementById('refillMessage');
                
                if (data.status === 'success') {
                    messageDiv.style.display = 'block';
                    messageDiv.style.backgroundColor = '#d4edda';
                    messageDiv.style.color = '#155724';
                    const totalPrice = data.data && data.data.totalPrice ? parseFloat(data.data.totalPrice) : 0;
                    console.log('Total Price:', totalPrice); // Debug log
                    messageDiv.textContent = 'Refill request created! Total Price: $' + totalPrice.toFixed(2);
                    setTimeout(() => {
                        window.location.href = '<%= request.getContextPath() %>/pages/user/RefillDetails.jsp?FuelStation=' + encodeURIComponent(data.data.fuelStation) + '&FuelType=' + encodeURIComponent(data.data.fuelType) + '&amount=' + encodeURIComponent(data.data.amount) + '&TotalPrice=' + encodeURIComponent(totalPrice.toFixed(2));
                    }, 1500);
                } else {
                    messageDiv.style.display = 'block';
                    messageDiv.style.backgroundColor = '#f8d7da';
                    messageDiv.style.color = '#721c24';
                    messageDiv.textContent = data.message;
                }
            } catch (error) {
                const messageDiv = document.getElementById('refillMessage');
                messageDiv.style.display = 'block';
                messageDiv.style.backgroundColor = '#f8d7da';
                messageDiv.style.color = '#721c24';
                messageDiv.textContent = 'Refill request failed. Please try again.';
            }
        }
    </script>

</body>
</html>

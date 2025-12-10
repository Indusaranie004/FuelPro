<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Refill Details</title>
    <link rel="stylesheet" href="CSS/RefillDetails.css"> <!-- Link to your CSS file -->
</head>
<body>
    <div class="container">
        <h1>Refill Request is Successful!</h1>
        <p><strong>Fuel Station:</strong> ${requestScope.RefillReq.fuelStation}</p>
        <p><strong>Fuel Type:</strong> ${requestScope.RefillReq.fuelType}</p>
        <p><strong>Total Price:</strong> $${TotalPrice}</p>

        <%
            int referenceNumber = (int)(Math.random() * 10000);
        %>
        <p><strong>Reference Number:</strong> REF<%= referenceNumber %></p>

        <!-- Cancel request form -->
        <form action="RefillServlet" method="post" onsubmit="setTimeout(redirectToRefill, 2000)">
            <input type="hidden" name="FuelStation" value="${requestScope.RefillReq.fuelStation}" />
            <input type="hidden" name="FuelType" value="${requestScope.RefillReq.fuelType}" />
            <input type="hidden" name="amount" value="${requestScope.RefillReq.amount}" />
            <input type="hidden" name="action" value="delete" />
            <button type="submit">Cancel Request</button>
        </form>

        <!-- Proceed to add cart page -->
        <form action="addcart.jsp" method="post">
            <input type="hidden" name="FuelStation" value="${requestScope.RefillReq.fuelStation}" />
            <input type="hidden" name="FuelType" value="${requestScope.RefillReq.fuelType}" />
            <input type="hidden" name="amount" value="${requestScope.RefillReq.amount}" />
            <button type="submit">Proceed to Checkout</button>
        </form>

        <!-- Message display for record deletion -->
        <c:if test="${not empty message}">
            <p class="message"><strong>${message}</strong></p>
        </c:if>
    </div>

    <script>
        function redirectToRefill() {
            window.location.href = "Refill.jsp"; // Adjust this URL as needed
        }
    </script>
</body>
</html>

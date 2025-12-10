package PaymentPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cardtype = request.getParameter("cardtype");
		String cardholdername = request.getParameter("cardholdername");
		String cardnumberStr = request.getParameter("cardnumber");
		String expmonth = request.getParameter("expmonth");
		String expyear = request.getParameter("expyear");
		String cvnStr = request.getParameter("cvn");
		String amountStr = request.getParameter("amount");

		// Convert cardnumber and cvc from String to int
		int cardnumber = 0;
		int cvn = 0;
		int amount =0;
		
		boolean istrue;

		try {
			// Remove spaces and non-numeric characters before parsing
			String cardnumberClean = cardnumberStr.replaceAll("[^0-9]", "");
			String cvnClean = cvnStr.replaceAll("[^0-9]", "");
			String amountClean = amountStr.replaceAll("[^0-9]", "");
			
			// Parse the card number cvn and amount to int
			cardnumber = Integer.parseInt(cardnumberClean);
			cvn = Integer.parseInt(cvnClean);
			amount = Integer.parseInt(amountClean);
		} catch (NumberFormatException e) {
			// Handle the case where the cardnumber cvn or amount is not a valid integer
			System.out.println("Error parsing card number CVN or Amount: " + e.getMessage());
			e.printStackTrace();
			// Optionally, redirect to an error page
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
			return; // Exit the method to prevent further processing
		}

		// Insert the data using the CardController
		istrue = CardController.insertdata(cardtype, cardholdername, cardnumber, expmonth, expyear, cvn, amount);

		if (istrue) {
			// Success message
			String alertMessage = "Payment successful!";
			response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='HomeLogged.jsp'</script>");
		} else {
			// Forward to the wrong.jsp page if insertion fails
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
		
	}

}
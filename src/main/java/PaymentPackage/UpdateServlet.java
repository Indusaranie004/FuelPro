package PaymentPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String cardtype = request.getParameter("cardtype");
        String cardholdername = request.getParameter("cardholdername");
        String cardnumberStr = request.getParameter("cardnumber");
        String expmonth = request.getParameter("expmonth");
        String expyear = request.getParameter("expyear");
        String cvnStr = request.getParameter("cvn");
        String amountStr = request.getParameter("amount");
        
        int id = 0;
        int cardnumber = 0;
        int cvn = 0;
        int amount =0;
        
		try {
            // Parse the string parameters to integers
            id = Integer.parseInt(idStr);
            cardnumber = Integer.parseInt(cardnumberStr);
            cvn = Integer.parseInt(cvnStr);
            amount  = Integer.parseInt(amountStr);
            
        } catch (NumberFormatException e) {
            // Handle parsing errors, perhaps by redirecting to an error page
            request.setAttribute("errorMessage", "Invalid input format for ID, card number, CVN, Amount");
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
            return; // Stop further processing
        }
        
        boolean istrue;
        istrue = CardController.update(id, cardtype, cardholdername, cardnumber, expmonth, expyear, cvn, amount);
        
        if (istrue ==true) {
			// Success message
        	List<CardModel> cardDetails = CardController.getById(idStr);
        	request.setAttribute("cardDetails", cardDetails );
        	
			String alertMessage = "Data update successful";
			response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='CardGetAll'</script>");
		} else {
			// Forward to the wrong.jsp page if insertion fails
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
        }
    }
}
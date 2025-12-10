package RefillCtrl;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RefillServlet")
public class RefillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String action = request.getParameter("action");
	    String FuelStation = request.getParameter("FuelStation");
	    String FuelType = request.getParameter("FuelType");
	    String Amount = request.getParameter("amount");

	    Refill RefillReq = new Refill();
	    RefillReq.setFuelStation(FuelStation);
	    RefillReq.setFuelType(FuelType);
	    RefillReq.setAmount(Integer.parseInt(Amount));

	    if ("delete".equals(action)) {
	        // Call delete method
	        try {
				RefillDBUtil.DeleteRecord(RefillReq);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        request.setAttribute("message", "Record deleted successfully.");
	    } else {
	        // Normal refill request
	        try {
	            RefillDBUtil.UpdateRefilRecord(RefillReq);
	            double TotalPrice = RefillDBUtil.CalculatePrice(Integer.parseInt(Amount), FuelType);
	            request.setAttribute("RefillReq", RefillReq);
	            request.setAttribute("TotalPrice", TotalPrice);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }

	    // Forward to the same JSP
	    RequestDispatcher dispatcher = request.getRequestDispatcher("RefillDetails.jsp");
	    dispatcher.forward(request, response);
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Refill.jsp");
		dispatcher.forward(request, response);
		
		
	}
		


}



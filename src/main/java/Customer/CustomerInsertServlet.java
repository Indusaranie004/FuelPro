package Customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CustomerInsertServlet")
public class CustomerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String vehiclenumber = request.getParameter("vehiclenumber");
	    String servicetype = request.getParameter("servicetype");
	    String servicestation = request.getParameter("servicestation");
	    String date = request.getParameter("date");
	    String time = request.getParameter("time");

	    boolean isTrue;

	    isTrue = CustomerController.insertdata(vehiclenumber, servicetype, servicestation, date, time);

	    if (isTrue) {
	        // Set request attributes for booking details
	        request.setAttribute("vehiclenumber", vehiclenumber);
	        request.setAttribute("servicetype", servicetype);
	        request.setAttribute("servicestation", servicestation);
	        request.setAttribute("date", date);
	        request.setAttribute("time", time);

	        // Forward to BookingConfirmation.jsp
	        RequestDispatcher dispatcher = request.getRequestDispatcher("BookingConfirmation.jsp");
	        dispatcher.forward(request, response);
	    } else {
	        RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
	        dis2.forward(request, response);
	    }
	}

		 
		 
	
	
	}

	



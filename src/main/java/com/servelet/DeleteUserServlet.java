package com.servelet;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDao;
import com.connection.DBConnect;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the user ID from the request
        String userIdStr = request.getParameter("userId");
        int userId = Integer.parseInt(userIdStr); // Convert the user ID to an integer

        // Database connection
        Connection connection = DBConnect.getConnection();
        UserDao userDao = new UserDao(connection);

        // Delete the user from the database
        boolean isDeleted = userDao.deleteUser(userId);

        // Invalidate the session if the user was deleted successfully
        if (isDeleted) {
            HttpSession session = request.getSession();
            session.invalidate(); // Invalidate the session
            response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login page
        } else {
            // Handle failure (e.g., log an error or notify the user)
            request.setAttribute("errorMessage", "Failed to delete the account. Please try again.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }
}

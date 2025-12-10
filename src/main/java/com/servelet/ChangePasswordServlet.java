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
import com.model.UserModel;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the form
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Get the current user from the session
        HttpSession session = request.getSession();
        UserModel currentUser = (UserModel) session.getAttribute("currentUser");

        // Check if user is logged in
        if (currentUser == null) {
            request.setAttribute("errorMessage", "You need to be logged in to change your password.");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            return;
        }

        // Database connection
        Connection connection = DBConnect.getConnection();
        UserDao userDao = new UserDao(connection);

        // Verify the current password by checking if it matches the stored password
        if (currentUser.getPassword().equals(currentPassword)) {
            if (newPassword.equals(confirmPassword)) {
                // Update the password
                boolean isUpdated = userDao.verifyUserPassword(currentUser.getUserId(), newPassword);

                if (isUpdated) {
                    // Update the password in the session object as well
                    currentUser.setPassword(newPassword);
                    session.setAttribute("currentUser", currentUser);
                    request.setAttribute("successMessage", "Password changed successfully.");
                } else {
                    request.setAttribute("errorMessage", "Failed to change password. Please try again.");
                }
            } else {
                request.setAttribute("errorMessage", "New passwords do not match.");
            }
        } else {
            request.setAttribute("errorMessage", "Current password is incorrect.");
        }

        // Forward to the change password page
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
    }
}

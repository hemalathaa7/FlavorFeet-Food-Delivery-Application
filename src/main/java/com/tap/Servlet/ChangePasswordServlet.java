package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        UserDAOImpl dao = new UserDAOImpl();

        user u = dao.getUser(userId);

        // Check current password

     // Check current password
     if (!BCrypt.checkpw(currentPassword, u.getPassword())) {

         response.getWriter().println("<script>");
         response.getWriter().println("alert('Current password is incorrect');");
         response.getWriter().println("history.back();");
         response.getWriter().println("</script>");
         return;
     }

        // Check new password confirmation
        if (!newPassword.equals(confirmPassword)) {

            response.getWriter().println("<script>");
            response.getWriter().println("alert('Passwords do not match');");
            response.getWriter().println("location='SettingsServlet';");
            response.getWriter().println("</script>");
            return;

        }

     // Encrypt the new password
        String encryptedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        u.setPassword(encryptedPassword);

        dao.UpdateUser(u);

        response.getWriter().println("<script>");
        response.getWriter().println("alert('Password changed successfully');");
        response.getWriter().println("location='ProfileServlet';");
        response.getWriter().println("</script>");
        
        
        return;
    }

}
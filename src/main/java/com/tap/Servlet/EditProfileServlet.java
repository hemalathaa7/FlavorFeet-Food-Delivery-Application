package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("user") == null){

            response.sendRedirect("login.html");
            return;

        }

        user sessionUser = (user) session.getAttribute("user");

        UserDAOImpl dao = new UserDAOImpl();

        user customer = dao.getUser(sessionUser.getUserId());

        request.setAttribute("user", customer);

        request.getRequestDispatcher("editProfile.jsp")
               .forward(request, response);

    }

}
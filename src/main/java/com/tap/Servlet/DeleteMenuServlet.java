package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteMenuServlet")
public class DeleteMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        MenuDAOImp dao = new MenuDAOImp();

        dao.deleteMenu(menuId);

        response.sendRedirect("AdminMenuServlet");
    }
}
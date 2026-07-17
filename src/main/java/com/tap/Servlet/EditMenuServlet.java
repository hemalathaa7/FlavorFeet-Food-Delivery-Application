package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImp;
import com.tap.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditMenuServlet")
public class EditMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        MenuDAOImp dao = new MenuDAOImp();

        Menu menu = dao.getMenu(menuId);

        request.setAttribute("menu", menu);

        request.getRequestDispatcher("editMenu.jsp")
               .forward(request, response);

    }

}
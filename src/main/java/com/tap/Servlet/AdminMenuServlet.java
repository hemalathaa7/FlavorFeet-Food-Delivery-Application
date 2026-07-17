package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDAOImp;
import com.tap.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminMenuServlet")
public class AdminMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        MenuDAOImp menuDAO = new MenuDAOImp();

        List<Menu> menuList = menuDAO.getAllMenu();

        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("manageMenu.jsp")
               .forward(request, response);

    }

}
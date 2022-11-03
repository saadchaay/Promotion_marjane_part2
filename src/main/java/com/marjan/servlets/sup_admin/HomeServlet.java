package com.marjan.servlets.sup_admin;

import com.marjan.controllers.UsersController;
import com.marjan.dao.StoresDao;
import com.marjan.helpers.Enum;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "HomeServlet", value = "/general/dashboard")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("admins", UsersController.admins());
        request.setAttribute("stores", new StoresDao().all());
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String store = request.getParameter("store");
        if(UsersController.addUser(name, Enum.role.ADMIN.toString(), email, password, (long) Integer.parseInt(store))){
            request.setAttribute("feedback", "success");
        } else {
            request.setAttribute("feedback", "error");
        }
        response.sendRedirect("/general/dashboard");
    }
}

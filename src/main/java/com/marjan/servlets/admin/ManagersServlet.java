package com.marjan.servlets.admin;

import com.marjan.controllers.UsersController;
import com.marjan.entities.Users;
import com.marjan.helpers.Enum;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ManagersServlet", value = "/admin/new-manager")
public class ManagersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter p = response.getWriter();
        p.println("hello jilkjollk");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        String name = request.getParameter("name");
//        int storeId = ((Users)session.getAttribute("loggedIn")).getStoreId();
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        String role = Enum.role.MANAGER.toString();
//        System.out.println(name);
//        System.out.println(email);
//        System.out.println(password);
//        System.out.println(storeId);
//        System.out.println(role);
//        if(UsersController.addUser(name, role, email, password, (long) storeId)){
//            response.sendRedirect("/admin/");
//        }else{
//            request.setAttribute("error", "cannot add new manager, try again.");
//            request.getRequestDispatcher("/users/index.jsp").forward(request, response);
//        }
    }
}

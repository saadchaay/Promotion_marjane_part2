package com.marjan.servlets.auth;

import com.marjan.controllers.AuthController;
import com.marjan.controllers.PromoController;
import com.marjan.entities.SupAdmin;
import com.marjan.entities.Users;
import com.marjan.helpers.Enum;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Objects;
import java.util.Optional;

@WebServlet(name = "AuthServlet", value = "/authentication")
public class AuthServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String roleSession = (String) session.getAttribute("role");
        if(session.getAttribute("loggedIn") != null){
            System.out.println(roleSession);
            switch (roleSession){
                case "general-admin" -> response.sendRedirect("/general/dashboard");
                case "admin" -> response.sendRedirect("/admin/welcome");
                case "manager" -> response.sendRedirect("user/welcome");
            }
        }else{
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String role = request.getParameter("role");
        String pwd = request.getParameter("password");
        String login = "general-admin".equals(role) ? request.getParameter("username"):request.getParameter("email");
        PromoController.expiredPromo();
        switch (role){
            case "general-admin" -> {
                SupAdmin admin = AuthController.isAdminAuth(login, pwd);
                if(admin != null){
                    session.setAttribute("role", role);
                    session.setAttribute("loggedIn", admin);
                    response.sendRedirect("/general/dashboard");
                }else{
                    request.setAttribute("error", "error");
                    request.getRequestDispatcher("/authentication").forward(request, response);
                }
            }
            case "admin", "manager" -> {
                Users user = AuthController.isUserAuth(login, pwd);
                if(user != null){
                    session.setAttribute("role", role);
                    session.setAttribute("loggedIn", user);
                    if(role.equals("admin"))
                        response.sendRedirect("/admin/");
                    else response.sendRedirect("/user/welcome");
                }else{
                    request.setAttribute("error", "error");
                    request.getRequestDispatcher("/authentication").forward(request, response);
                }
            }
        }
    }
}

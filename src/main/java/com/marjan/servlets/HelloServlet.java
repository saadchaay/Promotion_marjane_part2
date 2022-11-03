package com.marjan.servlets;

import java.io.*;

import com.marjan.controllers.UsersController;
import com.marjan.dao.UsersDao;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        System.out.println(role);
        switch (role){
            case "general-admin" -> response.sendRedirect("/general/dashboard");
            case "admin" -> response.sendRedirect("/admin/");
            case "manager" -> response.sendRedirect("user/welcome");
        }
    }

    public void destroy() {
    }
}
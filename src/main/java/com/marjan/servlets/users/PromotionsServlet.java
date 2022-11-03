package com.marjan.servlets.users;

import com.marjan.controllers.PromoController;
import com.marjan.entities.Users;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PromotionsServlet", value = "/user/welcome")
public class PromotionsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        int storeId = ((Users)session.getAttribute("loggedIn")).getStoreId();
        System.out.println(storeId);
        request.setAttribute("promotions", PromoController.listPendingPromotions((long) storeId));
        request.getRequestDispatcher("/users/promotions.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

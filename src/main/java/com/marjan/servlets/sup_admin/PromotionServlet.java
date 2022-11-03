package com.marjan.servlets.sup_admin;

import com.marjan.controllers.PromoController;
import com.marjan.dao.PromotionsDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "PromotionServlet", value = "/general/promotion")
public class PromotionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setAttribute("promotions", new PromotionsDao().all());
        request.getRequestDispatcher("/admin/promotion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

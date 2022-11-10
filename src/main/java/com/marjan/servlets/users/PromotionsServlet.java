package com.marjan.servlets.users;

import com.marjan.controllers.PromoController;
import com.marjan.entities.Promotions;
import com.marjan.entities.Users;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "PromotionsServlet", value = "/user/welcome")
public class PromotionsServlet extends HttpServlet {

    static boolean accept = false;
    static boolean reject = false;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        int storeId = ((Users)session.getAttribute("loggedIn")).getStoreId();
        List<Promotions> promos = PromoController.listPendingPromotions((long) storeId);
        request.setAttribute("accept", accept);
        request.setAttribute("reject", reject);
        accept = false;
        reject = false;
        if(promos != null) {
            request.setAttribute("promotions", promos);
            request.getRequestDispatcher("/users/promotions.jsp").forward(request, response);
        }else{
            request.setAttribute("emptyListPromo", true);
            request.getRequestDispatcher("/users/promotions.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int promoID = Integer.parseInt(request.getParameter("promo"));
        switch (action){
            case "accept" -> acceptPromotion(promoID, request, response);
            case "reject" -> rejectPromotion(promoID, request, response);
        }
    }

    public void acceptPromotion(int id, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if(PromoController.acceptPromotion((long) id, req.getParameter("comment")) != null){
            accept = true;
        }
        res.sendRedirect("/user/welcome");
    }

    public void rejectPromotion(int id, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if(PromoController.refusePromotion((long) id) != null){
            reject = true;
        }
        res.sendRedirect("/user/welcome");
    }
}

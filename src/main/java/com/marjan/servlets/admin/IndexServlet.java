package com.marjan.servlets.admin;

import com.marjan.controllers.PromoController;
import com.marjan.controllers.UsersController;
import com.marjan.dao.CategoriesDao;
import com.marjan.dao.PromotionsDao;
import com.marjan.dao.StoresDao;
import com.marjan.dao.SubCategoriesDao;
import com.marjan.entities.Promotions;
import com.marjan.entities.Users;
import com.marjan.helpers.Enum;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Objects;

@WebServlet(name = "IndexServlet", value = "/admin/")
public class IndexServlet extends HttpServlet {

    static HashMap<String, Boolean> feedback = new HashMap<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("role"));
        if(Objects.equals(session.getAttribute("role").toString(), "admin")){
            Users admin = (Users) session.getAttribute("loggedIn");
            request.setAttribute("stores", new StoresDao().all());
            request.setAttribute("managers", UsersController.listUserByStore((long) admin.getStoreId()));
            request.setAttribute("promotions", PromoController.listPromotions((long) admin.getStoreId()));
            request.setAttribute("categories", new CategoriesDao().all());
            request.setAttribute("subCategories", new SubCategoriesDao().all());
            request.getRequestDispatcher("/users/index.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("/users/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        switch (request.getParameter("action")){
            case "promo" -> addNewPromotion(session, request, response);
            case "manager" -> addNewManager(session, request, response);
            case "delete" -> deletePromo(Integer.parseInt(request.getParameter("promo")), request, response);
        }
    }

    public void addNewPromotion(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Promotions newPromo = new Promotions();
        String typeCategory = request.getParameter("typeCategory");
        newPromo.setValue(Integer.parseInt(request.getParameter("promoValue")));
        newPromo.setTypeId(typeCategory);
        newPromo.setStartDate(Date.valueOf(request.getParameter("startDate")));
        newPromo.setEndDate(Date.valueOf(request.getParameter("endDate")));
        newPromo.setStoreId(((Users)session.getAttribute("loggedIn")).getStoreId());
        if(Objects.equals(typeCategory, Enum.idType.SUP_CATEGORY.toString())){
            newPromo.setSupCateId(Integer.parseInt(request.getParameter("category")));
        }else{
            newPromo.setCategoryId(Integer.parseInt(request.getParameter("category")));
        }
        if(PromoController.addPromotion(newPromo)){
            feedback.put("newPromo", true);
        }else{
            feedback.put("errorNewPromo", true);
        }
        response.sendRedirect("/admin/");

    }

    public void addNewManager(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int storeId = ((Users)session.getAttribute("loggedIn")).getStoreId();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = Enum.role.MANAGER.toString();
        System.out.println(name);
        System.out.println(email);
        System.out.println(password);
        System.out.println(storeId);
        System.out.println(role);
        if(UsersController.addUser(name, role, email, password, (long) storeId)){
            feedback.put("newManager", true);
        }else{
            feedback.put("errorNewManager", true);
        }
        response.sendRedirect("/admin/");
    }

    public void deletePromo(int promoId, HttpServletRequest req, HttpServletResponse res) throws IOException {
        if(new PromotionsDao().delete((long) promoId)){
            feedback.put("delete", true);
        }else{
            feedback.put("errorDelete", true);
        }
        res.sendRedirect("/admin/");
    }

}

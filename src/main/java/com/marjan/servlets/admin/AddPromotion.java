package com.marjan.servlets.admin;

import com.marjan.controllers.PromoController;
import com.marjan.entities.Promotions;
import com.marjan.entities.Users;
import com.marjan.helpers.Enum;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.util.Objects;

@WebServlet(name = "AddPromotion", value = "/admin/promotions")
public class AddPromotion extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

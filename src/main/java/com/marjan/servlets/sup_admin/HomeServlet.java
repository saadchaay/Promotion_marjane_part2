package com.marjan.servlets.sup_admin;

import com.marjan.controllers.StatisticController;
import com.marjan.controllers.StoresController;
import com.marjan.controllers.UsersController;
import com.marjan.dao.StoresDao;
import com.marjan.helpers.Enum;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "HomeServlet", value = "/general/dashboard")
public class HomeServlet extends HttpServlet {

    static boolean success = false;
    static boolean error = false;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(Objects.equals(request.getParameter("action"), "details")){
            int storeID = Integer.parseInt(request.getParameter("admin"));
//            System.out.println("this id admin: \t"+request.getParameter("admin"));
            request.setAttribute("details", true);
            request.setAttribute("admin", StatisticController.getAdminByStore(storeID));
            request.setAttribute("countManagers", StatisticController.countManagerByStore(storeID));
            request.setAttribute("promoStatistic", StatisticController.promoStatisticByStore(storeID));
        }
        request.setAttribute("admins", UsersController.admins());
        request.setAttribute("stores", StoresController.getFreeStores());
        request.setAttribute("statistic", StatisticController.promoStatisticGenAdmin());
        request.setAttribute("success", success);
        request.setAttribute("error", error);
        success = false;
        error = false;
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String store = request.getParameter("store");
        if(UsersController.addUser(name, Enum.role.ADMIN.toString(), email, password, (long) Integer.parseInt(store))){
            success = true;
        } else {
            error = true;
        }
        response.sendRedirect("/general/dashboard");
    }
}

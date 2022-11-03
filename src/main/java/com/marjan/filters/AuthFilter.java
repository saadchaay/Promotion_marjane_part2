package com.marjan.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "AuthFilter", value = "/*")
public class AuthFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        String url = req.getRequestURL().toString();

        if(url.contains("authentication") && session.getAttribute("loggedIn") == null){
            chain.doFilter(request, response);
            return;
        }

        if(session.getAttribute("loggedIn") == null){
            res.sendRedirect("/authentication");
        }else {
            String role = (String) session.getAttribute("role");
            switch (role){
                case "general-admin" -> {
                    if(url.contains("user") || url.contains("admin")){
                        req.getRequestDispatcher("/unauthorized.jsp").forward(request, response);
                    }else{
                        chain.doFilter(request, response);
                        return;
                    }
                }
                case "admin" -> {
                    if(url.contains("user") || url.contains("general")){
                        req.getRequestDispatcher("/unauthorized.jsp").forward(request, response);
                    }else {
                        chain.doFilter(request, response);
                        return;
                    }
                }
                case "manager" -> {
                    if(url.contains("general") || url.contains("admin")){
                        req.getRequestDispatcher("/unauthorized.jsp").forward(request, response);
                    }else{
                        chain.doFilter(request, response);
                        return;
                    }
                }
            }
            chain.doFilter(request, response);
        }
    }


}

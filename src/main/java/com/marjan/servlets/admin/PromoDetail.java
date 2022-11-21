package com.marjan.servlets.admin;

import com.marjan.dao.CommentsDao;
import com.marjan.dao.PromotionsDao;
import com.marjan.entities.Comments;
import com.marjan.entities.Promotions;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet(name = "PromoDetail", urlPatterns = "/admin/promo/*")
public class PromoDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = String.valueOf(request.getRequestURL());
        int id = Integer.parseInt(url.split("/")[url.split("/").length-1]);
        Optional<Promotions> promo = new PromotionsDao().findById((long) id);
        assert promo.isPresent();
        List<Comments> comments = new CommentsDao().all().stream()
                .filter(c -> c.getPromotionId() == promo.get().getId())
                .collect(Collectors.toList());
        request.setAttribute("promo", promo.get());
        request.setAttribute("comment", comments.size() > 0 ? comments.get(0):null);
        request.getRequestDispatcher("/users/details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

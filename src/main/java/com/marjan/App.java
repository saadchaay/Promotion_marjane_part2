package com.marjan;

import com.marjan.controllers.PromoController;
import com.marjan.controllers.StatisticController;
import com.marjan.controllers.StoresController;
import com.marjan.dao.PromotionsDao;
import com.marjan.entities.Promotions;
import com.marjan.entities.Stores;

public class App {
    public static void main(String[] args) {
//        for (Stores s: StoresController.getFreeStores()){
//            System.out.println(s.getName());
//        }
//        System.out.println(StatisticController.promoStatisticGenAdmin().get("accepted"));
//        PromoController.expiredPromo();
        Promotions p = new PromotionsDao().findById(8L).orElse(null);
        assert p != null;
        p.setStatus("EXPIRED");
        new PromotionsDao().update(8L, p);
    }
}

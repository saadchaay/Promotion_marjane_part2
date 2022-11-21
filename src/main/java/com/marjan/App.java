package com.marjan;

import com.marjan.controllers.PromoController;
import com.marjan.controllers.StatisticController;
import com.marjan.controllers.StoresController;
import com.marjan.dao.PromotionsDao;
import com.marjan.entities.Promotions;
import com.marjan.entities.Stores;
import com.marjan.helpers.JPA;
import jakarta.persistence.EntityManagerFactory;

public class App {
    public static void main(String[] args) {
        System.out.println(JPA.getEntityManager());
    }
}

package com.marjan.controllers;

import com.marjan.dao.PromotionsDao;
import com.marjan.dao.StoresDao;
import com.marjan.dao.UsersDao;
import com.marjan.entities.Stores;
import com.marjan.entities.Users;
import com.marjan.helpers.Enum;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

public class StatisticController {

    public static HashMap<String, Integer> promoStatisticGenAdmin(){
        HashMap<String, Integer> statistic = new HashMap<>();
        statistic.put("accepted",(int) new PromotionsDao().all().stream()
                .filter(p -> Objects.equals(p.getStatus(), Enum.status.ACCEPTED.toString())).count());
        statistic.put("rejected", (int) new PromotionsDao().all().stream()
                .filter(p -> Objects.equals(p.getStatus(), Enum.status.REJECTED.toString())).count());
        statistic.put("pending", (int) new PromotionsDao().all().stream()
                .filter(p -> Objects.equals(p.getStatus(), Enum.status.PENDING.toString())).count());
        statistic.put("expired", (int) new PromotionsDao().all().stream()
                .filter(p -> Objects.equals(p.getStatus(), Enum.status.EXPIRED.toString())).count());
        return statistic;
    }

    public static HashMap<String, Integer> promoStatisticByStore(int storeID){
        HashMap<String, Integer> statistic = new HashMap<>();
        statistic.put("accepted",(int) new PromotionsDao().all().stream()
                .filter(p -> p.getStoreId() == storeID)
                .filter(p -> Objects.equals(p.getStatus(), Enum.status.ACCEPTED.toString())).count());
        statistic.put("rejected", (int) new PromotionsDao().all().stream()
                .filter(p -> p.getStoreId() == storeID)
                .filter(p -> Objects.equals(p.getStatus(), Enum.status.REJECTED.toString())).count());
        statistic.put("pending", (int) new PromotionsDao().all().stream()
                .filter(p -> p.getStoreId() == storeID)
                .filter(p -> Objects.equals(p.getStatus(), Enum.status.PENDING.toString())).count());
        statistic.put("expired", (int) new PromotionsDao().all().stream()
                .filter(p -> p.getStoreId() == storeID)
                .filter(p -> Objects.equals(p.getStatus(), Enum.status.EXPIRED.toString())).count());
        return statistic;
    }

    public static Users getAdminByStore(int storeID){
        return new UsersDao().all().stream()
                .filter(a -> a.getStoreId() == storeID)
                .filter(a -> Objects.equals(a.getRole(), Enum.role.ADMIN.toString()))
                .collect(Collectors.toList()).get(0);
    }

    public static int countManagerByStore(int storeID){
        return (int) new UsersDao().all().stream()
                .filter(user -> user.getStoreId() == storeID)
                .filter(user -> Objects.equals(user.getRole(), Enum.role.MANAGER.toString())).count();
    }
}

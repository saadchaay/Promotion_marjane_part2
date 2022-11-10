package com.marjan.controllers;

import com.marjan.dao.StoresDao;
import com.marjan.dao.UsersDao;
import com.marjan.entities.Stores;
import com.marjan.entities.Users;

import java.util.List;
import java.util.stream.Collectors;

public class StoresController {

    public static List<Stores> getFreeStores(){
        List<Stores> freeStores = new StoresDao().all();
        for (Users user: UsersController.admins())
            freeStores = freeStores.stream()
                    .filter(s -> s.getId() != user.getStoreId())
                    .collect(Collectors.toList());
        return freeStores;
    }
}

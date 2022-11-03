package com.marjan;

import com.marjan.controllers.UsersController;
import com.marjan.dao.StoresDao;
import com.marjan.dao.UsersDao;
import com.marjan.entities.Stores;
import com.marjan.entities.Users;
import com.marjan.helpers.Enum;

public class App {
    public static void main(String[] args) {
        Users user = new Users();
        user.setName("Fadwkd ulike");
        user.setRole(Enum.role.ADMIN.toString());
        user.setEmail("fadw39@gmail.com");
        user.setPassword("fadw1234");
        user.setStoreId(4);
//        if(new UsersDao().save(user) != null){
//            System.out.println("add success");
//        }else{
//            System.out.println("add nothing");
//        }
        if( UsersController.addUser(
                user.getName(),
                Enum.role.ADMIN.toString(),
                user.getEmail(),
                user.getPassword(),
                (long) user.getStoreId()
        )){
            System.out.println("add nice");
        } else {
            System.out.println("Nopp");
        }
    }
}

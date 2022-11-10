package com.marjan.controllers;

import com.marjan.dao.UsersDao;
import com.marjan.entities.Users;
import com.marjan.helpers.Enum;
import com.marjan.security.Hash;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class UsersController {

    public static List<Users> admins(){
        return new UsersDao().all().stream()
                .filter( user ->  Objects.equals(user.getRole(),"ADMIN"))
                .collect(Collectors.toList());
    }

    public static Boolean addUser(String name, String role, String email, String password, Long storeId){
        List<Users> users = new UsersDao().all();
        if(checkEmailExists(users, email)){
            return false;
        } else {
            if(role.equals(Enum.role.ADMIN.toString()))
                for (Users user: users){
                    if((long)user.getStoreId() == storeId && user.getRole().equals(role)) {
                        System.out.println("same admin with same store id");
                        return false;
                    }
                }
            Users newUser = new Users();
            newUser.setName(name);
            newUser.setEmail(email);
            newUser.setPassword(Hash.getHashedPassword(password));
            newUser.setStoreId(Math.toIntExact(storeId));
            newUser.setRole(role);
            // sending email .....
//            SendMail.sendAccountInfos(email, customMessage(name, email, password));
            return new UsersDao().save(newUser) != null;
        }
    }

    public  static List<Users> listUserByStore(Long storeId){
        return new UsersDao().all().stream()
                .filter(user -> Objects.equals(user.getRole(),"MANAGER"))
                .filter(user -> user.getStoreId() == storeId)
                .collect(Collectors.toList());
    }

    public static Boolean checkEmailExists(List<Users> users, String email){
        for (Users user: users){
            if (Objects.equals(email, user.getEmail())) {
                return true;
            }
        }
        return false;
    }

    public static String customMessage(String name, String email, String password){
        return  "Hello "+ name +",\n\nWell, your account has created successfully. \n" +
                "\nAccount information to login: \n\n" +
                "\t\tEmail:   "+ email + "\n\t\tPassword:   " + password + "\n\n\nMarjan Service.\nThanks.";
    }

}

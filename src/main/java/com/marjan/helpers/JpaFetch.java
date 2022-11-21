package com.marjan.helpers;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

import java.util.function.Consumer;

public class JpaFetch {

//    private static final EntityManagerFactory entityManagerFactory;
//    static {
//        entityManagerFactory = Persistence.createEntityManagerFactory("default");
//    }

    public static EntityManager getEm(){
//        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
//        System.out.println(JPA.getEmf().createEntityManager());
        return JPA.getEntityManager();
    }
}

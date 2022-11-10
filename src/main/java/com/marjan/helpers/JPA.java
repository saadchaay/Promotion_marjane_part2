package com.marjan.helpers;

import jakarta.persistence.*;

import java.util.function.Consumer;

public class JPA {

    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;

    static {
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
        entityManager = entityManagerFactory.createEntityManager();
    }

    public static void trans(Consumer<EntityManager> action){
        EntityTransaction tr = entityManager.getTransaction();
        try {
            tr.begin();
            action.accept(entityManager);
            tr.commit();
        }catch (RuntimeException re){
            tr.rollback();
            throw re;
        }
    }

    public static EntityManagerFactory getEmf(){
        return entityManagerFactory;
    }


}

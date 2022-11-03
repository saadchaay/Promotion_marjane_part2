package com.marjan.dao;

import com.marjan.entities.Promotions;
import com.marjan.helpers.JPA;
import jakarta.persistence.Query;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

public class PromotionsDao implements Dao<Promotions>{
    @Override
    public Optional<Promotions> findById(Long id) {
        return Optional.ofNullable(JPA.getEm().find(Promotions.class, id));
    }

    @Override
    public Promotions save(Promotions promotion) {
        JPA.trans(entityManager -> entityManager.persist(promotion));
        return promotion;
    }

    @Override
    public List<Promotions> all() {
        return JPA.getEm().createQuery("from Promotions ", Promotions.class).getResultList();
    }

    @Override
    public Boolean update(Long id, Promotions promotion) {
        AtomicReference<Boolean> val = new AtomicReference<>(false);
        JPA.trans(entityManager -> {
            Query qry = entityManager.createQuery("UPDATE Promotions set status = :status " + "WHERE id = :promoId");
            qry.setParameter("status", promotion.getStatus());
            qry.setParameter("promoId", id);
            val.set(true);
        });
        return val.get();
    }

    @Override
    public Boolean delete(Long id) {
        AtomicReference<Boolean> val = new AtomicReference<>(false);
        findById(id).ifPresent(
                promotion -> {
                    JPA.trans(entityManager -> entityManager.remove(promotion));
                    val.set(true);
                });
        return val.get();
    }
}

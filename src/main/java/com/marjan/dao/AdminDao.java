package com.marjan.dao;

import com.marjan.entities.SupAdmin;
import com.marjan.helpers.JPA;
import com.marjan.helpers.JpaFetch;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

public class AdminDao implements Dao<SupAdmin> {

    @Override
    public Optional<SupAdmin> findById(Long id) {
        return Optional.ofNullable(JpaFetch.getEm().find(SupAdmin.class, id));
    }

    @Override
    public SupAdmin save(SupAdmin admin) {
        JPA.trans(entityManager -> entityManager.persist(admin));
        return admin;
    }

    @Override
    public List<SupAdmin> all() {
        return JpaFetch.getEm().createQuery("from SupAdmin ", SupAdmin.class).getResultList();
    }

    @Override
    public Boolean update(Long id, SupAdmin admin) {
        return null;
    }

    @Override
    public Boolean delete(Long id) {
        AtomicReference<Boolean> val = new AtomicReference<>(false);
        findById(id).ifPresent(
                admin -> {
                    JPA.trans(entityManager -> entityManager.remove(admin));
                    val.set(true);
                });
        return val.get();
    }

}

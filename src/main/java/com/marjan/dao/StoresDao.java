package com.marjan.dao;

import com.marjan.entities.Stores;
import com.marjan.helpers.JPA;
import com.marjan.helpers.JpaFetch;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

public class StoresDao implements Dao<Stores> {

    @Override
    public Optional<Stores> findById(Long id) {
        return Optional.ofNullable(JpaFetch.getEm().find(Stores.class, id));
    }

    @Override
    public Stores save(Stores store) {
        JPA.trans(entityManager -> entityManager.persist(store));
        return store;
    }

    @Override
    public List<Stores> all() {
        return JpaFetch.getEm().createQuery("from Stores ", Stores.class).getResultList();
    }

    @Override
    public Boolean update(Long id, Stores store) {
        return null;
    }

    @Override
    public Boolean delete(Long id) {
        AtomicReference<Boolean> val = new AtomicReference<>(false);
        findById(id).ifPresent(
                store -> {
                    JPA.trans(entityManager -> entityManager.remove(store));
                    val.set(true);
                });
        return val.get();
    }

}

package com.marjan.dao;

import com.marjan.entities.Categories;
import com.marjan.helpers.JPA;
import com.marjan.helpers.JpaFetch;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

public class CategoriesDao implements Dao<Categories>{

    @Override
    public Optional<Categories> findById(Long id) {
        return Optional.ofNullable(JpaFetch.getEm().find(Categories.class, id));
    }

    @Override
    public Categories save(Categories category) {
        JPA.trans(entityManager -> entityManager.persist(category));
        return category;
    }

    @Override
    public List<Categories> all() {
        return JpaFetch.getEm().createQuery("from Categories ", Categories.class).getResultList();
    }

    @Override
    public Boolean update(Long id, Categories subCategory) {
        return null;
    }

    @Override
    public Boolean delete(Long id) {
        AtomicReference<Boolean> val = new AtomicReference<>(false);
        findById(id).ifPresent(
                category -> {
                    JPA.trans(entityManager -> entityManager.remove(category));
                    val.set(true);
                });
        return val.get();
    }

}

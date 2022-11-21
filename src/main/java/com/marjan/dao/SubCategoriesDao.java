package com.marjan.dao;

import com.marjan.entities.SubCategories;
import com.marjan.helpers.JPA;
import com.marjan.helpers.JpaFetch;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

public class SubCategoriesDao implements Dao<SubCategories>{

    @Override
    public Optional<SubCategories> findById(Long id) {
        return Optional.ofNullable(JPA.getEntityManager().find(SubCategories.class, id));
    }

    @Override
    public SubCategories save(SubCategories subCategory) {
        JPA.trans(entityManager -> entityManager.persist(subCategory));
        return subCategory;
    }

    @Override
    public List<SubCategories> all() {
        return JPA.getEntityManager().createQuery("from SubCategories ", SubCategories.class).getResultList();
    }

    @Override
    public Boolean update(Long id, SubCategories subCategory) {
        return null;
    }

    @Override
    public Boolean delete(Long id) {
        AtomicReference<Boolean> val = new AtomicReference<>(false);
        findById(id).ifPresent(
                subCategory -> {
                    JPA.trans(entityManager -> entityManager.remove(subCategory));
                    val.set(true);
                });
        return val.get();
    }

}

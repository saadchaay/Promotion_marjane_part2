package com.marjan.dao;

import com.marjan.entities.Comments;
import com.marjan.helpers.JPA;
import com.marjan.helpers.JpaFetch;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

public class CommentsDao implements Dao<Comments>{

    @Override
    public Optional<Comments> findById(Long id) {
        return Optional.ofNullable(JpaFetch.getEm().find(Comments.class, id));
    }

    @Override
    public Comments save(Comments comment) {
        JPA.trans(entityManager -> entityManager.persist(comment));
        return comment;
    }

    @Override
    public List<Comments> all() {
        return JpaFetch.getEm().createQuery("from Comments ", Comments.class).getResultList();
    }

    @Override
    public Boolean update(Long id, Comments subCategory) {
        return null;
    }

    @Override
    public Boolean delete(Long id) {
        AtomicReference<Boolean> val = new AtomicReference<>(false);
        findById(id).ifPresent(
                comment -> {
                    JPA.trans(entityManager -> entityManager.remove(comment));
                    val.set(true);
                });
        return val.get();
    }

}

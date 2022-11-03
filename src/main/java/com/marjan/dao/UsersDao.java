package com.marjan.dao;

import com.marjan.entities.Users;
import com.marjan.helpers.JPA;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

public class UsersDao implements Dao<Users> {

    @Override
    public Optional<Users> findById(Long id) {
        return Optional.ofNullable(JPA.getEm().find(Users.class, id));
    }

    @Override
    public Users save(Users user) {
        JPA.trans(entityManager -> {
            entityManager.persist(user);
//            entityManager.merge(user);
        });
        return user;
    }

    @Override
    public List<Users> all() {
        return JPA.getEm().createQuery("from Users ", Users.class).getResultList();
    }

    @Override
    public Boolean update(Long id, Users users) {
        return null;
    }

    @Override
    public Boolean delete(Long id) {
        AtomicReference<Boolean> val = new AtomicReference<>(false);
        findById(id).ifPresent(
                user -> {
                    JPA.trans(entityManager -> entityManager.remove(user));
                    val.set(true);
                });
        return val.get();
    }
}

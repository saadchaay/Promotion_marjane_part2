package com.marjan.controllers;

import com.marjan.dao.CategoriesDao;
import com.marjan.dao.CommentsDao;
import com.marjan.dao.PromotionsDao;
import com.marjan.dao.SubCategoriesDao;
import com.marjan.entities.*;
import com.marjan.helpers.Enum;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

public class PromoController {

    public static List<Promotions> listPromotions(Long storeId){
        return new PromotionsDao().all().stream()
                .filter(promo -> promo.getStoreId() == storeId)
                .filter(promo -> promo.getEndDate().toLocalDate().isAfter(LocalDate.now()))
                .collect(Collectors.toList());
    }

    public static List<Promotions> listPendingPromotions(Long storeId){
//        if(LocalTime.now().isAfter(LocalTime.of(8,0,0)) && LocalTime.now().isBefore(LocalTime.of(12,0,0))){
            return new PromotionsDao().all().stream()
                    .filter(promo ->  promo.getStoreId() == storeId)
                    .filter(promo -> Objects.equals(promo.getStatus(), Enum.status.PENDING.toString()))
                    .collect(Collectors.toList());
//        }else{
//            return null;
//        }
    }

    public static Boolean addPromotion(Promotions promo) {
        AtomicReference<Boolean> returnStatus = new AtomicReference<>(false);
        if(checkTypeIdIsSupCategory(promo.getTypeId())){
            Optional<SubCategories> supCategory = new SubCategoriesDao().findById((long) promo.getSupCateId());
            supCategory.ifPresent(s -> {
                promo.setCategoryId(s.getCategoryId());
            });
        }
        Optional<Categories> category = new CategoriesDao().findById((long) promo.getCategoryId());
        category.ifPresent(c -> {
            if (!(promo.getValue() > 20 && c.getName().equalsIgnoreCase("multimedia"))) {
                returnStatus.set(true);
            }
        });
        promo.setLoyaltyValue(promo.getValue() * 10);
        promo.setStatus(Enum.status.PENDING.toString());
        return returnStatus.get() && new PromotionsDao().save(promo) != null;
    }

    // check type id, if equals sup_category, this function should return the id category by sup_category
    public static Boolean checkTypeIdIsSupCategory(String typeId){
        return Objects.equals(typeId, Enum.idType.SUP_CATEGORY.toString());
    }

    // accept the promotion by manager
    public static Comments acceptPromotion(Long id, String commentToAdd){
        AtomicReference<Comments> comment = new AtomicReference<>(null);
        PromotionsDao promotionsDao = new PromotionsDao();
        Optional<Promotions> prm = promotionsDao.findById(id);
        assert prm.isPresent();
        System.out.println("promo to update: "+prm.get().getId());
        prm.ifPresent(pr -> {
            if(Objects.equals(pr.getStatus(), Enum.status.PENDING.toString())) {
                pr.setStatus(Enum.status.ACCEPTED.toString());
                if (promotionsDao.update((long) pr.getId(), pr)) {
                    Comments cmt = new Comments();
                    cmt.setPromotionId(pr.getId());
                    cmt.setComment(commentToAdd);
                    comment.set(new CommentsDao().save(cmt));
                }
            }
        });
        return comment.get();
    }
    
    // refuse the promotion by manager
    public static Boolean refusePromotion(Long id){
        AtomicReference<Boolean> rtnValue = new AtomicReference<>(false);
        PromotionsDao promotionsDao = new PromotionsDao();
        Optional<Promotions> prm = promotionsDao.findById(id);
        prm.ifPresent(pr -> {
            if(Objects.equals(pr.getStatus(), Enum.status.PENDING.toString())) {
                pr.setStatus(Enum.status.REJECTED.toString());
                if (promotionsDao.update((long) pr.getId(), pr)) {
                    rtnValue.set(true);
                }
            }
        });
        return rtnValue.get();
    }

    public static void expiredPromo(){
        AtomicReference<Boolean> v = new AtomicReference<>(false);
        List<Promotions> promos = new PromotionsDao().all().stream()
                .filter(p -> Objects.equals(p.getStatus(), Enum.status.PENDING.toString()))
                .filter(p -> p.getEndDate().toLocalDate().isBefore(LocalDate.now())).collect(Collectors.toList());
        for (Promotions p: promos){
            System.out.println(p.getId());
            p.setStatus("EXPIRED");
            if(new PromotionsDao().update((long) p.getId(), p)){
                System.out.println(true);
            }
        }
    }

}

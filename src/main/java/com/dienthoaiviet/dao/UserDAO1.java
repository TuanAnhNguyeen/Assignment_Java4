package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Staff;
import com.dienthoaiviet.utils.JpaUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class UserDAO1 {
   static EntityManager em = JpaUtils.getEntityManager();
   static EntityTransaction trans = em.getTransaction();
    public  void insert (Staff user){
        try {
          trans.begin();
          em.persist(user);
          trans.commit();
        } catch (Exception e) {
          e.printStackTrace();
          trans.rollback();
        }
        em.close();
    }
    public void update(Staff user){
        try {
           trans.begin();
           em.merge(user);
           trans.commit();
        } catch (Exception e) {
           trans.rollback();
        }
        em.close();
    }
    public void delete (String id  ){
        try {
           trans.begin();
           Staff user = em.find(Staff.class,id);
           em.remove(user);
           trans.commit();
        } catch (Exception e) {
            //  Block of code to handle errors
        }
    }
    public List findAll(){
        List<Staff> list = null;
        TypedQuery<Staff> query = em.createNamedQuery("findAll",Staff.class);
        list=query.getResultList();
        return list;
    }
    public Staff findOne(String username , String password){
        int id = Integer.parseInt(username);
        String jpql = "select o from Staff o where o.id =:id and o.password=:pw";
        TypedQuery<Staff> query = em.createQuery(jpql,Staff.class);
        query.setParameter("id",id);
        query.setParameter("pw",password);
        Staff user = null;
        try {
            user = query.getSingleResult();
        } catch (Exception e) {
            //  Block of code to handle errors
        }
        return user;
    }
}

package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Role;
import com.dienthoaiviet.utils.JpaUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class RoleDAO1 {
  static   EntityManager em = JpaUtils.getEntityManager();
  static   EntityTransaction trans =em.getTransaction();
        public List findAll(){
            List<Role> list = null;
            String jpql = "select o from Role o";
            TypedQuery<Role> query = em.createNamedQuery("Role.findAll",Role.class);
            list = query.getResultList();
            return list;
        }
}

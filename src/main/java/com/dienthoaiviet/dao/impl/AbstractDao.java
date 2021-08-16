package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.GenegicDao;
import com.dienthoaiviet.utils.JpaUtils;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import java.util.List;

public class AbstractDao<T> implements GenegicDao<T> {
    static  EntityManager em = JpaUtils.getEntityManager();

    @Override
    public Integer excuteUpate(T entity, String method) {
        EntityTransaction trans = em.getTransaction();
        try {
           trans.begin();
           if(method.equals(MethodconstantDao.INSERT)){
               em.persist(entity);
           }else if (method.equals(MethodconstantDao.UPDATE)){
               em.merge(entity);
           }else  if(method.equals(MethodconstantDao.DELETE)){
               em.remove(entity);
           }
           trans.commit();
        } catch (Exception e) {
           trans.rollback();
           return 0;
        }finally {
            return 1;
        }

    }

    @Override
    public List<T> excuteQuery(String nameQuery, Class<T> entityClass, Object... parameters) {
        TypedQuery query = em.createNamedQuery(nameQuery,entityClass);
        if(parameters != null){
            setParmeters(query,parameters);
        }
        List<T> list = query.getResultList();
        return list;
    }
    public void setParmeters (TypedQuery<T> query, Object... parameters){
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i+1;
                query.setParameter(index,parameter);
            }
        } catch (Exception e) {
          e.printStackTrace();
        }
    }
}

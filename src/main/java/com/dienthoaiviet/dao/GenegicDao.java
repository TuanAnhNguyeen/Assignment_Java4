package com.dienthoaiviet.dao;

import java.util.List;

public interface GenegicDao<T> {
    Integer excuteUpate(T entity, String method);
    List<T> excuteQuery(String nameQuery, Class<T> entityClass,Object ...parameters );
}

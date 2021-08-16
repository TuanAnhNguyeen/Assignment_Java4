package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.IImageDao;
import com.dienthoaiviet.model.Image;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.ArrayList;
import java.util.List;

public class ImageDao extends AbstractDao<Image> implements IImageDao {
    @Override
    public List<Image> findAllImage() {
        List<Image> list = excuteQuery("findAllImage",Image.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insertImage(Image image) {
        excuteUpate(image, MethodconstantDao.INSERT);
    }

    @Override
    public void updateImage(Image image) {
        excuteUpate(image, MethodconstantDao.UPDATE);
    }

    @Override
    public void deleteImage(Image image) {
        excuteUpate(image, MethodconstantDao.DELETE);
    }

    @Override
   public List<Image> findByIdImage(String id) {
        List<Image> list = excuteQuery("findByIdAllImage",Image.class,id);
        return list.isEmpty() ? null : list;
    }
}

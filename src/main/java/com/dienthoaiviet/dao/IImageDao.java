package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Image;

import java.util.List;

public interface IImageDao extends GenegicDao<Image> {
    List<Image> findAllImage();
    void insertImage(Image image);
    void updateImage(Image image);
    void deleteImage(Image image);
    List<Image> findByIdImage(String id);
}

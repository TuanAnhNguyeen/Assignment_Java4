package com.dienthoaiviet.utils;

import com.dienthoaiviet.model.dto.StaffDto;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

public class SessionUtil {
    public static SessionUtil sessionUtil = null;

    public static SessionUtil getSession(){
        if(sessionUtil == null){
            return sessionUtil = new SessionUtil();
        } else {
            return sessionUtil;
        }
    }

    public static void putUser(HttpServletRequest req, String key, Object value){
        req.getSession().setAttribute(key, value);
    }

    public static Object getUser(HttpServletRequest req, String key){
        return req.getSession().getAttribute(key);
    }

    public static void removeUser(HttpServletRequest req, String key){
        req.getSession().removeAttribute(key);
    }
}

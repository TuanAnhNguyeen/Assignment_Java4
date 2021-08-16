package com.dienthoaiviet.utils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

@WebListener
public class AppListener implements HttpSessionListener, ServletContextListener {
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
            ServletContext application = sce.getServletContext();
            Integer visitors = (Integer) application.getAttribute("visitors");
        try {
           String path = application.getRealPath("/visitors.txt");
           byte[] data =String.valueOf(visitors).getBytes();
           Files.write(Paths.get(path),data, StandardOpenOption.CREATE);
        } catch (Exception e) {
           e.printStackTrace();
        }
    }
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        Integer visitors = 0;
        try {
            String path =application.getRealPath("/visitors.txt");
            List<String> lines = Files.readAllLines(Paths.get(path));
            visitors=Integer.valueOf(lines.get(0));

        } catch (Exception e) {
           visitors=10000;
        }
        application.setAttribute("visitors",visitors);
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session =se.getSession();
        ServletContext application = session.getServletContext();
        Integer visitors = (Integer) application.getAttribute("visitors");
        application.setAttribute("visitors",visitors+1);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSessionListener.super.sessionDestroyed(se);
    }
}

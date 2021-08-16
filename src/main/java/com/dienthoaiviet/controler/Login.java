package com.dienthoaiviet.controler;

import com.dienthoaiviet.model.dto.StaffDto;
import com.dienthoaiviet.service.IUserService;
import com.dienthoaiviet.service.impl.UserService;
import com.dienthoaiviet.utils.CookieUtils;
import com.dienthoaiviet.utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/login","/logout"})
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if(uri.contains("logout")){
            SessionUtil.removeUser(req,"user");
            resp.sendRedirect(req.getContextPath()+"/login");
            return;
        }
        String getUsername = CookieUtils.get("id",req);
        String getPass = CookieUtils.get("password",req);
        if(!getUsername.equals("") && !getPass.equals("")){
            req.setAttribute("id",getUsername);
            req.setAttribute("password",getPass);
            req.setAttribute("remember",true);
        }
       req.getRequestDispatcher("/views/login/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        String pass = req.getParameter("password");
        String remember = req.getParameter("remember");
        boolean check = true;
        if(id.equalsIgnoreCase("")){
            req.setAttribute("errId","Bạn Chưa nhập Id");
            check=false;
        }else {
            try {
                Integer.parseInt(id);
            } catch (Exception e) {
                req.setAttribute("errId","Bạn  nhập Sai Id");
            }
        }
        if(pass.equalsIgnoreCase("")){
            req.setAttribute("errPass","Bạn chưa nhập Mật Khẩu");
            check=false;
        }
        if(check==false){
            req.getRequestDispatcher("/views/login/login.jsp").forward(req,resp);
            return;
        }
        IUserService userService = new UserService();
        StaffDto staff =userService.findByIdAndPassword(Integer.parseInt(id),pass);
        if(staff==null){
            req.setAttribute("messengeError","Tài Khoản Không Tồn Tại Mời Nhập lại");
            req.setAttribute("checkErorr",true);
            req.getRequestDispatcher("/views/login/login.jsp").forward(req,resp);
            return;
        }
        if(remember!=null){
            int hors = 30*24;
            CookieUtils.add("id",id,hors,resp);
            CookieUtils.add("password",pass,hors,resp);
        }
        SessionUtil sessionUtil = new SessionUtil();
        sessionUtil.putUser(req,"user",staff);
        StaffDto a = (StaffDto) sessionUtil.getUser(req,"user");
        req.setAttribute("check",true);
        req.setAttribute("msgSuccess","Chúc Mừng Bạn Đăng Nhập Thành Công");
        req.setAttribute("link",req.getContextPath()+"/admin");
        req.getRequestDispatcher("/views/login/login.jsp").forward(req,resp);
    }
}

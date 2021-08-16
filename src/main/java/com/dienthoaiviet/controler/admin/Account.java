package com.dienthoaiviet.controler.admin;

import com.dienthoaiviet.model.dto.StaffDto;
import com.dienthoaiviet.service.IUserService;
import com.dienthoaiviet.service.impl.UserService;
import com.dienthoaiviet.utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/account/changepassword")
public class Account extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("content","changepassword.jsp");
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        String newPassword = req.getParameter("newpassword");
        String confrimPassword = req.getParameter("confrimpassword");
        StaffDto staffDto =(StaffDto) SessionUtil.getUser(req,"user");
       if(!staffDto.getPassword().equals(password)){
           req.setAttribute("errorPassword","Current Password Incorrect");
           req.setAttribute("content","changepassword.jsp");
       }else{
           staffDto.setPassword(newPassword);
           IUserService userService = new UserService();
           userService.updateUser(staffDto);
           resp.sendRedirect(req.getContextPath()+"/admin");
           return;
       }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req,resp);
    }
}

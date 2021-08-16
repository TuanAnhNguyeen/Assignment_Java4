package com.dienthoaiviet.controler.admin;

import com.dienthoaiviet.dao.RoleDAO1;

import com.dienthoaiviet.exception.ExceptionCommon;
import com.dienthoaiviet.model.Role;
import com.dienthoaiviet.model.dto.StaffDto;
import com.dienthoaiviet.service.IUserService;
import com.dienthoaiviet.service.impl.UserService;
import com.dienthoaiviet.utils.Conmom;
import com.dienthoaiviet.utils.SessionUtil;
import com.dienthoaiviet.webConstant.MethodconstantDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


import java.util.Calendar;
import java.util.Date;
import java.util.List;


@MultipartConfig
@WebServlet({"/admin/user", "/admin/user/edit", "/admin/user/add","/admin/user/delete"})
public class UserServlet extends HttpServlet {
    List<StaffDto> list = new ArrayList<>();
   IUserService userDAO = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sumReply", Conmom.CoutMail());
        StaffDto staffDto = (StaffDto) SessionUtil.getUser(req,"user");
        if(staffDto.getRole().getId()!=1){
            req.setAttribute("content","admin.jsp");
            req.setAttribute("checkErorr",true);
            req.setAttribute("messengeError","Bạn Không Có Quyến Truy Cập Vào Chức Năng");
            req.setAttribute("link",req.getContextPath()+"/admin");
            req.getRequestDispatcher("/views/admin/index.jsp").forward(req,resp);
            return;
        }
        String uri = req.getRequestURI();
        req.setAttribute("listRole", fillAllRole());
        if (uri.contains("add")) {
            req.setAttribute("content","profile.jsp");
        }else if(uri.contains("edit")){
            String id = req.getParameter("id");
            StaffDto user = userDAO.findById(Integer.parseInt(id));
            req.setAttribute("user",user);
            req.setAttribute("content","EditUser.jsp");
        }else if(uri.contains("delete")){
            String id = req.getParameter("id");
            StaffDto user = userDAO.findById(Integer.parseInt(id));
            user.setStatus(false);
            userDAO.updateUser(user);
            resp.sendRedirect(req.getContextPath()+"/admin/user");
            return;
        }else {
            loadList();
            req.setAttribute("listStaff", list);
            req.setAttribute("content","table.jsp");
        }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String uri = req.getRequestURI();
        if(uri.contains("add")) {
           if(insertStaff(req, resp)){
               resp.sendRedirect(req.getContextPath()+"/admin/user");
               return;
           }
        }else if(uri.contains("edit")){
            if(updateStaff(req,resp)){
                resp.sendRedirect(req.getContextPath()+"/admin/user");
                return;
            }
        }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req,resp);
    }

    protected List fillAllRole() {
       RoleDAO1 roleDAO = new RoleDAO1();
        return roleDAO.findAll();
    }

    protected void loadList() {
        list.clear();
        list = userDAO.findAll();
    }

    protected boolean insertStaff(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        StaffDto staff  = vadidate(req,MethodconstantDao.INSERT);
        if(staff==null){
            req.setAttribute("listRole", fillAllRole());
            req.setAttribute("content","profile.jsp");
            return false ;
        }
        userDAO.insertUser(staff);
        return true;
    }
    protected boolean updateStaff(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        String id = req.getParameter("id");
        StaffDto user = userDAO.findById(Integer.parseInt(id));
        StaffDto staff  = vadidate(req,MethodconstantDao.UPDATE);
        if(staff==null){
            req.setAttribute("listRole", fillAllRole());
            req.setAttribute("user",user);
            req.setAttribute("content","EditUser.jsp");
            return false ;
        }
        if(staff.getImage()==null) {
            staff.setImage(user.getImage());
        }
        staff.setPassword(user.getPassword());
        staff.setId(user.getId());
        userDAO.updateUser(staff);
        return true;
    }
    public StaffDto vadidate(HttpServletRequest req,String method){
        StaffDto staff = new StaffDto();
        String fullname = req.getParameter("fullname");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phonenumber = req.getParameter("phonenumber");
        String salary = req.getParameter("salary");
        String gender = req.getParameter("gender");
        String role = req.getParameter("role");
        String birthday = req.getParameter("birthday");
        String address = req.getParameter("address");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        boolean check = true;
        Date a = null;
        if (fullname.trim().equals("")) {
            req.setAttribute("errorFullname", "Bạn Phải Nhập Họ Và Tên");
            check = false;
        }
        if (address.trim().equals("")) {
            req.setAttribute("errorAddress", "Bạn Phải Nhập Địa Chỉ");
            check = false;
        }
        if(method.equals(MethodconstantDao.INSERT)) {
            if (password.trim().equals("")) {
                req.setAttribute("errorPassword", "Bạn Phải Nhập Password");
                check = false;
            } else if (password.length() > 10) {
                req.setAttribute("errorPassword", "Bạn Phải Nhập Password Nhỏ Hơn 10 kí tự");
            }
        }
        if (birthday.equals("")) {
            req.setAttribute("errorBirthday", "Bạn Phải Chọn Ngày Sinh");
            check = false;
        } else {
            try {
                a = sdf.parse(birthday);
                Calendar c = Calendar.getInstance();
                c.setTime(a);
                int yearofBrith = c.get(c.YEAR);
                c.setTime(new Date());
                int yearNow = c.get(c.YEAR);
                if (yearNow - yearofBrith < 18) {
                    req.setAttribute("errorBirthday", "Bạn Chưa Đủ 18 tuổi mời bạn chọn đúng ngày sinh");
                    check = false;
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if (gender == null) {
            req.setAttribute("errorGender", "Bạn Chưa chọn giới tính");
            check = false;
        }
        if(role.equals("")){
            req.setAttribute("errorRole","bạn chưa chon chức vụ");
            check=false;
        }
        String checkEmail = ExceptionCommon.checkEmail(method,email);
        if(!checkEmail.equals("")){
            req.setAttribute("errorEmail",checkEmail);
            check=false;
        }
        String checkPhone = ExceptionCommon.checkPhoneNumBer(method,phonenumber );
        if(!checkPhone.equals("")){
            req.setAttribute("errorPhonenumber",checkPhone);
            check=false;
        }
        if(salary.trim().equals("")){
            req.setAttribute("errorSalary","bạn chưa nhâp số tiền");
            check=false;
        }else {
            try {
                int salaryCheck =  Integer.parseInt(salary);
                if(salaryCheck<1000){
                    req.setAttribute("errorSalary","bạn phải nhập lương trên 1000");
                    check = false;
                }
            } catch (Exception e) {
                req.setAttribute("errorSalary","bạn nhập sai định dạng tiền tệ");
                check = false;
            }
        }
        try {
            File file = new File(req.getServletContext().getRealPath("/files"));
            if (!file.exists()) {
                file.mkdirs();
            }
            Part photo = req.getPart("img");
            File photo_file = new File(file, photo.getSubmittedFileName());
            photo.write(photo_file.getAbsolutePath());
            System.out.println(photo_file);
            staff.setImage(photo_file.getName());
        } catch (Exception e) {
            //  Block of code to handle errors
        }
        if(staff.getImage()==null&& method.equals(MethodconstantDao.INSERT)){
            req.setAttribute("errorImage","bạn chua chọn ảnh ");
            check=false;
        }
        if(check==false){
            return null;
        }
        try {
            staff.setBirthday(sdf.parse(birthday));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        staff.setFullname(fullname);
        staff.setPassword(password);
        staff.setPhonenumber(phonenumber);
        staff.setAddress(address);
        staff.setStatus(true);
        staff.setSalary(Integer.parseInt(salary));
        List<Role> listRole = fillAllRole();
        for (Role x : listRole){
            if(x.getId() ==Integer.parseInt(role)){
                staff.setRole(x);
            }
        }
        staff.setEmail(email);
        staff.setGender(Boolean.parseBoolean(gender));
        return staff;
    }
}

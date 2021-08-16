//package com.dienthoaiviet.exception.admin;
//
//import com.dienthoaiviet.exception.ExceptionCommon;
//import com.dienthoaiviet.model.Role;
//import com.dienthoaiviet.model.Staff;
//import com.dienthoaiviet.webConstant.MethodconstantDao;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.Part;
//import java.io.File;
//import java.util.Calendar;
//import java.util.Date;
//
//public class ExceptionUser {
//    public static void vadidateInsert(Staff staff, HttpServletRequest req) {
//        if (staff.getFullname().trim().equals("")) {
//            req.setAttribute("errorFullname", "Bạn Phải Nhập Họ Và Tên");
//        }
//        if (staff.getAddress().trim().equals("")) {
//            req.setAttribute("errorAddress", "Bạn Phải Nhập Địa Chỉ");
////            check = false;
//        }
//        if (staff.getPassword().trim().equals("")) {
//            req.setAttribute("errorPassword", "Bạn Phải Nhập Password");
////            check = false;
//        } else if (staff.getPassword().length() > 10) {
//            req.setAttribute("errorPassword", "Bạn Phải Nhập Password Nhỏ Hơn 10 kí tự");
//        }
//        Date a = null;
//        if (staff.getBirthday().equals("")) {
//            req.setAttribute("errorBirthday", "Bạn Phải Chọn Ngày Sinh");
////            check = false;
//        } else {
//            Calendar c = Calendar.getInstance();
//            c.setTime(a);
//            int yearofBrith = c.get(c.YEAR);
//            c.setTime(new Date());
//            int yearNow = c.get(c.YEAR);
//            if (yearNow - yearofBrith < 18) {
//                req.setAttribute("errorBirthday", "Bạn Chưa Đủ 18 tuổi mời bạn chọn đúng ngày sinh");
////                check = false;
//            }
//
//        }
////        if (staff.isGender()==null) {
////            req.setAttribute("errorGender", "Bạn Chưa chọn giới tính");
////            check = false;
////        }
//        if (staff.getRole().equals("")) {
//            req.setAttribute("errorRole", "bạn chưa chon chức vụ");
////            check = false;
//        }
//        String phonenumber = ExceptionCommon.checkEmail(staff.getEmail(), MethodconstantDao.INSERT);
//        if (phonenumber != null) {
//            req.setAttribute("ErrorEmail", phonenumber);
//        }
//
//        String email = ExceptionCommon.checkEmail(staff.getEmail(), MethodconstantDao.INSERT);
//        if (email != null) {
//            req.setAttribute("ErrorEmail", email);
//        }
////        String monney = ExceptionCommon.checkMoney(staff.getSalary());
//        try {
//            File file = new File(req.getServletContext().getRealPath("/files"));
//            if (!file.exists()) {
//                file.mkdirs();
//            }
//            Part photo = req.getPart("img");
//            File photo_file = new File(file, photo.getSubmittedFileName());
//            photo.write(photo_file.getAbsolutePath());
//            System.out.println(photo_file);
//            staff.setImage(photo_file.getName());
//        } catch (Exception e) {
//            //  Block of code to handle errors
//        }
//        if (staff.getImage() == null) {
//            req.setAttribute("errorImage", "bạn chua chọn ảnh ");
//            check = false;
//        }
//        if (check == false) {
//            System.out.println(1);
//            req.getRequestDispatcher("/views/admin/profile.jsp").forward(req, resp);
//            return;
//        }
//        if(req.toString().equals("")){
//
//        }
//    }
//}

package com.dienthoaiviet.controler;

import com.dienthoaiviet.model.dto.StaffDto;
import com.dienthoaiviet.service.IUserService;
import com.dienthoaiviet.service.impl.UserService;
import com.dienthoaiviet.utils.CookieUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet({"/forgorpassword","/forgorpassword/confirm"})
public class forgotPassword extends HttpServlet {
   public static IUserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("checkErorr","Nhập email tài Khoản để lấy lại mật khẩu");
        req.getRequestDispatcher("/views/login/forgotpassword.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String uri = req.getRequestURI();
        if(uri.contains("confirm")){
            String emailTo1 =CookieUtils.get("emailConfirm",req);
            StaffDto staffDto1 = userService.findByEmail(emailTo1);
            String codeConfrim = req.getParameter("code");
            String code = CookieUtils.get("confimcode",req);
            if(code.equals(codeConfrim)){
                staffDto1.setPassword("123");
                userService.updateUser(staffDto1);
                String content = "Mật Khẩu Mới Là : 123";
                sendEmail(emailTo1,"Lấy Lại Mật Khẩu",content);
                CookieUtils.add("confimcode", String.valueOf(code), 0, resp);
                CookieUtils.add("emailConfirm", emailTo1, 0, resp);
                resp.sendRedirect(req.getContextPath()+"/login");
                return;
            }else {
               req.setAttribute("msgErorr","Mã xác nhận sai mời nhâp lại");
                req.getRequestDispatcher("/views/login/ModalConfrim.jsp").forward(req, resp);

                return;
            }
        }else {
            String emailTo =req.getParameter("email");
            StaffDto staffDto = userService.findByEmail(emailTo);
            if(staffDto==null){
                req.setAttribute("checkErorr","Email Không Đúng Mời Nhập Lại");
                req.getRequestDispatcher("/views/login/forgotpassword.jsp").forward(req,resp);
                return;
            }
            int code = (int) Math.floor(((Math.random() * 899999) + 100000));
            String content = "Mã Xác Nhận Là : " + code;
            sendEmail(emailTo, "Lấy Lại Mật Khẩu", content);
            CookieUtils.add("confimcode", String.valueOf(code), 1, resp);
            CookieUtils.add("emailConfirm", emailTo, 1, resp);
            req.setAttribute("checkConfrim", true);
            req.setAttribute("msgErorr","Mời bạn nhập mã xác nhận");
            req.getRequestDispatcher("/views/login/ModalConfrim.jsp").forward(req, resp);
        }
    }
    public void sendEmail(String emailTo, String subject,String content){
        final String username = "doduy23071995@gmail.com";
        final String passworld = "anhyeu12345";
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.ssl.trust", "*");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, passworld);
            }
        });
        MimeMessage mimeMessage = new MimeMessage(session);
        try {
            mimeMessage.setFrom(new InternetAddress(username));
            mimeMessage.setRecipients(Message.RecipientType.TO, emailTo);
            mimeMessage.setSubject(subject, "UTF-8");
            mimeMessage.setText(content, "UTF-8", "html");
            mimeMessage.setReplyTo(mimeMessage.getFrom());
            Transport.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}

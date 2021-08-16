package com.dienthoaiviet.controler.admin;

import com.dienthoaiviet.dao.IContactDao;
import com.dienthoaiviet.dao.impl.ContactDao;
import com.dienthoaiviet.model.Contact;
import com.dienthoaiviet.utils.Conmom;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

@WebServlet({"/admin/contact/*","/admin/contact/reply","/admin/contact/delete"})
public class ContactAdmin extends HttpServlet {
    private static IContactDao contactDao = new ContactDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if(uri.contains("reply")){
            String id = req.getParameter("id");
            req.setAttribute("contact",contactDao.findByIdContact(Integer.parseInt(id)));
            req.setAttribute("content", "./contact/mail-view.jsp");
        }else if(uri.contains("delete")){
            String id = req.getParameter("id");
            contactDao.deleteContact(contactDao.findByIdContact(Integer.parseInt(id)));
            resp.sendRedirect(req.getContextPath()+"/admin/contact");
            return;
        } else {
            List<Contact> listContact =  contactDao.findAllContact();
            req.setAttribute("sumEmail", listContact.size());
            req.setAttribute("sumReply", Conmom.CoutMail());
            req.setAttribute("listContact", listContact);
            req.setAttribute("content", "./contact/mail-all.jsp");
        }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String note = req.getParameter("reply");
        Contact contact = contactDao.findByIdContact(Integer.parseInt(id));
        String subject = "Trả lời câu hỏi : " +contact.getSubject();
        String content = "Kính gửi quý khách : " + contact.getFullname()+"\n"+note;
        sendEmail(contact.getEmail(),subject,content);
        contact.setStatus(false);
        contactDao.updateContact(contact);
        resp.sendRedirect(req.getContextPath()+"/admin/contact");
        return;
    }

    public void sendEmail(String emailTo, String subject, String content){
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

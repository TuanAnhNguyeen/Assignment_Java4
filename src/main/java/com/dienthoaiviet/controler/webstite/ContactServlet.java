package com.dienthoaiviet.controler.webstite;

import com.dienthoaiviet.dao.IContactDao;
import com.dienthoaiviet.dao.impl.ContactDao;
import com.dienthoaiviet.model.Contact;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/contact/*","/contact/add","/contact/question"})
public class ContactServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if (uri.contains("add")) {
            System.out.println(1);
            return;
        } else if (uri.contains("question")) {
            String email =req.getParameter("email");
            req.setAttribute("email",email);
            req.setAttribute("contentHomePage", "contactDESC.jsp");
        } else {
            req.setAttribute("contentHomePage", "contact.jsp");
        }
        req.getRequestDispatcher("/views/website/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Contact contact = new Contact();
        contact.setEmail(req.getParameter("customerEmail"));
        contact.setSubject(req.getParameter("contactSubject"));
        contact.setNote(req.getParameter("contactMessage"));
        contact.setFullname(req.getParameter("customerName"));
        contact.setStatus(true);
        IContactDao contactDao = new ContactDao();
        contactDao.insertContact(contact);
        req.setAttribute("check",true);
        req.setAttribute("msgSuccess","Cảm ơn quý khách đã luôn tin tưởng, chúng tôi sẽ phản hồi cho quý khách sớm nhât.");
        req.setAttribute("link",req.getContextPath()+"/contact");
        req.setAttribute("contentHomePage", "contactDESC.jsp");
        req.getRequestDispatcher("/views/website/index.jsp").forward(req,resp);
        return;
    }
}

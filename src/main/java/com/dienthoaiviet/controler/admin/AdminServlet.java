package com.dienthoaiviet.controler.admin;

import com.dienthoaiviet.dao.IStoredProcedureDao;
import com.dienthoaiviet.dao.impl.StoredProcedureDao;
import com.dienthoaiviet.model.Top10Total;
import com.dienthoaiviet.model.dto.BillSyntheticDto;
import com.dienthoaiviet.utils.Conmom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private IStoredProcedureDao storedProcedureDao = new StoredProcedureDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sumReply", Conmom.CoutMail());
        List<Top10Total> listTop10 = storedProcedureDao.findTop10();
        List<BillSyntheticDto> billSyntheticConfrimList = storedProcedureDao.findBillAll_Status(0,4);
        req.setAttribute("order",billSyntheticConfrimList.size());
        req.setAttribute("listTop10",listTop10);
        req.setAttribute("content","admin.jsp");
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req,resp);
    }
}

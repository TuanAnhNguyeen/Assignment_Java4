
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<div class="left main-sidebar">

    <div class="sidebar-inner leftscroll">

        <div id="sidebar-menu">

            <ul>

                <li class="submenu">
                    <a href="<%=request.getContextPath()%>/admin">
                        <i class="fas fa-bars"></i>
                        <span> Tổng Quát</span>
                    </a>
                </li>

                <li class="submenu">
                    <a  href="<%=request.getContextPath()%>/admin/user">
                        <i class="fas fa-user"></i>
                        <span> Nhân Viên </span>
                    </a>
                </li>

                <li class="submenu">
                    <a href="<%=request.getContextPath()%>/admin/customer">
                        <i class="fas fa-file-image"></i>
                        <span> Khách Hàng</span>
                    </a>
                </li>

                <li class="submenu">
                    <a href="<%=request.getContextPath()%>/admin/contact">
                        <span class="label radius-circle bg-danger float-right">${sumReply}</span>
                        <i class="fas fa-envelope"></i>
                        <span> Mailbox </span>
                    </a>
                </li>


<%--                <li class="submenu">--%>
<%--                    <a  href="charts.html">--%>
<%--                        <i class="fas fa-chart-line"></i>--%>
<%--                        <span> Biểu Đồ </span>--%>
<%--                    </a>--%>
<%--                </li>--%>
                <li class="submenu">
                    <a  href="<%=request.getContextPath()%>/admin/products">
                        <i class="fas fa-laptop"></i>
                        <span> Sản Phẩm</span>
                    </a>
                </li>
                <li class="submenu">
                    <a  href="<%=request.getContextPath()%>/admin/bill">
                        <i class="fas fa-table"></i>
                        <span> Hóa Đơn</span>
                    </a>
                </li>
                <li class="submenu">
                    <a  href="<%=request.getContextPath()%>/admin/category">
                        <i class="fas fa-star"></i>
                        <span> Hãng Và Thuộc Tính</span>
                    </a>
                </li>
                <li class="submenu">
                    <a class="pro" href="<%=request.getContextPath()%>/homepage">
                        <i class="fas fa-shopping-cart"></i>
                        <span> Website Bán Hàng </span>
                    </a>
                </li>

            </ul>

            <div class="clearfix"></div>

        </div>

        <div class="clearfix"></div>

    </div>
</div>
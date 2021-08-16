<%--
  Created by IntelliJ IDEA.
  User: Duy
  Date: 7/30/2021
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header-bottom header-sticky d-none d-lg-block d-xl-block">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Begin Header Bottom Menu Area -->
                <div class="hb-menu">
                    <nav>
                        <ul>
                            <li class="dropdown-holder"><a href="<%=request.getContextPath()%>/homepage">Trang Chủ</a>
                            </li>
                            <li class="megamenu-holder"><a href="shop-left-sidebar.html">Điện Thoại</a>
                                <ul class="megamenu hb-megamenu">
                                    <li><a role="button" href="#">Thương Hiệu Nổi Tiếng</a>
                                        <ul>
                                            <c:forEach var="item" items="${listCategory}">
                                            <li><a href="<%=request.getContextPath()%>/homepage/hang?id=${item.id}">${item.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                    <li><a href="single-product-gallery-left.html">Dung Lượng Bộ Nhớ</a>
                                        <ul>
                                            <c:forEach var="item" items="${listProperties}">
                                            <li><a href="single-product-carousel.html">${item.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown-holder"><a href="blog-left-sidebar.html">Máy Tính</a>
                                <ul class="hb-dropdown">
                                    <li class="sub-dropdown-holder"><a href="blog-left-sidebar.html">LapTop</a>
                                        <ul class="hb-dropdown hb-sub-dropdown">
                                            <li><a href="blog-2-column.html">Dell</a></li>
                                            <li><a href="blog-3-column.html">Asus</a></li>
                                            <li><a href="blog-left-sidebar.html">MacBook</a></li>
                                            <li><a href="blog-right-sidebar.html">Acer</a></li>
                                        </ul>
                                    </li>
                                    <li class="sub-dropdown-holder"><a href="blog-list-left-sidebar.html">Máy Tính Bàn</a>
                                        <ul class="hb-dropdown hb-sub-dropdown">
                                            <li><a href="blog-list.html">Blog List</a></li>
                                            <li><a href="blog-list-left-sidebar.html">List Left Sidebar</a></li>
                                            <li><a href="blog-list-right-sidebar.html">List Right Sidebar</a></li>
                                        </ul>
                                    </li>
                                    <li class="sub-dropdown-holder"><a href="blog-details-left-sidebar.html">Máy Tính Bảng</a>
                                        <ul class="hb-dropdown hb-sub-dropdown">
                                            <li><a href="blog-details-left-sidebar.html">Left Sidebar</a></li>
                                            <li><a href="blog-details-right-sidebar.html">Right Sidebar</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="megamenu-static-holder"><a href="index.html">Phụ Kiện</a>
                                <ul class="megamenu hb-megamenu">
                                    <li><a href="blog-left-sidebar.html">Điện Thoại</a>
                                        <ul>
                                            <li><a href="blog-2-column.html">Tai Nghe</a></li>
                                            <li><a href="blog-3-column.html">Bao Da</a></li>
                                            <li><a href="blog-left-sidebar.html">Ốp Lưng</a></li>
                                            <li><a href="blog-right-sidebar.html">Kính Cường Lực</a></li>
                                            <li><a href="blog-list.html">Sạc, Cáp</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="blog-details-left-sidebar.html">LapTop</a>
                                        <ul>
                                            <li><a href="blog-details-left-sidebar.html">Chuột Không Dây</a></li>
                                            <li><a href="blog-details-right-sidebar.html">Chuột Có Dây</a></li>
                                            <li><a href="blog-audio-format.html">Bàn Phím</a></li>
                                            <li><a href="blog-video-format.html">Loa</a></li>
                                            <li><a href="blog-gallery-format.html">Túi Chống Sóc</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="index.html">Lưu Trữ</a>
                                        <ul>
                                            <li><a href="login-register.html">Thẻ Nhớ</a></li>
                                            <li><a href="checkout.html">Ổ Cứng</a></li>
                                            <li><a href="compare.html">USb</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="index.html">Phụ Kiện Khác</a>
                                        <ul>
                                            <li><a href="contact.html">Thiết Bị Mạng</a></li>
                                            <li><a href="about-us.html">Thiết Bị Định Vị</a></li>
                                            <li><a href="faq.html">Quạt Mini</a></li>
                                            <li><a href="404.html">Máy Hút Bụi</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="<%=request.getContextPath()%>/homepage">Máy Cũ</a></li>
                            <li><a href="<%=request.getContextPath()%>/contact">Hỏi Đáp</a></li>
                            <li><a href="<%=request.getContextPath()%>/homepage">Tin Công Nghệ</a></li>
                            <li><a href="<%=request.getContextPath()%>/history">Lịch sử</a></li>
                        </ul>
                    </nav>
                </div>
                <!-- Header Bottom Menu Area End Here -->
            </div>
        </div>
    </div>
</div>

<%--
  Created by IntelliJ IDEA.
  User: Duy
  Date: 7/30/2021
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <!-- Begin Header Top Area -->
    <div class="header-top">
        <div class="container">
            <div class="row">
                <!-- Begin Header Top Left Area -->
                <div class="col-lg-3 col-md-4">
                    <div class="header-top-left">
                        <ul class="phone-wrap">
                            <li><span>Telephone Enquiry: </span><a href="#"> 0978825572</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Header Top Left Area End Here -->
                <!-- Begin Header Top Right Area -->
                <div class="col-lg-9 col-md-8">
                    <div class="header-top-right">
                        <ul class="ht-menu">
                            <!-- Begin Setting Area -->
                            <li>
                                <div class="ht-setting-trigger"><span>Setting</span></div>
                                <div class="setting ht-setting">
                                    <ul class="ht-setting-list">
                                        <li><a href="login-register.html">My Account</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="login-register.html">Sign In</a></li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Setting Area End Here -->
                            <!-- Begin Currency Area -->
                            <li>
                                <span class="currency-selector-wrapper">Currency :</span>
                                <div class="ht-currency-trigger"><span>USD $</span></div>
                                <div class="currency ht-currency">
                                    <ul class="ht-setting-list">
                                        <li><a href="#">EUR €</a></li>
                                        <li class="active"><a href="#">USD $</a></li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Currency Area End Here -->
                            <!-- Begin Language Area -->
                            <li>
                                <span class="language-selector-wrapper">Language :</span>
                                <div class="ht-language-trigger"><span>English</span></div>
                                <div class="language ht-language">
                                    <ul class="ht-setting-list">
                                        <li>
                                            <a href="#" onclick="doGTranslate('vi|vi');return false;" title="Tiếng Việt" class="gflag nturl"
                                            ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_North_Vietnam_%281955%E2%80%931976%29.svg/230px-Flag_of_North_Vietnam_%281955%E2%80%931976%29.svg.png"
                                                  style="width: 25px"
                                                  alt="English"/> Tiếng Việt</a>
                                        </li>
                                        <li>
                                            <a href="#" onclick="doGTranslate('vi|zh-CN');return false;" title="Tiếng Trung" class="gflag nturl"
                                            ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/225px-Flag_of_the_People%27s_Republic_of_China.svg.png"
                                                  style="width: 25px"
                                                  alt="English"/> Tiếng Trung</a>
                                        </li>
                                        <li>
                                            <a href="#" onclick="doGTranslate('vi|en');return false;" title="Tiếng Anh" class="gflag nturl"
                                            ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Flag_of_the_United_Kingdom.svg/300px-Flag_of_the_United_Kingdom.svg.png"
                                                  style="width: 25px"
                                                  alt="English"/> Tiếng Anh</a>
                                        </li>
                                        <li>
                                            <a href="#" onclick="doGTranslate('vi|ko');return false;" title="Tiếng Hàn" class="gflag nturl"
                                            ><img src="https://globalmap.edu.vn/wp-content/uploads/2020/10/flag_of_the_provisional_government_of_the_republic_of_korea-svg.png"
                                                  style="width: 25px"
                                                  alt="English"/> Tiếng Hàn</a>
                                        </li>
                                        <li>
                                            <a href="#" onclick="doGTranslate('vi|ja');return false;" title="Tiếng Nhật" class="gflag nturl"
                                            ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/225px-Flag_of_Japan.svg.png"
                                                  style="width: 25px"
                                                  alt="English"/> Tiếng Nhật</a>
                                        </li>
                                    </ul>

                                </div>
                            </li>
                            <!-- Language Area End Here -->
                        </ul>
                    </div>
                </div>
                <!-- Header Top Right Area End Here -->
            </div>
        </div>
    </div>
    <!-- Header Top Area End Here -->
    <!-- Begin Header Middle Area -->
    <div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
        <div class="container">
            <div class="row">
                <!-- Begin Header Logo Area -->
                <div class="col-lg-3">
                    <div class="logo pb-sm-30 pb-xs-30">
                        <a href="<%=request.getContextPath()%>/homepage">
                            <img src="<%=request.getContextPath()%>/views/website/images/menu/logo/1.jpg" alt="">
                        </a>
                    </div>
                </div>
                <!-- Header Logo Area End Here -->
                <!-- Begin Header Middle Right Area -->
                <div class="col-lg-9 pl-0 ml-sm-15 ml-xs-15">
                    <!-- Begin Header Middle Searchbox Area -->
                    <form action="<%=request.getContextPath()%>/homepage/search" method="post" class="hm-searchbox">
                        <select class="nice-select select-search-category">
                            <option value="0">All</option>
                        </select>
                        <input type="text" name="key" placeholder="Enter your search key ...">
                        <button class="li-btn" type="submit"><i class="fa fa-search"></i></button>
                    </form>
                    <!-- Header Middle Searchbox Area End Here -->
                    <!-- Begin Header Middle Right Area -->
                    <div class="header-middle-right">
                        <ul class="hm-menu">
                            <!-- Begin Header Middle Wishlist Area -->
                            <li class="hm-wishlist">
                                <a href="wishlist.html">
                                    <span class="cart-item-count wishlist-item-count">0</span>
                                    <i class="fa fa-heart-o"></i>
                                </a>
                            </li>
                            <!-- Header Middle Wishlist Area End Here -->
                            <!-- Begin Header Mini Cart Area -->
                            <li class="hm-minicart">
                                <div class="hm-minicart-trigger">
                                    <span class="item-icon"></span>
                                    <span class="item-text">${sumMoney}đ
                                                    <span class="cart-item-count">${sumQuantity}</span>
                                                </span>
                                </div>
                                <span></span>
                                <div class="minicart">
                                    <ul class="minicart-product-list">
                                        <c:forEach var="item" items="${listProduct_details_cart}">
                                            <li>
                                                <a href="product.jsp" class="minicart-product-image">
                                                    <img src="<%=request.getContextPath()%>/files/${item.products.image}"
                                                         alt="cart products">
                                                </a>
                                                <div class="minicart-product-details">
                                                    <h6><a href="product.jsp">${item.products.name}</a></h6>
                                                    <span>${item.products.convertPrice()}đ x ${item.quantity}</span>
                                                </div>
                                                <a href="<%=request.getContextPath()%>/homepage/xoagio?SanPham=${item.id}"
                                                   class="close" title="Remove">
                                                    <i class="fa fa-close"></i>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <p class="minicart-total">Tổng Tiền: <span>${sumMoney}đ</span></p>
                                    <div class="minicart-button">
                                        <a type="button" href="<%=request.getContextPath()%>/homepage/cart"
                                           class="li-button li-button-fullwidth li-button-dark">
                                            <span>Xem Giỏ Hàng</span>
                                        </a>
                                        <a href="<%=request.getContextPath()%>/cart/checkout"
                                           class="li-button li-button-fullwidth">
                                            <span>Đặt hàng</span>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <!-- Header Mini Cart Area End Here -->
                        </ul>
                    </div>
                    <!-- Header Middle Right Area End Here -->
                </div>
                <!-- Header Middle Right Area End Here -->
            </div>
        </div>
    </div>
    <!-- Header Middle Area End Here -->
    <!-- Begin Header Bottom Area -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Header Bottom Area End Here -->
    <!-- Begin Mobile Menu Area -->
    <div class="mobile-menu-area d-lg-none d-xl-none col-12">
        <div class="container">
            <div class="row">
                <div class="mobile-menu">
                </div>
            </div>
        </div>
    </div>
    <!-- Mobile Menu Area End Here -->
</header>
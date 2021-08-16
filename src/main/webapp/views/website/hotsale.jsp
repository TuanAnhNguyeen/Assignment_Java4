<%--
  Created by IntelliJ IDEA.
  User: Duy
  Date: 7/30/2021
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="product-area pt-60 pb-50">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="li-product-tab">
                    <ul class="nav li-product-menu">
                        <li><a class="active" data-toggle="tab" href="#li-new-product"><span class="text-danger">Khuyến Mại Hót</span></a>
                        </li>
                        <%--                        <li><a data-toggle="tab" href="#li-bestseller-product"><span>Bestseller</span></a></li>--%>
                        <%--                        <li><a data-toggle="tab" href="#li-featured-product"><span>Featured Products</span></a></li>--%>
                    </ul>
                </div>
                <!-- Begin Li's Tab Menu Content Area -->
            </div>
        </div>
        <div class="tab-content">
            <div id="li-new-product" class="tab-pane active show" role="tabpanel">
                <div class="row">
                    <div class="product-active owl-carousel">
                        <c:forEach var="item" items="${listHotSale}">
                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="product.jsp">
                                            <img src="<%=request.getContextPath()%>/files/${item.image}"
                                                 alt="Li's Product Image">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="shop-left-sidebar.html">${item.properties.name}</a>
                                                </h5>
                                                <div class="rating-box">
                                                    <ul class="rating">
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h4><a class="product_name" href="product.jsp">${item.name}</a></h4>
                                            <div class="price-box">
                                                <span class="new-price new-price-2">${item.convertPrice()}đ</span>
                                                <span class="old-price">${item.price}đ</span>
                                                <span class="discount-percentage">${item.discout}%</span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="<%=request.getContextPath()%>/homepage/dienthoai?name=${item.name}">Add to cart</a></li>
                                                <li><a class="links-details" href="wishlist.html"><i
                                                        class="fa fa-heart-o"></i></a></li>
                                                <li><a href="<%=request.getContextPath()%>/homepage/dienthoai?name=${item.name}"><i class="fa fa-eye"></i></a></li>
                                            </ul>
<%--                                            <a href="#" title="quick view" class="quick-view-btn"--%>
<%--                                               data-toggle="modal" data-target="#exampleModalCenter"><i--%>
<%--                                                    class="fa fa-eye"></i></a>--%>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="li-static-banner">
    <div class="container">
        <div class="row">
            <!-- Begin Single Banner Area -->
            <div class="col-lg-4 col-md-4 text-center">
                <div class="single-banner">
                    <a href="#">
                        <img src="<%=request.getContextPath()%>/views/website/images/banner/1_3.jpg" alt="Li's Static Banner">
                    </a>
                </div>
            </div>
            <!-- Single Banner Area End Here -->
            <!-- Begin Single Banner Area -->
            <div class="col-lg-4 col-md-4 text-center pt-xs-30">
                <div class="single-banner">
                    <a href="#">
                        <img src="<%=request.getContextPath()%>/views/website/images/banner/1_4.jpg" alt="Li's Static Banner">
                    </a>
                </div>
            </div>
            <!-- Single Banner Area End Here -->
            <!-- Begin Single Banner Area -->
            <div class="col-lg-4 col-md-4 text-center pt-xs-30">
                <div class="single-banner">
                    <a href="#">
                        <img src="<%=request.getContextPath()%>/views/website/images/banner/1_5.jpg" alt="Li's Static Banner">
                    </a>
                </div>
            </div>
            <!-- Single Banner Area End Here -->
        </div>
    </div>
</div>

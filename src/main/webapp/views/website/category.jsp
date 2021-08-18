<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="breadcrumb-area">
        <div class="container">
            <div class="breadcrumb-content">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Shop Left Sidebar</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Li's Breadcrumb Area End Here -->
    <!-- Begin Li's Content Wraper Area -->
    <div class="content-wraper pt-60 pb-60 pt-sm-30">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 order-1 order-lg-2">
                    <!-- Begin Li's Banner Area -->
                    <div class="single-banner shop-page-banner">
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/views/website/images/bg-banner/2.jpg" alt="Li's Static Banner">
                        </a>
                    </div>
                    <!-- Li's Banner Area End Here -->
                    <!-- shop-top-bar start -->
                    <div class="shop-top-bar mt-30">
                        <div class="shop-bar-inner">
                            <div class="product-view-mode">
                                <!-- shop-item-filter-list start -->
                                <ul class="nav shop-item-filter-list" role="tablist">
                                    <li class="active" role="presentation"><a aria-selected="true" class="active show"
                                                                              data-toggle="tab" role="tab"
                                                                              aria-controls="grid-view"
                                                                              href="#grid-view"><i class="fa fa-th"></i></a>
                                    </li>
                                    <li role="presentation"><a data-toggle="tab" role="tab" aria-controls="list-view"
                                                               href="#list-view"><i class="fa fa-th-list"></i></a></li>
                                </ul>
                                <!-- shop-item-filter-list end -->
                            </div>
                            <div class="toolbar-amount">
                                <span>Showing 1 to 9 of 15</span>
                            </div>
                        </div>
                        <!-- product-select-box start -->
                        <div class="product-select-box">
                            <div class="product-short">
                                <p>Xếp Theo:</p>
                                <select id="sort" class="nice-select" onchange="sort()">
                                    <option value="trending">Tất Cả</option>
                                    <option value="asc">Giá thấp đến cao</option>
                                    <option value="decs">Giá cao đến thấp</option>
                                    <option value="rating">Trả Góp 0% </option>
                                    <option value="date">Khuyến Mại</option>
                                </select>
                            </div>
                        </div>
                        <!-- product-select-box end -->
                    </div>
                    <!-- shop-top-bar end -->
                    <!-- shop-products-wrapper start -->
                    <div class="shop-products-wrapper">
                        <div class="tab-content">
                            <div id="grid-view" class="tab-pane fade active show" role="tabpanel">
                                <div class="product-area shop-product-area">
                                    <div class="row">
                                        <c:forEach var="item" items="${listProductCategory}">
                                        <div class="col-lg-4 col-md-4 col-sm-6 mt-40">
                                            <!-- single-product-wrap start -->
                                            <div class="single-product-wrap">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/files/${item.image}"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">${item.properties.name}</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">${item.name}</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price new-price-2">${item.discout >0 ? item.showPrice(): ""}</span>
                                                            <span class="${item.discout >0 ? "old-price" : "new-price"}">${item.showPriceDiscout()}</span>
                                                            <span class="discount-percentage">${item.convertDiscout()}</span>
                                                        </div>
                                                    </div>
                                                    <div class="add-actions">
                                                        <ul class="add-actions-link">
                                                            <li class="add-cart active"><a href="<%=request.getContextPath()%>/homepage/dienthoai?name=${item.name}">Add
                                                                to cart</a></li>
                                                            <li><a href="#" title="quick view" class="quick-view-btn"
                                                                   data-toggle="modal"
                                                                   data-target="#exampleModalCenter"><i
                                                                    class="fa fa-eye"></i></a></li>
                                                            <li><a class="links-details" href="<%=request.getContextPath()%>/homepage/dienthoai?name=${item.name}"><i
                                                                    class="fa fa-heart-o"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- single-product-wrap end -->
                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div id="list-view" class="tab-pane fade product-list-view" role="tabpanel">
                                <div class="row">
                                    <div class="col">
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/12.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/11.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/10.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/9.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/8.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/7.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/6.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/5.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/4.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/3.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/2.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action mb-xs-30">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row product-layout-list last-child">
                                            <div class="col-lg-3 col-md-5 ">
                                                <div class="product-image">
                                                    <a href="single-product.html">
                                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/1.jpg"
                                                             alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-7">
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="product-details.html">Graphic Corner</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                    <li class="no-star"><i class="fa fa-star-o"></i>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" href="single-product.html">Hummingbird
                                                            printed t-shirt</a></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$46.80</span>
                                                        </div>
                                                        <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant
                                                            360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With
                                                            Exquisite Sound via Ring Radiator Technology. Stream And
                                                            Control R3 Speakers Wirelessly With Your Smartphone.
                                                            Sophisticated, Modern Desig</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="shop-add-action">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart"><a href="#">Add to cart</a></li>
                                                        <li class="wishlist"><a href="wishlist.html"><i
                                                                class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                        <li><a class="quick-view" data-toggle="modal"
                                                               data-target="#exampleModalCenter" href="#"><i
                                                                class="fa fa-eye"></i>Quick view</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="paginatoin-area">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 pt-xs-15">
                                        <p>Showing 1-12 of 13 item(s)</p>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <ul class="pagination-box pt-xs-20 pb-xs-15">
                                            <li><a href="#" class="Previous"><i class="fa fa-chevron-left"></i> Previous</a>
                                            </li>
                                            <li class="active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li>
                                                <a href="#" class="Next"> Next <i class="fa fa-chevron-right"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- shop-products-wrapper end -->
                </div>
                <div class="col-lg-3 order-2 order-lg-1">
                    <!--sidebar-categores-box start  -->
                    <div class="sidebar-categores-box mt-sm-30 mt-xs-30">
                        <div class="sidebar-title">
                            <h2>Hãng Điện Thoại</h2>
                        </div>
                        <!-- category-sub-menu start -->
                        <div class="categori-checkbox">
                            <form action="#">
                                <ul>
                                    <li><input type="checkbox" name="category"><a href="#">Tất Cả</a></li>
                                    <c:forEach var="item" items="${listCategory}">
                                        <li><input type="checkbox" ${item.id == IdCategory ? "checked": ""}  value="${item.id}"} >
                                            <a href="#">${item.name}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </form>
                        </div>
                        <!-- category-sub-menu end -->
                    </div>
                    <!--sidebar-categores-box end  -->
                    <!--sidebar-categores-box start  -->
                    <div class="sidebar-categores-box">
                        <div class="sidebar-title">
                            <h2>Filter By</h2>
                        </div>
                        <!-- btn-clear-all start -->
                        <button class="btn-clear-all mb-sm-30 mb-xs-30">Clear all</button>
                        <!-- btn-clear-all end -->
                        <!-- filter-sub-area start -->
                        <div class="filter-sub-area">
                            <h5 class="filter-sub-titel">Mức Giá</h5>
                            <div class="categori-checkbox">
                                <form action="#">
                                    <ul>
                                        <li><input type="checkbox" name="product-categori" checked><a href="#">Tất Cả</a></li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">Dưới 1000</a></li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">1000-3000</a></li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">3000-5000</a></li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">Trên 5000</a></li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                        <div class="filter-sub-area pt-sm-10 pt-xs-10">
                            <h5 class="filter-sub-titel">Tính Năng</h5>
                            <div class="categori-checkbox">
                                <form action="#">
                                    <ul>
                                        <li><input type="checkbox" name="product-categori" checked><a href="#">Tất cả</a></li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">Bảo mật vân tây</a></li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">Nhận diện khuôn mặt</a></li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">Sạc nhanh</a></li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                        <!-- filter-sub-area end -->
                        <!-- filter-sub-area start -->
                        <div class="filter-sub-area pt-sm-10 pt-xs-10">
                            <h5 class="filter-sub-titel">Trả Góp</h5>
                            <div class="size-checkbox">
                                <form action="#">
                                    <ul>
                                        <li><input type="checkbox" name="product-size" checked><a href="#">Tất cả</a></li>
                                        <li><input type="checkbox" name="product-size"><a href="#">0%</a></li>
                                        <li><input type="checkbox" name="product-size"><a href="#">0đ</a></li>
                                        <li><input type="checkbox" name="product-size"><a href="#">0%/0đ</a></li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                        <div class="filter-sub-area pt-sm-10 pb-sm-15 pb-xs-15">
                            <h5 class="filter-sub-titel">Kích thước màn hình</h5>
                            <div class="categori-checkbox">
                                <form action="#">
                                    <ul>
                                        <li><input type="checkbox" name="product-categori" checked><a href="#">Tất cả</a>
                                        </li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">40x60</a>
                                        </li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">60x90</a>
                                        </li>
                                        <li><input type="checkbox" name="product-categori"><a href="#">80x120</a>
                                        </li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                        <!-- filter-sub-area end -->
                    </div>
                    <!--sidebar-categores-box end  -->
                    <!-- category-sub-menu start -->
                </div>
            </div>
        </div>
    </div>
<script>
    function sort(){
        var a = document.getElementById("sort").value
        window.location= "<%=request.getContextPath()%>/homepage/hang?id=${IdCategory}&sort="+a;
    }
</script>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html  lang="zxx">

<!-- index28:48-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home Version One || limupa - Digital Products Store eCommerce Bootstrap 4 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id"
          content="850225260680-s6gfh2hi2nb7uu9ogojmp6nht1rescrl.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/views/website/images/favicon.png">
    <!-- Material Design Iconic Font-V2.2.0 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/material-design-iconic-font.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/font-awesome.min.css">
    <!-- Font Awesome Stars-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/fontawesome-stars.css">
    <!-- Meanmenu CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/meanmenu.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/owl.carousel.min.css">
    <!-- Slick Carousel CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/slick.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/animate.css">
    <!-- Jquery-ui CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/jquery-ui.min.css">
    <!-- Venobox CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/venobox.css">
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/nice-select.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/magnific-popup.css">
    <!-- Bootstrap V4.1.3 Fremwork CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/bootstrap.min.css">
    <!-- Helper CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/helper.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/website/css/responsive.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/common/sweetalert%20(1).css">
    <script src="<%=request.getContextPath()%>/views/common/sweetalert2.all.min.js"></script>
    <!-- Modernizr js -->
    <script src="<%=request.getContextPath()%>/views/website/js/vendor/modernizr-2.8.3.min.js"></script>
    <style type="text/css">
        a.gflag {
            vertical-align: middle;
            font-size: 15px;
            padding: 0px;
            background-repeat: no-repeat;
            background-image: url(//gtranslate.net/flags/16.png);
        }

        a.gflag img {
            border: 0;
        }

        a.gflag:hover {
            background-image: url(//gtranslate.net/flags/16a.png);
        }

        #goog-gt-tt {
            display: none !important;
        }

        .goog-te-banner-frame {
            display: none !important;
        }

        .goog-te-menu-value:hover {
            text-decoration: none !important;
        }

        body {
            top: 0 !important;
        }

        #google_translate_element2 {
            display: none !important;
        }
        div.stars {
            width: 270px;
            display: inline-block
        }

        .mt-200 {
            margin-top: 200px
        }

        input.star {
            display: none
        }

        label.star {
            float: right;
            padding: 10px;
            font-size: 36px;
            color: #4A148C;
            transition: all .2s
        }

        input.star:checked~label.star:before {
            content: '\f005';
            color: #FD4;
            transition: all .25s
        }

        input.star-5:checked~label.star:before {
            color: #FE7;
            text-shadow: 0 0 20px #952
        }

        input.star-1:checked~label.star:before {
            color: #F62
        }

        label.star:hover {
            transform: rotate(-15deg) scale(1.3)
        }

        label.star:before {
            content: '\f006';
            font-family: FontAwesome
        }
        .phimItem{
            transition: all 0.7s;
        }

        .phimItem:hover{
            transform: translateY(-25px);
            transform: scale(1.10);
            z-index: 100;
        }

        .phimNgangItem{
            transition: all 0.7s;
        }

        .phimNgangItem:hover{
            transform: scale(1.10);
            z-index: 100;
        }

        .abcRioButtonLightBlue {
            background-color: #ff4343;
            width: 100%;
        }
        .abcRioButton{
            width: 450px;
        }

        #connecteds94xksg0wpa6{
            width: 400px;
        }

        #player{
            transform: translateY(-150px);
        }

        .plyr__controls{
            transform: translateY(-180px);
        }
        .anime__details__episodes{
            transform: translateY(-270px);
        }
    </style>
</head>
<body>

<!-- Begin Body Wrapper -->
<div class="body-wrapper">
    <div id="google_translate_element2">
        xin chào
    </div>
    <!-- Begin Header Area -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- Header Area End Here -->
    <jsp:include page="${contentHomePage}"></jsp:include>
    <!-- Li's Trendding Products Area End Here -->
    <!-- Begin Footer Area -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Footer Area End Here -->
    <!-- Begin Quick View | Modal Area -->
    <div class="modal fade modal-wrapper " id="exampleModalCenter">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <div class="modal-inner-area row">
                        <div class="col-lg-5 col-md-6 col-sm-6">
                            <!-- Product Details Left -->
                            <div class="product-details-left">
                                <div class="product-details-images slider-navigation-1">
                                    <div class="lg-image">
                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/1.jpg"
                                             alt="product image">
                                    </div>
                                    <div class="lg-image">
                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/2.jpg"
                                             alt="product image">
                                    </div>
                                    <div class="lg-image">
                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/3.jpg"
                                             alt="product image">
                                    </div>
                                    <div class="lg-image">
                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/4.jpg"
                                             alt="product image">
                                    </div>
                                    <div class="lg-image">
                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/5.jpg"
                                             alt="product image">
                                    </div>
                                    <div class="lg-image">
                                        <img src="<%=request.getContextPath()%>/views/website/images/product/large-size/6.jpg"
                                             alt="product image">
                                    </div>
                                </div>
                                <div class="product-details-thumbs slider-thumbs-1">
                                    <%--                                            <div class="sm-image"><img src="<%=request.getContextPath()%>/views/website/images/product/small-size/1.jpg" alt="product image thumb"></div>--%>
                                    <%--                                            <div class="sm-image"><img src="<%=request.getContextPath()%>/views/website/images/product/small-size/2.jpg" alt="product image thumb"></div>--%>
                                    <%--                                            <div class="sm-image"><img src="<%=request.getContextPath()%>/views/website/images/product/small-size/3.jpg" alt="product image thumb"></div>--%>
                                    <%--                                            <div class="sm-image"><img src="<%=request.getContextPath()%>/views/website/images/product/small-size/4.jpg" alt="product image thumb"></div>--%>
                                    <%--                                            <div class="sm-image"><img src="<%=request.getContextPath()%>/views/website/images/product/small-size/5.jpg" alt="product image thumb"></div>--%>
                                    <%--                                            <div class="sm-image"><img src="<%=request.getContextPath()%>/views/website/images/product/small-size/6.jpg" alt="product image thumb"></div>--%>
                                </div>
                            </div>
                            <!--// Product Details Left -->
                        </div>

                        <div class="col-lg-7 col-md-6 col-sm-6">
                            <div class="product-details-view-content pt-60">
                                <div class="product-info">
                                    <h2>Hàng Chất Lượng</h2>
                                    <span class="product-details-ref">Reference: demo_15</span>
                                    <div class="rating-box pt-20">
                                        <ul class="rating rating-with-review-item">
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                            <li class="review-item"><a href="#">Read Review</a></li>
                                            <li class="review-item"><a href="#">Write Review</a></li>
                                        </ul>
                                    </div>
                                    <div class="price-box pt-20">
                                        <span class="new-price new-price-2">$57.98</span>
                                    </div>
                                    <div class="product-desc">
                                        <p>
                                                    <span>100% cotton double printed dress. Black and white striped top and orange high waisted skater skirt bottom. Lorem ipsum dolor sit amet, consectetur adipisicing elit. quibusdam corporis, earum facilis et nostrum dolorum accusamus similique eveniet quia pariatur.
                                                    </span>
                                        </p>
                                    </div>
                                    <div class="product-variants">
                                        <div class="produt-variants-size">
                                            <label>Chọn Màu</label>
                                            <select class="nice-select">
                                                <option value="1" title="S" selected="selected">40x60cm</option>
                                                <option value="2" title="M">60x90cm</option>
                                                <option value="3" title="L">80x120cm</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="single-add-to-cart">
                                        <form action="#" class="cart-quantity">
                                            <div class="quantity">
                                                <label>Quantity</label>
                                                <div class="cart-plus-minus">
                                                    <input class="cart-plus-minus-box" value="1" type="text">
                                                    <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                    <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                </div>
                                            </div>
                                            <button class="add-to-cart" type="submit">Add to cart</button>
                                        </form>
                                    </div>
                                    <div class="product-additional-info pt-25">
                                        <a class="wishlist-btn" href="wishlist.html"><i class="fa fa-heart-o"></i>Add to
                                            wishlist</a>
                                        <div class="product-social-sharing pt-25">
                                            <ul>
                                                <li class="facebook"><a href="#"><i class="fa fa-facebook"></i>Facebook</a>
                                                </li>
                                                <li class="twitter"><a href="#"><i class="fa fa-twitter"></i>Twitter</a>
                                                </li>
                                                <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i>Google
                                                    +</a></li>
                                                <li class="instagram"><a href="#"><i class="fa fa-instagram"></i>Instagram</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Quick View | Modal Area End Here -->
</div>
<!-- Body Wrapper End Here -->
<!-- jQuery-V1.12.4 -->
<script src="<%=request.getContextPath()%>/views/website/js/vendor/jquery-1.12.4.min.js"></script>
<!-- Popper js -->
<script src="<%=request.getContextPath()%>/views/website/js/vendor/popper.min.js"></script>
<!-- Bootstrap V4.1.3 Fremwork js -->
<script src="<%=request.getContextPath()%>/views/website/js/bootstrap.min.js"></script>
<!-- Ajax Mail js -->
<script src="<%=request.getContextPath()%>/views/website/js/ajax-mail.js"></script>
<!-- Meanmenu js -->
<script src="<%=request.getContextPath()%>/views/website/js/jquery.meanmenu.min.js"></script>
<!-- Wow.min js -->
<script src="<%=request.getContextPath()%>/views/website/js/wow.min.js"></script>
<!-- Slick Carousel js -->
<script src="<%=request.getContextPath()%>/views/website/js/slick.min.js"></script>
<!-- Owl Carousel-2 js -->
<script src="<%=request.getContextPath()%>/views/website/js/owl.carousel.min.js"></script>
<!-- Magnific popup js -->
<script src="<%=request.getContextPath()%>/views/website/js/jquery.magnific-popup.min.js"></script>
<!-- Isotope js -->
<script src="<%=request.getContextPath()%>/views/website/js/isotope.pkgd.min.js"></script>
<!-- Imagesloaded js -->
<script src="<%=request.getContextPath()%>/views/website/js/imagesloaded.pkgd.min.js"></script>
<!-- Mixitup js -->
<script src="<%=request.getContextPath()%>/views/website/js/jquery.mixitup.min.js"></script>
<!-- Countdown -->
<script src="<%=request.getContextPath()%>/views/website/js/jquery.countdown.min.js"></script>
<!-- Counterup -->
<script src="<%=request.getContextPath()%>/views/website/js/jquery.counterup.min.js"></script>
<!-- Waypoints -->
<script src="<%=request.getContextPath()%>/views/website/js/waypoints.min.js"></script>
<!-- Barrating -->
<script src="<%=request.getContextPath()%>/views/website/js/jquery.barrating.min.js"></script>
<!-- Jquery-ui -->
<script src="<%=request.getContextPath()%>/views/website/js/jquery-ui.min.js"></script>
<!-- Venobox -->
<script src="<%=request.getContextPath()%>/views/website/js/venobox.min.js"></script>
<!-- Nice Select js -->
<script src="<%=request.getContextPath()%>/views/website/js/jquery.nice-select.min.js"></script>
<!-- ScrollUp js -->
<script src="<%=request.getContextPath()%>/views/website/js/scrollUp.min.js"></script>
<!-- Main/Activator js -->
<script src="<%=request.getContextPath()%>/views/website/js/main.js"></script>
<script>
    function editAsc() {
        var quantity = document.getElementById("quantitySP").value
        document.getElementById("quantitySP").value = Number(quantity) + 1;
    }

    function editDesc() {
        var quantity = document.getElementById("quantitySP").value
        if (quantity > 1) {
            document.getElementById("quantitySP").value = Number(quantity) - 1;
        }
    }
</script>
<script>
    document.getElementById("closeAlertSuccess").onclick = closeAlert;

    function closeAlert() {
        document.getElementById("successAlert3").style.display = 'none';
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    function googleTranslateElementInit2() {
        new google.translate.TranslateElement({
            pageLanguage: 'vi',
            autoDisplay: false
        }, 'google_translate_element2');
    }
</script>
<script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit2"></script>
<script type="text/javascript">
    /* <![CDATA[ */
    eval(function (p, a, c, k, e, r) {
        e = function (c) {
            return (c < a ? '' : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36))
        };
        if (!''.replace(/^/, String)) {
            while (c--) r[e(c)] = k[c] || e(c);
            k = [function (e) {
                return r[e]
            }];
            e = function () {
                return '\\w+'
            };
            c = 1
        }
        while (c--) if (k[c]) p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
        return p
    }('6 7(a,b){n{4(2.9){3 c=2.9("o");c.p(b,f,f);a.q(c)}g{3 c=2.r();a.s(\'t\'+b,c)}}u(e){}}6 h(a){4(a.8)a=a.8;4(a==\'\')v;3 b=a.w(\'|\')[1];3 c;3 d=2.x(\'y\');z(3 i=0;i<d.5;i++)4(d[i].A==\'B-C-D\')c=d[i];4(2.j(\'k\')==E||2.j(\'k\').l.5==0||c.5==0||c.l.5==0){F(6(){h(a)},G)}g{c.8=b;7(c,\'m\');7(c,\'m\')}}', 43, 43, '||document|var|if|length|function|GTranslateFireEvent|value|createEvent||||||true|else|doGTranslate||getElementById|google_translate_element2|innerHTML|change|try|HTMLEvents|initEvent|dispatchEvent|createEventObject|fireEvent|on|catch|return|split|getElementsByTagName|select|for|className|goog|te|combo|null|setTimeout|500'.split('|'), 0, {}))
    /* ]]> */
</script>
</body>

<!-- index30:23-->
</html>
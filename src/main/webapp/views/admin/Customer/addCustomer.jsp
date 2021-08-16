<%@page contentType="text/html;UTF8" pageEncoding="utf-8" language=
        "java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Nura Admin - My profile</title>
    <meta name="description" content="My profile | Nura Admin">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Your website">

    <!-- Favicon -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/views/admin/assets/images/favicon.ico">

    <!-- Bootstrap CSS -->
    <link href="<%=request.getContextPath()%>/views/admin/assets/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"/>

    <!-- Font Awesome CSS -->
    <link href="<%=request.getContextPath()%>/views/admin/assets/font-awesome/css/all.css" rel="stylesheet"
          type="text/css"/>

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/views/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>

</head>

<body class="adminbody">

<div id="main">

    <div class="content-page">

        <!-- Start content -->
        <div class="content">
            <form action="admin/customer" method="post" enctype="multipart/form-data">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-holder">
                                <h1 class="main-title float-left">My Profile</h1>
                                <ol class="breadcrumb float-right">
                                    <li class="breadcrumb-item">Home</li>
                                    <li class="breadcrumb-item active">Profile</li>
                                </ol>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->
                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-9 col-xl-9">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h3><i class="far fa-user"></i> Điền Thông Tin Khách Hàng</h3>
                                </div>

                                <div class="card-body">
                                    <%--                                <c:url var="url" value="admin/user/add" />--%>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Họ Tên</label>
                                                <input class="form-control" name="fullname" type="text"/>
                                            </div>
                                            <p class="text-danger">${errorFullname}</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input class="form-control" name="email" type="email"/>
                                            </div>
                                            <p class="text-danger">${errorEmail}</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Địa Chỉ</label>
                                                <input class="form-control" name="address" type="text" value=""/>
                                            </div>
                                            <p class="text-danger">${errorAddress}</p>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Số Điện Thoại</label>
                                                <input class="form-control" name="phonenumber" type="text" value=""/>
                                            </div>
                                            <p class="text-danger">${errorPhonenumber}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <hr>
                                            <button class="btn btn-primary" formaction="add">Thêm Nhân Viên</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- end card-body -->

                            </div>
                            <!-- end card -->

                        </div>



                    </div>
                    <!-- end row -->
                <!-- END container-fluid -->
            </form>
        </div>
        <!-- END content -->

    </div>
    <!-- END content-page -->

    <footer class="footer">
            <span class="text-right">
                Copyright <a target="_blank" href="#">Your Company</a>
            </span>
        <span class="float-right">
                <!-- Copyright footer link MUST remain intact if you download free version. -->
            <!-- You can delete the links only if you purchased the pro or extended version. -->
            <!-- Purchase the pro or extended version with PHP version of this template: https://bootstrap24.com/template/nura-admin-4-free-bootstrap-admin-template -->
                Powered by <a target="_blank" href="https://bootstrap24.com"
                              title="Download free Bootstrap templates"><b>Bootstrap24.com</b></a>
            </span>
    </footer>

    <script src="<%=request.getContextPath()%>/views/admin/assets/js/modernizr.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/admin/assets/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/admin/assets/js/moment.min.js"></script>

    <script src="<%=request.getContextPath()%>/views/admin/assets/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/admin/assets/js/bootstrap.min.js"></script>

    <script src="<%=request.getContextPath()%>/views/admin/assets/js/detect.js"></script>
    <script src="<%=request.getContextPath()%>/views/admin/assets/js/fastclick.js"></script>
    <script src="<%=request.getContextPath()%>/views/admin/assets/js/jquery.blockUI.js"></script>
    <script src="<%=request.getContextPath()%>/views/admin/assets/js/jquery.nicescroll.js"></script>

    <!-- App js -->
    <script src="<%=request.getContextPath()%>/views/admin/assets/js/admin.js"></script>
    <script>
        const files = document.querySelector("#files");
        const reader = new FileReader();
        files.addEventListener("change", (evt) => {
            const files = evt.target.files;
            console.log(files)
            reader.readAsDataURL(files[0])
            reader.addEventListener("load", (evt) => {
                const url = evt.target.result
                console.log(url)
                document.getElementById("img").src = url ;
            })
        })
    </script>

</div>
<!-- END main -->

</body>

</html>
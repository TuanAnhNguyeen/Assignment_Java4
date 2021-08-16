<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Nura Admin - Users</title>
    <meta name="description" content="Users | Nura Admin">
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


    <div class="content-page">

        <!-- Start content -->
        <div class="content">

            <div class="container-fluid">


                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-holder">
                            <h1 class="main-title float-left">Users</h1>
                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item">Home</li>
                                <li class="breadcrumb-item active">Users</li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->


                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <div class="card mb-3">
                            <div class="card-header">
                                    <span class="pull-right">
                                        <button class="btn btn-primary btn-sm">
                                            <i class="fas fa-user-plus"></i><a href="user/add">Thêm Nhân Viên</a> </button>
                                    </span>
                                <h3>
                                    <i class="far fa-user"></i> All users</h3>
                            </div>
                            <!-- end card-header -->

                            <div class="card-body">

                                <div class="">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th style="width: 150px">Mã Nhân Viên</th>
                                            <th>Họ Và Tên</th>
                                            <th>Ngày Sinh</th>
                                            <th style="width: 200px">Địa Chỉ</th>
                                            <th style="width: 150px">Email</th>
                                            <th>Số Điện Thoại</th>
                                            <th>Lương</th>
                                            <th>Giới Tính</th>
                                            <th>Chức Vụ</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${listStaff}">
                                            <tr>
                                                <td>${item.id}</td>
                                                <td>${item.fullname}</td>
                                                <td>${item.convertBirthday()}</td>
                                                <td>${item.address}</td>
                                                <td>${item.email}</td>
                                                <td>${item.phonenumber}</td>
                                                <td>${item.salary}</td>
                                                <td>${item.gender ? "Nữ" : "Nam"}</td>
                                                <td>${item.role.name}</td>
                                                <td>
                                                    <a href="user/edit?id=${item.id}" class="btn btn-primary btn-sm btn-block"><i class="far fa-edit"></i> Edit</a>
                                                    <a href="#" class="btn btn-danger btn-sm btn-block mt-2"><i class="fas fa-trash"></i> Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>


                            </div>
                            <!-- end card-body -->

                        </div>
                        <!-- end card -->

                    </div>
                    <!-- end col -->

                </div>
                <!-- end row -->

            </div>
            <!-- END container-fluid -->

        </div>
        <!-- END content -->

    </div>
    <!-- END content-page -->

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


</body>

</html>
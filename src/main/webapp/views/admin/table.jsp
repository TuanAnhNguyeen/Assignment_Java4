
<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Nura Admin - DataTables</title>
    <meta name="description" content="DataTables | Nura Admin">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Your website">
    <!-- Favicon -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/views/admin/assets/images/favicon.ico">

    <!-- Bootstrap CSS -->
    <link href="<%=request.getContextPath()%>/views/admin/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <!-- Font Awesome CSS -->
    <link href="<%=request.getContextPath()%>/views/admin/assets/font-awesome/css/all.css" rel="stylesheet" type="text/css" />

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/views/admin/assets/css/style.css" rel="stylesheet" type="text/css" />

    <!-- BEGIN CSS for this page -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/admin/assets/plugins/datatables/datatables.min.css" />
    <style>
        tfoot {
            display: table-header-group;
        }
    </style>
    <!-- END CSS for this page -->
</head>

<body class="adminbody">



        <!-- End Sidebar -->

        <div class="content-page">

            <!-- Start content -->
            <div class="content">

                <div class="container-fluid">

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-holder">
                                <h1 class="main-title float-left"> Quản Lí Nhân Viên</h1>
                                <ol class="breadcrumb float-right">
                                    <div class="card-header">
                                        <button type="button" class="btn btn-primary">
                                            <i class="fas fa-user-plus"></i><a class="btn btn-primary" href="user/add">Thêm Nhân Viên </a> </button>
                                    </div>
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
                                    <h3><i class="fas fa-table"></i>Bảng Nhân Viên</h3>
                                </div>

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="dataTable1" class="table table-striped table-bordered zero-configuration" >
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Mã Nhân Viên</th>
                                                    <th>Họ Và Tên</th>
                                                    <th>Ngày Sinh</th>
                                                    <th>Số Điện Thoại</th>
                                                    <th>Lương</th>
                                                    <th>Giới Tính</th>
                                                    <th>Chức Vụ</th>
                                                    <th>Hoạt Động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach  var="item" items="${listStaff}" varStatus="index">
                                                <tr>
                                                    <td> ${index.index +1}</td>
                                                    <td>${item.id}</td>
                                                    <td>${item.fullname}</td>
                                                    <td>${item.convertBirthday()}</td>
                                                    <td>${item.phonenumber}</td>
                                                    <td>${item.salary}</td>
                                                    <td>${item.gender ? "Nam" : "Nữ"}</td>
                                                    <td>${item.role.name}</td>
                                                    <td>
                                                        <a href="user/edit?id=${item.id}" class="btn btn-primary " >Sửa</a>
                                                        <a  href="user/delete?id=${item.id}" class="btn btn-danger">Khóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <!-- Modal -->
                                    </div>
                                    <!-- end table-responsive-->

                                </div>
                                <!-- end card-body-->

                            </div>
                            <!-- end card-->

                        </div>

                    </div>
                    <!-- end row-->

                </div>


            </div>


        </div>

    <!-- END main để t import lại thử -->
    <script src="<%=request.getContextPath()%>/views/admin/assets/plugins/datatables/datatables.min.js"></script>
    <!-- dataTabled data -->
    <script src="<%=request.getContextPath()%>/views/admin/assets/data/data_datatables.js"></script>
    <script>
        $(document).ready(function() {
            $('#dataTable1').DataTable();
        });

    </script>
    <!-- END Java Script for this page -->

</body>

</html>
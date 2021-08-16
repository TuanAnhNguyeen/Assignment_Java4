
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
            <h1 class="main-title float-left"> Quản Lí Sản Phẩm</h1>
            <ol class="breadcrumb float-right">
              <div class="card-header">
                <button type="button" class="btn btn-primary">
                  <i class="fas fa-user-plus"></i><a class="btn btn-primary" href="<%=request.getContextPath()%>/admin/products/add">Thêm Sản Phẩm</a> </button>
              </div>
              <div class="card-header">
                <button type="button" class="btn btn-primary">
                  <i class="fas fa-user-plus"></i><a role="button" href="#" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                  Sửa Sản Phẩm
                </a> </button>
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
                    <th>Mã Sản Phẩm</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Giá Nhập</th>
                    <th>Giá Bán</th>
                    <th>Giá Giảm</th>
                    <th>Số Lượng</th>
                    <th>Dung Lượng</th>
                    <th>Màu Sắc</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach  var="item" items="${listProducts}" varStatus="index">
                    <tr>
                      <td> ${index.index +1}</td>
                      <td>${item.id}</td>
                      <td>${item.products.name}</td>
                      <td>${item.products.importprice}</td>
                      <td>${item.products.price}</td>
                      <td>${item.products.discout/100}</td>
                      <td>${item.quantity}</td>
                      <td>${item.products.properties.name}</td>
                      <td>${item.color}</td>
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

        </div>

      </div>


    </div>


  </div>


</div>
</div>


<div class="modal fade bd-example-modal-sm show" style="display: ${checkProductDetails ? "block" : "none"}" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Sửa Sản Phẩm</h5>
      </div>
      <div class="modal-body">
          <input>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

</div>




<div class="modal fade show" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Sửa Sản Phẩm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="<%=request.getContextPath()%>/admin/products/edit" method="get">
        <div class="modal-body">
          <div class="form-group">
            <label>Nhập id hoặc tên sản phẩm</label>
            <input class="form-control" name="key" type="text" required/>
          </div>
        </div>
        <div class="modal-footer">
          <button  class="btn btn-primary" >Xác Nhận</button>
        </div>
      </form>
    </div>
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
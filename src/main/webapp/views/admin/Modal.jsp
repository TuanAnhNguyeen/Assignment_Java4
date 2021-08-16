<%--
  Created by IntelliJ IDEA.
  User: Duy
  Date: 7/22/2021
  Time: 9:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
</body>
</html>

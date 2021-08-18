
<%@ page contentType="text/html; UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-page">
    <!-- Start content -->
    <div class="content">
        <form action="<%=request.getContextPath()%>/admin/products/edit" method="post" enctype="multipart/form-data" >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-holder">
                            <h1 class="main-title float-left">Sủa Sản Phẩm</h1>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 col-xl-3">
                        <div class="card mb-3">
                            <div class="card-header">
                                <h3><i class="far fa-file-image"></i> Chọn Ảnh Đại Diện Sản Phẩm</h3>
                            </div>

                            <div class="card-body text-center">

                                <div class="row">
                                    <div class="col-lg-12">
                                        <img alt="avatar" id="img" class="img-fluid"
                                             src="<%=request.getContextPath()%>/files/${product.image}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <%--                                            <button type="button" class="btn btn-info btn-block mt-3">Change avatar</button>--%>
                                        <div class="bg-info text-white mt-3" style="height: 40px">
                                            <label for="files" class="btn">Chọn Ảnh Banner</label>
                                            <input id="files" name="photo_banner" style="visibility:hidden;" type="file" >
                                        </div>
                                        <p class="text-danger">${errorPhoto_banner}</p>
                                    </div>
                                </div>

                            </div>
                            <!-- end card-body -->

                        </div>
                        <!-- end card -->
                        <div class="card mb-3">
                            <div class="wrap">
                                <h4>Chọn Thêm Ảnh</h4>
                                <div class="dandev-reviews">
                                    <div class="form_upload">
                                        <label class="dandev_insert_attach"><span>Đính kèm ảnh</span></label>
                                    </div>
                                    <div class="list_attach">
                                        <ul class="dandev_attach_view">
                                            <c:forEach var="item" items="${listImage}">
                                            <li id="li_files_1627561204406" class="">
                                                <div class="img-wrap">
                                                    <span class="close" onclick="DelImg(this)">×</span>
                                                    <div class="img-wrap-box">
                                                    <img src="<%=request.getContextPath()%>/files/${item.name}">
                                                    </div>
                                                </div>
                                            </li>
                                            </c:forEach>
                                        </ul>
                                        <span class="dandev_insert_attach"><i class="dandev-plus">+</i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-9 col-xl-9">
                        <div class="card mb-3">
                            <div class="card-header">
                                <h3><i class="far fa-user"></i> Profile details</h3>
                            </div>

                            <div class="card-body">
                                <%--                                <c:url var="url" value="admin/user/add" />--%>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Mã Sản Phẩm</label>
                                            <input class="form-control" name="id" value="${product.id}" type="text" readonly/>
                                        </div>
                                        <p class="text-danger">${erorrId}</p>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Tên Sản Phẩm</label>
                                            <input class="form-control" name="name" value="${product.name}" type="text"/>
                                        </div>
                                        <p class="text-danger">${errorName}</p>
                                    </div>
                                    <%--                                        <p class="text-danger">${errorEmail}</p>--%>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Giá Bán</label>
                                            <input class="form-control" name="price" type="number" value="${product.price}"/>
                                        </div>
                                        <p class="text-danger">${errorPrice}</p>
                                    </div>


                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Giảm Giá</label>
                                            <input class="form-control" name="discout" type="text" value="${product.discout}"/>
                                        </div>
                                        <p class="text-danger">${errorDiscout}</p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Giá Nhập</label>
                                            <input class="form-control" name="importPrice" type="number" value="${product.importprice}"/>
                                        </div>
                                        <p class="text-danger">${errorImportPrice}</p>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Dung Lượng</label>
                                        <select id="memory" class="form-control" name="properties">
                                            <option value=""> Chọn Dung Lượng</option>
                                            <c:forEach var="item" items="${listProperties}">
                                                <option value="${item.id}" ${product.properties.id == item.id ? "selected" : ""}> ${item.name}</option>
                                            </c:forEach>
                                        </select>
                                        <p class="text-danger">${errorProperties}</p>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label>Hãng</label>
                                        <select  class="form-control" name="category">
                                            <option value=""> Chọn Hãng</option>
                                            <c:forEach var="item" items="${listCategory}">
                                                <option value="${item.id}" ${product.category.id == item.id ? "selected" : ""}> ${item.name}</option>
                                            </c:forEach>
                                        </select>
                                        <p class="text-danger">${errorCategory}</p>
                                    </div>
                                    <div class="col-lg-6" id="themmau">
                                        <label> <a type="button" id="addColor">Thêm Chi Tiết sản phẩm</a></label>
                                        <br>
                                        <c:forEach var="item" items="${listProduct_details}">
                                        <div>
                                            Màu Sắc : <input name="color" type="text" style="width: 100px " value="${item.color}" readonly >
                                            Số Lượng : <input name="quantity" type="number" style="width: 100px" value="${item.quantity}" min="1" readonly>
                                        </div>
                                        </c:forEach>
                                        <p class="text-danger">${errorColor}</p>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label>Mô Tả</label>
                                        <textarea  id="editor1" name="note" cols="80" rows="10" >
                                            ${product.details}
                                            </textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <hr>
                                        <button class="btn btn-primary" >Sửa Sản Phẩm</button>
                                    </div>
                                </div>
                            </div>
                            <!-- end card-body -->

                        </div>
                        <!-- end card -->

                    </div>
                    <!-- end col -->



                    <!-- end col -->


                </div>
                <!-- end row -->


            </div>

            <!-- END container-fluid -->
        </form>
    </div>
    <!-- END content -->



</div>

<script type="text/javascript">
    $('.dandev_insert_attach').click(function() {
        if ($('.list_attach').hasClass('show-btn') === false) {
            $('.list_attach').addClass('show-btn');
        }
        var _lastimg = jQuery('.dandev_attach_view li').last().find('input[type="file"]').val();

        if (_lastimg != '') {
            var d = new Date();
            var _time = d.getTime();
            var _html = '<li id="li_files_' + _time + '" class="li_file_hide">';
            _html += '<div class="img-wrap">';
            _html += '<span class="close" onclick="DelImg(this)">×</span>';
            _html += ' <div class="img-wrap-box"></div>';
            _html += '</div>';
            _html += '<div class="' + _time + '">';
            _html += '<input type="file" name="aaa" class="hidden"  onchange="uploadImg(this)" id="files_' + _time + '"   />';
            _html += '</div>';
            _html += '</li>';
            jQuery('.dandev_attach_view').append(_html);
            jQuery('.dandev_attach_view li').last().find('input[type="file"]').click();
        } else {
            if (_lastimg == '') {
                jQuery('.dandev_attach_view li').last().find('input[type="file"]').click();
            } else {
                if ($('.list_attach').hasClass('show-btn') === true) {
                    $('.list_attach').removeClass('show-btn');
                }
            }
        }
    });

    function uploadImg(el) {
        var file_data = $(el).prop('files')[0];
        var type = file_data.type;
        var fileToLoad = file_data;

        var fileReader = new FileReader();

        fileReader.onload = function(fileLoadedEvent) {
            var srcData = fileLoadedEvent.target.result;

            var newImage = document.createElement('img');
            newImage.src = srcData;
            var _li = $(el).closest('li');
            if (_li.hasClass('li_file_hide')) {
                _li.removeClass('li_file_hide');
            }
            _li.find('.img-wrap-box').append(newImage.outerHTML);


        }
        fileReader.readAsDataURL(fileToLoad);

    }

    function DelImg(el) {
        jQuery(el).closest('li').remove();

    }
</script>
<script>
    CKEDITOR.replace('editor1')
</script>

<script>
    $(document).ready(function(){
        $("#addColor").click(function(){
            $("#themmau").append("<div> Màu sắc : <input name='color' type='text' style='width: 100px' > Số lượng : <input name='quantity'  type='number' min='1' style='width: 100px' > </div>");
        });
    });
</script>
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

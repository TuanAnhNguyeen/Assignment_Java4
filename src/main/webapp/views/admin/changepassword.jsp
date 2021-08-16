
<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Nura Admin - Forms validation</title>
    <meta name="description" content="Forms validation | Nura Admin">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Your website">

</head>

<body class="adminbody">


        <!-- top bar navigation -->

        <!-- End Sidebar -->

        <div class="content-page">

            <!-- Start content -->
            <div class="content">

                <div class="container-fluid">

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-holder">
                                <h1 class="main-title float-left">Form validation</h1>
                                <ol class="breadcrumb float-right">
                                    <li class="breadcrumb-item">Home</li>
                                    <li class="breadcrumb-item active">Validation</li>
                                </ol>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->


                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">Parsley JavaScript form validation library</h4>
                        <p>You can find examples and documentation about Parsley form validation library here: <a target="_blank" href="http://parsleyjs.org/">Parsley documentation</a></p>
                    </div>


                    <div class="row">

                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h3><i class="far fa-hand-pointer"></i> Đổi Mật Khẩu</h3>
                                </div>

                                <div class="card-body">
                                    <form action="<%=request.getContextPath()%>/account/changepassword" method="post" data-parsley-validate novalidate>
                                        <div class="form-group">
                                            <label for="userName">Mật Khẩu Hiện Tại<span class="text-danger">*</span></label>
                                            <input type="password" name="password" data-parsley-trigger="change" required placeholder="Password" class="form-control" id="userName">
                                        </div>
                                        <p class="text-danger">${errorPassword}</p>
                                        <div class="form-group">
                                            <label for="pass1">Mật Khẩu Mới<span class="text-danger">*</span></label>
                                            <input id="pass1" name="newpassword" type="password" placeholder=" New Password" required class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="passWord2">Nhập Lại Mật Khẩu mới<span class="text-danger">*</span></label>
                                            <input name="confrimpassword" data-parsley-equalto="#pass1" type="password" required placeholder="Confrim Password" class="form-control" id="passWord2">
                                        </div>
                                        <div class="form-group text-right m-b-0">
                                            <button class="btn btn-primary" type="submit">
                                               Xác Nhận
                                            </button>
                                        </div>

                                    </form>

                                </div>
                            </div><!-- end card-->
                    </div>

                </div>
                <!-- END container-fluid -->

            </div>
            <!-- END content -->

        </div>
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
    <!-- END main -->

    <!-- BEGIN Java Script for this page -->
    <script src="<%=request.getContextPath()%>/views/admin/assets/plugins/parsleyjs/parsley.min.js"></script>
    <script>
    $(function() {
        var $sections = $('.form-section');

        function navigateTo(index) {
            // Mark the current section with the class 'current'
            $sections
                .removeClass('current')
                .eq(index)
                .addClass('current');
            // Show only the navigation buttons that make sense for the current section:
            $('.form-navigation .previous').toggle(index > 0);
            var atTheEnd = index >= $sections.length - 1;
            $('.form-navigation .next').toggle(!atTheEnd);
            $('.form-navigation [type=submit]').toggle(atTheEnd);
        }

        function curIndex() {
            // Return the current index by looking at which section has the class 'current'
            return $sections.index($sections.filter('.current'));
        }

        // Previous button is easy, just go back
        $(document).on( "click", ".form-navigation .previous", function() {             
            navigateTo(curIndex() - 1);
        });

        // Next button goes forward iff current block validates
        $(document).on( "click", ".form-navigation .next", function() {      
            $('.demo-form').parsley().whenValidate({
                group: 'block-' + curIndex()
            }).done(function() {
                navigateTo(curIndex() + 1);
            });
        });

        // Prepare sections by setting the `data-parsley-group` attribute to 'block-0', 'block-1', etc.
        $sections.each(function(index, section) {
            $(section).find(':input').attr('data-parsley-group', 'block-' + index);
        });
        navigateTo(0); // Start at the beginning
    });


    $('#form').parsley();
    </script>
    <!-- END Java Script for this page -->

</body>

</html>
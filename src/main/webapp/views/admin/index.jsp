<%@ page contentType="text/html; UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Nura Admin - Dashboard</title>
    <meta name="description" content="Dashboard | Nura Admin">
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
    <link href="<%=request.getContextPath()%>/views/admin/assets/css/addproduct.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <!-- BEGIN CSS for this page -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/admin/assets/plugins/chart.js/Chart.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/admin/assets/plugins/datatables/datatables.min.css" />
    <script src="<%=request.getContextPath()%>/views/admin/ckeditor/ckeditor.js"></script>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <!-- END CSS for this page -->
</head>

<body class="adminbody">

    <div id="main">
        <jsp:include page="topbar.jsp"></jsp:include>
        <!-- top bar navigation -->
        <jsp:include page="sliderbar.jsp" />

        <jsp:include  page="${content}"></jsp:include>


        <jsp:include page="footer.jsp"/>
        <jsp:include page="../common/modalError.jsp"></jsp:include>
        <jsp:include page="../common/modalmsgSuccess.jsp"></jsp:include>

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

    </div>
    <!-- END main -->

    <!-- BEGIN Java Script for this page -->
    <script src="<%=request.getContextPath()%>/views/admin/assets/plugins/chart.js/Chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/admin/assets/plugins/datatables/datatables.min.js"></script>

    <!-- Counter-Up-->
    <script src="<%=request.getContextPath()%>/views/admin/assets/plugins/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/admin/assets/plugins/counterup/jquery.counterup.min.js"></script>

    <!-- dataTabled data -->
    <script src="<%=request.getContextPath()%>/views/admin/assets/data/data_datatables.js"></script>

    <!-- Charts data -->
    <script src="<%=request.getContextPath()%>/views/admin/assets/data/data_charts_dashboard.js"></script>
    <script>
        $(document).on('ready', function() {
            // data-tables
            $('#dataTable').DataTable({
                data: dataSet,
                columns: [{
                    title: "Name"
                }, {
                    title: "Position"
                }, {
                    title: "Office"
                }, {
                    title: "Extn."
                }, {
                    title: "Date"
                }, {
                    title: "Salary"
                }]
            });

            // counter-up
            $('.counter').counterUp({
                delay: 10,
                time: 600
            });
        });
    </script>
    <!-- END Java Script for this page -->

</body>

</html>
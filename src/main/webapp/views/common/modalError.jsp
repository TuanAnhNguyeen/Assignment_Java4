<%--
  Created by IntelliJ IDEA.
  User: Duy
  Date: 7/25/2021
  Time: 10:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/common/sweetalert%20(1).css">
    <script src="<%=request.getContextPath()%>/views/common/sweetalert2.all.min.js"></script>
</head>
<body>
<div id="errorAlert" class="swal2-container swal2-center swal2-backdrop-show" style="display:${checkErorr ? "block" :"none"}  ">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-content"
         class="swal2-popup swal2-modal swal2-icon-error swal2-show" tabindex="-1" role="dialog"
         aria-live="assertive" aria-modal="true" style="display: flex;">
        <div class="swal2-header">
            <div class="swal2-icon swal2-error swal2-icon-show" style="display: flex;"><span class="swal2-x-mark">
                            <span class="swal2-x-mark-line-left"></span>
                            <span class="swal2-x-mark-line-right"></span>
                        </span>
            </div>
            <h2 class="swal2-title" id="swal2-title" style="display: flex;">${messengeError}</h2>
        </div>

        <div class="swal2-actions">
            <div class="swal2-loader"></div>
            <a href="${link}" type="button" class="swal2-confirm swal2-styled" id="closeAlertError" aria-label=""
                    style="display: inline-block;">OK
            </a>
        </div>
    </div>
</div>

<script>
    document.getElementById("closeAlertError").onclick = closeAlert;

    function closeAlert() {
        document.getElementById("errorAlert").style.display = 'none';
    }

</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <%@include file="../../includes/admin/common.jsp" %>
  <title>관리자 이벤트 등록</title>
  <style>
    .title {
      margin-top: 15px;
    }
  </style>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div class="d-flex justify-content-start">
  <!-- Sidebar -->
  <%@include file="../../includes/admin/sidebar.jsp" %>
  <!-- End of Sidebar -->

  <!-- Content Wrapper -->
  <!-- [[ 오른쪽 div 시작 ]] -->
  <section class="contentdiv d-flex" style="margin-left: 224px">
    <!-- Topbar -->
    <%@include file="../../includes/admin/header.jsp" %>
    <!-- End of Topbar -->
    <!-- Main Content -->
    <main class="container-fluid">
      <div class="title">
        <h4>프로그램 등록&nbsp;<span class="eventname">(해당 행사이름)</span></h4>
      </div>
<%--여기에 메인 넣으면 됨--%>
    </main>
    <!-- Footer -->
    <%@include file="../../includes/admin/footer.jsp" %>
    <!-- End of Footer -->
    <!-- End of Content Wrapper -->
  </section>
</div>
<!-- [[ 오른쪽 div 끝 ]] -->
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>
</body>
</html>
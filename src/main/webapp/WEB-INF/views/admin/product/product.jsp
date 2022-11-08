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
  <%@include file="../../../includes/admin/common.jsp" %>
  <title>관리자 상품관리</title>
  <style>

  </style>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div class="d-flex justify-content-start">
  <!-- Sidebar -->
  <%@include file="../../../includes/admin/sidebar.jsp" %>
  <!-- Content Wrapper -->
  <section class="contentdiv d-flex" style="margin-left: 224px">
    <!-- Topbar -->
    <%@include file="../../../includes/admin/header.jsp" %>
    <!-- Main Content -->
    <main class="container-fluid">
      <!-- Begin Page Content -->
      <section id="main">
        <section class="container-fluid">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800 mt-4">상품관리 페이지</h1>
          <p class="mt-3 mb-1 info">
            공지글을 관리하는 페이지 입니다. 클라이언트 페이지의 상품 목록으로 이동하시려면 <a href="/product/search" class="font-weight-bold">링크</a>를 눌러주세요.
          </p>

          <!-- 상품 목록 시작 -->
          <div class="card mb-4">

          </div>
        </section>
        <nav aria-label="Page navigation ">
          <ul class="pagination d-flex justify-content-center">


          </ul>
        </nav>
      </section>
    </main>
    <!-- Footer -->
    <%@include file="../../../includes/admin/footer.jsp" %>
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

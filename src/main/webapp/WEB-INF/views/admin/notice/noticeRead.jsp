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
    <title>관리자 공지사항</title>
      <style>
          .card-body{
              height: 100%;
          }
          table tr,
          table th{
              color: black;
          }
          tbody{
              height: 50vh;
          }
      </style>
  </head>
  <body id="page-top">
    <!-- Page Wrapper -->
    <div class="d-flex justify-content-start">
      <!-- Sidebar -->
	  <%@include file="../../../includes/admin/sidebar.jsp" %>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <!-- [[ 오른쪽 div 시작 ]] -->
      <section class="contentdiv d-flex" style="margin-left: 224px">
        <!-- Topbar -->
	   <%@include file="../../../includes/admin/header.jsp" %>
        <!-- End of Topbar -->
        <!-- Main Content -->
		<main class="container-fluid">
            <!-- Begin Page Content -->
            <section class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800 mt-4">공지사항 상세 페이지</h1>
                <!-- Notice Content -->
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <table class="table table-bordered border-dark" id="dataTable">
                            <thead>
                                <tr>
                                    <th class="text-center col-1">글번호</th>
                                    <td colspan="3">${noticeDto.nt_no}</td>
                                </tr>
                                <tr>
                                    <th class="text-center col-1">조회수</th>
                                    <td>${noticeDto.nt_hit}</td>
                                    <th class="text-center col-1">댓글수</th>
                                    <td>${noticeDto.nt_cocnt}</td>
                                </tr>
                                <tr>
                                    <th class="text-center col-1">제목</th>
                                    <td colspan="3">${noticeDto.nt_title}</td>
                                </tr>
                                <tr>
                                    <th class="text-center col-1">등록일</th>
                                    <td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeDto.nt_cdate}"/></td>
                                </tr>
                            </thead>
                            <tbody>
                            <th class="text-center align-middle col-1">내용</th>
                            <td colspan="3">
                                <p class="mt-2">${noticeDto.nt_content}</p>
                            </td>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-header py-3 d-flex justify-content-center">
                        <button id="ntModBtn" type="button" class="btn">공지글 수정하기</button>
                        <button id="ntDelBtn" type="button" class="btn">공지글 삭제하기</button>
                    </div>
                </div>
            </section>
            <%-- ================================== 공지사항 댓글 관리 ====================================--%>
            <section>

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
    <script>
        $("#ntWrtBtn").click(function(){
            alert("공지사항 등록 버튼");
        })
    </script>
  </body>
</html>
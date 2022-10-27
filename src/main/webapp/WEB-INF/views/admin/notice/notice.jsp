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
        #noticeData,
        #noticeTitle{
            text-align: center;
        }
        table > thead{
            pointer-events: none;
        }
        .info{
            font-size: 0.9rem;
            color: #1a1e21;
        }
        table td{
            color: black;
        }
        tbody tr{
            cursor: pointer;
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
                <h1 class="h3 mb-2 text-gray-800 mt-4">공지사항 페이지</h1>
                <p class="mt-3 mb-1 info">
                    공지글을 관리하는 페이지 입니다. 클라이언트 페이지의 공지사항으로 이동하시려면 <a href="/notice/list" class="font-weight-bold">링크</a>를 눌러주세요.
                </p>
                <p class="info">글 수정 및 삭제는 공지글 조회 후 상세페이지에서 진행해 주세요.</p>
                <!-- Notice Content -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <button id="ntWrtBtn" type="button" class="btn btn-dark">글 등록하기</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover" id="dataTable">
                                <thead id="noticeTitle" class="table-dark">
                                <tr class="text-white">
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>조회수</th>
                                    <th>댓글수</th>
                                    <th>작성일</th>
                                </tr>
                                </thead>
                                <tbody id="noticeData">
                                <c:forEach var="noticeDto" items="${noticeList}">
                                    <tr onclick="link('/admin/notice/read${ph.sc.queryString}&nt_no=${noticeDto.nt_no}')">
                                        <td><c:out value="${noticeDto.nt_no}"/></td>
                                        <td><c:out value="${noticeDto.nt_title}"/></td>
                                        <td><c:out value="${noticeDto.nt_hit}"/></td>
                                        <td><c:out value="${noticeDto.nt_cocnt}"/></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeDto.nt_cdate}"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
            <nav aria-label="Page navigation ">
                <ul class="pagination d-flex justify-content-center">
                    <%-- ================== 검색 결과가 없는 경우 ================== --%>
                    <c:if test="${ph.totalCnt==null || ph.totalCnt==0}">
                        <div> 게시물이 없습니다. </div>
                    </c:if>
                    <%-- ================== 검색 결과가 존재 하는 경우 ================== --%>
                    <c:if test="${ph.totalCnt!=null || ph.totalCnt!=0}">
                        <%-- =================== 이전 페이지 링크 보여줄 지 여부 ================--%>
                        <c:if test="${ph.showPrev}">
                            <li class="page-item">
                                <a class="page-link" href=""<c:url value="/admin/notice/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:if>
                        <%-- =================== 총 게시물 개수만큼 페이징 처리 ================--%>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <li class="page-item">
                                <a class="page-link" href="<c:url value="/admin/notice/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                            </li>
                        </c:forEach>
                        <%-- =================== 다음 페이지 링크 보여줄 지 여부 ================--%>
                        <c:if test="${ph.showNext}">
                            <li class="page-item">
                                <a class="page-link"href="<c:url value="/admin/notice/list${ph.sc.getQueryString(ph.endPage+1)}"/>">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </c:if>
                    </c:if>
                    <%-- ================== 검색 결과가 존재 하는 경우 끝 ================== --%>
                </ul>
            </nav>
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
            location.href="/admin/notice/write";
        })
        let link = function(detailLink){
            location.href= detailLink;
        }
    </script>
  </body>
</html>
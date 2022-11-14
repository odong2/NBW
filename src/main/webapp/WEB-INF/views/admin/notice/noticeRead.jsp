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
    <script src="/ckeditor5-35.2.0/build/ckeditor.js"></script>
    <title>관리자 공지사항</title>
      <style>
          @font-face {
              font-family: 'InfinitySans-RegularA1';
              src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
              font-weight: normal;
              font-style: normal;
          }
          *{
              font-family: 'InfinitySans-RegularA1';
          }
          .main{
              width:90%;
              height: 130vh;
          }
          #modSection{
              display: none;
          }
          textarea{
              color: black;
          }
          #inptitle{
              width:100%;
              height:40px;

          }
          #inptitle:focus{
              outline: solid 1px #b6d4fe;
          }
          form h5{
              font-size:0.9rem;
              color: black;
          }

          .ck-editor__editable {
              height: 400px;
          }
          .ck-content {
              font-size: 12px;
          }
          /*/////////////////*/
          .card-body{
              height: 90%;
          }
          table tr,
          table th{
              color: black;
          }
          #content{
              height: 50vh;
          }
          .file-row{
              font-size:0.9rem;
          }
          .file-row a{
              color: black;
              margin-left: 10px;
          }
          .file-row a:hover{
              color: #4e73df;
              font-weight: bold;
          }
          #wrtBtn,#ntModBtn{
              background-color: white;
              color: #5055b1;
              font-size: 0.9rem;
              font-weight: bold;
              border-color: #5055b1;
              width: 80px;
          }
          #ntModBtn {
              width: 130px;
              height: 42px;
          }
          #modOutBtn, #ntDelBtn{
              background-color: white;
              color: #be2617;
              font-size: 0.9rem;
              font-weight: bold;
              border-color: #a52834;
              width: 80px;
          }
          #ntDelBtn{
              width: 130px;
              height: 42px;
          }
          #wrtBtn:hover,
          #ntModBtn:hover{
              background: #5055b1;
              color:white;
          }
          #modOutBtn:hover,
          #ntDelBtn:hover{
              background:  #be2617;
              color:white;
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
            <%-- ================ 공지글 수정하기 폼 시작 ================--%>
            <section id="modSection" class="container-fluid main">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800 mt-4">공지사항 수정</h1>
                <form action="/admin/notice/modify" method="POST" enctype="multipart/form-data">
                    <h5 class="mt-3 mb-2">제목</h5>
                    <input type="text" name="nt_title" id="inptitle" placeholder="제목을 입력해 주세요" value="${noticeDto.nt_title}"/>
                    <h5 class="mt-3 mb-2">내용</h5>
                    <textarea type="text" class="text-dark" name="nt_content" id="editor">${noticeDto.nt_content}</textarea>
                    <input type="hidden" name="nt_no" value="${noticeDto.nt_no}">
                        <div class="mt-3">
                            <input type="file" name="file" id="fileInput"  value="${noticeDto.nt_filename}"/>
                        </div>
                    <div class="mt-4">
                        <button id="wrtBtn" type="submit"  class="btn  mt-1">수정</button>
                        <button id="modOutBtn" type="button" class="mt-1 btn">취소</button>
                    </div>
                </form>
            </section>
            <%-- ================ 공지글 수정하기 폼 끝================--%>
            <%-- ================ 공지글 읽기 폼 시작 ================--%>
            <section id="readSection" class="container-fluid main">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800 mt-4">공지사항 상세 페이지</h1>
                <!-- Notice Content -->
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <table class="table table-bordered border-dark" id="dataTable">
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
                            <tr id="content">
                                <th class="text-center align-middle col-1">내용</th>
                                <td colspan="3">
                                    <p class="mt-2">${noticeDto.nt_content}</p>
                                </td>
                            </tr>
                            <tr>
                            <th class="text-center col-1">첨부파일</th>
                            <c:set var="file" value="${noticeDto.nt_file}"/>
                            <c:if test="${not empty file}">
                                <c:choose>
                                    <%-- 한글 파일일 경우 --%>
                                    <c:when test="${fn:contains(file, '.hwp')}">
                                        <td colspan="3" class="align-middle file-row">
                                                <img src="/images/hwp.png" width="25px"/>
                                                <a href="/admin/notice/download?fileName=${noticeDto.nt_file}">
                                                    <c:out value="${noticeDto.nt_filename}"/>
                                                </a>
                                        </td>
                                    </c:when>
                                    <%-- 엑셀일 경우 파일일 경우 --%>
                                    <c:when test="${fn:contains(file, '.xlsx')}">
                                        <td colspan="3" class="align-middle file-row">
                                            <img src="/images/xlsx.png" width="20px"/>
                                            <a href="/admin/notice/download?fileName=${noticeDto.nt_file}">
                                                <c:out value="${noticeDto.nt_filename}"/>
                                            </a>
                                        </td>
                                    </c:when>
                                    <%-- pdf일 경우 파일일 경우 --%>
                                    <c:when test="${fn:contains(file, '.pdf')}">
                                        <td colspan="3" class="align-middle file-row">
                                            <img src="/images/pdf.png" width="23px"/>
                                            <a href="/admin/notice/download?fileName=${noticeDto.nt_file}">
                                                <c:out value="${noticeDto.nt_filename}"/>
                                            </a>
                                        </td>
                                    </c:when>
                                    <c:otherwise>
                                        <td colspan="3" class="align-middle file-row">
                                            <a  href="/admin/notice/download?fileName=${noticeDto.nt_file}">
                                                <c:out value="${noticeDto.nt_filename}"/>
                                            </a>
                                        </td>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                            <c:if test="${empty noticeDto.nt_file}">
                                <td colspan="3">첨부파일 없음</td>
                            </c:if>
                            </tr>
                        </table>
                    </div>
                    <div class="card-footer py-3 d-flex justify-content-center col-12">
                        <div class="col-6 d-flex justify-content-end">
                            <button id="ntModBtn" type="button" class="btn">공지글 수정하기</button>
                        </div>
                        <div class="col-6">
                            <button id="ntDelBtn" type="button" class="btn">공지글 삭제하기</button>
                        </div>
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
        $("#ntModBtn").click(function(){
            <%--location.href=`/admin/notice/modify?nt_title=${noticeDto.nt_title}&nt_content=${noticeDto.nt_content}`;--%>
            $("#readSection").css('display','none');
            $("#modSection").css('display','block');
        });
        $("#ntDelBtn").click(function(){
            location.href=`/admin/notice/delete/${noticeDto.nt_no}`;
        })
        $('#modOutBtn').click(()=>{
            $("#readSection").css('display','block');
            $("#modSection").css('display','none');
        })

    </script>
    <script>
        ClassicEditor
            .create(document.querySelector("#editor"),
                {
                    language: "ko",
                })
            .then(newEditor => {
                editor = newEditor;
            })
            .catch(error => {
                console.error(error);
            });
    </script>
  </body>
</html>
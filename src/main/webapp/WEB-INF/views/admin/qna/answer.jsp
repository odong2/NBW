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
    <%-- bootstrap-css--%>
	<link href="/bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet"/>
	<%-- bootstrap-js--%>
	<script src="/bootstrap-5.0.2-dist/js/bootstrap.bundle.js"></script>
	<%@include file="../../../includes/admin/common.jsp" %>
    <title>관리자-문의사항답변</title>
    <style type="text/css">
     @font-face {
       font-family: 'InfinitySans-RegularA1';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
       font-weight: normal;
       font-style: normal;
     }
     *{
       font-family: 'InfinitySans-RegularA1';
     }
     .q_content {
        height: 250px;
        padding: 16px;
        justify-content: center;
        border-radius: 0.5rem;
      }
      .mem_info {
        padding: 24px;
        margin-bottom: 16px;
        border-radius: 0.5rem;
        border: 1px solid rgb(229, 230, 236);
        background-color: rgb(250, 249, 247);
      }
      .register {
        justify-content: end;
        text-align: end;
        margin-right: 16px;
      }
      .admin_box {
        padding: 24px;
        border-radius: 0.5rem;
        border: 1px solid rgb(229, 230, 236);
        background-color: rgb(230, 249, 238);
      }
      .mem_h5 {
        width: fit-content;
        padding: 5px;
        border-radius: 1rem;
        background-color: rgb(198, 191, 176);
        font-size: 16px;
        color: #777;
      }
      .admin_h5 {
        width: fit-content;
        padding: 5px;
        border-radius: 1rem;
        background-color: rgb(167, 207, 184);
        font-size: 16px;
        color: #777;
      }
      .text-black {
        color: #333;
        font-size: 14px;
      }
      input {
        font-size: 14px;
      }
      .modify {
        background-color: #d3cefb;
      }
      .delete {
        background-color: rgb(251, 198, 198);
      }
      .an_cdate{
      	margin: 5px;
      	font-size: 14px;
      	text-align: right;
      }
    </style>
  </head>
  <body id="page-top">
  <script type="text/javascript">
  	/* 관리자 답변 삭제하기 */
  	function delAnswer(){
		alert('답변이 삭제됩니다.');
	  	$("#f_memform").submit();
	}
  </script>
    <!-- Page Wrapper -->
    <div class="d-flex justify-content-start">
      <!-- Sidebar -->
	  <%@include file="../../../includes/admin/sidebar.jsp" %>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <!-- [[ 오른쪽 div 시작 ]] -->
      <section class="contentdiv d-flex" style="margin-left: 224px">
        <!-- Topbar -->
	   <jsp:include page="/WEB-INF/includes/admin/header.jsp" >
	   		<jsp:param value="${ingCnt}" name="ingCnt"/>
	   		<jsp:param value="${questionIngList}" name="questionIngList"/>
	   </jsp:include>
        <!-- End of Topbar -->
        <!-- Main Content -->
		<main class="container-fluid mb-3 p-3">
		<!-- [[ 보낸 회원 정보 시작 ]] -->
				<div class="mem_info">
                  <div class="title">
                    <div class="row">
                      <div class="col-6">
                        <h5 class="mem_h5"><b>문의유형</b></h5>
                        <h5 class="text-black">[${qt.qn_category}]</h5>
                      </div>
                      <div class="col-6">
                        <h5 class="mem_h5"><b>문의 제목</b></h5>
                        <h5 class="text-black">${qt.qn_title}</h5>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-6">
                        <h5 class="mem_h5"><b>문의한 회원</b></h5>
                        <h5 class="text-black">${qt.qn_from}</h5>
                      </div>
                      <div class="col-6">
                        <h5 class="mem_h5"><b>문의 날짜</b></h5>
                        <h6 class="text-black"><fmt:formatDate value="${qt.qn_cdate}" pattern="yyyy-MM-dd"/></h6>
                      </div>
                    </div>
                  </div>
                  <h5 class="mem_h5"><b>문의 내용</b></h5>
                  <div
                    class="q_content text-black"
                    style="background-color: rgb(236, 227, 210)"
                  >
                    <p>
                      ${qt.qn_content}
                    </p>
                  </div>
                </div>
                <!-- [[ 보낸 회원 정보  끝 ]] -->
                <c:choose>
                <c:when test="${qt.qn_state eq '처리중'}">
	               <!-- [[ 관리자 답변 시작 ]] -->
	               <form name="modifyForm"  action="/admin/qna/answer" method="post">
	                <div class="admin_box">
	                  <div class="content">
	                    <h5 class="admin_h5"><b>답변등록</b></h5>
	                    <div>
	                      <input
	                        class="q_content mb-3"
	                        name="an_content"
	                        style="
	                          width: 100%;
	                          margin: 0;
	                          background-color: rgb(244, 255, 249);
	                          border: none;
	                        "
	                      />
	                      <input type="hidden" name="qn_no" value="${qt.qn_no}">
	                    </div>
	                  </div>
	                  <div class="register">
	                    <button class="btn btn-success" type="submit">등록</button>
	                  </div>
	                </div>
	               </form>
	               <!-- [[ 관리자 답변  끝 ]] -->
                </c:when>
                <c:otherwise>
					<!-- [[ 관리자 답변 확인 ]] -->
	              <form action="/admin/qna/remove" method="post" id="delForm">
	                <div class="mem_info">
	                  <div class="content">
	                    <h5 class="mem_h5"><b>관리자 답변</b></h5>
	                    <div
	                      class="q_content text-black"
	                      name="an_content"
	                      style="background-color: rgb(236, 227, 210)"
	                    >
	                      <p>${an.an_content}</p>
	                    </div>
	                  </div>
	                  <div class="an_cdate">
		                  답변 등록일: <fmt:formatDate value="${an.an_cdate}" pattern="yyyy-MM-dd"/>
	                  </div>
	                  <input type="hidden" name="qn_no" value="${qt.qn_no}">
	                  <div class="register">
	                    <button class="btn modify"  data-bs-toggle="modal" data-bs-target="#modifyModal" type="button">수정</button>
	                    <button class="btn delete" onclick="delAnswer()" type="submit">삭제</button>
	                  </div>
	                </div>
	              </form>
	                <!-- [[ 관리자 답변  확인 ]] -->                
                </c:otherwise>
                </c:choose>
            </main>
        <!-- Footer -->
		<%@include file="../../../includes/admin/footer.jsp" %>
        <!-- End of Footer -->
        <!-- End of Content Wrapper -->
      </section>
    </div>
    <!-- [[ 오른쪽 div 끝 ]] -->
    
    <!-- 관리자 답변 수정 모달 -->
    	<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg modal-dialog-centered">
		    <div class="modal-content border border-secondary rounded-3 border-opacity-50">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalToggleLabel">답변수정</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
				<form name="modifyForm"  action="/admin/qna/modify" method="post" >
				 	<div class="box p-3">
					 	<h5>수정할 답변을 입력해주세요.</h5>
					    <hr />
					    <br />
					    <div class="input-group">
					        <input
	                        class="q_content mb-3"
	                        name="an_content"
	                        style="
	                          width: 100%;
	                          margin: 0;
	                          background-color: rgb(244, 255, 249);
	                          border: none;
	                        "
	                      />
	                      <input type="hidden" name="qn_no" value="${qt.qn_no}">
					        <button class="btn btn-outline-secondary" style="border-radius: 0.5rem" onsubmit="modifyAnswer()">수정하기</button>
					    </div>
				    </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
    <!-- 관리자 답변 수정 모달 -->
    
    
    
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>
  </body>
</html>
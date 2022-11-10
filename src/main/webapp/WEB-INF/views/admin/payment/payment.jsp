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
    <%@include file="/WEB-INF/includes/common.jsp" %>
	<%@include file="../../../includes/admin/common.jsp" %>
    <title>관리자 메인페이지</title>
    <style type="text/css">
    	.h5-title{
    		color: black;
    	}
    	.card {
    		width: 90%;
    		margin: auto;
    	}
    	.card-body{
    		text-align: center;
    	}
    	th{
    		background-color: #8793db;
    		color: #555;
    		font-size: 15px;
    	}
    	.m-content {
	        display: flex;
	        width: 96%;
	        align-items: center;
	        justify-content: center;
	        margin: 5px auto;
	        padding: 5px;
	        border: 2px solid darksalmon;
	        border-radius: 8px;
	      }
	    .m-title {
	        margin-left: auto;
	        color: darksalmon;
	    }
	    .btn-confirm {
			background-color: white;
	        color: cornflowerblue;
	        border: 1px solid cornflowerblue;
	    }
	    .btn-confirm:hover {
	        background-color: rgb(171, 199, 251);
	        border: 2px solid rgb(105, 157, 255);
	    }
	    .btn-refuse {
	        background-color: white;
	        color: rgb(254, 64, 64);
	        border: 1px solid rgb(254, 64, 64);
	    }
	    .btn-refuse:hover {
	        background-color: rgb(255, 180, 180);
	        border: 2px solid rgb(209, 90, 90);
	    }
	    .modal-title{
	      	color: black;
	    }
    </style>
  </head>
  <body id="page-top">
  <script>
	let msg = "${msg}";
	if(msg != ""){
		alert(msg);
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
	   <%@include file="../../../includes/admin/header.jsp" %>
        <!-- End of Topbar -->
        <!-- Main Content -->
		<main class="container-fluid">
			<!-- 목록리스트 -->
              <div class="card mt-3 mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold h5-title">
                    전체 주문 목록
                  </h5>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table
                      class="table table-bordered"
                      id="dataTable"
                      width="100%"
                      cellspacing="0"
                    >
                      <thead>
                        <tr>
                          <th style="background-color: #8793db">주문번호</th>
                          <th style="background-color: #8793db">상품번호</th>
                          <th style="background-color: #8793db">주문자(ID)</th>
                          <th style="background-color: #8793db">주문상태</th>
                          <th style="background-color: #8793db">주문날짜</th>
                          <th style="background-color: #8793db">승인</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="pList" items="${paymentList}">
	                        <tr>
	                          <td><c:out value="${pList.order_no}"/></td>
	                          <td><c:out value="${pList.p_no}"/></td>
	                          <c:choose>
	                            <c:when test="${pList.mem_id eq null}">
	                           	  <td>비회원</td>
	                           	</c:when>
	                            <c:otherwise>
		                          <td><c:out value="${pList.mem_id}"/></td>
	                            </c:otherwise>
	                          </c:choose>
	                          <td><c:out value="${pList.order_status}"/></td>
	                          <td><fmt:formatDate value="${pList.order_date}" pattern="yyyy-MM-dd"/></td>
	                          <c:choose>
	                            <c:when test="${pList.order_status eq '반품 신청'}">
		                          <td>
		                            <button class="btn btn-danger btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#cancelModal">
		                              상세보기
		                            </button>
		                          </td>
	                            </c:when>
	                            <c:when test="${pList.order_status eq '상품 준비중'}">
	                              <td>
		                            <button class="btn btn-success btn-circle btn-sm">
		                              <i class="fas fa-box-open"></i>
		                            </button>
		                          </td>
	                            </c:when>
	                            <c:when test="${pList.order_status eq '배송완료'}">
	                              <td></td>
	                            </c:when>
	                            <c:otherwise><td>취소완료</td></c:otherwise>
	                          </c:choose>
	                        </tr>
	                    </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

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
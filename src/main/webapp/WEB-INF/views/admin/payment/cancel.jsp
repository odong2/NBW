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
    		color: #555;
    		background-color: #f7d2e0;
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
                    취소 및 환불 상품 목록
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
                          <th style="background-color: #f7d2e0">주문번호</th>
                          <th style="background-color: #f7d2e0">상품번호</th>
                          <th style="background-color: #f7d2e0">주문자(ID)</th>
                          <th style="background-color: #f7d2e0">주문상태</th>
                          <th style="background-color: #f7d2e0">주문날짜</th>
                          <th style="background-color: #f7d2e0">승인</th>
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
		                            <button class="btn btn-danger btn-sm refund-detail" type="button" data-orderNo="${pList.order_no}" data-pNo="${pList.p_no}"
		                            		data-bs-toggle="modal" data-bs-target="#cancelModal">
		                              상세보기
		                            </button>
		                          </td>
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
        	<!-- 반품 요청 모달 -->
			<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg modal-dialog-centered">
			    <div class="modal-content border border-secondary rounded-3 border-opacity-50">
			      <div class="modal-header">
			        <h4 class="modal-title" id="cancelModalToggleLabel"><b>반품 요청 상세보기</b></h4>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
	                <div class="row">
	                  <h5 class="m-title mt-3"><b>⚠️반품 사유</b></h5>
	                  <div class="m-content"></div>
	                </div>
					<div class="row mt-3">
	                  <h5 class="m-title col-3"><b>📆반품 신청일</b></h5>
	                  <div class="col-9 r-date"></div>
	                </div>
			      </div>
			      <div class="modal-footer">
	                <button type="button" class="btn btn-secondary btn-confirm" data-bs-dismiss="modal">반품 승인</button>
	                <button type="button" class="btn btn-secondary btn-refuse" data-bs-dismiss="modal">반품 거절</button>
	              </div>
			    </div>
			  </div>
			</div>
			<!-- 반품 요청 모달 -->
        
      </section>
    </div>
    <!-- [[ 오른쪽 div 끝 ]] -->
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>
    	
    
<script type="text/javascript">
	$('#cancelModal').on('show.bs.modal', function (event) {
    	let button = $(event.relatedTarget);
		let order_no = button.attr("data-orderNo");
		let p_no = button.attr("data-pNo");
		let modal = $(this);
		
		$.ajax({
            type : "post",
            url : "${contextPath}/admin/payment/refundlist",
            data : {
                p_no:p_no,
                order_no:order_no
            },
            success : function(data) {
            	let apply_date = getDate(data.apply_date);
            	modal.find('.m-content').text(data.refund_reason);
            	modal.find('.r-date').text(apply_date);
            },
            error : function(data, textStatus) {
                alert("에러가 발생했습니다."+data);
            },
            complete : function(data, textStatus) {
            }
        }); //end of ajax
	});
	/* apply_date를 날짜 형식 맞춰주기 */
	let getDate = function(data){
        let date = new Date(data);
        let year = date.getFullYear();
        let month = String(date.getMonth() + 1).padStart(2, "0");
        let day = String(date.getDate()).padStart(2,"0");
        return year + "-" + month + "-" + day;
    }
		
</script>
  </body>
</html>
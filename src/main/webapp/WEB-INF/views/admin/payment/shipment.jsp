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
    		background-color: #9dd8ca;
    		color: #555;
    		font-size: 15px;
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
                    '상품준비중'인 주문 목록
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
                          <th>주문번호</th>
                          <th>상품번호</th>
                          <th>주문자(ID)</th>
                          <th>주문상태</th>
                          <th>주문날짜</th>
                          <th>승인</th>
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
	                          <td>
	                          <c:choose>
	                            <c:when test="${pList.mem_id eq null}"><span>비회원 배송</span></c:when>
	                            <c:otherwise>
		                            <button class="btn btn-success btn-sm btn-ship" type="button" data-memId="${pList.mem_id}"
		                            		data-pNo="${pList.p_no}" data-orderNo="${pList.order_no}" data-orderStatus="${pList.order_status}"
		                            		data-page="shipmentlist" onClick=modifyStatus(this);>배송완료
									</button>
								</c:otherwise>
	                          </c:choose>
	                          </td>
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
    <script type="text/javascript">
    /* 상품 배송시키기 */
    function modifyStatus(button){
    	let pNo = $(button).attr("data-pNo");
    	let orderNo = $(button).attr("data-orderNo");
    	let mem_id = $(button).attr("data-memId");
    	let page = $(button).attr("data-page");
    	let orderStatus = $(button).attr("data-orderStatus");
    	if(!confirm(("상품 준비가 끝났습니다. 배송을 보내시겠습니까?"))){
            alert("다음에 다시 시도해주십시오.");
        }else{
    	 $.ajax({
             type : "post",
             url : "${contextPath}/admin/payment/modify",
             data : {
                 p_no:pNo,
                 order_no:orderNo,
                 mem_id:mem_id,
                 order_status:orderStatus,
                 page:page
             },
             success : function() {
                 location.reload();
             },
             error : function(data, textStatus) {
                 alert("에러가 발생했습니다."+data);
             },
             complete : function(data, textStatus) {
             }
         }); //end of ajax
        }
    }
    </script>
  </body>
</html>
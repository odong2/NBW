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
    <title>관리자-문의사항조회</title>
    <style type="text/css">
      .qna-title {
        color: black;
        font-weight: bold;
      }
      .ctg {
        width: fit-content;
        padding: 7px;
        border-radius: 1rem;
        background-color: #b710fe;
        color: #e6c3f5;
        border: none;
      }
      .ctg:hover {
        color: #2d1836;
      }
      ul {
        list-style: none;
        display: block;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        padding-inline-start: 40px;
        margin: 0;
        padding: 0;
      }
      li {
        display: list-item;
      }
      .content-box {
        border-top: 1px solid #999;
        border-bottom: 1px solid #999;
        padding: 20px 60px 20px 10px;
      }
      .inquiry_info {
        font-size: 12px;
      }
      .writer {
        width: fit-content;
        padding: 5px;
        border-radius: 1rem;
        background-color: #ededf7;
        color: black;
      }
      .gap {
        display: inline-block;
        font-size: 0;
        width: 1px;
        height: 10px;
        background-color: #d5d5d5;
        margin: 0 10px 0;
        box-sizing: border-box;
      }
      .ctg-item {
        font-size: 14px;
        line-height: 22px;
        letter-spacing: -0.01em;
        font-weight: 400;
        color: #595959;
        padding-right: 6px;
      }
      .inquiry_title {
        margin-top: 20px;
      }
      .title {
        margin-left: 10px;
        font-size: 16px;
      }
      .title > a {
        text-decoration: none;
        color: black;
      }
      .title > a:hover {
        color: #b710fe;
        font-weight: bold;
      }
      .cdate {
        font-size: 12px;
        margin-left: auto;
      }
      .icon-circle {
        background-color: #e6c3f5;
      }
      .nav-link{
      	color: black;
      }
      .nav-link:hover{
      	color: #e6c3f5;
      }
      .q-state {
        position: absolute;
        height: 10px;
        width: 10px;
        margin-top: -11px;
        background: #e23442;
        border-radius: 0.5rem;
      }
      .icon-circle {
        position: relative;
      }
      form{
      	width: fit-content;
      }
      .btn-keyword{
      	display: flex;
      	flex-direction: row;
      }
      .btn-kw {
      	border: none;
        flex: 1 1 auto;
        margin: 10px;
        padding: 8px;
        text-align: center;
        text-transform: uppercase;
        transition: 0.5s;
        background-size: 200% auto;
        color: white;
        /* text-shadow: 0px 0px 10px rgba(0,0,0,0.2);*/
        box-shadow: 0 0 20px #eee;
        border-radius: 10px;
      }
      .btn:hover {
        background-position: right center; /* change the direction of the change here */
      }
      .btn-2 {
        background-image: linear-gradient(
          to right,
          #fbc2eb 0%,
          #a6c1ee 51%,
          #fbc2eb 100%
        );
      }
      .menu-active{
      	background-color: #a6c1ee;
      }
    </style>
  </head>
<script type="text/javascript">
$(document).ready(function(){
	$("#finish").click(function(){
		$(".qna-title").text("답변완료한 문의내역");
		$("#Yform").submit();
    });
	$("#Processing").click(function(){
		$(".qna-title").text("처리중인 문의내역");
		$("#Nform").submit();
    });
	$("#allask").click(function(){
		$(".qna-title").text("전체 문의내역");
		$("#form").submit();
    });
	
	/*============= 페이징 엑티브 코드 ============= */   
	let params = new URLSearchParams(document.location.search);
	/* 현재 페이지 */
	let nowPage = params.get("page");
	console.log(nowPage);
	$(function(){
		$('.page-list').each(function(index, item){
			let page =$(item).children('.page-num').text();
			console.log(page);
		    if(nowPage == page){
				$(item).addClass('active');
			}
		})
	});
	/* 키워드가 가져오기 */
	let nowKeyword = params.get("keyword");
	console.log(nowKeyword);
	$(function(){
		if(nowKeyword==null){
			$(".qna-title").text("전체 문의내역");
			document.querySelector('#allask').style.color = 'black';
		} else if(nowKeyword=="N"){
			$(".qna-title").text("처리중인 문의내역");
			document.querySelector('#Processing').style.color = 'black';
		} else{
			$(".qna-title").text("답변완료한 문의내역");
			document.querySelector('#finish').style.color = 'black';
		}
	})
});
</script>
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
            <main class="container-fluid mb-3 p-3">
            	<div class="title mb-3">
                  <h5 class="qna-title">전체 문의내역</h5>
                </div>
                <br />
                <!-- 카테고리 목록 -->
                <div class="category mb-3" style="display: flex">
                	<div class="btn-keyword">
						<form action="/admin/qna/list" method="get" id="form">
				            <button class="btn-kw btn-2" id="allask" type="button"><span>전체</span></button>
				        </form>
                	</div>
                	<div class="btn-keyword">
			        	<form action="/admin/qna/list" method="get" id="Nform">
							<input type="hidden" value="N" name="keyword" />
			    	        <button class="btn-kw btn-2" id="Processing" type="button"><span>처리중</span></button>
						</form>
                	</div>
                	<div class="btn-keyword">
				        <form action="/admin/qna/list" method="get" id="Yform">
							<input type="hidden" value="Y" name="keyword" />
				            <button class="btn-kw btn-2" id="finish" type="button"><span>답변완료</span></button>
			        </form>
                	</div>
                </div>
                <%-- 전체 문의 --%>
	                <div class="qna-list-wrap" style="border-top: 1px solid black">
	                  <ul>
	                  <c:forEach var="qt" items="${questionList}">
	                    <li>
	                      <div class="content-box">
	                        <div class="inquiry_info">
	                          <span class="writer"><c:out value="${qt.qn_from}" /></span>
	                          <span class="gap"></span>
	                          <span class="ctg-item"><c:out value="${qt.qn_category}" /></span>
	                        </div>
	                        <div class="inquiry_title">
	                          <div class="d-flex align-items-center">
	                            <div class="mr-3">
	                              <div class="icon-circle">
	                              <c:choose>
	                              <c:when test="${qt.qn_category eq '교환'}">
		                              <i class="circle-icon fas fa-sync-alt text-white"></i>
	                              </c:when>
	                              <c:when test="${qt.qn_category eq '반품'}">
		                              <i class="circle-icon fas fa-times text-white"></i>
	                              </c:when>
	                              <c:when test="${qt.qn_category eq '제품'}">
		                              <i class="circle-icon fas fa-book text-white"></i>
	                              </c:when>
	                              <c:otherwise>
		                              <i class="circle-icon fas fa-question text-white"></i>
	                              </c:otherwise>
	                              </c:choose>
	                              </div>
	                            <c:choose>
		                          <c:when test="${qt.qn_state eq 'N'}"><div class="q-state"></div></c:when>
		                          <c:otherwise></c:otherwise>
	                            </c:choose>
	                            </div>
	                            <div class="title">
	                              <a href="/admin/qna/answer?qn_no=${qt.qn_no}"><c:out value="${qt.qn_title}" /></a>
	                            </div>
	                            <div class="cdate">
	                              <span> <fmt:formatDate value="${qt.qn_cdate}" pattern="yyyy-MM-dd"/></span>
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                    </li>
	                    </c:forEach>
	                  </ul>
                	</div>
                	 <nav aria-label="Page navigation ">
		                <ul class="pagination d-flex justify-content-center mt-3">
		                    <%-- ================== 검색 결과가 없는 경우 ================== --%>
		                    <c:if test="${ph.totalCnt==null || ph.totalCnt==0}">
		                        <div> 문의사항이 없습니다. </div>
		                    </c:if>
		                    <%-- ================== 검색 결과가 존재 하는 경우 ================== --%>
		                    <c:if test="${ph.totalCnt!=null || ph.totalCnt!=0}">
		                        <%-- =================== 이전 페이지 링크 보여줄 지 여부 ================--%>
		                        <c:if test="${ph.showPrev}">
		                            <li class="page-item">
		                                <a class="page-link" href="<c:url value='/admin/qna/list${ph.sc.getQueryString(ph.beginPage-1)}'/>">
		                                <span aria-hidden="true">&laquo;</span>
		                                <span class="sr-only">Previous</span>
		                                </a>
		                            </li>
		                        </c:if>
		                        <%-- =================== 총 게시물 개수만큼 페이징 처리 ================--%>
		                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
		                            <li class="page-item page-list">
		                                <a class="page-link page-num" href="<c:url value='/admin/qna/list${ph.sc.getQueryString(i)}'/>">${i}</a>
		                            </li>
		                        </c:forEach>
		                        <%-- =================== 다음 페이지 링크 보여줄 지 여부 ================--%>
		                        <c:if test="${ph.showNext}">
		                            <li class="page-item">
		                                <a class="page-link"href="<c:url value='/admin/qna/list${ph.sc.getQueryString(ph.endPage+1)}'/>">
		                                    <span aria-hidden="true">&raquo;</span>
		                                    <span class="sr-only">Next</span>
		                                </a>
		                            </li>
		                        </c:if>
		                    </c:if>
		                    <%-- ================== 검색 결과가 존재 하는 경우 끝 ================== --%>
		                </ul>
		             </nav>
	            <%-- 전체 문의 --%>
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
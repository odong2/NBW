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
            <main class="container-fluid mb-3 p-3">
            	<div class="title mb-3">
                  <h5 class="qna-title">문의내역</h5>
                </div>
                <br />
                <!-- 카테고리 목록 -->
                <div class="category mb-3">
                  	<ul class="nav nav-tabs" id="myTab" role="tablist">
			            <li class="nav-item" role="presentation">
			                <button
			                        class="nav-link active"
			                        id="allask"
			                        data-bs-toggle="tab"
			                        data-bs-target="#home-tab-pane"
			                        type="button"
			                        role="tab"
			                        aria-controls="home-tab-pane"
			                        aria-selected="true"
			                >
			                    <span>전체</span>
			                </button>
			            </li>
			            <li class="nav-item" role="presentation">
			                <button
			                        class="nav-link"
			                        id="Processing"
			                        data-bs-toggle="tab"
			                        data-bs-target="#profile-tab-pane"
			                        type="button"
			                        role="tab"
			                        aria-controls="profile-tab-pane"
			                        aria-selected="false"
			                >
			                    <span>처리중</span>
			                </button>
			            </li>
			            <li class="nav-item" role="presentation">
			                <button
			                        class="nav-link"
			                        id="finish"
			                        data-bs-toggle="tab"
			                        data-bs-target="#contact-tab-pane"
			                        type="button"
			                        role="tab"
			                        aria-controls="contact-tab-pane"
			                        aria-selected="false"
			                        color="black"
			                >
			                    <span>답변완료</span>
			                </button>
			            </li>
			        </ul>
                </div>
                <div class="tab-content" id="myTabContent">
                <%-- 전체 문의 --%>
	            <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="allask" tabindex="0">
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
		                          <c:when test="${qt.qn_state eq '처리중'}"><div class="q-state"></div></c:when>
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
	            </div>
	            <%-- 전체 문의 --%>
                <%-- 처리해야할 문의 --%>
            	<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="Processing" tabindex="0">
	                <div class="qna-list-wrap" style="border-top: 1px solid black">
	                  <ul>
	                  <c:forEach var="qt" items="${questionIngList}">
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
		                              <i class="fas fa-sync-alt text-white"></i>
	                              </c:when>
	                              <c:when test="${qt.qn_category eq '반품'}">
		                              <i class="fas fa-times text-white"></i>
	                              </c:when>
	                              <c:when test="${qt.qn_category eq '제품'}">
		                              <i class="fas fa-book text-white"></i>
	                              </c:when>
	                              <c:otherwise>
		                              <i class="fas fa-question text-white"></i>
	                              </c:otherwise>
	                              </c:choose>
	                              </div>
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
	            </div>
                <%-- 처리해야할 문의 --%>
                <%-- 처리한 문의 --%>
            	<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="finish" tabindex="0">
	                <div class="qna-list-wrap" style="border-top: 1px solid black">
	                  <ul>
	                  <c:forEach var="qt" items="${questionFinishList}">
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
		                              <i class="fas fa-sync-alt text-white"></i>
	                              </c:when>
	                              <c:when test="${qt.qn_category eq '반품'}">
		                              <i class="fas fa-times text-white"></i>
	                              </c:when>
	                              <c:when test="${qt.qn_category eq '제품'}">
		                              <i class="fas fa-book text-white"></i>
	                              </c:when>
	                              <c:otherwise>
		                              <i class="fas fa-question text-white"></i>
	                              </c:otherwise>
	                              </c:choose>
	                              </div>
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
	            </div>
                <%-- 처리한 문의 --%>
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
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
	<%@include file="../../includes/admin/common.jsp" %>
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
    </style>
  </head>
  <body id="page-top">
    <!-- Page Wrapper -->
    <div class="d-flex justify-content-start">
      <!-- Sidebar -->
	  <%@include file="../../includes/admin/sidebar.jsp" %>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <!-- [[ 오른쪽 div 시작 ]] -->
      <section class="contentdiv d-flex" style="margin-left: 224px">
        <!-- Topbar -->
	   <%@include file="../../includes/admin/header.jsp" %>
        <!-- End of Topbar -->
            <main class="container-fluid mb-3 p-3">
            	<div class="title mb-3">
                  <h5 class="qna-title">문의내역</h5>
                </div>
                <br />
                <!-- 카테고리 목록 -->
                <div class="category mb-3">
                  <button class="ctg"><b>전체</b></button>
                  <button class="ctg"><b>제품</b></button>
                  <button class="ctg"><b>교환</b></button>
                  <button class="ctg"><b>반품</b></button>
                  <button class="ctg"><b>기타</b></button>
                </div>
                <!-- [[ 문의 내역 시작 ]] -->
                <div class="qna-list-wrap" style="border-top: 1px solid black">
                  <ul>
                    <li>
                      <div class="content-box">
                        <div class="inquiry_info">
                          <span class="writer">이유리</span>
                          <span class="gap"></span>
                          <span class="ctg-item">제품</span>
                        </div>
                        <div class="inquiry_title">
                          <div class="d-flex align-items-center">
                            <div class="mr-3">
                              <div class="icon-circle">
                              <i class="fas fa-question text-white"></i>
                              </div>
                            </div>
                            <div class="title">
                              <a href="/admin/answer">책 언제 들어와요?</a>
                            </div>
                            <div class="cdate">
                              <span>2022-10-20</span>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="content-box">
                        <div class="inquiry_info">
                          <span class="writer">김민준</span>
                          <span class="gap"></span>
                          <span class="ctg-item">교환</span>
                        </div>
                        <div class="inquiry_title">
                          <div class="d-flex align-items-center">
                            <div class="mr-3">
                              <div class="icon-circle">
                                <i class="fas fa-question text-white"></i>
                              </div>
                            </div>
                            <div class="title">
                              <a href="#">책에 하자있는데 교환 가능할까요?</a>
                            </div>
                            <div class="cdate">
                              <span>2022-10-22</span>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
                <!-- [[ 문의 내역   끝 ]] -->
            </main>
        <!-- Footer -->
		<%@include file="../../includes/admin/footer.jsp" %>
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
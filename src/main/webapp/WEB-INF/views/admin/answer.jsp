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
    <title>관리자-문의사항답변</title>
    <style type="text/css">
     .q_content {
        height: 250px;
        margin: 16px;
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
        <!-- Main Content -->
		<main class="container-fluid mb-3 p-3">
		<!-- [[ 보낸 회원 정보 시작 ]] -->
				<div class="mem_info">
                  <div class="title">
                    <div class="row">
                      <div class="col-6">
                        <h5 class="mem_h5"><b>문의유형</b></h5>
                        <h5 class="text-black">[제품]</h5>
                      </div>
                      <div class="col-6">
                        <h5 class="mem_h5"><b>문의 제목</b></h5>
                        <h5 class="text-black">책 입고 문의</h5>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-6">
                        <h5 class="mem_h5"><b>문의한 회원</b></h5>
                        <h5 class="text-black">유리</h5>
                      </div>
                      <div class="col-6">
                        <h5 class="mem_h5"><b>문의 날짜</b></h5>
                        <h6 class="text-black">2022-10-14</h6>
                      </div>
                    </div>
                  </div>
                  <h5 class="mem_h5"><b>문의 내용</b></h5>
                  <div
                    class="q_content text-black"
                    style="background-color: rgb(236, 227, 210)"
                  >
                    <p>
                      책 언제 들어오나요 Lorem ipsum dolor sit amet consectetur
                      adipisicing elit. Magnam maiores commodi ullam distinctio
                      sequi aperiam minus consequatur possimus veritatis ratione
                      quibusdam obcaecati, delectus recusandae hic harum maxime
                      vel aspernatur quas. Lorem ipsum dolor sit, amet
                      consectetur adipisicing elit. Enim officiis, in
                      voluptatibus id tempore eos reiciendis ab ex repudiandae,
                      est totam quam non ipsa at quo porro assumenda nam
                      minus?Lorem ipsum dolor sit, amet consectetur adipisicing
                      elit. Molestiae quod dolores ipsam adipisci placeat
                      corporis laudantium veniam, ipsum ad in, odio quo sapiente
                      ducimus voluptates nulla qui vitae, necessitatibus
                      repellendus!
                    </p>
                  </div>
                </div>
                <!-- [[ 보낸 회원 정보  끝 ]] -->
                <!-- [[ 관리자 답변 시작 ]] -->
                <div class="admin_box">
                  <div class="content">
                    <h5 class="admin_h5"><b>답변등록</b></h5>
                    <div>
                      <input
                        class="q_content mb-3"
                        style="
                          width: 100%;
                          margin: 0;
                          background-color: rgb(244, 255, 249);
                          border: none;
                        "
                      />
                    </div>
                  </div>
                  <div class="register">
                    <button class="btn btn-success">등록</button>
                  </div>
                </div>
                <!-- [[ 관리자 답변  끝 ]] -->
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
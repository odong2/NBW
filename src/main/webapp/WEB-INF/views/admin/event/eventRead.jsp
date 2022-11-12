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
  <script src="/ckeditor5-35.2.0/build/ckeditor.js"></script>
  <%@include file="../../../includes/admin/common.jsp" %>
  <title>관리자 이벤트 등록</title>
  <style>
    /*********************** 글꼴 **************************/
    @font-face {
      font-family: 'GangwonEdu_OTFBoldA';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
    body {
      font-family: GangwonEdu_OTFBoldA;}
    /*********************** 글꼴 **************************/
    .title {
      margin-top: 15px;
    }
    .eventimg {
      /*margin-left: 40px;*/
      display: flex;
      flex-direction: column;
      margin-right: 30px;
    }
    .eventcontents {
      display: flex;
      flex-wrap: wrap;
      margin-top: 20px;
    }
    #writeBtn {
      background-color: #d119fe;
      width: 120px;
      height: 45px;
      border: 0;
      outline: 0;

    }
    .sendbtn {
      text-align: center;
      margin-top: 30px;
    }
    #previewImg {
      margin-bottom: 10px;
    }
    .j_infod_input {
      width: 170px;
    }
    .contentpart {
      margin-top: 20px;
    }
    #ev_content {
      width: 80%;
      height: 150px;
    }
    .ck-editor__editable {
      height: 400px;
    }
    .ck-content {
      font-size: 11px;
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
      <section id="container">
      <div class="title">
        <h4>프로그램 등록</h4>
      </div>
        <form action="/admin/event/modify" method="post" id="form" class="frm" enctype="multipart/form-data">
          <div class="allEventContent">
      <div class="eventcontents">
        <div class="eventimg">
<%--          <img id="previewImg" width="300px" height="300px" />--%>
<%--          <input type="file" id="fileUpload" accept="image/*" name="ev_img" />--%>
        </div>
        <table id="j_infod_table">
          <tbody id="j_infod_tbody">
          <tr>
            <td class="j_infod_title">이벤트 제목<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_title" colspan="2">
              <input type="text" id="ev_title" name="ev_title" class="j_infod_input" value="${event.ev_title}">
            </td>
          </tr>
          <tr>
            <td class="j_infod_target">대상<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_target" colspan="2">
              <input type="text" id="ev_target" name="ev_target" class="j_infod_input" value="${event.ev_target}">
            </td>
          </tr>
          <tr>
            <td class="j_infod_place">장소<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_place" colspan="2">
              <input type="text" id="ev_place" name="ev_place" class="j_infod_input" value="${event.ev_place}">
            </td>
          </tr>
          <tr>
            <td class="j_infod_today">행사기간<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_today" colspan="2">
              <input type="text" id="ev_today" name="ev_today" class="j_infod_input" value="${event.ev_today}" >
            </td>
          </tr>
          <tr>
            <td class="j_infod_time">시간<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_time" colspan="2">
              <input type="text" id="ev_time" name="ev_time" class="j_infod_input" value="${event.ev_time}">
            </td>
          </tr>
          <tr>
            <td class="j_infod_titl">접수기간<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_start" colspan="2">
              <input type="text" id="ev_start" name="ev_start" class="j_infod_input" value="${event.ev_start}">
              ~
              <input type="text" id="ev_end" name="ev_end" class="j_infod_input">
            </td>
          </tr>
          <tr>
            <td class="j_infod_phone">문의번호<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_phone" colspan="2">
              <input type="text" id="ev_phone" name="ev_phone" class="j_infod_input" value="${event.ev_phone}">
            </td>
          </tr>
          <%--============================== [[모집정원 시작]] ================================--%>
          <tr>
            <td class="j_infod_people">
              모집정원
              <a class="j_infod_sym">
                *
              </a>
            </td>
            <td class="j_infod_people" colspan="2">
              <input type="text" id="ev_people" name="ev_people" class="j_infod_input" value="${event.ev_people}">
            </td>
          </tr>
          <%--============================== [[모집정원 끝]] ================================--%>
          <tr>
            <td class="j_infod_file">
                <span>첨부파일</span>
            </td>
            <td>
                <input type="file" name="file" id="fileInput"  value="파일"/>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
        <h6 class="contentpart">이벤트 글</h6>
            <textarea type="text" class="text-dark" name="ev_content" id="editor" value="${event.ev_content}"></textarea>
          </div>
      <div class="sendbtn">
        <div style="display:inline-block">
          <input type="hidden" value="${event.ev_no}" name="ev_no">
          <button type="button" class="btn btn-secondary btn-lg" id="writeBtn">
            수정하기
          </button>
        </div>
      </div>
        </form>
      </section>
        <%--여기에 메인 넣으면 됨--%>
      <script>

        /****************************** [[이미지 첨부 시작]] *************************/
        // const fileInput = document.getElementById("fileUpload");
        //
        // const handleFiles = (e) => {
        //   const selectedFile = [...fileInput.files];
        //   const fileReader = new FileReader();
        //
        //   fileReader.readAsDataURL(selectedFile[0]);
        //
        //   fileReader.onload = function () {
        //     document.getElementById("previewImg").src = fileReader.result;
        //   };
        // };
        // fileInput.addEventListener("change", handleFiles);
        /****************************** [[이미지 첨부 끝]] *************************/

      </script>
  <script>
/******************************** [[클래식 에디터]] *******************************/
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
        <script>
        /****************************** [[이벤트 등록하기]] ************************/
        $(document).ready(function (){
          $('#writeBtn').on("click",function (){
            let form = $('#form');
            form.attr("action", "<c:url value="/admin/event/modify"/>");
            form.attr("method", "post");
            form.submit();
          })
        })
        /****************************** [[이벤트 등록하기]] ************************/
      </script>
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
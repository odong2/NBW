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
  <title>관리자 이벤트 등록</title>
  <style>
    .title {
      margin-top: 15px;
    }
    .eventimg {
      margin-left: 40px;
      display: flex;
      flex-direction: column;
      margin-right: 30px;
    }
    .eventcontents {
      display: flex;
      flex-wrap: wrap;
      margin-top: 20px;
    }
    #rbtn {
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
    <main class="container-fluid">
      <div class="title">
        <h4>프로그램 등록</h4>
      </div>
      <div class="eventcontents">
        <div class="eventimg">
          <img id="previewImg" width="300px" height="300px" />
          <input type="file" id="fileUpload" accept="image/*" />
        </div>
        <table id="j_infod_table">
          <tbody id="j_infod_tbody">
          <tr>
            <td class="j_infod_title">이벤트 제목<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_title" colspan="2"><input type="text" id="ev_title" name="ev_title" class="j_infod_input"></td>
          </tr>
          <tr>
            <td class="j_infod_target">대상<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_target" colspan="2"><input type="text" id="ev_target" name="ev_target" class="j_infod_input"></td>
          </tr>
          <tr>
            <td class="j_infod_place">장소<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_place" colspan="2"><input type="text" id="ev_place" name="ev_place" class="j_infod_input"></td>
          </tr>
          <tr>
            <td class="j_infod_today">교육기간<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_today" colspan="2"><input type="text" id="ev_today" name="ev_today" class="j_infod_input" ></td>
          </tr>
          <tr>
            <td class="j_infod_time">시간<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_time" colspan="2"><input type="text" id="EV_TIME" name="EV_TIME" class="j_infod_input"></td>
          </tr>
          <tr>
            <td class="j_infod_titl">접수기간<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_start" colspan="2"><input type="text" id="ev_start" name="ev_start" class="j_infod_input"></td>
            <td>~</td>
            <td class="j_infod_end" colspan="2"><input type="text" id="ev_end" name="ev_end" class="j_infod_input"></td>
          </tr>
          <tr>
            <td class="j_infod_phone">문의번호<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_phone" colspan="2"><input type="text" id="ev_phone" name="ev_phone" class="j_infod_input"></td>
          </tr>
          <tr>
            <td class="j_infod_people1">모집정원<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_people" colspan="2"><input type="text" id="emp_people" name="emp_people" class="j_infod_input"></td>
          </tr>
          <tr>
            <td>
              <div class="file">
                <span>첨부파일</span>
                <i class="fas fa-file-alt"></i>
              </div>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="sendbtn">
        <div style="display:inline-block"><button type="button" class="btn btn-secondary btn-lg" id="rbtn">등록하기</button></div>
      </div>
        <%--여기에 메인 넣으면 됨--%>
      <%----%>
      <script>
        /* 이미지 첨부 시작 */
        const fileInput = document.getElementById("fileUpload");

        const handleFiles = (e) => {
          const selectedFile = [...fileInput.files];
          const fileReader = new FileReader();

          fileReader.readAsDataURL(selectedFile[0]);

          fileReader.onload = function () {
            document.getElementById("previewImg").src = fileReader.result;
          };
        };

        fileInput.addEventListener("change", handleFiles);
        /* 이미지 첨부 시작 */
      </script>
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
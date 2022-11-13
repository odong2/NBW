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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
      width: 50%;
      height: 150px;
    }
    .ck-editor__editable {
      height: 400px;
    }
    .ck-content {
      font-size: 20px;
      color: black;
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
        <form action="/admin/event/write" method="post" id="form" class="frm" enctype="multipart/form-data">
          <div class="allEventContent">
      <div class="eventcontents">
        <div class="eventimg">
          <%----%>
          <div>
            <div style="height: 370px; width: 300px">
              <img id="eventImg" width="300px"/>
            </div>
            <input type="file" name="img"
                   id="file" accept="image/gif, image/jpeg, image/png" onchange="setCouponImg(this)"/>
          </div>
<%--            <input type="file" name="file" id="fileInput"  value="파일"/>--%>
          <%----%>
          <div id="img-box" class="d-flex align-items-center"></div>
        </div>
        <table id="j_infod_table">
          <tbody id="j_infod_tbody">
          <tr>
            <td class="j_infod_title">이벤트 제목<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_title" colspan="2">
              <input type="text" id="ev_title" name="ev_title" class="j_infod_input">
            </td>
          </tr>
          <tr>
            <td class="j_infod_target">대상<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_target" colspan="2">
              <input type="text" id="ev_target" name="ev_target" class="j_infod_input">
            </td>
          </tr>
          <tr>
            <td class="j_infod_place">장소<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_place" colspan="2">
              <input type="text" id="ev_place" name="ev_place" class="j_infod_input">
            </td>
          </tr>
          <tr>
            <td class="j_infod_today">행사날짜<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_today" colspan="2">
              <input id="ev_today" name="ev_today" class="j_infod_input datepicker" autocomplete="off">
            </td>
          </tr>
          <tr>
            <td class="j_infod_time">시간<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_time" colspan="2">
              <input type="text" id="ev_time" name="ev_time" class="j_infod_input">
            </td>
          </tr>
          <tr>
            <td class="j_infod_titl">접수기간<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_start" colspan="2">
              <input type="text" id="ev_start" name="ev_start" class="j_infod_input">
              ~
              <input type="text" id="ev_end" name="ev_end" class="j_infod_input">
            </td>
          </tr>
          <tr>
            <td class="j_infod_phone">문의번호<a class="j_infod_sym">*</a>
            </td>
            <td class="j_infod_phone" colspan="2">
              <input type="text" id="ev_phone" name="ev_phone" class="j_infod_input">
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
              <input type="text" id="ev_people" name="ev_people" class="j_infod_input">
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
            <textarea type="text" class="text-dark" name="ev_content" id="editor"></textarea>
          </div>
      <div class="sendbtn">
        <div style="display:inline-block">
          <button type="button" type="submit" class="btn btn-secondary btn-lg" id="writeBtn">
            등록하기
          </button>
        </div>
      </div>
        </form>
      </section>
        <%--여기에 메인 넣으면 됨--%>
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
            form.attr("action", "<c:url value="/admin/event/write"/>");
            form.attr("method", "post");
            form.submit();
          })
        })
        /****************************** [[이벤트 등록하기]] ************************/
      </script>
      <script>
        let fileAdd = ()=>{
          $('#eventImg').css({
            'border-radius': '5px',
            'padding': '10px',
          });
          $('#fileClear').css('display','block');
          imgBoxHeight = imgBoxHeight + 165;
          $('#imgBox').height(imgBoxHeight);
        }
        /* 쿠폰 이미지 및 이미지 박스 초기화하는 함수*/
        let fileClear = ()=>{
          $('#eventImg').prop('src','');
          $('#eventImg').css('box-shadow', '')
          $('#file').val('');
          $('#fileClear').css('display','none');
          imgBoxHeight = imgBoxHeight - 165;
          $('#imgBox').height(imgBoxHeight);
        }
      </script>
      <script>
        let title = '';
        let content = '';
        let imgBoxHeight = $('#imgBox').height(); // 업로드 이미지 박스 크기
        /* 쿠폰 이미지 등록 */
        let setCouponImg = (input)=>{
          if (input.files && input.files[0]) {
            let reader = new FileReader();
            reader.onload = function(e) {
              $('#eventImg').prop('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
            // 이미지 박스 및 이미지 크기 조절
            fileAdd();
          }
          // 파일 올리기 취소
          else {
            /* 기존에 이미지가 없을 경우 */
            $('#eventImg').prop('src', "");
            $('#eventImg').css('box-shadow', '')
            $('#file').val('');
            $('#fileClear').css('display','none');
            /* 기존에 이미지가 있을 경우 */
            if(imgBoxHeight == 265){
              imgBoxHeight = imgBoxHeight - 165;
              $('#imgBox').height(imgBoxHeight);
            }
          }
        }
      </script>
      <script>
        <%-- ================================= DatePicker =================================== --%>
        // datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능
        $(".datepicker").datepicker({
          changeMonth: true,
          changeYear: true,
          dateFormat: "yy-mm-dd",
          dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
          monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
        });

        // datepicker 클래스 이벤트
        var now = new Date();
        var startYear = now.getFullYear();
        var yearRange = (startYear - 120) +":" + startYear ;
        // datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
        //원래 있던 datepicker에 option을 추가하는 방법이다.
        $( ".datepicker" ).datepicker("option", {
          "maxDate" : new Date(),
          yearRange: yearRange
        });
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
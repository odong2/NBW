<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <%@include file="../../../includes/admin/common.jsp" %>
  <title>상품 상세</title>
  <style>
    /**{*/
    /*    border: 1px solid red;*/
    /*}*/
    @font-face {
      font-family: 'InfinitySans-RegularA1';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
    *{
      font-family: 'InfinitySans-RegularA1';
    }
    #main{
      width: 100%;
    }
    table{
      border-collapse: separate;
      border-spacing: 0 15px;
      margin-left: 40px;
    }
    .form-control:focus  {
      background-color: #ffffc3;
    }
    td {
      color: white;
      font-size: small;
    }
  </style>
</head>
<body>
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
      <section id="main" class="container-fluid">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800 mt-4">상품번호 <span style="color: #f19408; font-weight: bolder;">${product.getP_no()}</span> 번에 대한 상세정보 입니다.</h1>
        <hr>
        <form action="/admin/product/modify" id="productForm"
              method="POST" enctype="multipart/form-data">
          <input type="hidden" name="p_no" value="${product.getP_no()}"> <!-- 수정할 상품 아이디 -->
          <div class="card d-flex" style="width: 100%; text-align: center;">
            <div class="card-body d-flex" style="text-align: center; width:100%; height: 550px; background-color: #44485d; border-radius: 10px;">
              <div class="img-section" style="text-align: center; padding-top: 65px; border-radius: 10px;">
                <div id="img-box" style="text-align: center; width:250px; height: 350px; border-radius: 10px; background-color: #ededed">
                  <img src="<c:url value='${product.getP_img()}'/>" alt="" width="250" height="350" style="border-radius: 10px; padding-bottom: 40px;" >
                  <label id="upload-label"
                         for="fileInput" style="width: 250px; height: 350px; font-size: larger" disabled="true"></label></div>
              </div>
              <input type="file" name="uploadFile" id="fileInput"
                     accept="image/jpeg, image/png"
                     onchange="productImgUrl(this)"
                     style="display:none; z-index: 999;" disabled
              />
              <c:if test="${not empty product}">
                <table width="80%">
                  <tr><td>제목</td><td><label class="p_label">${product.getP_title()}</label><input type="text" name="p_title" id="p_title" required="required" autocomplete="off"
                                                                                                  class="form-control" value="${product.getP_title()}" hidden></td></tr>
                  <tr><td>저자</td><td><label class="p_label">${product.getP_author()}</label><input type="text" name="p_author" id="p_author" required="required" autocomplete="off"
                                                                                                   class="form-control" value="${product.getP_author()}" hidden></td></tr>
                  <tr><td>출판사</td><td><label class="p_label">${product.getP_publisher()}</label><input type="text" name="p_publisher"  id="p_publisher" required="required" autocomplete="off"
                                                                                                       class="form-control" value="${product.getP_publisher()}" hidden></td></tr>
                  <tr><td>출판일</td><td><label class="p_label">${product.getP_pubdate()}</label><input name="p_pubdate" id="p_pubdate" required="required"
                                                                                                     class="form-control datepicker " autocomplete="off" value="${product.getP_pubdate()}" hidden>
                  <tr><td>판매가</td><td><label class="p_label">${product.getP_price()}</label><input type="text" name="p_price" id="p_price" required="required" autocomplete="off"
                                                                                                   class="form-control" value="${product.getP_price()}" hidden></td></tr>
                  <tr><td>입고수량</td><td><label class="p_label">${product.getP_count()}</label><input type="text" name="p_count" id="p_count" required="required" autocomplete="off"
                                                                                                    class="form-control" value="${product.getP_count()}" hidden></td></tr>

                  <tr><td>카테고리</td>
                    <td>
                      <label class="p_label">${product.getP_category()}</label>
                      <select name="p_category" class="form-control" id="p_category" hidden>
                        <option value="철학">철학</option>
                        <option value="종교">종교</option>
                        <option value="사회과학">사회과학</option>
                        <option value="자연과학">자연과학</option>
                        <option value="기술과학">기술과학</option>
                        <option value="예술">예술</option>
                        <option value="언어">언어</option>
                        <option value="문학">문학</option>
                        <option value="역사">역사</option>
                      </select>
                    </td>
                  </tr>
                  <tr><td>개요</td><td><textarea class="form-control" type="text" class="text-dark" name="p_description" id="p_description" autocomplete="off" required="required" readonly>${product.getP_description()}</textarea></td></tr>
                </table>
              </c:if>
            </div>
          </div>
          <div style="text-align: center; margin-bottom: 50px; margin-top:30px; ">
            <input type="button" value="수정"
                   id="product-up-btn" class="mt-3" style="background-color: #2a3b72; border-radius: 10px; width: 120px; height: 50px; color: white; font-size: large; border: none;"
                   onclick="updateStart(this)"/>
            <input type="button" value="삭제" id="product-del-exe-btn" class="mt-3" style="background-color: #595f76; border-radius: 10px; width: 120px; height: 50px; color: white; font-size: large; border: none;"/>
            <input type="button" value="완료" id="product-up-exe-btn" onclick="upExe(this)" class="mt-3" style="background-color: #2a3b72; border-radius: 10px; width: 120px; height: 50px; color: white; font-size: large; border: none;" hidden/>
          </div>
        </form>
      </section>
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
  /* 리뷰 이미지 업로드 */
  function productImgUrl(input) {
    let reader = new FileReader();
    reader.onload = function(e) {
      src = e.target.result;
      $('#img-box').empty();
      $('#img-box').append('<img class="ms-2 border border-dark" alt="" src="'+src+'" style="width: 250px; height: 350px; border-radius: 10px;">')
    };
    reader.readAsDataURL(input.files[0]);
  } // productImgUrl

  /* 수정 모드로 변경 */
  function updateStart(input){
    // alert("수정버튼 클릭");
    if(confirm("수정을 시작하시겠습니까?")){
      $('#product-up-btn').attr("hidden", true);
      $('.p_label').attr("hidden", true);
      $('#product-up-exe-btn').attr("hidden", false);

      $('#p_title').attr("hidden", false);
      $('#p_author').attr("hidden", false);
      $('input[name=p_pubdate]').attr("hidden", false);
      $('#p_publisher').attr("hidden", false);
      $('#p_pubdate').attr("hidden", false);
      $('#p_price').attr("hidden", false);
      $('#p_count').attr("hidden", false);
      $('#p_category').attr("hidden", false);
      $('#p_description').attr("readonly", false);
      $('input[type=file]').attr("disabled", false);
      $('#img-box').empty();
      $('#img-box').append(` <label
                                            class="fs-1 d-flex align-items-center justify-content-center border border-opacity-25"
                                            for="fileInput" style="width: 250px; height: 350px; font-size: larger" ><i class="fas fa-camera-retro fa-2x"></i></label>`);
    }
  } // updateStart

  function upExe(input, e){
    let img = $("#fileInput").val();
    let title = $('#p_title').val();
    let author = $("input[name=p_author]").val();
    let publisher = $("input[name=p_publisher]").val();
    let pubdate = $("input[name=p_pubdate]").val();
    let price = $("input[name=p_price]").val();
    let count = $("input[name=p_count]").val();
    let category = $("select[name=p_category]").val();
    let description = $("textarea[name=p_description]").val();

    if(confirm("입력하신 정보로 수정하시겠습니까?")){
      if(!src || title.length == 0 || author.length == 0
              || publisher.length == 0 || pubdate.length == 0
              || price.length == 0 || count.length == 0
              || !category || description.length == 0 )
      {
        alert("입력 양식을 확인해 주세요.");
        alert("title ===> "+ title + "img ===> " +img +
                "author ===>"+ author + "publisher ===> "+ publisher +
                "pubdate ===> "+ pubdate +"price ===>"+ price +
                "count ===>" +count + "category ===> "+category +
                "description ===> "+ description);
        e.preventDefault();
      } else {
        $('#productForm').submit();
        alert("수정이 완료되었습니다.");
        e.preventDefault();
      }
    }
  } // 수정 upExe 함수 끝

  $(function(){
    <%-- ================================= DatePicker =================================== --%>
    //datepicker 클래스 이벤트
    var now = new Date();
    var startYear = now.getFullYear();
    var yearRange = (startYear - 120) +":" + startYear ;
    // datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
    //원래 있던 datepicker에 option을 추가하는 방법이다.
    $(".datepicker").datepicker({
      "maxDate" : new Date(),
      yearRange: yearRange ,// 지금 날짜 이전만 선택 가능
      changeMonth: true,
      changeYear: true,
      dateFormat: "yy-mm-dd",
      dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
      monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
    });


    $("#product-del-exe-btn").click(function(){
      if(confirm(" 정말 삭제하시겠습니까? ")){
        location.href=`/admin/product/delete/${product.p_no}`;
        alert("삭제가 완료되었습니다.");
      }
    })
  });
</script>
</body>
</html>

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
    <title>상품 등록</title>
    <script type="text/javascript">
        $(function () {
            <%-- ================================= DatePicker =================================== --%>
            // datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능
            $(".datepicker").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy-mm-dd",
                dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
                monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
            });
            // datepicker 클래스 이벤트
            var now = new Date();
            var startYear = now.getFullYear();
            var yearRange = (startYear - 120) + ":" + startYear;
            // datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
            //원래 있던 datepicker에 option을 추가하는 방법이다.
            $(".datepicker").datepicker("option", {
                "maxDate": new Date(),
                yearRange: yearRange
            });
        })
    </script>
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
                <h1 class="h3 mb-2 text-gray-800 mt-4">상품 등록</h1>
                <hr>

                <form action="/admin/product/write" id="productForm"
                      method="POST" enctype="multipart/form-data">
                    <div class="card d-flex" style="width: 100%; text-align: center;">
                        <div class="card-body d-flex" style="text-align: center; width:100%; background-color: #44485d; border-radius: 10px;">
                            <div class="img-section" style="text-align: center; padding-top: 65px; border-radius: 10px;">
                                <div id="img-box" style="text-align: center; width:250px; height: 350px; border-radius: 10px; background-color: #ededed"><label
                                        class="fs-1 d-flex align-items-center justify-content-center border border-opacity-25"
                                        for="fileInput" style="width: 250px; height: 350px; font-size: larger"><i class="fas fa-camera-retro fa-2x"></i></label></div>
                            </div>
                            <input type="file" name="uploadFile" id="fileInput"
                                   accept="image/jpeg, image/png"
                                   onchange="productImgUrl(this)"
                                   style="display:none; z-index: 999;"
                            />

                            <table width="80%">
                                <tr><td>제목</td><td><input type="text" name="p_title" id="p_title" required="required" autocomplete="off"
                                                          class="form-control"></td></tr>
                                <tr><td>저자</td><td><input type="text" name="p_author" required="required" autocomplete="off"
                                                          class="form-control"></td></tr>
                                <tr><td>출판사</td><td><input type="text" name="p_publisher" required="required" autocomplete="off"
                                                           class="form-control"></td></tr>
                                <tr><td>출판일</td><td><input name="p_pubdate" id="p_pubdate" required="required"
                                                           class="form-control datepicker" autocomplete="off">
                                <tr><td>판매가</td><td><input type="text" name="p_price" required="required" autocomplete="off"
                                                           class="form-control"></td></tr>
                                <tr><td>입고수량</td><td><input type="text" name="p_count" required="required" autocomplete="off"
                                                            class="form-control"></td></tr>

                                <tr><td>카테고리</td>
                                    <td>
                                        <select name="p_category" class="form-control">
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
                                <tr><td>개요</td><td><textarea class="form-control" type="text" class="text-dark" name="p_description" autocomplete="off" required="required"></textarea></td></tr>
                            </table>
                        </div>
                    </div>

                    <div style="text-align: center; margin-bottom: 50px; margin-top:30px; "><input type="button" value="등록" id="product-ins-btn" class="mt-3" style="background-color: #2a3b72; border-radius: 10px; width: 120px; height: 50px; color: white; font-size: large; border: none;"/></div
                    >
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
</body>
</html>
<script type="text/javascript">
    let src; /* 이미지 유효성 검사 변수 */
    let title = $("input[name=p_title]").val();
    /* 리뷰 이미지 업로드 */
    function productImgUrl(input) {
        let reader = new FileReader();
        reader.onload = function(e) {
            src = e.target.result;
            $('#img-box').empty();
            $('#img-box').append('<img class="ms-2 border border-dark" alt="" src="'+src+'" style="width: 250px; height: 350px; border-radius: 10px;">')
        };
        reader.readAsDataURL(input.files[0]);
    }
    $(function(){
        $('#product-ins-btn').click(function(e){
            let img = $("#fileInput").val();
            let title = $('#p_title').val();
            let author = $("input[name=p_author]").val();
            let publisher = $("input[name=p_publisher]").val();
            let pubdate = $("input[name=p_pubdate]").val();
            let price = $("input[name=p_price]").val();
            let count = $("input[name=p_count]").val();
            let category = $("select[name=p_category]").val();
            let description = $("textarea[name=p_description]").val();
            if(confirm("입력한 정보로 상품을 등록하시겠습니까?")){
                if(!src || title.length == 0 || author.length == 0
                    || publisher.length == 0 || pubdate.length == 0
                    || price.length == 0 || count.length == 0
                    || !category || description.length == 0
                )
                {
                    alert("입력 양식을 확인해 주세요.");
                    // alert("title ===> "+ title + "img ===> " +img +
                    //     "author ===>"+ author + "publisher ===> "+ publisher +
                    //     "pubdate ===> "+ pubdate +"price ===>"+ price +
                    //     "count ===>" +count + "category ===> "+category +
                    //     "description ===> "+ description);
                    e.preventDefault();
                }
                else {
                    alert("상품이 성공적으로 등록되었습니다.");
                    $('#productForm').submit();
                }
            }else{
                e.preventDefault();
            }
        })
    });
</script>
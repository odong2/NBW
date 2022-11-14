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
    <title>쿠폰 관리 페이지</title>
    <style>
        @font-face {
            font-family: 'InfinitySans-RegularA1';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        *{
            font-family: 'InfinitySans-RegularA1';
        }

        body{
            box-sizing: border-box;
            padding: 0;
            margin: 0;
        }
        /**{*/
        /*    border: 1px solid blue;*/
        /*}*/
        main{
            margin-bottom: 30px;
        }
        .flex-container{
            width: 1300px;
            margin-left: 35px;
        }
        #listWrapper{
            width:900px;
            margin-right: 50px;
            height:730px;
        }
        #registWrapper{
            width:550px;
            margin-left: 50px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        }
        form{
            padding: 20px;
        }
        #fileLabel{
            cursor: pointer;
        }
        table {
            padding:0;
            width: 100%;
            background-color: #f1f1f2;
        }
        table > thead > tr > th {
            font-weight: 400;
            color: #fff;
            background-color: #5055b1;
            height: 20px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.12);
        }
        table > tbody > tr > td {
            text-align: center;
            border-bottom: 1px solid rgba(0, 0, 0, 0.12);
        }
        .table-container {
            height: 600px;
            overflow: auto;
        }
        table{
            height: 600px;
        }
        tbody td{
            padding-top: 10px;
        }
        tbody span{
            display: inline-block;
            margin-top: 5px;
        }
        .fixed-header {
            position: sticky;
            top: 0;
            font-size: 0.8rem;
        }
        table td{
            font-weight: bold;
            font-size: 0.8rem;
            color: rgba(0,0,0,0.7)
        }
        table .delCpBtn{
            background-color: white;
            color: #5055b1;
            border-color: #5055b1 ;
            font-weight: bold;
            font-size: 0.7rem;
        }

        table .delCpBtn:hover{
            background-color: red;
            color: rgb(255,255,255);
            font-weight: bold;

        }

        .form-label{
            font-size: 0.9rem;
            font-weight: bold;
            color: rgba(0,0,0,0.7);
        }
        #form input, .form-check-label{
            font-size: 0.8rem;
        }

        #fileClear{
            cursor: pointer;
        }

        #wrtCpBtn{
            background-color: white;
            border: 1px solid #5055b1;
            color: #5055b1;
            font-weight: bold;
        }
        #wrtCpBtn:hover{
            color: white;
            background-color: #5055b1;
        }
        #msgBox{
            /*margin-top: 20px;*/
            border-radius: 10px;
            height: 60px;
            display: none;
            font-weight: bold;
        }
        #createNoBtn{
            font-size: 0.8rem;
            border: 1px solid #6DB329;
            background-color: white;
            color: #6DB329;
            font-weight: bold;
        }
        #createNoBtn:hover{
            background-color: #6DB329;
            color:white;
        }

    </style>
    <%@include file="/WEB-INF/includes/admin/common.jsp" %>
    <title>쿠폰관리 페이지</title>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div class="d-flex justify-content-start">
    <!-- Sidebar -->
    <%@include file="/WEB-INF/includes/admin/sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <!-- [[ 오른쪽 div 시작 ]] -->
    <section class="contentdiv d-flex" style="margin-left: 224px">
        <!-- Topbar -->
        <%@include file="/WEB-INF/includes/admin/header.jsp" %>
        <!-- End of Topbar -->
        <!-- Main Content -->
        <main class="container-fluid">
            <section id="main">
                <section class="container-fluid">
                <h1 class="h3 mb-2 text-gray-800 mt-4">쿠폰 관리 페이지</h1>
                </section>
                <section class="d-flex mt-4 flex-container">
                   <section id="listWrapper" >
                       <h4 class="text-gray-800 text-center mb-3 py-3">등록된 쿠폰 목록</h4>
                       <div class="table-container">
                       <table class="table">
                           <thead class="text-white text-center">
                                <th class="fixed-header">쿠폰 번호</th>
                                <th class="fixed-header">내용</th>
                                <th class="fixed-header">금액</th>
                                <th class="fixed-header">이미지</th>
                                <th class="fixed-header">공개 여부</th>
                                <th class="fixed-header">생성일</th>
                                <th class="fixed-header">삭제</th>
                           </thead>
                           <tbody>
                           <%-- 쿠폰 리스트 목록--%>

                           </tbody>
                       </table>
                       </div>
                   </section>
                    <section id="registWrapper">
                        <h4 class="text-gray-800 text-center mb-3 py-3">쿠폰 등록</h4>
                        <form id="form" method="POST" action="/coupon/write" enctype="multipart/form-data">
                        <div class="mt-3">
                            <div>
                                <label for="no" class="form-label">쿠폰 번호</label>
                            </div>
                            <div class="d-flex px-0 col-12">
                                <input type="text" name="cp_no" id="no" class="form-control" readonly placeholder="쿠폰 번호를 생성하세요" />
                                <div class="col-4">
                                    <button type="button" id="createNoBtn" class="btn btn-dark">쿠폰번호 생성</button>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div>
                                <label for="name"  class="form-label">쿠폰 이름</label>
                            </div>
                            <input type="text" name="cp_name" id="name" class="form-control" placeholder="쿠폰 이름을 입력하세요" />
                        </div>
                        <div class="mt-3">
                            <div>
                                <label for="price"  class="form-label">쿠폰 가격</label>
                            </div>
                            <input type="text" name="cp_price" id="price" class="form-control"  placeholder="쿠폰 가격을 입력하세요" />
                        </div>
                        <div class="mt-3">
                            <div>
                                <span class="form-label">쿠폰 다운로드 여부</span>
                            </div>
                            <div class="d-flex mt-2 col-12 px-0">
                                <div class="form-check col-2">
                                    <input class="form-check-input" name="cp_public" type="radio" id="allow" value="Y">
                                    <label class="form-check-label" for="allow">허용</label>
                                </div>
                                <div class="form-check col-3">
                                    <input class="form-check-input ms-4" name="cp_public" type="radio" id="disallow" value="N">
                                    <label class="form-check-label" for="disallow">비허용</label>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3 mb-1">
                            <span class="form-label">쿠폰 이미지</span>
                        </div>
                        <div>
                            <div style="width: 100px; height: 100px" id="imgBox">
                                <label id="fileLabel" for="file"><img src="/images/add-img.png" style="width: 60px"/></label>
                                <input type="file" name="cp_file"
                                       id="file" accept="image/gif, image/jpeg, image/png" onchange="setCouponImg(this)" style="display: none"/>
                                <div class="mt-3" id="coupon-box" style="position: relative; height: 165px; width: 300px;">
                                    <div>
                                        <img id="couponImg" width="300px"/>
                                    </div>
                                </div>
                                <img id="fileClear" src="/images/remove.png" style="width: 20px;position: relative;left: 283px;bottom: 180px; display:none;" />
                            </div>
                            <div>
                                <button type="button" id="wrtCpBtn" class="btn col-12 mt-3">쿠폰 등록</button>
                            </div>
                        </div>
                        </form>
                        <div id="msgBox" class="col-12 py-3 text-center"></div>
                    </section>
                </section>
            </section>
            <%--================================ 댓글 msg 알림창 ===================================--%>
        </main>
        <!-- Footer -->
        <%@include file="/WEB-INF/includes/admin/footer.jsp" %>
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

<%-- 함수 선언 관련 스크립트--%>
<script type="text/javascript">
    let msgPrint = function(msg, result){
        if(result == 'OK'){
            $('#msgBox').removeClass('alert-danger');
            $('#msgBox').addClass('alert-primary');
        }else if(result == 'ERR'){
            $('#msgBox').removeClass('alert-primary');
            $('#msgBox').addClass('alert-danger');
        }
        $('#msgBox').text(msg);
        $('#msgBox').fadeIn(300);
        $("#msgBox").delay(1800).fadeOut(500);

    }
    /* json 데이터 html로 바꾸는 함수 */
    let toHtml = (coupons)=>{
        let couponList = '';
        coupons.forEach((coupon)=>{
            let price = coupon.cp_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
            let cdate = getDate(coupon.cp_cdate);
            couponList += '<tr class="text-center">';
            couponList += `<td><span><c:out value="${'${coupon.cp_no}'}"/></span></td>`;
            couponList += `<td><span><c:out value="${'${coupon.cp_name}'}"/></span></td>`;
            couponList += `<td><span><c:out value="${'${price}'}"/></span></td>`;
            if(coupon.cp_img != null){
                couponList += `<td><span>있음</span></td>`;
            }else{
                couponList += `<td><span>없음</span></td>`;
            }
            if(coupon.cp_public =='Y'){
                couponList += `<td><span>공개</span></td>`;
            }else{
                couponList += `<td><span>비공개</span></td>`;
            }
            couponList += `<td><span><c:out value="${'${cdate}'}"/></span></td>`;
            couponList += `<td><button type="button"
                            class="btn delCpBtn" onClick="removeCp(this)"
                            data-cpName="<c:out value="${'${coupon.cp_name}'}"/>"
                            data-cpNo="<c:out value="${'${coupon.cp_no}'}"/>">삭제</button></td>`
            couponList += '</tr>';
        })
        return couponList;
    }

    /* 쿠폰 이미지 등록 시 동작 함수 */
    let fileAdd = ()=>{
        $('#couponImg').css({
            'border-radius': '5px',
            'padding': '10px',
            'box-shadow': '12px 12px 2px 1px rgba(153, 153, 153, .4)'
        });
        $('#fileClear').css('display','block');
        imgBoxHeight = imgBoxHeight + 165;
        $('#imgBox').height(imgBoxHeight);
    }
    /* 쿠폰 이미지 및 이미지 박스 초기화하는 함수*/
    let fileClear = ()=>{
        $('#couponImg').prop('src','');
        $('#couponImg').css('box-shadow', '')
        $('#file').val('');
        $('#fileClear').css('display','none');
        imgBoxHeight = imgBoxHeight - 165;
        $('#imgBox').height(imgBoxHeight);
    }

    /* Date 형식을 2022-11-11 형태로 바꿔주는 함수*/
    let getDate = function(cdate){
        let date = new Date(cdate);
        let year = date.getFullYear();
        let month = String(date.getMonth()+1).padStart(2, "0");
        let day = String(date.getDate()).padStart(2,"0");
        return year + "-" + month + "-" + day + " ";
    }
</script>
<%-- 이벤트 관련 스크립트--%>
<script type="text/javascript">
    let title = '';
    let content = '';
    let imgBoxHeight = $('#imgBox').height(); // 업로드 이미지 박스 크기

    /* 쿠폰 이미지 등록 */
     let setCouponImg = (input)=>{
         if (input.files && input.files[0]) {
             let reader = new FileReader();
             reader.onload = function(e) {
                    $('#couponImg').prop('src', e.target.result);
             };
             reader.readAsDataURL(input.files[0]);
             // 이미지 박스 및 이미지 크기 조절
             fileAdd();
         }
         // 파일 올리기 취소
         else {
             /* 기존에 이미지가 없을 경우 */
             $('#couponImg').prop('src', "");
             $('#couponImg').css('box-shadow', '')
             $('#file').val('');
             $('#fileClear').css('display','none');
             /* 기존에 이미지가 있을 경우 */
             if(imgBoxHeight == 265){
                 imgBoxHeight = imgBoxHeight - 165;
                 $('#imgBox').height(imgBoxHeight);
             }
         }
    }
    /* 쿠폰번호 생성 클릭 이벤트 */
    $('#createNoBtn').click(()=>{
        createCpno();
    })

    /* 쿠폰 이미지 취소*/
    $('#fileClear').click(()=>{
        fileClear();
    })

    /* window.onload*/
    $(function(){
        /* (1) 쿠폰 리스트 가져오기*/
        getCpList();
    })

     /* (해야할 일 !!!) 쿠폰 입력창 유효성 검사 */
    let formValidCheck = ()=>{
        let result = 'ERR';
        let no = $('#no').val();
        let name = $('#name').val();
        let price = $('#price').val();
        let public = $('input[name=cp_public]:checked').val();
        let file = $('#file').val();
        if(no == ''){
            title = "쿠폰번호를 생성해 주세요";
            msgPrint(title, result);
            return false;
        }
        if(name == ''){
            title = "쿠폰 이름을 입력해 주세요";
            msgPrint(title, result);
            return false;
        }
        if(price == ''){
            title = "쿠폰금액을 입력해 주세요";
            msgPrint(title, result);
            return false;
        }
        if(isNaN(price)){
            title = "쿠폰금액은 숫자만 입력해 주세요";
            msgPrint(title, result);
            return false;
        }
        if(public == undefined){
            title = "공개여부를 선택해 주세요.";
            msgPrint(title, result);
            return false;
        }
        if(public == "Y" && file == '' ){
            title = "쿠폰 공개시 이미지를 등록하세요";
            msgPrint(title, result);
            return false;
        }
        return true;

    }
</script>

<%-- Ajax 관련 스크립트--%>
<script type="text/javascript">

    /* 쿠폰 번호 생성 */
    let createCpno = ()=>{
        $.ajax({
            type: 'GET',
            url: '/coupon/random/cpno',
            dataType: 'text',
            success:function(result){
                let cpNo = result;
                $('#no').val(cpNo);
            }
        })
    }

    /* 쿠폰 삭제 이벤트*/
    let removeCp = (deleteBtn)=>{
        let cpName= $(deleteBtn).attr('data-cpName');
        if(!confirm(cpName + "을 삭제하시겠습니까?")){
            alert('쿠폰삭제를 취소하였습니다.')
            return;
        }
        let cp_no = $(deleteBtn).attr('data-cpNo')
        /* (1) Ajax로 쿠폰 삭제 요청*/
        $.ajax({
            type: "DELETE",
            url : '/coupon/' + cp_no,
            data : {cp_no: cp_no},
            dataType: 'text',
            success:function(result){
                /* (2) 기존 tbody 밑 내용 지우기 */
                $('tbody').empty();
                /* (3) couponList 가지고와서 업데이트 */
                getCpList();
                /* (4) 성공 메시지 보여주기*/
                msgPrint('쿠폰을 삭제하셨습니다.', result);
            },
            error: function(result){
                msgPrint('쿠폰 삭제에 실패하였습니다.', result);
            }
        })
    }

    /* 쿠폰 리스트 조회 Ajax */
    let getCpList = ()=>{
        /* (1) Ajax 요청 */
        $.ajax({
            type: "GET",
            url : '/coupon/list',
            success:function(couponList){
                /* (3) tbody 밑에 쿠폰 리스트 그리기 */
                $('tbody').append(toHtml(couponList));
            }
        })
    }

    /* 쿠폰 등록 이벤트*/
    $('#wrtCpBtn').click(()=>{
        // (1) form 유효성 검사
        if(formValidCheck()) {
            // (2) form 생성
            let form = $('#form')[0];
            // (3) formData 생성
            let formData = new FormData(form);
            console.log(formData)
            $.ajax({
                type: 'POST',
                url: '/coupon/write',
                data: formData,
                enctype: "multipart/form-data",
                contentType: false,
                processData: false,
                success: function (result) {
                    /* (4) 성공 메시지 보여주기*/
                    title = '쿠폰을 등록하셨습니다.';
                    msgPrint(title, result);
                    /* (5) form 초기화 */
                    $('#form')[0].reset();
                    /* (6) 이미지 파일 및 이미지 박스 초기화 */
                    if (imgBoxHeight == 265) {
                        fileClear();
                    }
                    /* (7) 쿠폰 리스트 조회 */
                    $('tbody').empty();
                    getCpList();
                },
                error: function (result) {
                    msgPrint('쿠폰 등록에 실패하셨습니다.', result);
                }
            })
        }
    });
</script>
</body>
</html>
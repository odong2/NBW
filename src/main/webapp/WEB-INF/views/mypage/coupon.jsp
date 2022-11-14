<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    <link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
    <title>MyPage</title>
    <style>
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body{
            font-family: GangwonEdu_OTFBoldA;
            box-sizing: border-box;
            padding:0;
            margin:0;
        }
        .sidebar span{
            font-size: 1rem;
        }
        .sidebar a{
            font-size: 1rem;
        }
        .sidebarList .title span{
            font-size: 1.3rem;
            font-weight: bold;
            color: #5055b1;
        }

        main {
            width: 100%;
        }

        main .header-list {
            border: 1px solid rgba(204, 204, 204, 0.8);
            width: 100%;
            height: 100px;
            border-radius: 7px;
            font-size: 0.8rem;
            padding: 5px;
        }
        header{
            padding-right: 40px;
            margin-right: 40px;
            margin-left: 40px;
        }

        #searchMyCouponBtn{
            height: 40px;
        }

        #cpWrtBtn{
            height: 40px;
            background-color: rgba(0,0,0,0.5);
            border: none;
        }
        .container-fluid{
            padding-right: 50px;
            padding-left: 50px;
        }
        #productHeader h5{
            font-size: 1.1rem;
        }
        .div-line{
            margin-right: 40px;
            border-bottom: solid 1px rgba(153,153,153,0.5);
        }
        .order-list span{
            font-size: 0.9rem;
        }
        .order-list #payBackBtn{
            background-color: white;
            color: #a52834;
            font-size: 0.9rem;
            border-color: #a52834;
            width:80px;
        }
        .order-list #returnBtn{
            background-color: white;
            color: #5055b1;
            font-size: 0.9rem;
            width:80px;
        }
        .order-list #detailBtn{
            background-color: white;
            color: #5055b1;
            font-size: 0.9rem;
            border-color: #5055b1;
            width: 80px;
        }
        .order-status-green{
            color: #6DB329;
            font-weight: bold;
        }
        .order-status-red{
            color: red;
            font-weight: bold;
        }
        .order-status-blue{
            color: #5055b1;
            font-weight: bold;
        }
        .order-list a{
            text-decoration: none;
            font-size: 0.9rem;
        }
        .modal-body span{
            font-size: 1rem;
        }
        .modal-body .title{
            font-size: 1.3rem;
            color: #5055b1;
        }
        .modal-body #pImg,
        .modal-body #img{
            width: 60px;
        }
        .modal-content .modal-data{
            padding:10px;
        }
        .modal-footer .close-mBtn{
            background-color: white;
            color: #5055b1;
            border-color: #5055b1 ;
        }
        .modal #payBackModalLabel{
            font-size: 1.2rem;
            color: #a52834;
        }
        .modal #p-msg{
            font-size: 0.9rem;
        }
        .coupon-img{
            width: 80%;
        }
        .btn{
            width:50%;
        }
        #couponZipSection{
            padding-top: 30px;
        }
        .toast-container{
            z-index: 100;
        }
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="../../includes/header.jsp" %>
<!-- 헤더 끝 -->
<!-- 마이 페이지 시작 -->
<section class="mypage wrapper d-flex">
    <!-- 사이드바 시작-->
    <%@include file="../../includes/sidebar.jsp" %>
    <!-- 사이드바 끝-->
    <%-- ==================== 메인 시작==================--%>
    <main class="ms-4">
        <%-- ==================== 마이 페이지 타이틀 ==================--%>
        <div class="mb-5">
            <h5>Coupon</h5>
        </div>
        <section>
            <div class="mb-3">
                <h5>쿠폰 조회</h5>
            </div>
            <div class="d-flex mb-5">
                <div class="col-3 btn-box">
                    <input type="button" id="searchMyCouponBtn" class="btn btn-sm btn-outline-primary"
                           data-bs-toggle="modal" data-bs-target="#staticBackdrop" value="보유 쿠폰 조회"/>
                </div>
            </div>
        </section>
        <section>
            <div class="mb-3">
                <h5>쿠폰 등록</h5>
            </div>
            <div class="d-flex mb-5">
                <div class="col-4">
                    <input class=" form-control" id="cpNoInput" type="text" placeholder="쿠폰번호를 입력하세요" val=""/>
                </div>
                <div class="col-3">
                    <input type="button" id="cpWrtBtn" disabled class="btn btn-sm btn-primary ms-3" value="등록"/>
                </div>
            </div>
        </section>

         <div class="div-line">
            <h5 id="downTitle" class="mb-3">쿠폰 다운로드</h5>
        </div>
        <section class="d-flex flex-wrap" id="couponZipSection">
            <%-- 다운로드 쿠폰 리스트가 들어가는 section --%>
        </section>
            <%--================================ 댓글 msg 알림창 ===================================--%>
        <section class="toast-container position-fixed top-0 end-0 p-3">
            <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <div id="colorBox"style="width: 25px; height: 25px; border-radius: 7px"></div>
                    <strong class="me-auto ms-2" id="msgTitle"></strong>
                    <small>방금</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body" id="msgContent"></div>
            </div>
        </section>
            <!-- Modal -->
            <section class="modal fade rounded-3" id="staticBackdrop" data-bs-backdrop="static"
                     data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <section class="modal-data">
                                <h6 class="title mb-2">보유중인 쿠폰</h6>
                                <hr/>
                                <div class="d-flex mb-2 px-2">
                                    <div class="col-3  align-self-center">상품</div>
                                    <div class="col-5  ms-5 align-self-center">제목</div>
                                    <div class="col-2  align-self-center">금액</div>
                                </div>
                                <div class="d-flex mb-4">
                                    <div class="col-3  align-self-center"><img src="" id="pImg"></div>
                                    <div class="col-6  align-self-center"><p id="pTitle" class="me-2 mt-3"></p></div>
                                    <div class="col-2  align-self-center"><span id="pPrice"></span></div>
                                </div>
                            </section>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary close-mBtn" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </section>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Launch demo modal
            </button>
    </main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->


<script type="text/javascript">
    let title = "";
    let content = "";
    $(function(){
        getCpList();
    })
    /* 결과 메시지 보여주는 함수 */
    let showMsg = function (title, content, result){
        if(result == 'OK'){
            $('#colorBox').css('background-color', '#0f6848');
        }
        else if(result == 'ERR'){
            $('#colorBox').css('background-color', 'red');
        }
        $('#msgTitle').text(title);
        $('#msgContent').text(content);
        const toastLive = document.getElementById('liveToast');
        const toast = new bootstrap.Toast(toastLive);
        toast.show();
    }

    /* 쿠폰 번호 18글자 이상 입력해야 등록 가능 */
    $("#cpNoInput").on("change paste input", function() {
        let cp_no = $('#cpNoInput').val().length;

        if(cp_no > 17){
            $('#cpWrtBtn').removeAttr('disabled');
            $('#cpWrtBtn').css({
                'background-color' : 'white',
                'border': '1px solid  #5055b1',
                'font-weight': 'bord',
                'color' : ' #5055b1'
            })

        }else if(cp_no < 17){
            $('#cpWrtBtn').attr('disabled', 'disabled');
            $('#cpWrtBtn').css({
                'background-color' : 'rgba(0,0,0,0.5)',
                'border': 'none',
                'color' : 'rgb(255,255,255)'
            })
        }
    })
    /* 쿠폰 번호 체크 */
    let formCheck = ()=>{
        let cp_no = $('#cpNoInput').val();

        /* (1) 이미 등록한 쿠폰인지 조회 */
        if(!checkCpNo(cp_no)){
            return false;
        }
        if(cp_no.trim() == ''){

        }
    }

    /* 쿠폰 등록 이벤트 */
    $('#cpWrtBtn').click(()=>{
        let cp_no = $('#cpNoInput').val();

        /* 폼 입력값 체크 및 이미 등록한 쿠폰인지 조회 */
        if(formCheck()) {
            let cp_no = $('#cpNoInput').val();
            requestDownCp(cp_no);
        }
    })


    /* 쿠폰 리스트 조회 Ajax */
    let getCpList = ()=>{
        /* (1) Ajax 요청 */
        $.ajax({
            type: "GET",
            url : '/coupon/down/list',
            success:function(couponList){
                console.log(couponList);
                /* (3) tbody 밑에 쿠폰 리스트 그리기 */
                $('#couponZipSection').append(toHtml(couponList));
            }
        })
    }

    /* json 데이터 html로 바꾸는 함수 */
    let toHtml = (coupons)=>{
        let couponList = '';
        coupons.forEach((coupon)=>{
            let filePath = encodeURIComponent(coupon.cp_img);
            let couponNo = encodeURIComponent(coupon.cp_no);
            if(coupon.mem_id != null){
            couponList += `
                <div class="col-4 mb-5">
                    <div class="col-10 d-flex justify-content-center">
                    <img src=<c:out value="/coupon/display/${'${filePath}'}"/> class="coupon-img"/>
                </div>
                <div class="col-10 d-flex justify-content-center mt-2">
                    <button type="button"
                    class="btn btn-secondary col-7" disabled data-cpNo="<c:out value="${'${couponNo}'}"/>">지급된 쿠폰</button>
                </div>
            </div>
            `
            return;
            }
            couponList += `
                <div class="col-4 mb-5">
                    <div class="col-10 d-flex justify-content-center">
                    <img src=<c:out value="/coupon/display/${'${filePath}'}"/> class="coupon-img"/>
                </div>
                <div class="col-10 d-flex justify-content-center mt-2">
                    <button type="button" onClick="downLoadCoupon(this)"
                    class="btn btn-primary col-7" data-cpNo="<c:out value="${'${couponNo}'}"/>">쿠폰 받기</button>
                </div>
            </div>
            `

    })
        return couponList;
    }

    /* 쿠폰 다운로드 이벤트 */
    let downLoadCoupon = (button)=>{
        let cp_no= $(button).attr('data-cpNo');
        requestDownCp(cp_no, button);

        }

    /* 보유중인 쿠폰 조회 */
    $('#searchMyCouponBtn').click(()=>{
    })

    /* 이미 등록한 쿠폰인지 체크하는 Ajax */
    let checkCpNo = (cp_no)=>{
        $.ajax({
            type: 'GET',
            url: '/coupon/check/' + cp_no,
            data:  {cp_no:cp_no},
            success:(result)=>{
                if (result == 'N'){
                    let ERR = 'ERR';
                    title = '등록 실패'
                    content = '이미 등록한 쿠폰입니다.'
                    showMsg(title, content, ERR);
                    return false;
                }
                return true;
            }
        })
    }

    /* 쿠폰 다운로드 Ajax 요청*/
    let requestDownCp = (cp_no,button)=>{
        $.ajax({
            type: "POST",
            url : '/coupon/down/' + cp_no,
            success:function(result){
                title = "쿠폰 다운 완료"
                content = "쿠폰을 다운로드 하셨습니다."
                showMsg(title, content, result);
                /* 쿠폰 다운로드 받기 눌렀을 경우*/
                if(button != undefined) {
                    $(button).attr('disabled', true);
                    $(button).removeClass('btn-primary');
                    $(button).addClass('btn-secondary');
                    $(button).text('지급된 쿠폰');
                }
                /* input창에 쿠폰을 등록 했을 경우 */
                else{
                    $('#cpNoInput').val('');
                }

            },
            error:function(result){
                title = "쿠폰 다운 실패"
                content = "쿠폰 다운에 실패 하셨습니다."
                showMsg(title, content, result);
            },
        });
    }

</script>
</body>
</html>

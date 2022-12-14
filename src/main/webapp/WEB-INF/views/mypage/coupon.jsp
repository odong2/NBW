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
<!-- ?????? ?????? -->
<%@include file="../../includes/header.jsp" %>
<!-- ?????? ??? -->
<!-- ?????? ????????? ?????? -->
<section class="mypage wrapper d-flex">
    <!-- ???????????? ??????-->
    <%@include file="../../includes/sidebar.jsp" %>
    <!-- ???????????? ???-->
    <%-- ==================== ?????? ??????==================--%>
    <main class="ms-4">
        <%-- ==================== ?????? ????????? ????????? ==================--%>
        <div class="mb-5">
            <h5>Coupon</h5>
        </div>
        <section>
            <div class="mb-3">
                <h5>?????? ??????</h5>
            </div>
            <div class="d-flex mb-5">
                <div class="col-3 btn-box">
                    <input type="button" id="searchMyCouponBtn" class="btn btn-sm btn-outline-primary"
                           data-bs-toggle="modal" data-bs-target="#staticBackdrop" value="?????? ?????? ??????"/>
                </div>
            </div>
        </section>
        <section>
            <div class="mb-3">
                <h5>?????? ??????</h5>
            </div>
            <div class="d-flex mb-5">
                <div class="col-4">
                    <input class=" form-control" id="cpNoInput" type="text" placeholder="??????????????? ???????????????" val=""/>
                </div>
                <div class="col-3">
                    <input type="button" id="cpWrtBtn" disabled class="btn btn-sm btn-primary ms-3" value="??????"/>
                </div>
            </div>
        </section>

         <div class="div-line">
            <h5 id="downTitle" class="mb-3">?????? ????????????</h5>
        </div>
        <section class="d-flex flex-wrap" id="couponZipSection">
            <%-- ???????????? ?????? ???????????? ???????????? section --%>
        </section>
            <%--================================ ?????? msg ????????? ===================================--%>
        <section class="toast-container position-fixed top-0 end-0 p-3">
            <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <div id="colorBox"style="width: 25px; height: 25px; border-radius: 7px"></div>
                    <strong class="me-auto ms-2" id="msgTitle"></strong>
                    <small>??????</small>
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
                                <h6 class="title mb-2">???????????? ??????</h6>
                                <hr/>
                                <div class="d-flex mb-2 px-2">
                                    <div class="col-6  align-self-center">?????? ??????</div>
                                    <div class="col-6  align-self-center">?????? ?????????</div>
                                </div>
                                <div id="couponInfo">

                                </div>
                            </section>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary close-mBtn" data-bs-dismiss="modal">??????</button>
                        </div>
                    </div>
                </div>
            </section>
    </main>
    <%-- ==================== ?????? ??? ==================--%>
</section>
<!-- ?????? ????????? ??? -->
<!-- ?????? ?????? -->
<%@include file="../../includes/footer.jsp" %>
<!-- ?????? ??? -->


<script type="text/javascript">
    let title = "";
    let content = "";
    $(function(){
        getCpList();
    })

    /* ?????? ????????? ???????????? ?????? */
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

    /* ?????? ?????? 18?????? ?????? ???????????? ?????? ?????? */
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
    /* ?????? ?????? ?????? */
    let formCheck = ()=>{
        let cp_no = $('#cpNoInput').val();

        /* (1) ?????? ????????? ???????????? ?????? */
        if(!checkCpNo(cp_no)){
            return false;
        }
        if(cp_no.trim() == ''){

        }
    }

    /* ?????? ?????? ????????? */
    $('#cpWrtBtn').click(()=>{
        let cp_no = $('#cpNoInput').val();

        /* ??? ????????? ?????? ??? ?????? ????????? ???????????? ?????? */
        if(formCheck()) {
            let cp_no = $('#cpNoInput').val();
            requestDownCp(cp_no);
        }
    })


    /* ?????? ????????? ?????? Ajax */
    let getCpList = ()=>{
        /* (1) Ajax ?????? */
        $.ajax({
            type: "GET",
            url : '/coupon/down/list',
            success:function(couponList){
                console.log(couponList);
                /* (3) tbody ?????? ?????? ????????? ????????? */
                $('#couponZipSection').append(toHtml(couponList));
            }
        })
    }

    /* json ????????? html??? ????????? ?????? */
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
                    class="btn btn-secondary col-7" disabled data-cpNo="<c:out value="${'${couponNo}'}"/>">????????? ??????</button>
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
                    class="btn btn-primary col-7" data-cpNo="<c:out value="${'${couponNo}'}"/>">?????? ??????</button>
                </div>
            </div>
            `

    })
        return couponList;
    }

    /* ?????? ???????????? ????????? */
    let downLoadCoupon = (button)=>{
        let cp_no= $(button).attr('data-cpNo');
        requestDownCp(cp_no, button);

        }

    /* ???????????? ?????? ?????? */
    $('#searchMyCouponBtn').click(()=>{
        $.ajax({
            type:'GET',
            url: '/coupon/list/member',
            success:(couponList)=>{
                console.log(couponList);
                $('#couponInfo').empty();
                $('#couponInfo').append(couponApppend(couponList));
            },
        })
    })
    /* ?????? ?????? html??? ????????? ?????? ??????*/
    let couponApppend = (coupons)=>{
        let couponList = '';
        coupons.forEach((coupon)=> {
            let cpName= coupon.cp_name;
            let cpPrice = coupon.cp_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " ???";
            couponList += `<div class="d-flex mb-4 px-2" >`;
            couponList += `<div class="col-6  align-self-center"><span id="cpName" class="me-2 mt-3"><c:out value="${'${cpName}'}"/></span></div>`;
            couponList += `<div class="col-6  align-self-center px-3"><span id="cpPrice"><c:out value="${'${cpPrice}'}"/></span></div>`;
            couponList += `</div>`;
        })
        return couponList;
    }


    /* ?????? ????????? ???????????? ???????????? Ajax */
    let checkCpNo = (cp_no)=>{
        $.ajax({
            type: 'GET',
            url: '/coupon/check/' + cp_no,
            data:  {cp_no:cp_no},
            success:(result)=>{
                if (result == 'N'){
                    let ERR = 'ERR';
                    title = '?????? ??????'
                    content = '?????? ????????? ???????????????.'
                    showMsg(title, content, ERR);
                    return false;
                }
                return true;
            }
        })
    }

    /* ?????? ???????????? Ajax ??????*/
    let requestDownCp = (cp_no,button)=>{
        $.ajax({
            type: "POST",
            url : '/coupon/down/' + cp_no,
            success:function(result){
                title = "?????? ?????? ??????"
                content = "????????? ???????????? ???????????????."
                showMsg(title, content, result);
                /* ?????? ???????????? ?????? ????????? ??????*/
                if(button != undefined) {
                    $(button).attr('disabled', true);
                    $(button).removeClass('btn-primary');
                    $(button).addClass('btn-secondary');
                    $(button).text('????????? ??????');
                }
                /* input?????? ????????? ?????? ?????? ?????? */
                else{
                    $('#cpNoInput').val('');
                }

            },
            error:function(result){
                title = "?????? ?????? ??????"
                content = "?????? ????????? ?????? ???????????????."
                showMsg(title, content, result);
            },
        });
    }
</script>
</body>
</html>

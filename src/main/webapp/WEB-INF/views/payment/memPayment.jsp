<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>도서 결제페이지</title>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
    <%@include file="/WEB-INF/includes/common.jsp" %>
<style>
    @font-face {
        font-family: CookieRun Regular;
        src: url('/font/cookieRunFont_TTF/CookieRun Regular.ttf') format("truetype");
    }
    * {
        /*  border: solid 0.8px blue; */
    }
    body {
        font-family:  CookieRun Regular;
        height: 00vh;
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }
    main {
        width: 1100px;
        margin: auto;
    }
    li {
        list-style: none;
    }
    ul {
        padding: 0;
    }
    th,.orderUser-info span{
        font-size: 0.9rem;
    }
    .btnFold,
    .btnFold h6,
    #prdInfo{
        font-size: 0.8rem;
    }

    .product-img {
        width: 80px;
    }
    .orderInfo-wrap {
        width: 800px;
    }
    .title {
        padding: 10px;
    }
    #prdInfo {
        width: 100%;
        padding: 10px;
    }
    .delivery span {
        font-size: 10px;
        border: solid 1px;
        padding: 2px;
        background-color: #5055b1;
        color: white;
        border-radius: 10px 10px;
    }
    .prdList {
        margin-top: 10px;
    }
    table {
        border: solid 1px #a0a0a0;
        /*  border-radius: 5px; */
        border-collapse: separate;
        border-spacing: 0 1rem;
        padding: 10px;
    }
    .btnFold {
        width: 100%;
        text-align: left;
        border: solid 1px #a0a0a0;
        border-radius: 5px 5px 0px 0px;
        padding: 10px;
    }

    #prdTotallCnt {
        color: #5055b1;
    }
    .paymentInfo-wrap span,
    .paymentInfo-wrap p,
    .receiver-label,
    .form-controller,
    option {
        font-size: 0.9rem;
    }
    .form-controller {
        border: solid 1px #d8d8d8;
        padding: 5px;
    }

    .pay {
        margin-left: 10px;
        margin-top: 3px;
    }

    .title{
        font-weight: bold;
    }

    .label,
    .receiver-label {

    }
    .container {
        border: solid 1px #a0a0a0;
        border-radius: 10px;
        padding: 20px;
        margin-top: 30px;
        margin-bottom: 30px;
    }
    #zipcodeBtn {
        background-color: #5055b1;
        color: white;
        font-size: 0.8rem;
        height: 33px;
        padding: 3px;
    }
    #deliveryMemo,
    #couponSelect,
    #direct-memo {
        font-size: 0.7rem;
    }

    /*  결제 정보창 스타일 */
    .payLabel {

    }
    .paymentInfo-wrap {
        width: 300px;
        position: fixed;
    }
    .paymentInfo-area {
        border: solid 1px #d8d8d8;
        height: 270px;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 5px;
    }
    #paymentPrice {
        font-size: 1rem;
        color:#5055b1;
        font-weight: bold;
    }
    #paymentPriceLabel{
        font-size: 1rem;
        font-weight: bold;
        color: #5055b1;
    }
    #payBtn {
        width: 100%;
        background-color: #5055b1;
        color: white;
        font-size: 1.1rem;
        letter-spacing: 0.2em;
        height: 40px;
    }

    .container input {
        border-radius: 5px;
    }
    .discount-label {
        font-size: 0.9rem;
    }
    #couponSelect {
        width: 53%;
        height: 30px;
    }

    #usePoint {
        font-size: 0.9rem;
        border: solid 1px #d8d8d8;
        padding: 5px;
        width: 80%;
        height: 40px;
        text-align: end;
    }

    #pointBtn {
        background-color: #5055b1;
        font-size: 0.8rem;
        color: white;
        margin-left: 50px;
    }

    #naverPayBtn .container-pay {
        background-color: #09bb4d;
        box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
        width: 200px;
        height: 50px;
        border-radius: 5px;
    }
    .container-pay {
        background-color: #ffeb3b;
        box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
        width: 200px;
        height: 50px;
        border-radius: 5px;
    }
    #naverPay,
    #kakaoPay {
        font-size: 25px;
        font-weight: bold;
    }
    #naverPay{
        color:white;
    }
    #kakaoPayBtn,
    #naverPayBtn {
        padding: 0;
        width: 200px;
        margin-left: 20px;
    }
    .naver {
        /* background-color: white; */
    }
    #payErrorMsg{
        border-radius: 10px;
        height: 60px;
        display: none;
        font-weight: bold;
    }
</style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<%-- 결제페이지 메인 시작--%>
<main>
    <c:set var="productPrice" value="0"/>
    <div id="orderBox" class="d-flex mt-5">
        <section class="orderInfo-wrap">
            <h6 class="title">주문/결제</h6>
            <hr />
            <%-- ====== 주문상품 접기 버튼 =======--%>
            <button class="btn btnFold d-flex" type="button">
                <h6 class="title ms-1 col-5">주문 상품</h6>
                <div class="col-7 d-flex">
                    <span id="prdTotallCnt" class="mt-2">총 <c:out value="${cartSize}"/>개</span>
                </div>
            </button>
            <%-- ========================== 주문 상품 정보 시작 ==============================--%>
            <table id="prdInfo" class="fold">
                <tbody>
                <c:forEach var="product" items="${cartList.cartProducts}">
                <tr class="prdList">
                    <td class="d-flex align-items-center col-8 ms-2">
                        <div class="productImg-box">
                            <img src=<c:out value="${product.p_img}"/> class="product-img"/>
                        </div>
                        <div class="prdTitle-box ms-3 col-12">
                            <span class="prdTitle">
                                [<c:out value="${product.p_category}"/>]
                                 <c:out value="${product.p_title}"/>
                            </span>
                        </div>
                    </td>
                    <td class="delivery col-1"><span>자체배송</span></td>
                    <td class="col-1"><span class="prdCount"><c:out value="${product.p_count}"/>개</span></td>
                    <td class="col-2"><span class="prdPrice"><fmt:formatNumber value="${product.p_price * product.p_count}" type="number"/>원</span></td>
                    <c:set var= "productPrice" value="${productPrice + product.p_price * product.p_count}"/>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <%-- ========================== 주문 상품 정보 끝 ==============================--%>
            <%-- ========================== 주문자 정보 시작 ==============================--%>
            <section class="orderUser-info container">
                <h6 class="title mt-2 ms-1">주문자 정보</h6>
                <hr />
                <ul class="ms-3">
                    <li class="d-flex mt-3">
                        <div class="col-lg-9 col-sm-4">
                            <span class="label">이름</span>
                        </div>
                        <div class="col-sm-8 ms-3">
                            <span><c:out value="${member.mem_name}"/></span>
                        </div>
                    </li>
                    <li class="d-flex mt-3">
                        <div class="col-lg-9 col-sm-4">
                            <span class="label">전화번호</span>
                        </div>
                        <div class="col-sm-8 ms-3">
                            <span><c:out value="${member.mem_phone}"/></span>
                        </div>
                    </li>
                    <li class="d-flex mt-3">
                        <div class="col-lg-9 col-sm-4">
                            <span class="label">회원등급</span>
                        </div>
                        <div class="col-sm-8 ms-3"><span><c:out value="${member.g_grade}"/></span></div>
                    </li>
                </ul>
            </section>
            <%-- ========================== 주문자 정보 끝 ==============================--%>
            <%-- ========================== 수령자 정보 시작 ==============================--%>
            <section class="container">
                <h6 class="title mt-2 ms-1">수령자 정보</h6>
                <hr />
                <!-- 수령자 정보 선택 라디오 -->
                <div class="radio d-flex ms-3 mb-3">
                    <div class="me-3">
                        <input id="orderEq" type="radio" name="orderUser-radio" style="width: 10px" checked/>
                        <label for="orderEq" class="receiver-label">주문자 동일</label>
                        <input id="orderDif" type="radio" name="orderUser-radio" style="width: 10px"/>
                        <label for="orderDif" class="receiver-label">수령자 별도</label>
                    </div>
                </div>
                <!-- 수령자 정보 선택 라디오 끝-->
                <!-- 수령자 정보 input 시작 -->
                <form name="paymentForm" class="paymentForm" action="/payment/pay" method="POST">
                    <c:forEach var="product" items="${cartList.cartProducts}">
                        <input type="hidden" name="p_no" value="${product.p_no}" >
                        <input type="hidden" name="p_title" value="${product.p_title}">
                        <input type="hidden" name="p_price" value="${product.p_price}">
                        <input type="hidden" name="p_img" value="${product.p_img}">
                        <input type="hidden" name="p_count" value="${product.p_count}">
                    </c:forEach>
                    <input name="mem_id" value="${member.mem_id}" type="hidden"/>
                    <input name="mem_email" value="${member.mem_email}" type="hidden"/>
                    <input name="mem_name" value="${member.mem_name}" type="hidden"/>
                    <input name="mem_point" value="${member.mem_point}" type="hidden"/>
                    <input name="used_point"  value="0" type="hidden"/>
                    <input name="total_price" value="${productPrice + deliveryPrice - gradeDiscount}" type="hidden"/>
                    <input name="cp_no" value="0" type="hidden"/>
                    <ul id="recvInfoList" class="ms-3">
                        <li>
                            <label for="receiver_name" class="receiver-label">* 수령자 이름</label>
                            <div class="mt-2 mb-3">
                                <input type="text" id="receiver_name"
                                       name="receiver_name"
                                       class="form-controller col-7" value=<c:out value="${member.mem_name}"/>>
                            </div>
                        </li>
                        <li>
                            <label for="receiver_phone" class="receiver-label">* 전화번호</label>
                            <div class="mt-2 mb-3">
                                <input type="text" id="receiver_phone" name="receiver_phone"
                                       oninput="autoHyphen(this)"
                                       maxlength="13"
                                       placeholder="'-'를 제외하고 입력하세요"
                                       pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
                                       class="form-controller col-7" value=<c:out value="${member.mem_phone}"/>>
                            </div>
                        </li>
                        <li>
                            <label for="recvZipcode" class="receiver-label">* 우편번호</label>
                            <div class="mt-2 mb-3">
                                <input type="text" id="recvZipcode" name="receiver_zipcode"
                                       class="form-controller col-5" value=<c:out value="${member.mem_zipcode}"/>>
                                <button type="button" id="zipcodeBtn" class="btn ms-2" onClick="changeSelectAddress();">우편번호 찾기</button>
                            </div>
                        </li>
                        <li>
                            <label for="recvAddress1" class="receiver-label">* 주소</label>
                            <div class="mt-2 mb-3">
                                <input type="text" id="recvAddress1" name="receiver_address1"
                                       class="form-controller col-7" value=<c:out value="${member.mem_address1}"/>>
                            </div>
                        </li>
                        <li>
                            <label for="recvAddress2" class="receiver-label">* 상세주소</label>
                            <div class="mt-2 mb-3">
                                <input type="text" ID="recvAddress2" name="receiver_address2"
                                       class="form-controller col-7" value=<c:out value="${member.mem_address2}"/>>
                            </div>
                        </li>
                        <li>
                            <label for="deliveryMemo" class="receiver-label">배송메모</label>
                            <div class="mt-2 col-7">
                                <select id="deliveryMemo"name="delivery_memo" class="form-select" onchange="selfMemo()">
                                    <option value="0" selected>
                                        배송시 요청사항을 선택해주세요
                                    </option>
                                    <option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
                                    <option value="부재시 택배함에 넣어주세요">부재시 택배함에 넣어주세요</option>
                                    <option value="부재시 문앞에 놔주세요">부재시 문앞에 놔주세요</option>
                                    <option value="배송전 연락바랍니다">배송전 연락바랍니다</option>
                                    <option value="5">직접입력</option>
                                </select>
                                    <textarea name="delivery_memo"
                                            id="direct-memo"
                                            cols="70"
                                            rows="2"
                                            class="mt-3"
                                            placeholder="메송 메모를 작성해 주세요"
                                            style="display: none"
                                            disabled
                                    ></textarea>
                            </div>
                        </li>
                    </ul>
                </form>
            </section>
            <%-- ========================== 수령자 정보 끝==============================--%>
            <%-- ========================== 쿠폰 시작 ==============================--%>
            <section class="container">
                <h6 class="title mt-2 ms-1">쿠폰 & 포인트</h6>
                <hr />
                <div class="d-flex ms-2">
                    <div class="col-4 ms-2">
                        <span class="discount-label">쿠폰적용</span>
                    </div>
                    <select id="couponSelect" name="coupon" onChange="changeSelectCoupon(this.value);">
                        <c:if test="${couponList != null}">
                        <option value="0" selected>쿠폰 선택</option>
                        <%-- 쿠폰이 존재하는 경우 --%>
                            <c:forEach var="coupon" items="${couponList}">
                            <option value="<c:out value="${coupon.cp_no}"/>"><c:out value="${coupon.cp_name}"/>(-<c:out value="${coupon.cp_price}"/>원)</option>
                            </c:forEach>
                        </c:if>
                        <c:if test="${couponList eq null}">
                            <option value="0" selected>사용 가능한 쿠폰이 없습니다</option>
                        </c:if>
                    </select>
                </div>
                <div class="d-flex ms-2 mt-3">
                    <div class="col-4 ms-2">
                        <span class="discount-label">보유 포인트</span>
                    </div>
                    <div class="col-4 text-end">
                        <p id="memPoint" style="font-size: 0.9rem"><c:out value="${member.mem_point}"/></p>
                    </div>
                    <div class="col-3 ms-3">
                        <button id="pointBtn" type="button" class="btn">모두 사용</button>
                    </div>
                </div>
                <div class="d-flex ms-2 mt-3">
                    <div class="col-4 ms-2">
                        <span class="discount-label">사용할 포인트</span>
                    </div>
                    <div class="col-8">
                        <input id="usePoint" type="text" value="0"/>
                    </div>
                </div>
            </section>
            <%-- ========================== 쿠폰 끝 ==============================--%>
            <%-- ======================== 결제수단 시작 ==============================--%>
            <section class="container">
                <h6 class="title mt-2 ms-1">결제수단</h6>
                <hr />
                <div class="wrapper d-flex justify-content-center">
                    <div class="flex-column">
                        <button id="naverPayBtn" type="button" class="btn payBtn">
                            <div class="container-pay d-flex justify-content-center me-5 align-items-center">
                                <div class="naver">
                                    <img
                                            id="naverPayImg"
                                            src="/images/nLogo.jpg"
                                            alt="네이버 로고"
                                            width="40px"
                                            height="40px"
                                    />
                                </div>
                                <span id="naverPay">Pay</span>
                            </div>
                        </button>
                    <div class="d-flex justify-content-center mt-3 ms-2">
                        <input type="radio" name="paySelect" value="네이버페이" id="naverpaySelect"/>
                    </div>
                    </div>
                    <div class="flex-column">
                        <button id="kakaoPayBtn" type="button" class="btn payBtn">
                            <div class="container-pay d-flex justify-content-center align-items-center">
                                <div class="kakaoPay me-1">
                                    <img
                                            id="kakaoPayImg"
                                            src="/images/kakao.png"
                                            alt="카카오 로고"
                                            width="30px"
                                            height="30px"
                                    />
                                </div>
                                    <span id="kakaoPay">Kakao</span>
                                </div>
                            </button>
                            <div class="d-flex justify-content-center mt-3 ms-2">
                                <input type="radio" value="카카오페이" name="paySelect" id="kakaopaySelect" />
                            </div>
                        </div>
                    </div>
            </section>
        </section>
        <%-- ======================== 결제수단 끝 ==============================--%>
        <%-- ======================== 결제 정보 시작 ==============================--%>
        <section class="ms-4">
            <div class="paymentInfo-wrap ms-3 mt-4">
                <div class="paymentInfo-area">
                        <ul>
                            <li class="mb-3">
                                <div class="d-flex pay">
                                    <div class="col-8 payLabel">
                                        <span>상품금액</span>
                                    </div>
                                    <div class="col-4 text-end px-2">
                                        <span id="prd-price"><fmt:formatNumber type="number" value="${productPrice}"/></span>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="d-flex pay">
                                    <div class="col-8 payLabel">
                                        <span>배송비</span>
                                    </div>
                                    <div class="col-4 text-end px-2">
                                        <c:choose>
                                            <%-- 주문 상품이 20000원을 넘을 경우 배송비 무료 --%>
                                            <c:when test="${productPrice ge 20000}">
                                                <c:set  var= "deliveryPrice" value="0"/>
                                                <span id="delivery-price"><c:out value="0"/>원</span>
                                            </c:when>
                                            <c:when test="${productPrice lt 20000}">
                                                <c:set  var= "deliveryPrice" value="2500"/>
                                                <span id="delivery-price"><c:out value="2500"/>원</span>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="d-flex pay">
                                    <div class="col-8 payLabel">
                                        <span>등급할인</span>
                                    </div>
                                    <div class="col-4 text-end px-2">
                                        <c:set var="gradeDiscount" value="2000"/>
                                        <span id="gradeDiscount">-2,000원</span>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="d-flex pay">
                                    <div class="col-8 payLabel">
                                        <span>쿠폰할인</span>
                                    </div>
                                    <div class="col-4 text-end px-2">
                                        <span id="couponDiscount">0원</span>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="d-flex pay">
                                    <div class="col-8 payLabel">
                                        <span>포인트사용</span>
                                    </div>
                                    <div class="col-4 text-end px-2">
                                        <span id="pointDiscount">
                                            <fmt:formatNumber value="0" type="number" />원
                                        </span>
                                    </div>
                                </div>
                            </li>
                            <hr class="ms-3 me-3" />
                            <li>
                                <div class="d-flex pay">
                                    <div class="col-8 payLabel">
                                        <span id="paymentPriceLabel">최종결제금액</span>
                                    </div>
                                    <div class="col-4 text-end px-2">
                                        <span id="paymentPrice">
                                            <fmt:formatNumber value="${productPrice + deliveryPrice - gradeDiscount}" type="number" />원
                                        </span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                </div>
                <button type="button" id="payBtn" class="btn">결제하기</button>
                <div id="payErrorMsg" class="col-12 mt-2 py-3 text-center alert-danger"></div>
            </div>
        </section>
        <%-- ======================== 결제정보 끝 ==============================--%>
    </div>
</main>
<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script type="text/javascript">
    <%-- 수령자 별도 클릭 이벤트 --%>
    $('#orderDif').click(function(){
        $('#recvInfoList input').val('');
    })
    $("#orderEq").click(function(){
        $('input[name=receiver_name]').val('${member.mem_name}');
        $('input[name=receiver_phone]').val('${member.mem_phone}');
        $('input[name=receiver_zipcode]').val('${member.mem_zipcode}');
        $('input[name=receiver_address1]').val('${member.mem_address1}');
        $('input[name=receiver_address2]').val('${member.mem_address2}');

    })
    let tmp = '${cartList}';
    console.log(tmp);

    //window.onload
    $(function () {
        <%-- 주문 상품 토글 숨겨 놓기--%>
        $("#prdInfo").hide();
    });

    $(".btnFold").click(function (e) {
        e.preventDefault();
        $(".fold").slideToggle(100);
    });

    /* 메모배송 직접 입력 */
    let selfMemo =  function(){
        let num = $("#deliveryMemo option:selected").val();
        if (num == 5) {
            $("#direct-memo").css('display', 'block');
            $("#direct-memo").focus();
            $("#direct-memo").prop('disabled', false);
        } else $("#direct-memo").css("display", "none");
    }


    <%-- 다음 주소록 API --%>
    let changeSelectAddress = function (){
        new daum.Postcode({
            oncomplete: function(data) {

                var addr = ''; // 주소 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#recvZipcode').val(data.zonecode);
                $('#recvAddress1').val(addr);
                $('#recvAddress2').val('');
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("recvAddress2").focus();
            }
        }).open();
    }
</script>
<%-- ============================= 결제금액 계산 관련 스크립트 ===========================--%>
<script type="text/javascript">
    // 결제 수단 에서의 point
    let usePoint = 0;		                                                // 포인트 사용금액(포인트 입력)
    let memPoint = parseInt('${member.mem_point}');                         // 멤버 보유 포인트
    /* 최종 결제 금액*/
    let productPrice    = ${productPrice};                                  // 총 상품금액
    let couponDiscount  = 0;                                                // 쿠폰할인금액
    let pointDiscount   = 0;                                                // 포인트 사용금액
    let paymentPrice    = ${productPrice - gradeDiscount + deliveryPrice};  // 최종 경제금액
    let beforePoint     = 0;                                                // 이전 포인트 사용금액
    let beforeCoupon     = 0;                                                // 이전 쿠폰 사용금액
    let cp_no           = "" ;

    /* 결제 수단 선택 이벤트 */
    $("#kakaoPayBtn").click(function(){
        $('#naverpaySelect').prop('checked', false);
        $('#kakaopaySelect').prop('checked', true);
    })
    $("#naverPayBtn").click(function(){
        $('#kakaopaySelect').prop('checked', false);
        $('#naverpaySelect').prop('checked', true);
    })

    <%-- 포인트 모두 사용 버튼 --%>
    $('#pointBtn').click(function(){
        let btnChek = $('#pointBtn').attr('btn');
        <%-- 모두 사용 누를 때 --%>
        if(btnChek != 'cancle') {
            $('#usePoint').val(memPoint);
            pointDiscount = parseInt('${member.mem_point}');
            pointDiscountNum  = memPoint.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원"
            $('#pointDiscount').text('-' + pointDiscountNum);
            $('#memPoint').text(0);
            $('#pointBtn').text('사용 취소');
            $('#pointBtn').css('background-color', '#CC3333');
            $('#pointBtn').attr('btn', 'cancle');
            $('#usePoint').prop('readonly', true);

            <%-- 최종 결제 금액 변경 --%>
            paymentPrice -= memPoint;
            let paymentPriceNum = paymentPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
            $('#paymentPrice').text(paymentPriceNum);
        }
        <%-- 사용 취소 누를 때 --%>
        else{
            $('#usePoint').val(0);
            $('#memPoint').text(memPoint);
            $('#pointDiscount').text('0원');
            $('#pointBtn').text('모두 사용');
            $('#pointBtn').css('background-color', '#5055b1');
            $('#pointBtn').removeAttr('btn');
            $('#usePoint').prop('readonly', false);

            <%-- 최종 결제 금액 변경 --%>
            paymentPrice += memPoint;
            let paymentPriceNum = paymentPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
            $('#paymentPrice').text(paymentPriceNum);

        }
    })

    // 사용가능 포인트 실시간 변경
    $("#usePoint").keyup(function(){
        usePoint = $('#usePoint').val();
        $("#memPoint").text(memPoint - usePoint);

        if(usePoint > memPoint){
            alert('사용가능 금액을 초과합니다. 다시 입력하세요');
            $("#usePoint").val(0);
            $("#memPoint").text(memPoint);
            return;
        }
        if(isNaN(usePoint)){
            alert('숫자만 입력하세요.');
            $("#usePoint").val(0);
            $("#memPoint").text(memPoint);
        }
    })

    // point 입력창 벗어 날 때 . 포인트 null 값 검사
    $("#usePoint").focusout(function(){
        let paymentPriceText = '';
        pointDiscount = 0;
        let useInputVal =  $('#usePoint').val();
        if(useInputVal == null || useInputVal == 0){
            $("#usePoint").val(0);
            $('#pointDiscount').text(pointDiscount + '원');
        }
        else{
        pointDiscount = parseInt(useInputVal);
        $('#pointDiscount').text('-' + pointDiscount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");
        }
        paymentPrice = paymentPrice - pointDiscount + beforePoint;
        paymentPriceText = paymentPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
        $('#paymentPrice').text(paymentPriceText);
        beforePoint = pointDiscount;

    })


    // 쿠폰 할인 적용
    let changeSelectCoupon = function (value){
        let couponDiscountText = '';
        cp_no = value;
        /* 쿠폰 가격을 초기화 시킨다(여러번 다시 클릭할 수 있기 때문에) */
        couponDiscount = 0;
        if(value == "0"){
            couponDiscount = 0;
            $('#couponDiscount').text(couponDiscount + '원');
        }
        else{
            /* (1) 선택된 쿠폰 */
            let couponText = $("#couponSelect option:checked").text();
            /* (2) 쿠폰의 가격을 들고 오기위해 index 값을 얻어 substring. ex) 브론즈회원 쿠폰(-1000원) */
            let startPoint = couponText.indexOf('(');
            let endPoint = couponText.indexOf(')');
            /* (3) 선택한 쿠폰가격을 couponDiscount(전역변수)에 초기화 */
            couponDiscount = parseInt(couponText.substring(startPoint+2, endPoint-1)); // 쿠폰 가격
            couponDiscountText = couponDiscount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
            /* (4) 쿠폰 할인에 선택한 쿠폰의 할인 금액 쓰기 */
            $('#couponDiscount').text('-'+ couponDiscountText);
        }
            /* (5) 선택한 쿠폰을 기준으로 최종 금액을 변경한다. */
            paymentPrice = paymentPrice - couponDiscount + beforeCoupon;
            let paymentPriceText = paymentPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
            $('#paymentPrice').text(paymentPriceText);
            /* (6) 쿠폰 다시 선택할 경우를 위해 이전에 사용했던 금액을 변수에 초기화 시킨다*/
            beforeCoupon = couponDiscount;
    }
</script>
<script type="text/javascript">

    <!-- 카카오페이 -->
    var IMP = window.IMP;
    IMP.init("imp20253202");

    let errorMsg = "";
    // 결제하기 버튼 클릭 시
    $('#payBtn').click(function(){
        formInputWrt(); // form에 입력값 삽입

        /* 배송메모 직접 입력 했을 경우 */
        if(!$('#direct-memo').prop('disabled')){
            $('#deliveryMemo').prop('disabled',true);
        }

        if(!formCheck()){
            errorMsg = "(*) 필수값을 입력해 주세요"
            errorMsgPrint(errorMsg);
            return;
        }
        // 결제 수단(네이버, 카카오페이)
        let payment = $("input[name=paySelect]:checked").val();
        console.log(payment);
        if (payment == undefined){
            errorMsg = "결제수단을 선택해 주세요";
            errorMsgPrint(errorMsg);
        }

        else if(payment == "카카오페이"){

        // IMP.request_pay(param, callback) 결제창 호출
            IMP.request_pay({ // param
                pg: "kakaopay",
                pay_method: "kakaopay",
                merchant_uid:  'merchant_' + new Date().getTime(),
                name: 'NBW',
                amount: paymentPrice,
                buyer_name: '${member.mem_name}',
                buyer_tel: '${member.mem_phone}',
                buyer_addr: $('#recvAddress1') + " " + $('#recvAddress2').text(),
                buyer_postcode: $('#recvZipcode').text()
            }, function (rsp) { // callback
                if (rsp.success) {
                    loading(true);
                    $(".paymentForm").submit();
                } else {
                    alert(rsp.error_msg);
                    /* 배송메모 직접 입력 했을 경우 */
                    if(!$('#direct-memo').prop('disabled')){
                        $('#deliveryMemo').prop('disabled',false);
                    }
                    // 결제 실패 url 전송
                }
            });
        }
    });
    <%-- 로딩창 띄우는 함수 --%>
    let loading = function(command){

        if (command){
            $('#icon-box').css({
                'display': 'block',
                'height': '100%',
                'min-width': '100%',
                'position':'fixed',
                'z-index':'99',
                'left':'0',
                'top':'0',
                'background-color': 'rgba( 255, 255, 255, 0.5 )'
            });
            $('#icon-box img').css({
                'position':'absolute',
                'left':'50%',
                'top':'50%',
                'transform':'translate(-50%, -50%)'
            })
        }
    }

    // 에러 메시지 출력 함수
    let errorMsgPrint = function(msg){
        $('#payErrorMsg').text(msg);
        $('#payErrorMsg').fadeIn(300);
        $("#payErrorMsg").delay(1800).fadeOut(500);
    }

    let formCheck = function(){
        let isCheck = false;
        let name = $("#receiver_name").val().trim();
        let phone = $("#receiver_phone").val().trim();
        let zipcode = $("#recvZipcode").val().trim();
        let address1 = $("#recvAddress1").val().trim();
        let address2 = $("#recvAddress2").val().trim();
        if(name != '' && phone != '' && zipcode != '' && address1 != '' && address2 != ''){
            isCheck = true;
            return isCheck;
        }else {
            return isCheck;
        }
    }
    // 결제하기 클릭 시 form의 input 값 채우는 함수
    let formInputWrt = function(){
        $('input[name=used_point]').val(pointDiscount);
        $('input[name=total_price]').val(paymentPrice);
        $('input[name=cp_no]').val(cp_no);
    }
    // 전화번호 자동 하이픈 함수
    const autoHyphen = function(target){
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
    }

</script>
<div id="icon-box" style="display:none;">
        <img src="/images/spinner.gif">
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>도서 결제페이지</title>
    <%@include file="/WEB-INF/includes/common.jsp" %>
<style>
    * {
        /*  border: solid 0.8px blue; */
    }
    body {
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
    span,
    p,
    th {
        font-size: 0.8rem;
    }

    .productImg {
        width: 60px;
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
        font-size: 0.8rem;
    }
    .form-controller {
        border: solid 1px #d8d8d8;
        padding: 5px;
    }

    .pay {
        margin-left: 10px;
        margin-top: 3px;
    }
    .label,
    .title,
    .receiver-label {
        font-weight: 700;
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
        font-size: 11px;
        height: 25px;
        padding: 5px;
    }
    #delivery-memo,
    #coupon,
    #direct-memo {
        font-size: 0.7rem;
    }

    /*  결제 정보창 스타일 */
    .payLabel {
        font-weight: 600;
    }
    .paymentInfo-wrap {
        width: 250px;
        position: fixed;
    }
    .paymentInfo-area {
        border: solid 1px #d8d8d8;
        border-radius: 5px;
        margin-bottom: 5px;
    }
    #prd-price {
        font-weight: 700;
    }
    #payment-price {
        font-size: 0.9rem;
        font-weight: 700;
    }
    #payBtn {
        width: 100%;
        background-color: #5055b1;
        color: white;
        font-size: 0.7rem;
        height: 40px;
        font-weight: 700;
    }

    .container input {
        border-radius: 5px;
    }
    .discount-label {
        font-weight: bold;
    }
    #coupon {
        width: 53%;
        height: 30px;
    }

    #pointInput {
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
    #kakaoPayBtn,
    #naverPayBtn {
        padding: 0;
        width: 200px;
        margin-left: 20px;
    }
    .naver {
        /* background-color: white; */
    }
</style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<%-- 결제페이지 메인 시작--%>
<main>
    <div id="orderBox" class="d-flex mt-5">
        <section class="orderInfo-wrap">
            <h6 class="title">주문/결제</h6>
            <hr />
            <%-- ====== 주문상품 접기 버튼 =======--%>
            <button class="btn btnFold d-flex" type="button">
                <h6 class="title ms-1 col-5">주문 상품</h6>
                <div class="col-7 d-flex">
                    <span id="prdTotallCnt" class="mt-2">총 3개</span>
                </div>
            </button>
<%--            <c:forEach var="products" items="${cartProducts}">--%>
<%--                ${products.nt_no}--%>
<%--            </c:forEach>--%>
            <%-- ========================== 주문 상품 정보 시작 ==============================--%>
            <table id="prdInfo" class="fold">
                <tbody>
                <tr class="prdList">
                    <td class="d-flex align-items-center col-8 ms-2">
                        <div class="productImg-box">
                            <img
                                    src="http://image.yes24.com/goods/112929848/XL"
                                    class="productImg"
                            />
                        </div>
                        <div class="prdTitle-box ms-3 col-12">
                            <span class="prdTitle">[국내도서]넘버스 스틱!</span>
                        </div>
                    </td>
                    <td class="delivery col-1"><span>자체배송</span></td>
                    <td class="col-1"><span class="prdCount">1</span></td>
                    <td class="col-2"><span class="prdPrice">15,300원</span></td>
                </tr>
                <tr class="prdList">
                    <td class="d-flex align-items-center col-8 ms-2">
                        <div class="productImg-box">
                            <img
                                    src="https://image.aladin.co.kr/product/30169/22/cover500/8959897094_3.jpg"
                                    class="productImg"
                            />
                        </div>
                        <div class="prdTitle-box ms-3 col-12">
                    <span class="prdTitle"
                    >트렌드 코리아 2023 - 서울대 소비트렌드 분석센터의 2023
                      전망</span
                    >
                        </div>
                    </td>
                    <td class="delivery col-1"><span>자체배송</span></td>
                    <td class="col-1"><span class="prdCount">1</span></td>
                    <td class="col-2"><span class="prdPrice">15,300원</span></td>
                </tr>
                <tr class="prdList">
                    <td class="d-flex align-items-center col-8 ms-2">
                        <div class="productImg_box">
                            <img
                                    src="https://image.aladin.co.kr/product/29489/3/cover500/k252837531_1.jpg"
                                    class="productImg"
                            />
                        </div>
                        <div class="prdTitle-box ms-3 col-12">
                            <span class="prdTitle">[국내도서]넘버스 스틱!</span>
                        </div>
                    </td>
                    <td class="delivery col-1"><span>자체배송</span></td>
                    <td class="col-1"><span class="prdCount">1</span></td>
                    <td class="col-2"><span class="prdPrice">15,300원</span></td>
                </tr>
                </tbody>
            </table>
            <%-- ========================== 주문 상품 정보 끝 ==============================--%>
            <%-- ========================== 주문자 정보 시작 ==============================--%>
            <section class="orderUser-info container">
                <h6 class="title mt-2 ms-1">주문자 정보</h6>
                <hr />
                <ul class="ms-3">
                    <li class="d-flex">
                        <div class="col-lg-9 col-sm-4">
                            <span class="label">이름</span>
                        </div>
                        <div class="col-sm-8 ms-3">
                            <span>김민준</span>
                        </div>
                    </li>
                    <li class="d-flex">
                        <div class="col-lg-9 col-sm-4">
                            <span class="label">전화번호</span>
                        </div>
                        <div class="col-sm-8 ms-3">
                            <span> 010-2323-2323 </span>
                        </div>
                    </li>
                    <li class="d-flex">
                        <div class="col-lg-9 col-sm-4">
                            <span class="label">회원등급</span>
                        </div>
                        <div class="col-sm-8 ms-3"><span>골드</span></div>
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
                        <input
                                id="order-eq"
                                type="radio"
                                name="orderUser-radio"
                                style="width: 10px"
                                checked
                        />
                        <label for="orderUser-radio" class="receiver-label"
                        >주문자 동일</label
                        >
                        <input
                                id="order-dif"
                                type="radio"
                                name="orderUser-radio"
                                style="width: 10px"
                        />
                        <label for="orderUser-radio" class="receiver-label"
                        >수령자 별도</label
                        >
                    </div>
                </div>
                <!-- 수령자 정보 선택 라디오 끝-->
                <!-- 수령자 정보 input 시작 -->
                <ul class="ms-3">
                    <li>
                        <label for="receiver-name" class="receiver-label"
                        >수령자 이름</label
                        >
                        <div class="mt-2 mb-1">
                            <input
                                    type="text"
                                    name="receiver-name"
                                    class="form-controller col-7"
                                    value="김민준"
                            />
                        </div>
                    </li>
                    <li>
                        <label for="receiver-name" class="receiver-label"
                        >전화번호</label
                        >
                        <div class="mt-2 mb-1">
                            <input
                                    type="text"
                                    name="receiver-phone"
                                    class="form-controller col-7"
                                    value="010-2323-2323"
                            />
                        </div>
                    </li>
                    <li>
                        <label for="receiver-name" class="receiver-label"
                        >우편번호</label
                        >
                        <div class="mt-2 mb-1">
                            <input
                                    type="text"
                                    name="receiver-zipcode"
                                    class="form-controller col-5"
                                    value="06002"
                            />
                            <button type="button" id="zipcodeBtn" class="btn">
                                우편번호 찾기
                            </button>
                        </div>
                    </li>
                    <li>
                        <label for="receiver-address1" class="receiver-label"
                        >주소</label
                        >
                        <div class="mt-2 mb-1">
                            <input
                                    type="text"
                                    name="receiver-address1"
                                    class="form-controller col-7"
                                    value="서울시 강남구 역삼동"
                            />
                        </div>
                    </li>
                    <li>
                        <label for="receiver-address2" class="receiver-label"
                        >상세주소</label
                        >
                        <div class="mt-2 mb-2">
                            <input
                                    type="text"
                                    name="receiver-address2"
                                    class="form-controller col-7"
                                    value="KH정보교육원"
                            />
                        </div>
                    </li>
                    <li>
                        <label for="delivery-memo" class="receiver-label"
                        >배송메모</label
                        >
                        <div class="mt-2 col-7">
                            <select
                                    id="delivery-memo"
                                    name="delivery-memo"
                                    class="form-select"
                                    onchange="deliveryMemo()"
                            >
                                <option value="0" selected>
                                    배송시 요청사항을 선택해주세요
                                </option>
                                <option value="1">부재시 경비실에 맡겨주세요</option>
                                <option value="2">부재시 택배함에 넣어주세요</option>
                                <option value="3">부재시 문앞에 놔주세요</option>
                                <option value="4">배송전 연락바랍니다</option>
                                <option value="5">직접입력</option>
                                <textarea
                                        name="delivery-memo"
                                        id="direct-memo"
                                        cols="70"
                                        rows="2"
                                        class="mt-2"
                                        placeholder="메송 메모를 작성해 주세요"
                                        style="display: none"
                                ></textarea>
                            </select>
                        </div>
                    </li>
                </ul>
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
                    <select id="coupon" name="coupon">
                        <option value="0" selected>쿠폰 선택</option>
                        <option value="1">골드멤버 정기 쿠폰5%</option>
                        <option value="2">생일쿠폰10%</option>
                        <option value="3">새해쿠폰10%</option>
                    </select>
                </div>
                <div class="d-flex ms-2 mt-3">
                    <div class="col-4 ms-2">
                        <span class="discount-label">보유 포인트</span>
                    </div>
                    <div class="col-4 text-end">
                        <span style="font-size: 0.9rem">5,000원</span>
                    </div>
                    <div class="col-3 ms-3">
                        <button id="pointBtn" type="button" class="btn">
                            모두 사용
                        </button>
                    </div>
                </div>
                <div class="d-flex ms-2 mt-3">
                    <div class="col-4 ms-2">
                        <span class="discount-label">사용할 포인트</span>
                    </div>
                    <div class="col-8">
                        <input id="pointInput" type="text" value="2000" readonly />
                    </div>
                </div>
            </section>
            <%-- ========================== 쿠폰 끝 ==============================--%>
            <%-- ======================== 결제수단 시작 ==============================--%>
            <section class="container">
                <h6 class="title mt-2 ms-1">결제수단</h6>
                <hr />
                <div class="wrapper d-flex justify-content-center">
                    <button id="naverPayBtn" type="button" class="btn payBtn">
                        <div
                                class="container-pay d-flex justify-content-center me-5 align-items-center"
                        >
                            <div class="naver">
                                <img
                                        id="naverPayImg"
                                        src="/images/nLogo.jpg"
                                        alt="네이버 로고"
                                        width="40px"
                                        height="40px"
                                />
                            </div>
                            <span id="naverPay">Naver</span>
                        </div>
                    </button>
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
                </div>
            </section>
        </section>
        <%-- ======================== 결제수단 끝 ==============================--%>
        <%-- ======================== 결제 정보 시작 ==============================--%>
        <section class="ms-4">
            <div class="paymentInfo-wrap ms-3 mt-4">
                <div class="paymentInfo-area">
                    <ul>
                        <li>
                            <div class="d-flex pay">
                                <div class="col-8 payLabel">
                                    <span>상품금액</span>
                                </div>
                                <div class="col-4 text-end px-2">
                                    <span id="prd-price">80,000원</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="d-flex pay">
                                <div class="col-8 payLabel">
                                    <span>배송비</span>
                                </div>
                                <div class="col-4 text-end px-2">
                                    <span id="delivery-price">0원</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="d-flex pay">
                                <div class="col-8 payLabel">
                                    <span>등급할인</span>
                                </div>
                                <div class="col-4 text-end px-2">
                                    <span id="grade-discount">-2,000원</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="d-flex pay">
                                <div class="col-8 payLabel">
                                    <span>쿠폰할인</span>
                                </div>
                                <div class="col-4 text-end px-2">
                                    <span id="coupon-discount">0원</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="d-flex pay">
                                <div class="col-8 payLabel">
                                    <span>포인트사용</span>
                                </div>
                                <div class="col-4 text-end px-2">
                                    <span id="use-point">0원</span>
                                </div>
                            </div>
                        </li>
                        <hr class="ms-3 me-3" />
                        <li>
                            <div class="d-flex pay">
                                <div class="col-8 payLabel">
                                    <span>최종결제금액</span>
                                </div>
                                <div class="col-4 text-end px-2">
                                    <span id="payment-price">78,000원</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <button type="button" id="payBtn" class="btn">결제하기</button>
            </div>
        </section>
        <%-- ======================== 결제정보 끝 ==============================--%>
    </div>
</main>
<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script>
    $(function(){
        console.log('${cartList}');
    })
    $(".btnFold").click(function (e) {
        e.preventDefault();
        $(".fold").slideToggle(100);
    });
    function deliveryMemo() {
        let num = $("#delivery-memo option:selected").val();
        if (num == 5) {
            $("#direct-memo").css("display", "block");
            $("#direct-memo").focus();
        } else $("#direct-memo").css("display", "none");
    }
    // $("#kakaoPayBtn").click(function () {
    //   $("#kakaoPayBtn").css("padding", "3px");
    // });
    /* 결제 수단 선택 */
    $(".payBtn").on("click", function (e) {
        if (e.target.id === "naverPayBtn") alert("네이버페이 선택");
        else if (e.target.id === "kakaoPayBtn") alert("카카오페이 선택");
    });
</script>
</body>
</html>

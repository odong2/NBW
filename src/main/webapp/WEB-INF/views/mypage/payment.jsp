<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="../../includes/common.jsp" %>
<link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
<title>MyPage</title>
<style>
    @font-face {
        font-family: CookieRun Regular;
        src: url('/font/cookieRunFont_TTF/CookieRun Regular.ttf') format("truetype");
    }
    body{
        font-family: CookieRun Regular;
        box-sizing: border-box;
    }
    *{
        /*border: 1px solid blue;*/
    }
    .sidebar span{
        font-size: 1rem;
    }
    .sidebar a{
        font-size: 0.9rem;
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
    .container-fluid{
        padding-right: 50px;
        padding-left: 50px;
    }
    #productHeader h5{
        font-size: 1.1rem;
    }
    .modal-section{
        border-radius: 5px;
    }
    .product-img{
        width: 70px;
        margin-left:20px;
    }
    .product-header{
        margin-right: 40px;
        border-top: solid 2px rgba(0,0,0,1);

    }
    .order-list{
        margin-right: 40px;
        border-top: solid 1px rgba(153,153,153,0.5);
    }
    .order-list span{
        font-size: 0.8rem;
    }
    .order-list #payBackBtn{
        background-color: white;
        color: #a52834;
        font-size: 0.8rem;
        border-color: #a52834;
        width:80px;
    }
    .order-list #returnBtn{
        background-color: white;
        color: #5055b1;
        font-size: 0.8rem;
        width:80px;
    }
    .order-list #detailBtn{
        background-color: white;
        color: #5055b1;
        font-size: 0.8rem;
        border-color: #5055b1;
        width: 80px;
    }
    .order-status{
        color: #6DB329;
        font-weight: bold;
    }
    .product-price{
        font-weight: bold;
    }
    #returnBtn:hover,
    #detailBtn:hover{
        background-color: #5055b120;
    }
    .modal-body span{
        font-size: 0.9rem;
    }
    .modal-body .title{
        font-size: 1.2rem;
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
<main>
    <%-- ==================== 마이 페이지 타이틀 ==================--%>
    <div class="ms-4 mb-5">
        <h5>주문 조회</h5>
    </div>
    <%-- ==================== 주문조회 페이지 헤더 시작 ==================--%>
    <header>
        <ul class="d-flex">
            <li class="header-list">
                <div class="d-flex justify-content-center">
                    <img src="/images/coupon.png" alt="쿠폰 이미지" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>쿠폰함</span>
                </div>
                <div class="text-center mt-1">
                    <span class="badge bg-primary rounded-pill">1장</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center">
                    <img src="/images/delivery-truck.png" alt="배송 이미지" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>배송중</span>
                </div>
                <div class="text-center mt-1">
                    <span class="badge bg-primary rounded-pill">0</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center">
                    <img src="/images/house.png" alt="배송완료 이미지" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>배송완료</span>
                </div>
                <div class="text-center mt-1">
                    <span class="badge bg-primary rounded-pill">0</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center mt-1">
                    <img src="/images/exchange.png" alt="교환 이미지" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>반품/교환</span>
                </div>
                <div class="text-center">
                    <span class="badge bg-primary rounded-pill">0</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center mt-1">
                    <img src="/images/cancle.png" alt="취소 이미지" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>취소</span>
                </div>
                <div class="text-center">
                    <span class="badge bg-primary rounded-pill">0</span>
                </div>
            </li>
        </ul>
    </header>
        <%-- ==================== 주문조회 페이지 헤더 끝 ==================--%>
    <section class="container-fluid mt-4">
        <ul>
        <c:forEach var="order" items="${orderList}">
            <%-- == 한 주문번호에 상품 여러개면 하나로 묶기 ==--%>
            <c:if test="${empty preOrderNo || preOrderNo ne order.order_no }">
            <li class="product-header mb-3">
                <div id="productHeader">
                    <h5 class="mt-4 mb-4"><fmt:formatDate value="${order.order_date}" pattern="yyyy년 MM월 dd일"/> (주문번호 : ${order.order_no})</h5>
                </div>
            </li>
            </c:if>
            <c:set var="preOrderNo" value="${order.order_no}"/>
            <li class="order-list mb-3">
                <div class="d-flex mt-3 col-12">
                    <img src="${order.p_img}" class="product-img"/>
                    <div class="col-4 text-center align-self-center"><span><c:out value="[${order.p_category}]${order.p_title}"/></span></div>
                    <div class="col-1 text-center align-self-center"><span><c:out value="${order.p_count}"/>권</span></div>
                    <div class="col-2 text-center align-self-center"><span class="product-price"><fmt:formatNumber value="${order.p_price * order.p_count}" type="number"/>원</span></div>
                    <div class="col-1 text-center align-self-center"><span class="order-status"><c:out value="${order.order_status}"/></span></div>
                    <div class="col-3 flex-column text-center align-self-center">
                    <c:choose>
                        <c:when test="${order.order_status eq '배송 완료'}">
                        <div><button type="button" id="returnBtn" class="btn btn-primary col-4 mb-2">반품</button></div>
                        </c:when>
                        <c:when test="${order.order_status eq '상품 준비중'}">
                            <div><button type="button" id="payBackBtn" class="btn btn-primary col-4 mb-2"
                                         data-pImg="${order.p_img}" data-pCount="${order.p_count}" data-pTitle="${order.p_title}" data-pPrice="${order.p_price}"
                                         data-pPno="${order.p_no}" data-orderNo="${order.order_no}" data-bs-toggle="modal" data-bs-target= "#payBackModal">결제취소</button></div>
                        </c:when>
                    </c:choose>
                        <div><button type="button" id="detailBtn" class="btn btn-primary col-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                     data-pImg="${order.p_img}" data-pCount="${order.p_count}" data-pTitle="${order.p_title}" data-pPrice="${order.p_price}"
                                     data-orderNo="${order.order_no}" data-orderDate="${order.order_date}" data-receiverPhone="${order.receiver_phone}"
                                     data-totalPrice="${order.total_price}" data-usedPoint="${order.used_point}" data-receiverName="${order.receiver_name}" data-receiverAddress1="${order.receiver_address1}"
                                     data-receiverAddress2="${order.receiver_address2}" data-deliveryMemo="${order.delivery_memo}" data-cpName="${order.cp_name}" data-cpPrice="${order.cp_price}">상세내역</button></div>
                    </div>
                </div>
            </li>
        </c:forEach>
        </ul>
    </section>
        <!-- Modal -->
        <section class="modal fade rounded-3" id="staticBackdrop" data-bs-backdrop="static"
                 data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <section class="modal-data">
                            <h6 class="title mb-2">상품개별 정보</h6>
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
                        <section class="modal-data">
                            <h6 class="title">배송정보</h6>
                            <hr/>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-7"><span>수령자</span></div>
                                <div class="col-7 ms-5"><span id="receiverName"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-7"><span>수령자 전화번호</span></div>
                                <div class="col-7 ms-5"><span id="receiverPhone"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-7"><span>수령자 주소</span></div>
                                <div class="col-7 ms-5"><span id="receiverAddress"></span></div>
                            </div>
                            <div class="d-flex mb-4 px-2">
                                <div class="col-7"><span>배송메모</span></div>
                                <div class="col-7 ms-5"><span id="deliveryMemo"></span></div>
                            </div>
                        </section>
                        <section class="modal-data">
                            <h6 class="title">결제 정보</h6>
                            <hr/>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-7"><span>쿠폰</span></div>
                                <div class="col-7 ms-5"><span id="cpName"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-7"><span>쿠폰사용 금액</span></div>
                                <div class="col-7 ms-5"><span id="cpPrice"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-7"><span>포인트 사용</span></div>
                                <div class="col-7 ms-5"><span id="usedPoint"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-7"><span>총 결제금액</span></div>
                                <div class="col-7 ms-5"><span id="totalPrice"></span></div>
                            </div>
                        </section>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary close-mBtn" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <!-- 결제 취소 Modal -->
            <section class="modal fade rounded-3" id="payBackModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <section class="modal-header">
                            <h6 class="modal-title" id="payBackModalLabel">결제취소</h6>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </section>
                        <section class="modal-body">
                            <div>
                                <div class="d-flex mb-2">
                                    <div class="col-4  align-self-center">상품</div>
                                    <div class="col-5  align-self-center">제목</div>
                                    <div class="col-2  align-self-center">금액</div>
                                </div>
                                <div class="d-flex mb-4">
                                    <div class="col-4  align-self-center"><img src="" id="img"></div>
                                    <div class="col-5  align-self-center"><span id="title"></span></div>
                                    <div class="col-2  align-self-center"><span id="price"></span></div>
                                </div>
                            </div>
                        </section>
                        <section class="modal-footer">
                            <button type="button" class="btn btn-secondary close-mBtn" data-bs-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-primary">결제취소</button>
                        </section>
                    </div>
                </div>
            </section>
        </section>
</main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script type="text/javascript">

    <%-- 모달 이벤트 --%>
    $('#staticBackdrop').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget) // Button that triggered the modal
        <%-- button data에서 클릭한 주문번호의 상세내역 데이터 동적 바인딩 --%>
        let pImg = button.attr('data-pImg');
        let pTitle = button.attr('data-pTitle');
        let pPrice = button.attr('data-pPrice');
        let pCount = button.attr('data-pCount');
        let productPrice = (pPrice * pCount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
        let name = button.attr('data-receiverName');
        let address1 = button.attr('data-receiverAddress1');
        let address2 = button.attr('data-receiverAddress2');
        let phone = button.attr('data-receiverPhone');
        let memo = button.attr('data-deliveryMemo');
        let cpName = button.attr('data-cpName');
        let cpPrice = button.attr('data-cpPrice').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
        let usedPoint = button.attr('data-usedPoint').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
        let totalPrice = button.attr('data-totalPrice').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
        let modal = $(this);
        modal.find('#receiverName').text(name);
        modal.find('#receiverAddress').text(address1+address2);
        modal.find('#receiverPhone').text(phone);
        modal.find('#deliveryMemo').text(memo);
        modal.find('#cpName').text(cpName);
        modal.find('#cpPrice').text(cpPrice);
        modal.find('#usedPoint').text(usedPoint);
        modal.find('#totalPrice').text(totalPrice);
        modal.find('#pImg').attr('src',pImg);
        modal.find('#pTitle').text(pTitle);
        modal.find('#pPrice').text(productPrice);
    })
    $('#payBackModal').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget) // Button that triggered the modal
        let img = button.attr('data-pImg');
        let title = button.attr('data-pTitle');
        let price = button.attr('data-pPrice');
        let count = button.attr('data-pCount');
        let productPrice = (price * count).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
        let modal = $(this);
        modal.find('#img').attr('src',img);
        modal.find('#title').text(title);
        modal.find('#price').text(productPrice);

    });
</script>
</body>
</html>

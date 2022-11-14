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
    #orderContainer{
        height: 300px;
        border: 1px solid rgba(153,153,153,0.7);
        border-radius: 20px;
        width: 80%;
        margin:auto;
    }
    #orderContainer span{
        display: inline-block;
        height: 100%;
        margin-top: 130px;
        color: rgba(153,153,153,0.8);
    }

    .order-list{
        margin-right: 40px;
        border-top: solid 1px rgba(153,153,153,0.5);
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
    .order-list .returnBtn{
        background-color: white;
        color: #a52834;
        font-size: 0.9rem;
        border-color: #a52834;
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
        color: #a52834;
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
    .product-price{
        font-weight: bold;
    }

    .returnBtn:hover,
    #payBackBtn:hover {
        color: white;
        background-color: #a52834;
    }
    #detailBtn:hover{
        color: white;
        background-color: #5055b1;
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
                    <span class="badge bg-primary rounded-pill"><c:out value="${member.coupon_count}"/>&nbsp장</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center">
                    <img src="/images/delivery-truck.png"  alt="배송완료 이미지" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>배송완료</span>
                </div>
                <div class="text-center mt-1">
                    <span class="badge bg-primary rounded-pill"><c:out value="${orderStatus.COMPLETE_COUNT}"/>&nbsp건</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center">
                    <img src="/images/house.png"alt="상품 준비중 이미지" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>상품준비중</span>
                </div>
                <div class="text-center mt-1">
                    <span class="badge bg-primary rounded-pill"><c:out value="${orderStatus.READY_COUNT}"/>&nbsp건</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center mt-1">
                    <img src="/images/exchange.png" alt="반품 이미지" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>반품</span>
                </div>
                <div class="text-center">
                    <span class="badge bg-primary rounded-pill"><c:out value="${orderStatus.RETURN_COUNT}"/>&nbsp건</span>
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
                    <span class="badge bg-primary rounded-pill"><c:out value="${orderStatus.CANCLE_COUNT}"/>&nbsp건</span>
                </div>
            </li>
        </ul>
    </header>
        <%-- ==================== 주문조회 페이지 헤더 끝 ==================--%>
    <section class="container-fluid mt-4">
        <ul>
        <c:if test="${not empty orderList}">
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
                    <div class="col-4 text-center align-self-center"><a href="/product/${order.p_no}"><c:out value="[${order.p_category}]${order.p_title}"/></a></div>
                    <div class="col-1 text-center align-self-center"><span><c:out value="${order.p_count}"/>권</span></div>
                    <div class="col-2 text-center align-self-center"><span class="product-price"><fmt:formatNumber value="${order.p_price * order.p_count}" type="number"/>원</span></div>
                    <div class="col-1 text-center align-self-center">
                        <c:choose>
                            <c:when test="${order.order_status eq '반품'}">
                                        <span class="order-status-blue">반품 신청</span>
                            </c:when>
                            <c:when test="${order.order_status eq '환불' || order.order_status eq '취소'}">
                                <span class="order-status-red"><c:out value="${order.order_status}"/></span>
                            </c:when>
                            <c:when test="${order.order_status eq '상품 준비중'}">
                                <span class="order-status-green"><c:out value="${order.order_status}"/></span>
                            </c:when>
                            <c:when test="${order.order_status eq '배송완료' || order.order_status eq '반품 거절'}">
                                <span class="order-status-blue"><c:out value="${order.order_status}"/></span>
                            </c:when>

                        </c:choose>
                    </div>
                    <div class="col-3 flex-column text-center align-self-center">
                    <c:choose>
                        <c:when test="${order.order_status eq '배송완료'}">
                        <div><button type="button" class="btn btn-primary col-4 mb-2 returnBtn"
                                     data-pImg="${order.p_img}" data-pCount="${order.p_count}" data-pTitle="${order.p_title}" data-pPrice="${order.p_price}" data-orderStatus="반품"
                                     data-pPno="${order.p_no}" data-orderNo="${order.order_no}" data-bs-toggle="modal" data-bs-target="#payBackModal">반품</button></div>
                        </c:when>
                        <c:when test="${order.order_status eq '상품 준비중'}">
                            <div><button type="button" id="payBackBtn" class="btn btn-primary col-4 mb-2"
                                         data-pImg="${order.p_img}" data-pCount="${order.p_count}" data-pTitle="${order.p_title}" data-pPrice="${order.p_price}" data-orderStatus="취소"
                                         data-pPno="${order.p_no}" data-orderNo="${order.order_no}" data-bs-toggle="modal" data-bs-target= "#payBackModal">결제취소</button></div>
                        </c:when>
                    </c:choose>
                        <div><button type="button" id="detailBtn" class="btn btn-primary col-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                     data-pImg="${order.p_img}" data-pCount="${order.p_count}" data-pTitle="${order.p_title}" data-pPrice="${order.p_price}" data-orderStatus="${order.order_status}"
                                     data-orderNo="${order.order_no}" data-orderDate="${order.order_date}" data-receiverPhone="${order.receiver_phone}"
                                     data-totalPrice="${order.total_price}" data-usedPoint="${order.used_point}" data-receiverName="${order.receiver_name}" data-receiverAddress1="${order.receiver_address1}"
                                     data-receiverAddress2="${order.receiver_address2}" data-deliveryMemo="${order.delivery_memo}" data-cpName="${order.cp_name}" data-cpPrice="${order.cp_price}">상세내역</button></div>
                    </div>
                </div>
            </li>
        </c:forEach>
        </c:if>
        <c:if test="${empty orderList}">
            <div id="orderContainer" class="text-center">
                <span class="text-center h4">주문 상품이 없습니다</span>
            </div>
        </c:if>
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
                                <div class="col-3"><span>수령자</span></div>
                                <div class="col-9 text-end"><span id="receiverName"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>수령자 전화번호</span></div>
                                <div class="col-9 text-end"><span id="receiverPhone"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>수령자 주소</span></div>
                                <div class="col-9 text-end"><span id="receiverAddress"></span></div>
                            </div>
                            <div class="d-flex mb-4 px-2">
                                <div class="col-3"><span>배송메모</span></div>
                                <div class="col-9 text-end"><span id="deliveryMemo"></span></div>
                            </div>
                        </section>
                        <section class="modal-data">
                            <h6 class="title">결제 정보</h6>
                            <hr/>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>쿠폰</span></div>
                                <div class="col-9 text-end"><span id="cpName"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>쿠폰사용 금액</span></div>
                                <div class="col-9 text-end"><span id="cpPrice"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>포인트 사용</span></div>
                                <div class="col-9 text-end"><span id="usedPoint"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>총 결제금액</span></div>
                                <div class="col-9 text-end"><span id="totalPrice"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>상품 상태</span></div>
                                <div class="col-9 text-end"><span id="productStatus"></span></div>
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
            <section class="modal fade rounded-3" id="payBackModal" tabindex="-1" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <section class="modal-header">
                            <h6 class="modal-title" id="payBackModalLabel">결제취소</h6>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </section>
                        <div class="modal-body">
                            <section class="modal-data">
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

                            </section>
                            <section class="modal-data">
                                <form id="payBackForm" action="/payment/status" method="post">
                                    <input type="hidden" id="pNo" name="p_no" val=""/>
                                    <input type="hidden" id="orderNo" name="order_no" val=""/>
                                    <input type="hidden" id="pCount" name="p_count" val=""/>
                                    <input type="hidden" id="orderStatus" name="order_status" val=""/>
                                    <select id="form-select" class="form-select form-select-sm" name="refund_reason" aria-label="Refund Reason">
                                        <option selected value="0" disabled>환불 사유를 선택하세요</option>
                                        <option value="취소후 재구매">취소후 재구매</option>
                                        <option value="구매의사 없음">구매의사 없음</option>
                                        <option value="주문을 잘못함">주문을 잘못함</option>
                                        <option value="단순변심">단순변심</option>
                                    </select>
                                    <p id="p-msg" class="mt-4">상품이 이미 배송된 경우에는 결제 취소가 어려울 수 있는 점 양해바랍니다.</p>
                                </form>
                            </section>
                        </div>
                        <section class="modal-footer">
                            <button type="button" class="btn btn-secondary close-mBtn" data-bs-dismiss="modal">닫기</button>
                            <button type="button" id="payBackSBtn" class="btn btn-primary">결제취소</button>
                        </section>
                    </div>
                </div>
            </section>
        </section>
        <%--================================ 댓글 msg 알림창 ===================================--%>
        <section class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 100">
            <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <div id="colorBox"style="width: 25px; height: 25px; border-radius: 7px; background-color: indianred"></div>
                    <strong class="me-auto ms-2" id="msgTitle"></strong>
                    <small>방금</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body" id="msgContent"></div>
            </div>
        </section>
</main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script>
    /* 결제 반품 및 취소 메시지 보여주는 함수*/
    let showMsg = function (title, content){

        $('#msgTitle').text(title);
        $('#msgContent').text(content);
        const toastLive = document.getElementById('liveToast')
        const toast = new bootstrap.Toast(toastLive)
        toast.show()
    }

    $(function(){
        let msg = '${msg}';
        console.log(msg);
        if(msg.trim().length != 0){
            showMsg("알림",msg);
        }
    })

    <%-- 모달 이벤트(상세 내역) --%>
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
        let productStatus = button.attr('data-orderStatus');
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
        modal.find('#productStatus').text(productStatus);
    })

    /* 결제취소 모달 / 반품 모달 */
    $('#payBackModal').on('show.bs.modal', function (event) {

        let button = $(event.relatedTarget) // Button that triggered the modal
        let img = button.attr('data-pImg');
        let pNo = button.attr('data-pPno');
        let orderNo = button.attr('data-orderNo');
        let orderStatus = button.attr('data-orderStatus');
        let title = button.attr('data-pTitle');
        let price = button.attr('data-pPrice');
        let count = button.attr('data-pCount');
        let productPrice = (price * count).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
        let modal = $(this);

        modal.find('#orderStatus').val(orderStatus);
        modal.find('#pNo').val(pNo);
        modal.find('#orderNo').val(orderNo);
        modal.find('pCount').val(count);
        modal.find('#img').attr('src', img);
        modal.find('#title').text(title);
        modal.find('#price').text(productPrice);
        if($(event.relatedTarget).text() == '반품') {
            modal.find('#payBackModalLabel').text('반품 신청');
        }
        else if($(event.relatedTarget).text() == '취소'){
            modal.find('#payBackModalLabel').text('결제 취소');

        }
    });

     /*결제취소 모달에서 결제하기 전송 이벤트*/
    $('#payBackSBtn').on('click',function(){
        let returnReason = $('#form-select').val();
        if(returnReason==null){
            alert('환불사유를 선택해주세요.');
            return;
        }
        if(!confirm(("결제를 취소하시겠습니까?"))){
            alert("결제취소를 취소하셨습니다.")
        }
        else{
            $('#payBackForm').submit();
        }
    })

</script>
</body>
</html>

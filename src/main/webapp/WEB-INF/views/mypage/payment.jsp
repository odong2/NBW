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
<!-- ?????? ?????? -->
<%@include file="../../includes/header.jsp" %>
<!-- ?????? ??? -->
<!-- ?????? ????????? ?????? -->
<section class="mypage wrapper d-flex">
<!-- ???????????? ??????-->
<%@include file="../../includes/sidebar.jsp" %>
<!-- ???????????? ???-->
    <%-- ==================== ?????? ??????==================--%>
<main>
    <%-- ==================== ?????? ????????? ????????? ==================--%>
    <div class="ms-4 mb-5">
        <h5>?????? ??????</h5>
    </div>
    <%-- ==================== ???????????? ????????? ?????? ?????? ==================--%>
    <header>
        <ul class="d-flex">
            <li class="header-list">
                <div class="d-flex justify-content-center">
                    <img src="/images/coupon.png" alt="?????? ?????????" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>?????????</span>
                </div>
                <div class="text-center mt-1">
                    <span class="badge bg-primary rounded-pill"><c:out value="${member.coupon_count}"/>&nbsp???</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center">
                    <img src="/images/delivery-truck.png"  alt="???????????? ?????????" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>????????????</span>
                </div>
                <div class="text-center mt-1">
                    <span class="badge bg-primary rounded-pill"><c:out value="${orderStatus.COMPLETE_COUNT}"/>&nbsp???</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center">
                    <img src="/images/house.png"alt="?????? ????????? ?????????" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>???????????????</span>
                </div>
                <div class="text-center mt-1">
                    <span class="badge bg-primary rounded-pill"><c:out value="${orderStatus.READY_COUNT}"/>&nbsp???</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center mt-1">
                    <img src="/images/exchange.png" alt="?????? ?????????" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>??????</span>
                </div>
                <div class="text-center">
                    <span class="badge bg-primary rounded-pill"><c:out value="${orderStatus.RETURN_COUNT}"/>&nbsp???</span>
                </div>
            </li>
            <li class="header-list">
                <div class="d-flex justify-content-center mt-1">
                    <img src="/images/cancle.png" alt="?????? ?????????" width="40px" />
                </div>
                <div class="text-center mt-1">
                    <span>??????</span>
                </div>
                <div class="text-center">
                    <span class="badge bg-primary rounded-pill"><c:out value="${orderStatus.CANCLE_COUNT}"/>&nbsp???</span>
                </div>
            </li>
        </ul>
    </header>
        <%-- ==================== ???????????? ????????? ?????? ??? ==================--%>
    <section class="container-fluid mt-4">
        <ul>
        <c:if test="${not empty orderList}">
        <c:forEach var="order" items="${orderList}">
            <%-- == ??? ??????????????? ?????? ???????????? ????????? ?????? ==--%>
            <c:if test="${empty preOrderNo || preOrderNo ne order.order_no }">
            <li class="product-header mb-3">
                <div id="productHeader">
                    <h5 class="mt-4 mb-4"><fmt:formatDate value="${order.order_date}" pattern="yyyy??? MM??? dd???"/> (???????????? : ${order.order_no})</h5>
                </div>
            </li>
            </c:if>
            <c:set var="preOrderNo" value="${order.order_no}"/>
            <li class="order-list mb-3">
                <div class="d-flex mt-3 col-12">
                    <img src="${order.p_img}" class="product-img"/>
                    <div class="col-4 text-center align-self-center"><a href="/product/${order.p_no}"><c:out value="[${order.p_category}]${order.p_title}"/></a></div>
                    <div class="col-1 text-center align-self-center"><span><c:out value="${order.p_count}"/>???</span></div>
                    <div class="col-2 text-center align-self-center"><span class="product-price"><fmt:formatNumber value="${order.p_price * order.p_count}" type="number"/>???</span></div>
                    <div class="col-1 text-center align-self-center">
                        <c:choose>
                            <c:when test="${order.order_status eq '??????'}">
                                        <span class="order-status-blue">?????? ??????</span>
                            </c:when>
                            <c:when test="${order.order_status eq '??????' || order.order_status eq '??????'}">
                                <span class="order-status-red"><c:out value="${order.order_status}"/></span>
                            </c:when>
                            <c:when test="${order.order_status eq '?????? ?????????'}">
                                <span class="order-status-green"><c:out value="${order.order_status}"/></span>
                            </c:when>
                            <c:when test="${order.order_status eq '????????????' || order.order_status eq '?????? ??????'}">
                                <span class="order-status-blue"><c:out value="${order.order_status}"/></span>
                            </c:when>

                        </c:choose>
                    </div>
                    <div class="col-3 flex-column text-center align-self-center">
                    <c:choose>
                        <c:when test="${order.order_status eq '????????????'}">
                        <div><button type="button" class="btn btn-primary col-4 mb-2 returnBtn"
                                     data-pImg="${order.p_img}" data-pCount="${order.p_count}" data-pTitle="${order.p_title}" data-pPrice="${order.p_price}" data-orderStatus="??????"
                                     data-pPno="${order.p_no}" data-orderNo="${order.order_no}" data-bs-toggle="modal" data-bs-target="#payBackModal">??????</button></div>
                        </c:when>
                        <c:when test="${order.order_status eq '?????? ?????????'}">
                            <div><button type="button" id="payBackBtn" class="btn btn-primary col-4 mb-2"
                                         data-pImg="${order.p_img}" data-pCount="${order.p_count}" data-pTitle="${order.p_title}" data-pPrice="${order.p_price}" data-orderStatus="??????"
                                         data-pPno="${order.p_no}" data-orderNo="${order.order_no}" data-bs-toggle="modal" data-bs-target= "#payBackModal">????????????</button></div>
                        </c:when>
                    </c:choose>
                        <div><button type="button" id="detailBtn" class="btn btn-primary col-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                     data-pImg="${order.p_img}" data-pCount="${order.p_count}" data-pTitle="${order.p_title}" data-pPrice="${order.p_price}" data-orderStatus="${order.order_status}"
                                     data-orderNo="${order.order_no}" data-orderDate="${order.order_date}" data-receiverPhone="${order.receiver_phone}"
                                     data-totalPrice="${order.total_price}" data-usedPoint="${order.used_point}" data-receiverName="${order.receiver_name}" data-receiverAddress1="${order.receiver_address1}"
                                     data-receiverAddress2="${order.receiver_address2}" data-deliveryMemo="${order.delivery_memo}" data-cpName="${order.cp_name}" data-cpPrice="${order.cp_price}">????????????</button></div>
                    </div>
                </div>
            </li>
        </c:forEach>
        </c:if>
        <c:if test="${empty orderList}">
            <div id="orderContainer" class="text-center">
                <span class="text-center h4">?????? ????????? ????????????</span>
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
                            <h6 class="title mb-2">???????????? ??????</h6>
                            <hr/>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3  align-self-center">??????</div>
                                <div class="col-5  ms-5 align-self-center">??????</div>
                                <div class="col-2  align-self-center">??????</div>
                            </div>
                            <div class="d-flex mb-4">
                                <div class="col-3  align-self-center"><img src="" id="pImg"></div>
                                <div class="col-6  align-self-center"><p id="pTitle" class="me-2 mt-3"></p></div>
                                <div class="col-2  align-self-center"><span id="pPrice"></span></div>
                            </div>
                        </section>
                        <section class="modal-data">
                            <h6 class="title">????????????</h6>
                            <hr/>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>?????????</span></div>
                                <div class="col-9 text-end"><span id="receiverName"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>????????? ????????????</span></div>
                                <div class="col-9 text-end"><span id="receiverPhone"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>????????? ??????</span></div>
                                <div class="col-9 text-end"><span id="receiverAddress"></span></div>
                            </div>
                            <div class="d-flex mb-4 px-2">
                                <div class="col-3"><span>????????????</span></div>
                                <div class="col-9 text-end"><span id="deliveryMemo"></span></div>
                            </div>
                        </section>
                        <section class="modal-data">
                            <h6 class="title">?????? ??????</h6>
                            <hr/>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>??????</span></div>
                                <div class="col-9 text-end"><span id="cpName"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>???????????? ??????</span></div>
                                <div class="col-9 text-end"><span id="cpPrice"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>????????? ??????</span></div>
                                <div class="col-9 text-end"><span id="usedPoint"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>??? ????????????</span></div>
                                <div class="col-9 text-end"><span id="totalPrice"></span></div>
                            </div>
                            <div class="d-flex mb-2 px-2">
                                <div class="col-3"><span>?????? ??????</span></div>
                                <div class="col-9 text-end"><span id="productStatus"></span></div>
                            </div>
                        </section>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary close-mBtn" data-bs-dismiss="modal">??????</button>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <!-- ?????? ?????? Modal -->
            <section class="modal fade rounded-3" id="payBackModal" tabindex="-1" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <section class="modal-header">
                            <h6 class="modal-title" id="payBackModalLabel">????????????</h6>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </section>
                        <div class="modal-body">
                            <section class="modal-data">
                                    <div class="d-flex mb-2">
                                        <div class="col-4  align-self-center">??????</div>
                                        <div class="col-5  align-self-center">??????</div>
                                        <div class="col-2  align-self-center">??????</div>
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
                                        <option selected value="0" disabled>?????? ????????? ???????????????</option>
                                        <option value="????????? ?????????">????????? ?????????</option>
                                        <option value="???????????? ??????">???????????? ??????</option>
                                        <option value="????????? ?????????">????????? ?????????</option>
                                        <option value="????????????">????????????</option>
                                    </select>
                                    <p id="p-msg" class="mt-4">????????? ?????? ????????? ???????????? ?????? ????????? ????????? ??? ?????? ??? ??????????????????.</p>
                                </form>
                            </section>
                        </div>
                        <section class="modal-footer">
                            <button type="button" class="btn btn-secondary close-mBtn" data-bs-dismiss="modal">??????</button>
                            <button type="button" id="payBackSBtn" class="btn btn-primary">????????????</button>
                        </section>
                    </div>
                </div>
            </section>
        </section>
        <%--================================ ?????? msg ????????? ===================================--%>
        <section class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 100">
            <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <div id="colorBox"style="width: 25px; height: 25px; border-radius: 7px; background-color: indianred"></div>
                    <strong class="me-auto ms-2" id="msgTitle"></strong>
                    <small>??????</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body" id="msgContent"></div>
            </div>
        </section>
</main>
    <%-- ==================== ?????? ??? ==================--%>
</section>
<!-- ?????? ????????? ??? -->
<!-- ?????? ?????? -->
<%@include file="../../includes/footer.jsp" %>
<!-- ?????? ??? -->
<script>
    /* ?????? ?????? ??? ?????? ????????? ???????????? ??????*/
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
            showMsg("??????",msg);
        }
    })

    <%-- ?????? ?????????(?????? ??????) --%>
    $('#staticBackdrop').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget) // Button that triggered the modal

        <%-- button data?????? ????????? ??????????????? ???????????? ????????? ?????? ????????? --%>
        let pImg = button.attr('data-pImg');
        let pTitle = button.attr('data-pTitle');
        let pPrice = button.attr('data-pPrice');
        let pCount = button.attr('data-pCount');
        let productPrice = (pPrice * pCount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "???";
        let name = button.attr('data-receiverName');
        let address1 = button.attr('data-receiverAddress1');
        let address2 = button.attr('data-receiverAddress2');
        let phone = button.attr('data-receiverPhone');
        let memo = button.attr('data-deliveryMemo');
        let cpName = button.attr('data-cpName');
        let productStatus = button.attr('data-orderStatus');
        let cpPrice = button.attr('data-cpPrice').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "???";
        let usedPoint = button.attr('data-usedPoint').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "???";
        let totalPrice = button.attr('data-totalPrice').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "???";
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

    /* ???????????? ?????? / ?????? ?????? */
    $('#payBackModal').on('show.bs.modal', function (event) {

        let button = $(event.relatedTarget) // Button that triggered the modal
        let img = button.attr('data-pImg');
        let pNo = button.attr('data-pPno');
        let orderNo = button.attr('data-orderNo');
        let orderStatus = button.attr('data-orderStatus');
        let title = button.attr('data-pTitle');
        let price = button.attr('data-pPrice');
        let count = button.attr('data-pCount');
        let productPrice = (price * count).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "???";
        let modal = $(this);

        modal.find('#orderStatus').val(orderStatus);
        modal.find('#pNo').val(pNo);
        modal.find('#orderNo').val(orderNo);
        modal.find('pCount').val(count);
        modal.find('#img').attr('src', img);
        modal.find('#title').text(title);
        modal.find('#price').text(productPrice);
        if($(event.relatedTarget).text() == '??????') {
            modal.find('#payBackModalLabel').text('?????? ??????');
        }
        else if($(event.relatedTarget).text() == '??????'){
            modal.find('#payBackModalLabel').text('?????? ??????');

        }
    });

     /*???????????? ???????????? ???????????? ?????? ?????????*/
    $('#payBackSBtn').on('click',function(){
        let returnReason = $('#form-select').val();
        if(returnReason==null){
            alert('??????????????? ??????????????????.');
            return;
        }
        if(!confirm(("????????? ?????????????????????????"))){
            alert("??????????????? ?????????????????????.")
        }
        else{
            $('#payBackForm').submit();
        }
    })

</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Title</title>
  <%@include file="/WEB-INF/includes/common.jsp" %>
  <style>
  @font-face {
      font-family: CookieRun Regular;
      src: url('/font/cookieRunFont_TTF/CookieRun Regular.ttf') format("truetype");
  }
    body {
      font-family: CookieRun Regular;
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

/*    *{
        border:0.8px solid blue;
    }*/
    main {
      width: 800px;
      margin: auto;
    }
    ul{
        padding: 0px;
    }
    li{
        list-style: none;
    }
    .main_title{
        font-size: 2rem;
    }
    #mainTile{
        margin-top: 70px;
        margin-bottom: 30px;
        color: #6DB329;
        font-weight: bold;
    }
    #mainTitle + span{
        font-size: 2rem;
    }
    #prdImg{
        width: 70px;
    }
    table{
        font-size: 0.9rem;
    }
    #receiverInfo{
        font-size: 0.9rem;
    }
    .btn{
        border-radius: 10px;
        width: 250px;
        height: 60px;
        font-size: 1rem;
    }
    .btn-group a{
        text-decoration: none;
        color: inherit;
    }
    .btn-group a:hover{
        color: white;
    }
    #mainBtn{
        background-color: #4e73df;
    }
    #orderBtn{
        background-color: #6DB329;
    }
    #orderInfoTitle,
    #deliveryTitle{
        color: tomato;
    }
  </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<%-- ================================= 공지사항 Main 시작 ====================================--%>
<main>
    <section class="container text-center mt-5">
        <div>
            <span class="main_title" id="mainTile">결제가 완료</span>
            <span class="main_title" >되었습니다</span>
        </div>
        <hr/>
    </section>
    <%-- ========================== 주문 상품 정보 시작 ==============================--%>
    <secttion clas="container">
      <h5 class="text-center"><fmt:formatDate value="${receiverInfo.ORDER_DATE}" pattern="yyyy년 MM월 dd일"/>
          주문 / 주문번호 <c:out value="${receiverInfo.ORDER_NO}"/></h5>
      <table id="prdInfo" class="fold col-12 mt-5">
          <tbody>
          ${paymentDto.receiver_address1}
          <c:forEach var="product" items="${productList}">
            <tr class="prdList">
              <td class="d-flex align-items-center col-8 ms-2">
                <div class="productImg-box mb-4">
                  <img id="prdImg" src=<c:out value="${product.p_img}"/> class="product-img"/>
                </div>
                <div class="prdTitle-box ms-3 col-12">
                    <span class="prdTitle">
                        [<c:out value="${product.p_category}"/>] <c:out value="${product.p_title}"/>
                    </span>
                </div>
              </td>
              <td class="col-1"><span class="prdCount"><c:out value="${product.p_count}"/>개</span></td>
              <td class="col-2"><span class="prdPrice"><fmt:formatNumber value="${product.p_price}" type="number"/>원</span></td>
              <td class="col-2"><span class="prdStatus"><c:out value="${product.order_status}"/></span></td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
    </secttion>
    <section class="container">
        <h5 class="mt-5 mb-4" id="orderInfoTitle">주문자 정보</h5>
        <hr/>
        <ul id="orderInfo">
            <li class ="d-flex mb-3">
                <div class="col-6">
                    <span>주문자 이름</span>
                </div>
                <div class="col-6 text-end">
                    <span class="me-2"><c:out value="${receiverInfo.ORDER_NAME}"/></span>
                </div>
            </li>
            <li class ="d-flex mb-3">
                <div class="col-6">
                    <span>주문자 전화번호</span>
                </div>
                <div class="col-6 text-end">
                    <span class="me-2"><c:out value="${receiverInfo.ORDER_PHONE}"/></span>
                </div>
            </li>
        </ul>
    </section>
    <section class="container">
        <h5 class="mt-5 mb-4" id="deliveryTitle">배송정보</h5>
        <hr/>
        <ul id="receiverInfo">
            <li class ="d-flex mb-3">
                <div class="col-6">
                    <span>수령인</span>
                </div>
                <div class="col-6 text-end">
                    <span class="me-2">${receiverInfo.RECEIVER_NAME}</span>
                </div>
            </li>
            <li class ="d-flex mb-3">
                <div class="col-6">
                    <span>우편번호</span>
                </div>
                <div class="col-6 text-end">
                    <span class="me-2"><c:out value="${receiverInfo.RECEIVER_ZIPCODE}"/> </span>
                </div>
            </li>
            <li class ="d-flex mb-3">
                <div class="col-6">
                    <span>받는 주소</span>
                </div>
                <div class="col-6 text-end">
                    <span class="me-2">
                        <c:out value="${receiverInfo.RECEIVER_ADDRESS1}"/>
                        <c:out value="${receiverInfo.RECEIVER_ADDRESS2}"/>
                    </span>
                </div>
            </li>
            <li class ="d-flex mb-3">
                <div class="col-6">
                    <span>연락처</span>
                </div>
                <div class="col-6 text-end">
                    <span class="me-2"><c:out value="${receiverInfo.RECEIVER_PHONE}"/></span>
                </div>
            </li>
            <li class = "d-flex mb-3">
                <div class="col-6">
                    <span>배송메모</span>
                </div>
                <div class="col-6 text-end">
                    <span class="me-2"><c:out value="${receiverInfo.DELIVERY_MEMO}"/></span>
                </div>
            </li>
        </ul>
        <hr/>
    </section>
    <section class="container">
        <div class="d-flex mt-5 mb-4 justify-content-center ">
            <h5 class="me-5" id="totalPriceTitle">총 결제금액</h5>
            <h5 class=""><fmt:formatNumber value="${receiverInfo.TOTAL_PRICE}"  type="number"/>원</h5>
        </div>
    </section>
    <section class="container">
        <div class="btn-group d-flex justify-content-center align-items-center mt-5">
            <div class="me-3">
                <a href="/home">
                    <button type="button" id="mainBtn" class="btn btn-primary btn-sm">계속 쇼핑하기</button>
                </a>
            </div>
            <div>
                <a href="#">
                    <button type="button" id="orderBtn" class="btn btn-secondary btn-sm">비회원 주문조회 바로가기</button>
                </a>
            </div>
        </div>
    </section>
  <%-- ========================== 주문 상품 정보 끝 ==============================--%>
</main>
<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script>

</script>
</body>
</html>


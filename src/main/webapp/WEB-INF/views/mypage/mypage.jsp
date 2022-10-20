<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="../../includes/common.jsp" %>
<title>MyPage</title>
<style>
main {
    width: 100%;
}

main .header-list {
    border: 1px solid rgba(204, 204, 204, 0.8);
    width: 200px;
    height: 100px;
    border-radius: 7px;
    font-size: 0.8rem;
    padding: 5px;
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
</main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

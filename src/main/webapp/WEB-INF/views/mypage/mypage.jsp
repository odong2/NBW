<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="../../includes/common.jsp" %>
<link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
<title>MyPage</title>
<style>
main {
    width: 100%;
    padding-left: 30px;
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
<!-- 
		본인 페이지 내용 작성하는 부분
 -->
</main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

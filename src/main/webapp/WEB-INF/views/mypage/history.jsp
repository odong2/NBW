<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>

    <link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
    <title>MyHistory</title>
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
        <main>

        </main>
    </section>
    <!-- 마이 페이지 끝 -->
    <!-- 풋터 시작 -->
    <%@include file="../../includes/footer.jsp" %>
    <!-- 풋터 끝 -->
    </body>
    </html>
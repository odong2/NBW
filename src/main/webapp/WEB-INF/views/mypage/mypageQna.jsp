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
        .divTitle {
            margin-top: 10px;
            font-size: large;
        }
        .explainTitle {
            font-size: 25px;
        }
        .typePick {
            width: 300px;
        }
        .sendbtn {
            background-color: #e0e0e0;
            color: black;
            border: 0;
            outline: 0;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 5px;
            padding-bottom: 5px;
        }
        .qnaname {
            margin-top: 10px;
        }
        .qnatypepick {
            margin-top: 30px;
        }
        .qnacontent {
            margin-top: 10px;
        }
        .dbtn{
        }
        .sendbtn {
            font-size: 18px;
            font-weight: bolder;
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

        <%-- ==================== 주문조회 페이지 헤더 시작 ==================--%>
        <header>
        </header>
        <%-- ==================== 주문조회 페이지 헤더 끝 ==================--%>
            <div class="divTitle">문의 접수</div>
            <hr />
            <div class="explainTitle">제품 / 교환 / 반품 등 이용에 관한 궁금증을 해결하세요.</div>
            <form action="">
                <div class="qnatypepick">문의 유형 선택</div>
                <div class="typePick">
                    <select class="" style="width: 600px; height: 30px">
                        <option selected>선택</option>
                        <option value="1">제품</option>
                        <option value="2">교환</option>
                        <option value="3">반품</option>
                    </select>
                </div>
                <%-- 문의제목 시작 --%>
                <div class="qnaname">문의 제목</div>
                <div class="namewrite">
                    <input type="text" style="width: 600px">
                </div>
                <%-- 문의제목 끝--%>
                <%-- 문의내용 시작--%>
                <div class="qnacontent">문의 내용</div>
                <div class="mb-3">
                    <textarea rows="3" style="width: 600px"></textarea>
                </div>
                <%-- 문의내용 끝--%>
                <div class="dbtn"><button class="sendbtn">전송</button></div>
            </form>
    </main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

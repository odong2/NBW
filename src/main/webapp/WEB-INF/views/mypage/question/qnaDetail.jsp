<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../../includes/common.jsp" %>
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
                padding-left: 30px;
        }

        main .header-list {
            border: 1px solid rgba(204, 204, 204, 0.8);
            width: 100%;
            height: 100px;
            border-radius: 7px;
            font-size: 0.8rem;
            padding: 5px;
        }
        /******************** 공통코드 ************************/
        /*main {*/
        /*    width: 100%;*/
        /*    padding-left: 30px;*/
        /*}*/

        .divTitle {
            margin-top: 10px;
            font-size: large;
        }

        th > label {
            margin-left: 15px;
            margin-right: 15px;
        }

        .content-box {
            /*border-top: 1px solid #999;*/
            border-bottom: 1px solid #999;
            padding: 20px 60px 20px 10px;
        }
        .inquiry_info {
            font-size: 12px;
            /*padding: 20px 60px 20px 10px;*/
        }
        .text {
            width: fit-content;
            padding: 5px;
            border-radius: 1rem;
            background-color: #ededf7;
            color: black;
        }
        .gap {
            display: inline-block;
            font-size: 0;
            width: 1px;
            height: 10px;
            background-color: #d5d5d5;
            margin: 0 10px 0;
            box-sizing: border-box;
        }
        .ctg-item {
            font-size: 14px;
            line-height: 22px;
            letter-spacing: -0.01em;
            font-weight: 400;
            color: #595959;
            padding-right: 6px;
        }
        .inquiry_title {
            margin-top: 20px;
        }
        .title {
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 12px;
        }
        .inquiry_content {
            position: relative;
            padding-left: 24px;
            padding-bottom: 5px;
            padding-right: 24px;
            padding-top: 10px;
            border-radius: 10px;
            background-color: #f7f7f7;
        }
        .adminanswer {
            width: fit-content;
            border-radius: 1rem;
            background-color: #ededf7;
            color: black;
            margin-top: 20px;
            margin-bottom: 5px;
            font-size: 12px;
        }
        .cdate {
            font-size: 12px;
        }
        .admin_inquiry_info {
            font-size: 13px;
            padding: 15px 60px 15px 10px;
        }
        .twoBtn {
            display: flex;
            justify-content : center;
            margin-top: 10px;
        }

        .twoBtn > button {
            margin-right: 5px;
            margin-left: 5px;
        }

    </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="../../../includes/header.jsp" %>
<!-- 헤더 끝 -->
<!-- 마이 페이지 시작 -->
<section class="mypage wrapper d-flex">
    <!-- 사이드바 시작-->
    <%@include file="../../../includes/sidebar.jsp" %>
    <!-- 사이드바 끝-->
    <%-- ==================== 메인 시작==================--%>
    <main>
        <%-- ==================== 마이 페이지 타이틀 ==================--%>

        <%-- ==================== 주문조회 페이지 헤더 시작 ==================--%>
        <header>
        </header>
        <%-- ==================== 주문조회 페이지 헤더 끝 ==================--%>
        <div class="divTitle">문의</div>
                <hr />
<%--            <c:if test="${qna}">--%>
                <div class="content-box">
                    <div class="inquiry_info">
                        <span class="text">
                            ${qna.qn_state}
                        </span>
                        <span class="gap"></span>
                        <span class="ctg-item">
                            ${qna.qn_category}
                        </span>
                        <span class="gap"></span>
                        <span class="cdate">
                            <fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qn_cdate}"/>
                        </span>
                    </div>
                <div class="inquiry_title">
                    <div class="inquiry_content">
                        <div class="d-flex align-items-center">
                            <div class="title">
                                ${qna.qn_title}
                            </div>
                        </div>
                        <p>
                            ${qna.qn_content}
                        </p>

                    </div>
                <div class="fold_box_contents">
                    <div class="admin_inquiry_info">
                        <span class="text">답변</span>
                        <span class="gap"></span>
                        <span class="cdate">
                            <fmt:formatDate value="${an.an_cdate}" pattern="yyyy-MM-dd"/>
                        </span>
                    </div>
                    <div class="inquiry_content">
                        <div class="inquiry_content_area">
                            <p>
                                ${an.an_content}
                            </p>
                        </div>
                    </div>
                </div>
                    </div>
           </div>
            <div class="twoBtn">
                <button id="listBtn" type="button"  class="btn btn-outline-secondary">목록으로</button>
                <button id="deleteBtn" class="btn btn-outline-danger">삭제하기</button>
            </div>
        </div>
    </main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<script>
        $("#listBtn").on("click", function (){
            location.href = "<c:url value='/mypage/question/list'/>";
        })

        $("#deleteBtn").on("click", function (){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            location.href = `/mypage/qna/delete/${qna.qn_no}`;
        })
</script>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

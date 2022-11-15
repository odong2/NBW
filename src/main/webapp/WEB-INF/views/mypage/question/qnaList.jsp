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
            margin-right: 180px;
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
        .topAsk {
            margin-bottom: 50px;
            margin-top: 10px;
        }
        .divTitle {
            font-size: large;
            /*margin-bottom: 20px;*/
            float: left;
        }
        .askBtn {
            float: right;
            margin-right: 50px;
            font-size: small;
        }
        .askBtn > a {
            text-decoration: none;
        }
        ul {
            list-style: none;
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
            margin: 0;
            padding: 0;
        }
        li {
            display: list-item;
        }
        .content-box {
            /*border-top: 1px solid #999;*/
            border-bottom: 1px solid #999;
            padding: 20px 60px 20px 10px;
        }
        .inquiry_info {
            font-size: 12px;
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
        }
        .inquiry_title {
            margin-top: 20px;
        }
        .title {
            margin-left: 10px;
            font-size: 16px;
        }
        .title > a {
            text-decoration: none;
            color: black;
        }
        .title > a:hover {
            color: #676BAD;
            font-weight: bold;
        }
        .cdate {
            font-size: 12px;
            margin-left: auto;
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
        <div class="topAsk">
            <div class="divTitle">문의내역</div><div class="askBtn"><a href="/mypage/qna/write">문의하기</a></div>
        </div>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button
                        class="nav-link active"
                        id="allask"
                        data-bs-toggle="tab"
                        data-bs-target="#home-tab-pane"
                        type="button"
                        role="tab"
                        aria-controls="home-tab-pane"
                        aria-selected="true"
                >
                    <span>전체</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button
                        class="nav-link"
                        id="Processing"
                        data-bs-toggle="tab"
                        data-bs-target="#profile-tab-pane"
                        type="button"
                        role="tab"
                        aria-controls="profile-tab-pane"
                        aria-selected="false"
                >
                    <span>처리중</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button
                        class="nav-link"
                        id="finish"
                        data-bs-toggle="tab"
                        data-bs-target="#contact-tab-pane"
                        type="button"
                        role="tab"
                        aria-controls="contact-tab-pane"
                        aria-selected="false"
                        color="black"
                >
                    <span>답변완료</span>
                </button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <%-- 전체 문의 --%>
            <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="allask" tabindex="0">
                <div class="qna-list-wrap" >
                    <ul>
                        <c:forEach var="qna" items="${qnaSelectAll}">
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">
                                        <c:out value="${qna.qn_state}"/>
                                    </span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">
                                            <c:out value="${qna.qn_category}"/>
                                    </span>
                                    <span class="gap"></span>
                                    <span>
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qn_cdate}"/>
                                    </span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="/mypage/question/detail?qn_no=${qna.qn_no}">
                                                <c:out value="${qna.qn_title}"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <%-- 전체 문의 --%>
            <%-- 처리중인 문의 --%>
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="Processing" tabindex="0">
                <div class="qna-list-wrap">
                    <ul>
                        <c:forEach var="qna" items="${qnaSelectIngAll}">
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">
                                        <c:out value="${qna.qn_state}"/>
                                    </span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">
                                            <c:out value="${qna.qn_category}"/>
                                    </span>
                                    <span class="gap"></span>
                                    <span>
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qn_cdate}"/>
                                    </span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="/mypage/question/detail?qn_no=${qna.qn_no}">
                                                <c:out value="${qna.qn_title}"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <%-- 처리중인 문의 --%>
            <%-- 답변완료 문의 --%>
            <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="finish" tabindex="0">
                <div class="qna-list-wrap" >
                    <ul>
                        <c:forEach var="qna" items="${qnaSelectFinishAll}">
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">
                                        <c:out value="${qna.qn_state}"/>
                                    </span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">
                                            <c:out value="${qna.qn_category}"/>
                                    </span>
                                    <span class="gap"></span>
                                    <span>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qn_cdate}"/>
                                    </span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="/mypage/question/detail?qn_no=${qna.qn_no}">
                                                <c:out value="${qna.qn_title}"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
                <%-- 답변완료 문의 --%>
            </div>
        </div>
    </main>
    <script>
        let msg = "${msg}"
        if(msg=="DEL_OK") alert("성공적으로 삭제되었습니다.");
        if(msg=="DEL_ERR") alert("삭제에 실패했습니다.");
    </script>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
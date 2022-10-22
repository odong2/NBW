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
        .divTitle {
            margin-top: 10px;
            font-size: large;
            margin-bottom: 20px;
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
            padding-right: 6px;
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
<%@include file="../../includes/header.jsp" %>
<!-- 헤더 끝 -->
<!-- 마이 페이지 시작 -->
<section class="mypage wrapper d-flex">
    <!-- 사이드바 시작-->
    <%@include file="../../includes/sidebar.jsp" %>
    <!-- 사이드바 끝-->
    <%-- ==================== 메인 시작==================--%>
    <main>
        <div class="divTitle">문의내역</div>
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
                    <span>(4)</span>
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
                    <span>(2)</span>
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
                    <span>(2)</span>
                </button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <%-- 전체 문의 --%>
            <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="allask" tabindex="0">
                <div class="qna-list-wrap" >
                    <ul>
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">처리중</span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">배송</span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="">책 언제 들어와요?</a>
                                        </div>
                                        <div class="cdate">
                                            <span>2022-05-05</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">처리중</span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">제품</span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="">책이 망가졌는데 환불 가능한가요?</a>
                                        </div>
                                        <div class="cdate">
                                            <span>2022-10-20</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">답변완료</span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">배송</span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="">오늘 주문했는데 도착하는데 얼마나 걸릴까요?</a>
                                        </div>
                                        <div class="cdate">
                                            <span>2022-03-01</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">답변완료</span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">반품</span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="">책이 마음에 안들어서 반품하려고요</a>
                                        </div>
                                        <div class="cdate">
                                            <span>2022-01-20</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <%-- 전체 문의 --%>
            <%-- 처리중인 문의 --%>
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="Processing" tabindex="0">
                <div class="qna-list-wrap">
                    <ul>
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">처리중</span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">배송</span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="">책 언제 들어와요?</a>
                                        </div>
                                        <div class="cdate">
                                            <span>2022-05-05</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">처리중</span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">제품</span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="">책이 망가졌는데 환불 가능한가요?</a>
                                        </div>
                                        <div class="cdate">
                                            <span>2022-10-20</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <%-- 처리중인 문의 --%>
            <%-- 전체 문의 --%>
            <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="finish" tabindex="0">
                <div class="qna-list-wrap" >
                    <ul>
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">답변완료</span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">배송</span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="">오늘 주문했는데 도착하는데 얼마나 걸릴까요?</a>
                                        </div>
                                        <div class="cdate">
                                            <span>2022-03-01</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="content-box">
                                <div class="inquiry_info">
                                    <span class="text">답변완료</span>
                                    <span class="gap"></span>
                                    <span class="ctg-item">반품</span>
                                </div>
                                <div class="inquiry_title">
                                    <div class="d-flex align-items-center">
                                        <div class="title">
                                            <a href="">책이 마음에 안들어서 반품하려고요</a>
                                        </div>
                                        <div class="cdate">
                                            <span>2022-01-20</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
                <%-- 전체 문의 --%>
            </div>
        </div>
    </main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
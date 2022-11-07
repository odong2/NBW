<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../../includes/common.jsp" %>
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
        }
        /* 이벤트 전체 */
        .applylist {
            display: flex;
        }
        /* 이벤트 전체 */
        /* 행사 포스터 */
        .classimg {
            flex: 1;
            width: 110px;
            height: 180px;
            margin-right: 10px;
        }
        .classimg > img {
            width: 70%;
            height: 100%;
        }
        /* 행사 포스터 */
        /* 행사 설명 시작 */
        .playcontent {
            flex: 3;
        }
        /* 행사 제목 */
        .titlename {
            font-size: 30px;
            font-weight: bold;
            margin-top: 20px;
        }
        /* 행사 제목 */
        /* 행사기간 */
        .playday {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        /* 행사기간 */
        /* 행사장소 */
        .playspace {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        /* 행사장소 */
        /* 행사시간 */
        .playtime {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        /* 행사시간 */
        /* 행사 설명 끝 */
        /* 상세보기 버튼 */
        .playdetail {
            flex: 1;
            margin-left: 100px;
            margin-top: 60px;
            width: 130px;
            text-align: center;
        }
        .pick-btn {
            height: 38px;
            justify-content: flex-end;
            padding: 0 19px;
            border: 1px solid #d9d9d9;
            color: #505050;
            font-size: 15px;
            text-align: center;
        }
        /* 상세보기 버튼 */
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
            <%-- 신청한 이벤트 시작--%>
            <ul>
                <c:forEach var="event" items="${myEventSelectAll}">
                    <li>
            <div class="divTitle">참여중인 이벤트</div>
            <hr />
            <div class="applylist">
                <!-- 행사 포스터 시작 -->
                <img
                    class="classimg"
                    src="${event.ev_img}"
                />
                </div>
                <!-- 행사 포스터 끝 -->
                <!-- 행사 설명 시작-->
                <div class="playcontent">
                    <%-- 이벤트 이름 --%>
                    <div class="titlename">
                        <c:out value="${event.ev_title}"/>
                    </div>
                    <div class="playday">
                        <div>행사기간&nbsp;:&nbsp;</div>
                        <div>
                            <c:out value="${event.ev_today}"/>
                        </div>
                    </div>
                    <br />
                    <div class="playspace">
                        <div>장소&nbsp;:&nbsp;</div>
                        <div>
                            <c:out value="${event.ev_place}"/>
                        </div>
                    </div>
                    <br />
                    <div class="playtime">
                        <div>시간&nbsp;:&nbsp;</div>
                        <div>
                            <c:out value="${event.ev_time}"/>
                        </div>
                    </div>
                </div>
                <!-- 행사 설명 끝-->
                <!-- 상세보기 버튼 시작 -->
                <div class="playdetail">
                    <button class="pick-btn">
                        <a href="/event/detail?ev_no=${event.ev_no}">
                        상세보기
                        </a>
                    </button>
                </div>
                <!-- 상세보기 버튼 끝 -->
            </div>
            <hr /></li>
                </c:forEach>
            </ul>
    </main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

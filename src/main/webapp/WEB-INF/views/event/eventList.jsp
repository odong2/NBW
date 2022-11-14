<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    <title>event</title>
    <style>
        /* * {
          border: 1px solid red;
        } */
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body {
            font-family: GangwonEdu_OTFBoldA;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        main {
            width: 1000px;
            margin: auto;
        }
        h2 {
            padding-top: 30px;
        }
        .headerTit {
            font-weight: bolder;
            font-size: 24px;
            margin-top: 3px;
            margin-bottom: 7px;
        }
        .lectureHeader {
            background-color: #f2f2f2;
            /* text-align: left; */
            margin: 10px;
            /*padding-left: 30px;*/
            padding-right: 30px;
            padding-top: 10px;
            padding-bottom: 10px;
            display: flex;
        }
        a {
            color: black;
        }
        .programnote {
            font-size: 14px;
            color: #969696;
        }
        .eventcare {
            color: red;
        }
        .list {
            list-style: none;
            padding: 30px 0px 39px;
            display: flex;
        }
        .search-box {
            display: flex;
            justify-content: right;
            margin: 10px;
            width: auto;
            height: auto;
        }
        #search-txt {
            width: 200px;
        }
        #search-btn {
            background-color: #006eaf;
            color: white;
            border: 0;
            outline: 0;
        }
        .picking {
            display: flex;
            justify-content: center;
            margin-top: 5px;
        }
        .picturepeople {
            margin-left: 10px;
        }
        .classimg {
/*            width: 146px;
            height: 225px;*/
            width: 180px;
            height: 260px;
        }
        .receiving {
            width: 62px;
            padding: 5px 0;
            color: white;
            background-color: #fa4b4b;
            text-align: center;
            margin-left: 3px;
            margin-right: 3px;
        }
        .receivingpeople {
            width: 62px;
            text-align: center;
            border: 1px solid #fa4b4b;
            padding: 5px 0;
            margin-left: 3px;
            margin-right: 3px;
        }
        /** {*/
        /*    border: 1px red solid;*/
        /*}*/
        .detail {
            margin-left: 10px;
        }
        .bookname {
            margin-left: 10px;
            margin-top: 10px;
        }
        .bodycontent {
            margin-left: 10px;
        }
        .playpeople {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .playplace {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .studyday {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .studytime {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .applicationday {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .recruitment {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .eventhit {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .bookname > a {
            text-decoration: none;
            font-weight: bold;
            font-size: 25px;
        }
        .programImg {
        margin-right: 30px;
        }
        .programcontent {

        }
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="../../includes/header.jsp" %>
<!-- 헤더 끝 -->
<main>
    <div>
        <h2 id="divTitle" class="fl">프로그램 신청</h2>
    </div>
    <hr />
    <div class="lectureHeader">
        <div class="programImg">
            <img alt="" src="/images/programpick.png" style="width: 300px; height: 110px">
        </div>
        <div class="programcontent">
            <div class="headerTit">프로그램신청 시 유의사항</div>
            <div class="programnote">
                <div>1. 프로그램명을 클릭하시면 신청할 수 있으며, 프로그램신청은 로그인 후 이용가능합니다.</div>
                <div>2. 신청자의 인적사항(성명,휴대폰번호,주소)은 정확하게 확인 바랍니다.</div>
                <div class="eventcare">3. 수강 취소 없이 불참 시 다음 프로그램 참여가 제한될 수 있습니다. "마이페이지"에서 신청내역을 확인 가능합니다.</div>
            </div>
        </div>
    </div>

    <hr />
    <%-- ************************************** [[EVENT CONTENT 시작]] ************************************ --%>
    <%--    <section id="event-main" class="container">--%>
    <ul>
        <c:forEach var="event" items="${eventSelectAll}">
            <li class="list" >
                <!-- 왼쪽 그림 시작 -->
                <div class="picturepeople">
                    <!-- 이미지 사진 시작 -->
                    <img
                            class="classimg"
                            src="/admin/event/img/display/${eventSelect.ev_img}"/>
                    <!-- 이미지 사진 끝 -->
                    <div class="picking">
                        <span class="receiving">${event.ev_status}</span>
                        <span class="receivingpeople"><c:out value="${event.ev_people-event.ev_nowpeople}"/></span>
                    </div>
                </div>
                <!-- 왼쪽 그림 끝 -->
                <!-- 오른쪽 설명 시작 -->
                <div class="detail">
                    <div class="bookname">
                        <a href="/event/detail?ev_no=${event.ev_no}" style="color: #ff0000"/>
                            <c:out value="${event.ev_title}"/>
                        </a>
                    </div>

                    <div class="bodycontent">
                        <div class="playpeople">
                            <div>대상&nbsp;:&nbsp;</div>
                            <div style="color: #7c7c7c"><c:out value="${event.ev_target}"/></div>
                        </div>
                        <br />
                        <div class="playplace">
                            <div>장소&nbsp;:&nbsp;</div>
                            <div style="color: #7c7c7c"><c:out value="${event.ev_place}"/></div>
                        </div>
                        <br />
                        <div class="studyday">
                            <div>행사기간&nbsp;:&nbsp;</div>
                            <div style="color: #7c7c7c"><c:out value="${event.ev_today}"/></div>
                        </div>
                        <br />
                        <div class="studytime">
                            <div>시간&nbsp;:&nbsp;</div>
                            <div style="color: #7c7c7c"><c:out value="${event.ev_time}"/></div>
                        </div>
                        <br />
                        <div class="applicationday">
                            <div>접수기간&nbsp;:&nbsp;</div>
                            <div style="color: #7c7c7c">
                                <c:out value="${event.ev_start}"/>
                                ~
                                <c:out value="${event.ev_end}"/>
                            </div>
                        </div>
                        <br />
                        <div class="recruitment">
                            <div>모집정원&nbsp;:&nbsp;</div>
                            <div style="color: #7c7c7c">
                                <c:out value="${event.ev_people}"/> 명&nbsp;
                                <span style="color: red">(신청:<c:out value="${event.ev_nowpeople}"/>)</span>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <!-- 오른쪽 설명 끝 -->
            </li>
        </c:forEach>
    </ul>
    <%--    </section>--%>
    <%-- ************************************** [[EVENT CONTENT 끝]] ************************************ --%>
<%--    <script>--%>
<%--        $(document).ready(function (){--%>
<%--            $--%>
<%--        })--%>
<%--    </script>--%>
</main>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
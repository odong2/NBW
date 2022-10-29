<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    <title>event</title>
        <style>
            /* * {
              border: 1px solid red;
            } */
            body {
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
            }
            .lectureHeader {
                background-color: #f2f2f2;
                /* text-align: left; */
                margin: 10px;
                padding-left: 30px;
                padding-right: 30px;
                padding-top: 10px;
                padding-bottom: 10px;
            }
            a {
                color: black;
            }
            .programnote {
                font-size: small;
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
            .img {
                float: left;
            }
            .classimg {
                width: 146px;
                height: 225px;
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
            .bookname {
                margin-left: 10px;
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
            <p class="headerTit">프로그램신청 시 유의사항</p>
            <div class="programnote">
                <div>1. 프로그램명을 클릭하시면 신청할 수 있으며, 프로그램신청은 로그인 후 이용가능합니다.</div>
                <div>2. 신청자의 인적사항(성명,휴대폰번호,주소)은 정확하게 확인 바랍니다.</div>
                <div class="eventcare">3. 수강 취소 없이 불참 시 다음 프로그램 참여가 제한될 수 있습니다. "마이페이지"에서 신청내역을 확인 가능합니다.</div>
            </div>
        </div>

        <div class="search-box">
            <form action="." method="post">
                <input id="search-txt" type="text" placeholder="검색어를 입력해 주세요" />
                <button id="search-btn" type="submit">검색</button>
            </form>
        </div>

        <hr />
    <%-- ************************************** [[EVENT CONTENT 시작]] ************************************ --%>
<%--    <section id="event-main" class="container">--%>
      <ul>
<%--        <c:forEach var="event" items="${eventList}">--%>
        <li class="list">
            <!-- 왼쪽 그림 시작 -->
            <div class="picturepeople">
                <!-- 이미지 사진 시작 -->
                <img
                    class="classimg"
                    src="${eventDto.ev_img}"/>
                <!-- 이미지 사진 끝 -->
                <div class="picking">
                    <span class="receiving">접수중</span>
                    <span class="receivingpeople"><c:out value="${eventDto.ev_people-event.ev_nowpeople}"/></span>
                </div>
            </div>
            <!-- 왼쪽 그림 끝 -->
            <!-- 오른쪽 설명 시작 -->
            <div class="detail">
                <p class="bookname">
                    <a href="<c:url value="/event/read${ph.sc.queryString}&ev_no=${event.ev_no}"/>" style="color: #ff0000">
                        <c:out value="${eventDto.ev_title}"/>
                    </a>
                </p>
                <div class="bodycontent">
                    <div class="playpeople">
                        <div>대상&nbsp;:&nbsp;</div>
                        <div style="color: #7c7c7c"><c:out value="${eventDto.ev_target}"/></div>
                    </div>
                    <br />
                    <div class="playplace">
                        <div>장소&nbsp;:&nbsp;</div>
                        <div style="color: #7c7c7c"><c:out value="${eventDto.ev_place}"/></div>
                    </div>
                    <br />
                    <div class="studyday">
                        <div>행사기간&nbsp;:&nbsp;</div>
                        <div style="color: #7c7c7c"><c:out value="${eventDto.ev_today}"/></div>
                    </div>
                    <br />
                    <div class="studytime">
                        <div>시간&nbsp;:&nbsp;</div>
                        <div style="color: #7c7c7c"><c:out value="${eventDto.ev_time}"/></div>
                    </div>
                    <br />
                    <div class="applicationday">
                        <div>접수기간&nbsp;:&nbsp;</div>
                        <div style="color: #7c7c7c"><c:out value="${eventDto.ev_start}"/> ~ <c:out value="${eventDto.ev_end}"/></div>
                    </div>
                    <br />
                    <div class="recruitment">
                        <div>모집정원&nbsp;:&nbsp;</div>
                        <div style="color: #7c7c7c"><c:out value="${eventDto.ev_people}"/></div>
                    </div>
                </div>
            </div>
            <hr />
            <!-- 오른쪽 설명 끝 -->
        </li>
    </ul>
<%--    </section>--%>
    <%-- ************************************** [[EVENT CONTENT 끝]] ************************************ --%>
</main>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

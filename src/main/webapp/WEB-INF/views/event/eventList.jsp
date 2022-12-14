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
        .class-img {
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
<!-- ?????? ?????? -->
<%@include file="../../includes/header.jsp" %>
<!-- ?????? ??? -->
<main>
    <div>
        <h2 id="divTitle" class="fl">???????????? ??????</h2>
    </div>
    <hr />
    <div class="lectureHeader">
        <div class="programImg">
            <img alt="" src="/images/programpick.png" style="width: 300px; height: 110px">
        </div>
        <div class="programcontent">
            <div class="headerTit">?????????????????? ??? ????????????</div>
            <div class="programnote">
                <div>1. ?????????????????? ??????????????? ????????? ??? ?????????, ????????????????????? ????????? ??? ?????????????????????.</div>
                <div>2. ???????????? ????????????(??????,???????????????,??????)??? ???????????? ?????? ????????????.</div>
                <div class="eventcare">3. ?????? ?????? ?????? ?????? ??? ?????? ???????????? ????????? ????????? ??? ????????????. "???????????????"?????? ??????????????? ?????? ???????????????.</div>
            </div>
        </div>
    </div>

    <hr />
    <%-- ************************************** [[EVENT CONTENT ??????]] ************************************ --%>
    <%--    <section id="event-main" class="container">--%>
    <ul id="eventListUl">
<%--        <c:forEach var="event" items="${eventSelectAll}">--%>
<%--            <li class="list" >--%>
<%--                <!-- ?????? ?????? ?????? -->--%>
<%--                <div class="picturepeople">--%>
<%--                    <!-- ????????? ?????? ?????? -->--%>
<%--                    <img class="class-img" src="/admin/event/display/cb930cd1-f386-4e28-9261-a67a56bc298c_%5BCopy%20of%20%EC%97%94%EB%B9%84%EB%8D%94%5D%20(%EC%9D%B4%EB%B2%A4%ED%8A%B8%EB%B3%B4%EA%B8%B0)%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80.png"/>--%>
<%--                    <!-- ????????? ?????? ??? -->--%>
<%--                    <div class="picking">--%>
<%--                        <span class="receiving">${event.ev_status}</span>--%>
<%--                        <span class="receivingpeople"><c:out value="${event.ev_people-event.ev_nowpeople}"/></span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- ?????? ?????? ??? -->--%>
<%--                <!-- ????????? ?????? ?????? -->--%>
<%--                <div class="detail">--%>
<%--                    <div class="bookname">--%>
<%--                        <a href="/event/detail?ev_no=${event.ev_no}" style="color: #ff0000"/>--%>
<%--                            <c:out value="${event.ev_title}"/>--%>
<%--                        </a>--%>
<%--                    </div>--%>

<%--                    <div class="bodycontent">--%>
<%--                        <div class="playpeople">--%>
<%--                            <div>??????&nbsp;:&nbsp;</div>--%>
<%--                            <div style="color: #7c7c7c"><c:out value="${event.ev_target}"/></div>--%>
<%--                        </div>--%>
<%--                        <br />--%>
<%--                        <div class="playplace">--%>
<%--                            <div>??????&nbsp;:&nbsp;</div>--%>
<%--                            <div style="color: #7c7c7c"><c:out value="${event.ev_place}"/></div>--%>
<%--                        </div>--%>
<%--                        <br />--%>
<%--                        <div class="studyday">--%>
<%--                            <div>????????????&nbsp;:&nbsp;</div>--%>
<%--                            <div style="color: #7c7c7c"><c:out value="${event.ev_today}"/></div>--%>
<%--                        </div>--%>
<%--                        <br />--%>
<%--                        <div class="studytime">--%>
<%--                            <div>??????&nbsp;:&nbsp;</div>--%>
<%--                            <div style="color: #7c7c7c"><c:out value="${event.ev_time}"/></div>--%>
<%--                        </div>--%>
<%--                        <br />--%>
<%--                        <div class="applicationday">--%>
<%--                            <div>????????????&nbsp;:&nbsp;</div>--%>
<%--                            <div style="color: #7c7c7c">--%>
<%--                                <c:out value="${event.ev_start}"/>--%>
<%--                                ~--%>
<%--                                <c:out value="${event.ev_end}"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <br />--%>
<%--                        <div class="recruitment">--%>
<%--                            <div>????????????&nbsp;:&nbsp;</div>--%>
<%--                            <div style="color: #7c7c7c">--%>
<%--                                <c:out value="${event.ev_people}"/> ???&nbsp;--%>
<%--                                <span style="color: red">(??????:<c:out value="${event.ev_nowpeople}"/>)</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <hr />--%>
<%--                <!-- ????????? ?????? ??? -->--%>
<%--            </li>--%>
<%--        </c:forEach>--%>
    </ul>
    <%--    </section>--%>
    <%-- ************************************** [[EVENT CONTENT ???]] ************************************ --%>
    <script>
    let toHtml =(events)=>{
        let eventList = '';
        events.forEach((event)=>{
        let eventImg = encodeURI(event.ev_img);
        console.log(eventImg);
        eventList +=  `<li class="list" >
            <!-- ?????? ?????? ?????? -->
            <div class="picturepeople">
                <!-- ????????? ?????? ?????? -->
                <img class="class-img" src="/admin/event/display/${'${eventImg}'}"/>
                <!-- ????????? ?????? ??? -->
                <div class="picking">
                <span class="receiving">${'${event.ev_status}'}</span>
                    <span class="receivingpeople">${'${event.ev_people-event.ev_nowpeople}'}</span>
                </div>
            </div>
            <!-- ?????? ?????? ??? -->
            <!-- ????????? ?????? ?????? -->
            <div class="detail">
                <div class="bookname">
                    <a href="/event/detail?ev_no=${'${event.ev_no}'}" style="color: #ff0000"/>
                ${'${event.ev_title}'}
                </a>
            </div>
            <div class="bodycontent">
                <div class="playpeople">
                    <div>??????&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">${'${event.ev_target}'}</div>
                </div>
                <br />
                <div class="playplace">
                    <div>??????&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">${'${event.ev_place}'}</div>
                </div>
                <br />
                <div class="studyday">
                    <div>????????????&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">${'${event.ev_today}'}</div>
                </div>
                <br />
                <div class="studytime">
                    <div>??????&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">${'${event.ev_time}'}</div>
                </div>
                <br />
                <div class="applicationday">
                    <div>????????????&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">
                    ${'${event.ev_start}'}
                        ~
                    ${'${event.ev_end}'}
                    </div>
                </div>
                <br />
                <div class="recruitment">
                    <div>????????????&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">
                        ${'${event.ev_people}'}&nbsp;<span style="color: red">(??????:${'${event.ev_nowpeople}'})</span>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <!-- ????????? ?????? ??? -->
        </li>`;
        })
        return eventList;
    }




        $(document).ready(function (){
            $.ajax({
                type: 'GET',
                url: '/event/list/all',
                success:((eventList)=>{
                    console.log(eventList);
                    $('#eventListUl').empty();
                    $('#eventListUl').append(toHtml(eventList));
                })
            });
        })
    </script>
</main>
<!-- ?????? ?????? -->
<%@include file="../../includes/footer.jsp" %>
<!-- ?????? ??? -->
</body>
</html>
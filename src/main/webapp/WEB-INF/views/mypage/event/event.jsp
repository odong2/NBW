<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../../includes/common.jsp" %>
    <link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
    <title>MyPage</title>
    <style>
        /******************** 공통코드 ************************/
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
            margin-right: 190px;
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
        .alltext {
            margin-bottom: 50px;
        }
        .divTitle {
            margin-top: 10px;
            font-size: large;
        }
        /* 이벤트 전체 */
        .imgline {
            display: flex;
            float: left;
        }
        /* 행사 포스터 */
        .classimg {
            float: left;
            /*flex: 1;*/
            width: 140px;
            height: 190px;
            margin-right: 20px;
        }
        .classimg > img {
            width: 70%;
            height: 70%;
        }
        /* 행사 설명 시작 */
        .playcontent {
            /*flex: 3;*/
        }
        /* 행사 제목 */
        .titlename {
            font-size: 30px;
            font-weight: bold;
            margin-top: 20px;
        }
        /* 행사기간 */
        .playday {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        /* 행사장소 */
        .playspace {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        /* 행사시간 */
        .playtime {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .status {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        /* 상세보기 버튼 */
        .playdetail {
            /*flex: 1;*/
            float: right;
            /*margin-right: 100px;*/
            /*margin-top: 45px;*/
            width: 130px;
            text-align: center;
        }
        .playdetail >button {
            border: 0;
            outline: 0;
        }
        .playdetail > button > a {
            text-decoration: none;
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
                    <div class="divTitle">이벤트 신청 내역</div>
                    <hr />
            <ul id="eventListUl">
<%--                <li>--%>
<%--                <div class="alltext">--%>
<%--                    <div class="imgline">--%>
<%--                        <img--%>
<%--                            class="classimg"--%>
<%--                            src="${event.ev_img}"--%>
<%--                        />--%>
<%--                    </div>--%>
<%--                    <div class="playcontent">--%>
<%--                        <div class="titlename">--%>
<%--                            <c:out value="${event.ev_title}"/>--%>
<%--                        </div>--%>
<%--                        <div class="playday">--%>
<%--                            <div>행사기간&nbsp;:&nbsp;</div>--%>
<%--                            <div>--%>
<%--                                <c:out value="${event.ev_today}"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <br />--%>
<%--                        <div class="playspace">--%>
<%--                            <div>장소&nbsp;:&nbsp;</div>--%>
<%--                            <div>--%>
<%--                                <c:out value="${event.ev_place}"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <br />--%>
<%--                        <div class="playtime">--%>
<%--                            <div>시간&nbsp;:&nbsp;</div>--%>
<%--                            <div>--%>
<%--                                <c:out value="${event.ev_time}"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <br/>--%>
<%--                        <div class="playtime">--%>
<%--                            <div>전화번호&nbsp;:&nbsp;</div>--%>
<%--                            <div>--%>
<%--                            <c:out value="${event.ev_time}"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                            <br/>--%>
<%--                        <div class="status"">--%>
<%--                            <div>상태&nbsp;:&nbsp;</div>--%>
<%--                            <div style="color: red;">--%>
<%--                                <c:out value="${event.mem_status}"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                         <div class="playdetail">--%>
<%--                            <button class="pick-btn">--%>
<%--                                <a href="/event/detail?ev_no=${event.ev_no}">--%>
<%--                                상세보기--%>
<%--                                </a>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                <!-- 상세보기 버튼 끝 -->--%>
<%--                </div>--%>
<%--            </li>--%>
    </ul>
</main>

    <%-- ==================== 메인 끝 ==================--%>
</section>
<script>
    let toHtml =(events)=>{
        let eventList = '';
        events.forEach((event)=>{
        let eventImg = encodeURI(event.ev_img);
        console.log(eventImg);
        eventList +=
    /******************************* li 태그 *******************/
            `<li>
                <div class="alltext">
                    <div class="imgline">
                        <!-- 행사 포스터 시작 -->
                        <img
                            class="classimg"
                            src="/admin/event/display/${'${eventImg}'}"
                        />
                    </div>
                    <div class="playcontent">
                        <div class="titlename">
                            ${'${event.ev_title}'}
                        </div>
                        <div class="playday">
                            <div>행사기간&nbsp;:&nbsp;</div>
                            <div>
                                ${'${event.ev_today}'}
                            </div>
                        </div>
                        <br />
                        <div class="playspace">
                            <div>장소&nbsp;:&nbsp;</div>
                            <div>
                                ${'${event.ev_place}'}
                            </div>
                        </div>
                        <br />
                        <div class="playtime">
                            <div>시간&nbsp;:&nbsp;</div>
                            <div>
                                ${'${event.ev_time}'}
                            </div>
                        </div>
                        <br/>
                        <div class="playtime">
                            <div>전화번호&nbsp;:&nbsp;</div>
                            <div>
                                ${'${event.ev_time}'}
                            </div>
                        </div>
                        <br/>
                        <div class="status"">
                            <div>상태&nbsp;:&nbsp;</div>
                            <div style="color: red;">
                            ${'${event.mem_status}'}
                    </div>
                </div>
                <div class="playdetail">
                    <button class="pick-btn">
                        <a href="/event/detail?ev_no=${'${event.ev_no}'}">
                            상세보기
                        </a>
                    </button>
                </div>
            </div>
        </div>
        </li>`;


    /******************************* li 태그 *******************/
        })
        return eventList;
    }

    $(document).ready(function (){
        $.ajax({
            type: 'GET',
            url: '/mypage/event/list/all',
            success:((eventList)=>{
                console.log(eventList);
                $('#eventListUl').empty();
                $('#eventListUl').append(toHtml(eventList));
            })
        });
    })

</script>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

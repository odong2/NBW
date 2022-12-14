<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    <title>event</title>
    <style>
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
        .detailcontents {
            list-style: none;
            padding: 40px 0px 39px;
            display: flex;
        }
        #title {
            margin-top: 50px;
            margin-bottom: 100px;
            padding: 15px;
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
            margin-right: 40px;
        }
        .img {
            float: left;
        }
        #classImg {
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
        .bookname {
            margin-left: 10px;
            margin-bottom: 8px;
            font-size: 25px;
            font-weight: bold;
            color: #ff0000;
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
        .phone {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .recruitment {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .buttonpick {
            /*margin-top: 5px;*/
            /*margin-bottom: 5px;*/
            width: 100%;
            display: flex;
            justify-content: center;
        }
        #listBtn {
            margin: 0 5px;
            width: 100px;
            height: 50px;
        }
        #addBtn {
            margin: 0 5px;
            width: 100px;
            height: 50px;
        }
        .programImg {
            margin-right: 30px;
        }
        /************************* [[??????]] **************************/

</style>
</head>
<body>
<!-- ?????? ?????? -->
<%@include file="../../includes/header.jsp" %>
<!-- ?????? ??? -->

<main>
    <session id="title" class="container text-center">
        <h2>???????????? ??????</h2>
    </session>
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

    <ul>
<%--    <c:forEach var="event" items="${eventSelect}">--%>
    <li class="detailcontents">
        <!-- ?????? ?????? ?????? -->
        <div class="picturepeople">
            <!-- ????????? ?????? ?????? -->
            <img
                    id="classImg"/>
            <!-- ????????? ?????? ??? -->
            <div class="picking">
                <span class="receiving">${eventSelect.ev_status}</span>
                <span class="receivingpeople">
                    ${eventSelect.ev_people-eventSelect.ev_nowpeople}
                </span>
            </div>
        </div>
        <!-- ?????? ?????? ??? -->
        <!-- ????????? ?????? ?????? -->
        <div class="detail">
            <span class="bookname">
                ${eventSelect.ev_title}
            </span>
            <div class="bodycontent">
                <div class="playpeople">
                    <div>??????&nbsp;:&nbsp;</div>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_target}
                    </span>
                </div>
                <br />
                <div class="playplace">
                    <span>??????&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_place}
                    </span>
                </div>
                <br />
                <div class="studyday">
                    <span>????????????&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_today}
                    </span>
                </div>
                <br />
                <div class="studytime">
                    <div>??????&nbsp;:&nbsp;</div>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_time}
                    </span>
                </div>
                <br />
                <div class="applicationday">
                    <span>????????????&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_start}
                            ~
                        ${eventSelect.ev_end}
                    </span>
                </div>
                <br />
                <div class="phone">
                    <span>????????????&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_phone}
                    </span>
                </div>
                <br />
                <div class="recruitment">
                    <span>????????????&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_people}???&nbsp;<span style="color: red">(??????:${eventSelect.ev_nowpeople})</span>
                    </span>
                </div>
                <br />
                <div class="recruitment">
                    <span>????????????&nbsp;:&nbsp;</span>
                    <c:set var="file" value="${eventSelect.ev_file}"/>
                    <c:if test="${not empty file}">
                        <c:choose>
                            <%-- ?????? ????????? ?????? --%>
                            <c:when test="${fn:contains(file, '.hwp')}">
                                <img src="/images/hwp.png" width="25px"/>
                                <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:when>
                            <%-- ????????? ?????? ????????? ?????? --%>
                            <c:when test="${fn:contains(file, '.xlsx')}">
                                <img src="/images/xlsx.png" width="20px"/>
                                <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:when>
                            <%-- pdf??? ?????? ????????? ?????? --%>
                            <c:when test="${fn:contains(file, '.pdf')}">
                                <img src="/images/pdf.png" width="23px"/>
                                <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a  href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <c:if test="${empty eventSelect.ev_file}">
                        <span>???????????? ??????</span>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- ????????? ?????? ??? -->
        </li>
        <div>
            <p>${eventSelect.ev_content}</p>
        </div>
    </ul>
    <hr />
    <div class="buttonpick">
        <button id="listBtn" type="button"  class="btn btn-outline-secondary">
            ??????
        </button>
    <c:choose>
        <c:when test="${status.mem_status eq '??????' || status.mem_status eq '??????' ||  status.mem_status eq '??????'}">
        </c:when>
        <c:otherwise>
        <form action="/event/add" method="post">
            <input type="hidden" value="${eventSelect.ev_no}" name="ev_no">
        <button type="submit" id="addBtn"  class="btn btn-outline-success">
            ????????????
        </button>
        </form>
        </c:otherwise>

    </c:choose>
    </div>
</main>

<script>
/****************************************************************************************************/
    $(document).ready(function (){

        let fileImg = encodeURI('${eventSelect.ev_img}');
        $('#classImg').attr('src','/admin/event/display/' + fileImg);

         $('#listBtn').on("click", function (){
            location.href = "<c:url value='/event/list'/>";
         })
        $('#listBtnn').on("click", function (){
            location.href = "<c:url value='/event/list'/>";
        })
        $('#addbtn').on("click", function (){
            if(!confirm("?????? ???????????????????")) return;
            alert("????????? ?????? ??????");
        })
    })
</script>
<!-- ?????? ?????? -->
<%@include file="../../includes/footer.jsp" %>
<!-- ?????? ??? -->
</body>
</html>
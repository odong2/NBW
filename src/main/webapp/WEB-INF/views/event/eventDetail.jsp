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
        /************************* [[댓글]] **************************/

</style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="../../includes/header.jsp" %>
<!-- 헤더 끝 -->

<main>
    <session id="title" class="container text-center">
        <h2>프로그램 신청</h2>
    </session>
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

    <ul>
<%--    <c:forEach var="event" items="${eventSelect}">--%>
    <li class="detailcontents">
        <!-- 왼쪽 그림 시작 -->
        <div class="picturepeople">
            <!-- 이미지 사진 시작 -->
            <img
                    id="classImg"/>
            <!-- 이미지 사진 끝 -->
            <div class="picking">
                <span class="receiving">${eventSelect.ev_status}</span>
                <span class="receivingpeople">
                    ${eventSelect.ev_people-eventSelect.ev_nowpeople}
                </span>
            </div>
        </div>
        <!-- 왼쪽 그림 끝 -->
        <!-- 오른쪽 설명 시작 -->
        <div class="detail">
            <span class="bookname">
                ${eventSelect.ev_title}
            </span>
            <div class="bodycontent">
                <div class="playpeople">
                    <div>대상&nbsp;:&nbsp;</div>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_target}
                    </span>
                </div>
                <br />
                <div class="playplace">
                    <span>장소&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_place}
                    </span>
                </div>
                <br />
                <div class="studyday">
                    <span>행사기간&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_today}
                    </span>
                </div>
                <br />
                <div class="studytime">
                    <div>시간&nbsp;:&nbsp;</div>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_time}
                    </span>
                </div>
                <br />
                <div class="applicationday">
                    <span>접수기간&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_start}
                            ~
                        ${eventSelect.ev_end}
                    </span>
                </div>
                <br />
                <div class="phone">
                    <span>문의전화&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_phone}
                    </span>
                </div>
                <br />
                <div class="recruitment">
                    <span>모집정원&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_people}명&nbsp;<span style="color: red">(신청:${eventSelect.ev_nowpeople})</span>
                    </span>
                </div>
                <br />
                <div class="recruitment">
                    <span>첨부파일&nbsp;:&nbsp;</span>
                    <c:set var="file" value="${eventSelect.ev_file}"/>
                    <c:if test="${not empty file}">
                        <c:choose>
                            <%-- 한글 파일일 경우 --%>
                            <c:when test="${fn:contains(file, '.hwp')}">
                                <img src="/images/hwp.png" width="25px"/>
                                <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:when>
                            <%-- 엑셀일 경우 파일일 경우 --%>
                            <c:when test="${fn:contains(file, '.xlsx')}">
                                <img src="/images/xlsx.png" width="20px"/>
                                <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:when>
                            <%-- pdf일 경우 파일일 경우 --%>
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
                        <span>첨부파일 없음</span>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- 오른쪽 설명 끝 -->
        </li>
        <div>
            <p>${eventSelect.ev_content}</p>
        </div>
    </ul>
    <hr />
    <div class="buttonpick">
        <button id="listBtn" type="button"  class="btn btn-outline-secondary">
            목록
        </button>
    <c:choose>
        <c:when test="${status.mem_status eq '대기' || status.mem_status eq '승인' ||  status.mem_status eq '거절'}">
        </c:when>
        <c:otherwise>
        <form action="/event/add" method="post">
            <input type="hidden" value="${eventSelect.ev_no}" name="ev_no">
        <button type="submit" id="addBtn"  class="btn btn-outline-success">
            신청하기
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
            if(!confirm("신청 하시겠습니까?")) return;
            alert("이벤트 신청 완료");
        })
    })
</script>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
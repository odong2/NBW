<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <%@include file="../../../includes/admin/common.jsp" %>
    <title>관리자 메인페이지</title>
    <style>
        /*********************** 글꼴 **************************/
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body {
            font-family: GangwonEdu_OTFBoldA;}
        /*********************** 글꼴 **************************/
        main {
            color: black;
        }
        .title {
            margin-top: 15px;
        }

        .detailcontents {
            list-style: none;
            padding: 40px 0px 39px;
            display: flex;
        }

        .picking {
            display: flex;
            justify-content: center;
            margin-top: 5px;
        }
        .picturepeople {
            margin-left: 50px;
            margin-right: 40px;
        }
        .classimg {
            width: 210px;
            height: 290px;
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
            font-size: 20px;
            font-weight: bold;
            color: #ff0000;
        }
        .bodycontent {
            margin-left: 50px;
            font-size: 20px;
            font-weight: bold;
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
            margin-top: 5px;
            margin-bottom: 5px;
            width: 100%;
            display: flex;
            justify-content: center;
        }
        #listBtn {
            /*height: 38px;*/
            display: inline-block;
            /*margin: 0 5px;*/
            padding: 0 40px;
            /*padding-left: 40px;*/
            /*pa*/
            /*border: 1px solid #d9d9d9;*/
            color: #fff;
            border: none;
            background-color: #6C757D;
            font-size: 15px;
            line-height: 2.5em;
            vertical-align: top;
            text-align: center;
        }
        #delBtn {
            display: inline-block;
            height: 40px;
            /*margin: 0 5px;*/
            padding: 0 40px;
            background-color: #DC3545;
            border: none;
            color: #fff;
            font-size: 15px;
            line-height: 2.5em;
            vertical-align: top;
        }
        .title {
            margin-bottom: 58px;
        }
        .title > h4 {
        float: left;
        }
        #updBtn {
        float: right;
        }
        .event_content {
         margin-left: 30px;
        }

    </style>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div class="d-flex justify-content-start">
    <!-- Sidebar -->
    <%@include file="../../../includes/admin/sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <!-- [[ 오른쪽 div 시작 ]] -->
    <section class="contentdiv d-flex" style="margin-left: 224px">
        <!-- Topbar -->
        <%@include file="../../../includes/admin/header.jsp" %>
        <!-- End of Topbar -->
        <!-- Main Content -->
        <main class="container-fluid">
            <div class="title">
                <h4 style="color: red; margin-top: 5px;">${eventSelect.ev_title}</h4>
                <button id="updBtn" type="button"  class="btn btn-outline-primary">
                        수정하기
                </button>
            </div>
            <hr />
            <!-- 버튼[등록, 마감] 시작 -->
            <ul>
                <%--    <c:forEach var="event" items="${eventSelect}">--%>
                <li class="detailcontents">
                    <!-- 왼쪽 그림 시작 -->
                    <div class="picturepeople">
                        <!-- 이미지 사진 시작 -->
                        <img
                                class="classimg"
                                src="/admin/event/display/${eventSelect.ev_img}"/>
                        <!-- 이미지 사진 끝 -->
                        <div class="picking">
                            <span class="receiving">접수중</span>
                            <span class="receivingpeople">
                                ${eventSelect.ev_people-eventSelect.ev_nowpeople}
                            </span>
                        </div>
                    </div>
                    <!-- 왼쪽 그림 끝 -->
                    <!-- 오른쪽 설명 시작 -->
                    <div class="detail">
<%--                        <div class="bookname">--%>
<%--                            ${eventSelect.ev_title}--%>
<%--                        </div>--%>
                        <div class="bodycontent">
                            <div class="playpeople">
                                <div>대상&nbsp;:&nbsp;</div>
                                <div style="color: #7c7c7c">
                                    ${eventSelect.ev_target}
                                </div>
                            </div>
                            <br />
                            <div class="playplace">
                                <div>장소&nbsp;:&nbsp;</div>
                                <div style="color: #7c7c7c">${eventSelect.ev_place}</div>
                            </div>
                            <br />
                            <div class="studyday">
                                <div>행사기간&nbsp;:&nbsp;</div>
                                <div style="color: #7c7c7c">${eventSelect.ev_today}</div>
                            </div>
                            <br />
                            <div class="studytime">
                                <div>시간&nbsp;:&nbsp;</div>
                                <div style="color: #7c7c7c">${eventSelect.ev_time}</div>
                            </div>
                            <br />
                            <div class="applicationday">
                                <div>접수기간&nbsp;:&nbsp;</div>
                                <div style="color: #7c7c7c">${eventSelect.ev_start} ~ ${eventSelect.ev_end}</div>
                            </div>
                            <br />
                            <div class="phone">
                                <div>문의전화&nbsp;:&nbsp;</div>
                                <div style="color: #7c7c7c">${eventSelect.ev_phone}</div>
                            </div>
                            <br />
                            <div class="recruitment">
                                <div>모집정원&nbsp;:&nbsp;</div>
                                <div style="color: #7c7c7c">
                                    ${eventSelect.ev_people}
                                        <span style="color: red">(신청:${eventSelect.ev_nowpeople})</span>
                                </div>
                            </div>
                            <br />
                            <div class="recruitment">
                                <div>첨부파일&nbsp;:&nbsp;</div>
                                <c:set var="file" value="${eventSelect.ev_file}"/>
                                <c:if test="${not empty file}">
                                    <c:choose>
                                        <%-- 한글 파일일 경우 --%>
                                        <c:when test="${fn:contains(file, '.hwp')}">
                                            <img src="/images/hwp.png" width="25px"/>
                                            <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                                &nbsp;<c:out value="${eventSelect.ev_filename}"/>
                                            </a>
                                        </c:when>
                                        <%-- 엑셀일 경우 파일일 경우 --%>
                                        <c:when test="${fn:contains(file, '.xlsx')}">
                                            <img src="/images/xlsx.png" width="20px"/>
                                            <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                                &nbsp;<c:out value="${eventSelect.ev_filename}"/>
                                            </a>
                                        </c:when>
                                        <%-- pdf일 경우 파일일 경우 --%>
                                        <c:when test="${fn:contains(file, '.pdf')}">
                                            <img src="/images/pdf.png" width="23px"/>
                                            <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                                &nbsp;<c:out value="${eventSelect.ev_filename}"/>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a  href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                                &nbsp;<c:out value="${eventSelect.ev_filename}"/>
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
                <div class="event_content">
                    ${eventSelect.ev_content}
                </div>
            </ul>
            <div class="buttonpick">
                <button id="listBtn">목록</button>
                <button id="delBtn">삭제</button>
            </div>
            <!-- 표 끝 -->
        </main>
        <!-- Footer -->
        <%@include file="../../../includes/admin/footer.jsp" %>
        <!-- End of Footer -->
        <!-- End of Content Wrapper -->
    </section>
</div>
<!-- [[ 오른쪽 div 끝 ]] -->
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<script>
    $(document).ready(function (){
        $('#listBtn').on("click", function (){
            location.href = "<c:url value='/admin/event/list'/>";
        })
        $("#delBtn").on("click", function (){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            location.href = `/admin/event/delete/${eventSelect.ev_no}`;
        })
        $('#updBtn').on("click", function (){
            location.href = `/admin/event/modify?ev_no=${eventSelect.ev_no}`
        })
    })
</script>
</body>
</html>
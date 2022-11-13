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
            font-family: 'InfinitySans-RegularA1';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        *{
            font-family: 'InfinitySans-RegularA1';
        }
        /*********************** 글꼴 **************************/
        main {
            color: black;
        }
        .title {
            margin-top: 15px;
        }
        .twobtn {
            float: right;
            margin-right: 40px;
            margin-bottom: 15px;
        }
        /* 등록버튼 */
        .registerbtn {
            background-color: #e0e0e0;
            color: black;
            border: 0;
            outline: 0;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 2.5px;
            padding-bottom: 2.5px;
        }
        .check > input {
            width: 22px;
            height: 22px;
        }
        tr {
            text-align: center;
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
                <h4>프로그램 관리</h4>
            </div>
            <hr />
            <!-- 버튼[등록, 마감] 시작 -->
            <div class="twobtn">
                <button class="registerbtn" type="button" id="writeBtn"
                        onclick="location.href='<c:url value="/admin/event/write"/>'">등록</button>
            </div>
            <!-- 버튼[등록, 마감] 끝 -->
            <!-- 표 시작 -->
            <div class="container">
                <table class="table table-striped" class="table">
                    <thead>
                    <tr>
                        <th>구분</th>
                        <th>제목</th>
                        <th>행사날짜</th>
                        <th>시간</th>
                        <th>접수기간</th>
                        <th>모집정원</th>
                        <th>상태</th>
                        <th>신청자보기</th>
                    </tr>
                    </thead>
                <c:forEach var="event" items="${eventSelectAll}">
                    <tbody>
                    <tr>
                        <td>
                            <c:out value="${event.ev_no}"/>
                        </td>
                        <td>
                            <a href="/admin/event/detail?ev_no=${event.ev_no}">
                            <c:out value="${event.ev_title}"/>
                            </a>
                        </td>
                        <td>
                            <c:out value="${event.ev_today}"/>
                        </td>
                        <td>
                            <c:out value="${event.ev_time}"/>
                        </td>
                        <td>
                            <c:out value="${event.ev_start}"/>
                            &nbsp;~&nbsp;
                            <c:out value="${event.ev_end}"/>
                        </td>
                        <td>
                            <c:out value="${event.ev_people}"/>
                            /
                            <c:out value="${event.ev_nowpeople}"/>
                        </td>
                        <td>
                            <c:out value="${event.ev_status}"/>
                        </td>
                        <td>
                            <button id="applicationbtn" type="button" class="btn btn-outline-primary btn-sm">
                                <a href="/admin/event/applicant?ev_no=${event.ev_no}">
                                    신청자
                                </a>
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>
                </table>
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
    <%--$(document).ready(function (){--%>
    <%--    $("#applicationbtn").on("click", function (){--%>
    <%--        location.href = '/admin/event/applicant?ev_no=${event.ev_no}';--%>
    <%--    })--%>
    <%--})--%>

</script>
</body>
</html>
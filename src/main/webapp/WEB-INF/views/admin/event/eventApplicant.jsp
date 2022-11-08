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
        .title {
            margin-top: 15px;
            margin-bottom: 30px;
        }
        .okbtn {
            border: 0;
            background-color: #e0e0e0;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 2.5px;
            padding-bottom: 2.5px;
            margin-right: 5px;
            color: blue;
            font-weight: normal;
        }
        .delbtn {
            border: 0;
            background-color: #e0e0e0;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 2.5px;
            padding-bottom: 2.5px;
            color: red;
            font-weight: normal;
        }
        tr {
            text-align: center;
        }
        .eventname {
            color: red;
            font-size: 13px;
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
                <h4>신청자 관리&nbsp;<span class="eventname"><c: value="${event.ev_no}"/></span></h4>
            </div>
            <!-- 표 시작 -->
            <div class="container">
                <table class="table table-striped" class="table">
                    <thead>
                    <tr>
                        <th>no</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>생년월일</th>
                        <th>성별</th>
                        <th>휴대폰번호</th>
                        <th>선택</th>
                    </tr>
                    </thead>
                    <c:forEach var="event" items="${adminEventPerson}">
                    <tbody>
                    <tr>
                        <td>
                            5
                        </td>
                        <td>
                            <c:out value="${event.mem_name}"/>
                        </td>
                        <td>
                            <c:out value="${event.mem_email}"/>
                        </td>
                        <td>
                            <c:out value="${event.mem_birthday}"/>
                        </td>
                        <td>
                            <c:out value="${event.mem_gender}"/>
                        </td>
                        <td>
                            <c:out value="${event.mem_phone}"/>
                        </td>
                        <td><button class="okbtn">승인</button><button class="delbtn">삭제</button></td>
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
</body>
</html>
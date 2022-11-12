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
        .listbtn {
            float: right;
            margin-right: 40px;
            margin-bottom: 15px;
        }
        #delbtn {
        }
        #okbtn {
        }
        tr {
            text-align: center;
        }
        .eventname {
            color: red;
            font-size: 20px;
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
                <h3>신청자 관리&nbsp;
                    <span class="eventname">
                        ${eventSelect.ev_title}
                    </span>
                </h3>
            </div>
            <!-- 표 시작 -->
            <div class="listbtn">
                <button id="listBtn" type="button"  class="btn btn-outline-secondary">
                    목록
                </button>
            </div>
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
                    <c:forEach var="eventMember" items="${adminEventPerson}">
                    <tbody>
                        <tr>
                            <td>
                                1
                            </td>
                            <td>
                                <c:out value="${eventMember.mem_name}"/>
                            </td>
                            <td>
                                <c:out value="${eventMember.mem_email}"/>
                            </td>
                            <td>
                                <c:out value="${eventMember.mem_birthday}"/>
                            </td>
                            <td>
                                <c:out value="${eventMember.mem_gender}"/>
                            </td>
                            <td>
                                <c:out value="${eventMember.mem_phone}"/>
                            </td>
                            <td style="float: right">
                                <span style="float: left">
                                <form action="/admin/event/personn" method="post">
                                    <input type="hidden" value="${eventSelect.ev_no}" name="ev_no">
                                    <input type="hidden" value="${eventMember.mem_id}" name="mem_id">
                                <button id="delbtn" type="submit" class="btn btn-outline-danger">
                                    거절
                                </button>
                                </span>
                                <span style="float: right">
                                </form>
                                <form action="/admin/event/persony" method="post">
                                        <input type="hidden" value="${eventSelect.ev_no}" name="ev_no">
                                        <input type="hidden" value="${eventMember.mem_id}" name="mem_id">
                                <button id="okbtn" type="submit"  class="btn btn-outline-primary">
                                    승인
                                </button>
                                </form>
                                </span>
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
<%--============================== [이벤트 버튼] ==============================--%>
<script>
    $(document).ready(function (){
        <%--$("#delbtn").on("click", function (){--%>
        <%--if(!confirm("정말로 삭제하시겠습니까?")) return;--%>
        <%--let form = $('#form');--%>
        <%--form.attr("action", "<c:url value="/admin/event/deleteperson/${eventSelect.ev_no}"/>");--%>
        <%--form.attr("method", "post");--%>
        <%--    form.submit();--%>
        <%--})--%>

        $("#delbtn").on("click", function (){
            if(!confirm("거절 하시겠습니까?")) return;
            alert("거절 완료");
        })
        $("#okbtn").on("click", function (){
            if(!confirm("승인 하시겠습니까?")) return;
            alert("승인 완료");
        })

        $('#listBtn').on("click", function (){
            location.href = "<c:url value='/admin/event/list'/>";
        })
    })
</script>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
</body>
</html>
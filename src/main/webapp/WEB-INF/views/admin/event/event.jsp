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
        /* 마감버튼 */
        .deadlinebtn {
            background-color: #e0e0e0;
            color: black;
            border: 0;
            outline: 0;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 2.5px;
            padding-bottom: 2.5px;
        }
        .check {
            text-align: center;
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
                <button class="deadlinebtn">마감</button>
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
                        <th>선택</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>5</td>
                        <td>채은이와 함께하는 코딩</td>
                        <td>2022.10.18</td>
                        <td>12:00~13:00</td>
                        <td>2022.10.15 &nbsp;~&nbsp; 2022.10.17</td>
                        <td>10/30명</td>
                        <td>
                            <div class="check"><input type="checkbox" id="vehicle5" name="vehicle5" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>유리와 함께하는 코딩</td>
                        <td>2022.10.18</td>
                        <td>12:00~13:00</td>
                        <td>2022.10.15 &nbsp;~&nbsp; 2022.10.17</td>
                        <td>10/30명</td>
                        <td>
                            <div class="check"><input type="checkbox" id="vehicle4" name="vehicle4" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>동현이와 함께하는 코딩</td>
                        <td>2022.10.18</td>
                        <td>12:00~13:00</td>
                        <td>2022.10.15 &nbsp;~&nbsp; 2022.10.17</td>
                        <td>10/30명</td>
                        <td>
                            <div class="check"><input type="checkbox" id="vehicle3" name="vehicle3" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>민준이와 함께하는 코딩</td>
                        <td>2022.10.18</td>
                        <td>12:00~13:00</td>
                        <td>2022.10.15 &nbsp;~&nbsp; 2022.10.17</td>
                        <td>10/30명</td>
                        <td>
                            <div class="check"><input type="checkbox" id="vehicle2" name="vehicle2" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>종국이와 함께하는 코딩</td>
                        <td>2022.10.18</td>
                        <td>12:00~13:00</td>
                        <td>2022.10.15 &nbsp;~&nbsp; 2022.10.17</td>
                        <td>10/30명</td>
                        <td>
                            <div class="check"><input type="checkbox" id="vehicle1" name="vehicle1" /></div>
                        </td>
                    </tr>
                    </tbody>
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
    $(document).ready(function (){
        $('#listBtn').on("click", function (){
            location.href = "<c:url value='/event/list'/>";
        })
    })
</script>
</body>
</html>
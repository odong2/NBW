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
            margin-right: 120px;
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

        .divTitle {
            margin-top: 10px;
            font-size: large;
        }
        .col_box {
            margin-top: 15px;
        }
        th > label {
            margin-left: 15px;
            margin-right: 15px;
        }
        .typePick {
            width: 300px;
        }
        .inputtitle {
            margin-top: 20px;
        }
        #dbtn{
            width: 150px;
            height: 50px;
            color: white;
            background-color: #767676;
            font-weight: 500;
        }
        #sendbtn {
            width: 150px;
            height: 50px;
            color: white;
            background-color: #4F55B1;
            font-weight: 500;
        }
        .twobutton {
            margin-top: 10px;
            /*margin-left: 150px;*/
        }
        th {
            text-align: center;
        }
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
            <div class="divTitle">문의접수</div>
            <hr />
            <form action="" method="post" id="form" class="frm">
            <div>
                <table class="tbl_row">
                    <tbody>
                    <%--[[문의 유형]]--%>
                    <tr>
                        <th scope="row">
                            <label>문의유형</label>
                        </th>
                        <td>
                            <div class="typePick">
                                <select class="form-control" name="qn_category" style="width: 600px; height: 45px">
                                    <option selected>선택</option>
                                    <option value="제품">제품</option>
                                    <option value="교환">교환</option>
                                    <option value="반품">반품</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <%--[[문의 유형]]--%>
                    <%--[[내용]]--%>
                    <tr>
                        <th scope="row" style="padding-top: 25px">
                            <label for="InquiryTitle">제목</label>
                        </th>
                        <td>
                            <div class="form_col_group w_full">
                                <div class="inputtitle" >
                                    <%--[[제목입력란]]--%>
                                        <input type="hidden" name="qn_from" value="${sessionScope.qnfrom}" />
                                    <input
                                            data-kbbfn-field=""
                                            id="InquiryTitle"
                                            name="qn_title"
                                            type="text"
                                            class="form_ip w_full"
                                            title="제목 입력"
                                            placeholder="제목을 입력해 주세요."
                                            style="width: 600px; height: 45px"
                                            required=""
                                            maxlength="30"
                                    />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="thtitlet">
                            <label for="InquiryTitle">내용</label>
                        </th>
                        <td>
                                <div class="col_box" style="word-wrap:break-word;">
                                    <textarea
                                        data-kbbfn-field=""
                                        id="InquiryContent"
                                        name="qn_content"
                                        type="text"
                                        class="form_textarea"
                                        title="문의 내용 입력"
                                        placeholder="빠른 답변을 위해 10자 이상의 문의 내용을 입력해 주세요."
                                        maxlength="500"
                                        style="height: 246px; width: 600px; resize: none; font-size: 25px"
                                        required=""
                                    ></textarea>
                                </div>
                        </td>
                    </tr>
                    <%--[[취소&접수 버튼]]--%>
                    <tr>
                        <td>
                        <th scope="row">
                            <div class="twobutton">
                                <button type="button" class="btn btn-secondary btn-lg" id="dbtn">목록</button>
                                <button type="button" type="submit" class="btn btn-primary btn-lg" id="sendbtn">문의접수</button>
                            </div>
                        </th>
                        </td>
                    </tr>
                   <%-- [[취소&접수 버튼]]--%>
                    </tbody>
                </table>
            </div>
            </form>
    </main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<script>
    $(document).ready(function(){
        // 목록으로 가기
        $("#dbtn").on("click", function (){
            location.href = "<c:url value="/mypage/qna/list"/>";
        })
        // 문의 접수하기
        $("#sendbtn").on("click", function (){
            let form = $("#form");
            form.attr("action", "<c:url value="/mypage/qna/write"/> ");
            form.attr("method", "post");
            form.submit();
        })
    })
</script>
<!-- 풋터 시작 -->
<%@include file="../../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

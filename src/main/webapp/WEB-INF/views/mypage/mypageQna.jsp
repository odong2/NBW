<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    <title>MyPage</title>
    <style>
        /**{*/
        /*    border: 1px solid red;*/
        /*}*/
        main {
            width: 100%;
        }
        main .header-list {
            border: 1px solid rgba(204, 204, 204, 0.8);
            width: 200px;
            height: 100px;
            border-radius: 7px;
            font-size: 0.8rem;
            padding: 5px;
        }
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
            margin-left: 50px;
        }
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="../../includes/header.jsp" %>
<!-- 헤더 끝 -->
<!-- 마이 페이지 시작 -->
<section class="mypage wrapper d-flex">
    <!-- 사이드바 시작-->
    <%@include file="../../includes/sidebar.jsp" %>
    <!-- 사이드바 끝-->
    <%-- ==================== 메인 시작==================--%>
    <main>
        <%-- ==================== 마이 페이지 타이틀 ==================--%>

        <%-- ==================== 주문조회 페이지 헤더 시작 ==================--%>
        <header>
        </header>
        <%-- ==================== 주문조회 페이지 헤더 끝 ==================--%>
            <div class="divTitle">문의 접수</div>
            <hr />
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
                                <select class="" style="width: 600px; height: 45px">
                                    <option selected>선택</option>
                                    <option value="1">제품</option>
                                    <option value="2">교환</option>
                                    <option value="3">반품</option>
                                    <option value="4">기타</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <%--[[문의 유형]]--%>
                    <%--[[내용]]--%>
                    <tr>
                        <th scope="row" class="has_ip">
                            <label for="InquiryTitle">내용</label>
                        </th>
                        <td>
                            <div class="form_col_group w_full">
                                <div class="inputtitle" >
                                    <%--[[제목입력란]]--%>
                                    <input
                                            data-kbbfn-field=""
                                            id="InquiryTitle"
                                            type="text"
                                            class="form_ip w_full"
                                            title="제목 입력"
                                            placeholder="제목을 입력해 주세요."
                                            style="width: 600px; height: 45px"
                                            required=""
                                            maxlength="30"
                                    />
                                </div>
                                <%--[[제목입력란]]--%>
                                <%--[[문의내용]]--%>
                                <div class="col_box">
                                    <textarea
                                        data-kbbfn-field=""
                                        id="InquiryContent"
                                        class="form_textarea"
                                        title="문의 내용 입력"
                                        placeholder="빠른 답변을 위해 10자 이상의 문의 내용을 입력해 주세요."
                                        maxlength="500"
                                        style="height: 246px; width: 600px"
                                        required=""
                                    ></textarea>
                                </div>
                                <%--[[문의내용]]--%>
                            </div>
                        </td>
                    </tr>
                    <%--[[취소&접수 버튼]]--%>
                    <tr>
                        <td>
                        <th scope="row">
                            <div class="twobutton">
                                <button type="button" class="btn btn-secondary btn-lg" id="dbtn">취소</button>
                                <button type="button" class="btn btn-primary btn-lg" id="sendbtn">문의접수</button>
                            </div>
                        </th>
                        </td>
                    </tr>
                   <%-- [[취소&접수 버튼]]--%>
                    </tbody>
                </table>
            </div>
    </main>
    <%-- ==================== 메인 끝 ==================--%>
</section>
<!-- 마이 페이지 끝 -->
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

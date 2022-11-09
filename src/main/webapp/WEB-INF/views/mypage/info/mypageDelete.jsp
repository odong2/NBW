<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../../includes/common.jsp" %>
    <%--  daum postcode  --%>
    <%@include file="../../../includes/daumPostCode.jsp" %>
    <link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
    <title>MyPage</title>
    <script type="text/javascript">

        $(function(){
            $('#btn-delete').click(function(e){

                if(confirm("정말로 탈퇴하시겠습니까?")){
                    let isChecked = false;
                    if($('#radio1').is(':checked') && $('#radio2').is(':checked')) isChecked = true;

                    if(!isChecked){
                        alert("동의는 필수사항입니다.");
                        e.preventDefault();
                        $('.radio').focus();
                        return;
                    }else{
                        $('#deleteForm').attr("action", "/mypage/remove");
                        $('#deleteForm').attr("method", "post");
                        $('#deleteForm').submit();
                    }
                }
            })
        })
    </script>
    <style>
        /** {*/
        /*    border: red solid 1px;*/
        /*}*/
        main {
            width: 70%;
            margin:auto;
        }
        a {
            color: black;
        }
        .card {
            border-radius: 10px;
            width: 20rem;
            height: 10rem;
            padding: 45px 20px;
            margin: auto;
        }
        .card-text {
            float: right;
            text-align: center;
        }
    </style>
</head>
    <body>
    <!-- 헤더 시작 -->
    <%@include file="../../../includes/header.jsp" %>

    <!-- 회원 탈퇴 페이지 시작 -->
    <section class="mypage wrapper d-flex">
        <%-- ==================== 메인 시작==================--%>
        <main>
        <!-- 페이지 컨텐츠 레이아웃 -->
        <%-- =========================== MEMBER 기본 정보 FORM 시작 ========================== --%>
            <form id="deleteForm">
                <div class="row"><h4> <strong>회원탈퇴</strong> </h4></div><br><br>
                <div class="row">
                    <div class="col-12"><h6><strong>${sessionScope.member.getMem_name()}</strong> 님의 보유 이용 정보 </h6></div>
                    <input type="text" name="mem_id" value="${sessionScope.member.getMem_id()}" hidden/>
                </div>
                <hr style="border: solid 1px black;">

                <div class="row">
                    <div class="card">
                        <div class="card-body d-inline-flex">
                            <div class="col"><h5 class="card-title">진행 중 주문</h5></div>
                            <div class="col"><a href="#"><p class="card-text">${sessionScope.member.getMem_point()} 건</p></a></div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body d-inline-flex">
                            <div class="col"><h5 class="card-title">등급</h5></div>
                            <div class="col"><p class="card-text" style="background-color: #f8e886; border-radius: 10px; width: 80px">${sessionScope.member.getG_grade()}</p></div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body d-inline-flex">
                            <div class="col"><h5 class="card-title">통합 포인트</h5></div>
                            <div class="col"><a href="#"><p class="card-text">${sessionScope.member.getMem_point()} P</p></a></div>
                        </div>
                    </div>
                </div>

                <br>
                <div class="card" style="width: 100%; border-style: none; background-color: #f1f2f6; padding: 10px 10px;">
                    <div class="card-body">
                        <h6><strong>회원 탈퇴 시 유의사항</strong></h6>
                        <p style="color: #5e6269; font-size: smaller;">
                        ∙ 회원탈퇴 시 모든 회원정보와 <span style="color: red">할인쿠폰, 통합포인트, 구매내역</span>이 자동으로 삭제 처리되며, 복구가 불가합니다<br>
                        ∙ 회원가입 유형에 따라 엔비더 또는 네이버, 카카오 소셜로그인 회원탈퇴가 동시에 진행됩니다.<br>
                        ∙ 회원 아이디에 대해서는 서비스 이용의 혼선 방지, 법령에서 규정하는 회원 거래 정보의 보존 기간 동안의 보관 의무의 이행, 기타 안정적인 서비스 제공을 위하여 필요한 정보이므로 <br>
                            &nbsp;&nbsp; 탈퇴 후 동일 아이디로의 재가입은 허용되지 않습니다.
                        </p>
                    </div>
                </div>
                <br>
                <div class="card" style="width: 100%; height: 80px; border-style: none; background-color: #f1f2f6; padding: 5px 10px;">
                    <div class="card-body">
                        <label class="radio-inline" style="font-size: smaller"><input class="radio" id="radio1"  type="radio">
                            회원탈퇴 안내 사항을 확인했으며 탈퇴에 동의합니다.<span style="color: lightseagreen">&nbsp;(필수)</span>
                        </label>
                        <br>
                        <label class="radio-inline"  style="font-size: smaller"><input class="radio" id="radio2" type="radio" >
                            모든 금권 혜택 자동 소멸에 동의합니다.<span style="color: lightseagreen">&nbsp;(필수)</span>
                        </label>
                    </div>
                </div>
                <br>
                <div class="card" style="padding: 5px 10px; width: 100%; border-style: none; height: 120px; background-color: #f1f2f6;">
                    <div class="card-body" style="font-size: medium;">
                        <h6><strong>비밀번호 입력</strong></h6>
                        <input type="password" name="mem_pw" id="mem_pw" placeholder="비밀번호를 입력해 주세요." autocomplete="off"  style="border-radius: 5px; border-style: none; width: 200px">
                        <c:if test="${msg == false}">
                            <span style="color: red; font-size: smaller;"> &nbsp;&nbsp;💡️비밀번호를 확인해 주세요.</span>
                        </c:if>
                    </div>
                </div>
                <br>

                <%-- 버튼 ROW  --%>
                <div class="row m-auto text-center" >
                    <div class="col-4"></div>
                    <div class="col-4">
                        <button id="btn-cancel"
                                class="btn btn-success btn-lg m-2"
                                style="background-color: #9d9d9d"> 취소 </button>
                        <button id="btn-delete"
                                class="btn btn-primary btn-lg m-2"
                                style="background-color: #3b5998;"> 확인 </button>
                    </div>
                    <div class="col-4"></div>
                </div>
            </form>
            <%-- =========================== MEMBER 기본 정보 FORM 끝 ========================== --%>
        </main>
        <%-- ==================== 메인 끝 ==================--%>
    </section>
    <!-- 마이 페이지 끝 -->
    <!-- 풋터 시작 -->
    <%@include file="../../../includes/footer.jsp" %>
    <!-- 풋터 끝 -->
    </body>
    </html>

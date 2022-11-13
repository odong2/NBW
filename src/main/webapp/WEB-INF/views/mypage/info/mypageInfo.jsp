<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../../includes/common.jsp" %>
    <%--  daum postcode  --%>
    <%@include file="../../../includes/daumPostCode.jsp" %>
    <link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
    <title>MyPage</title>
    <style>

        main {
            width: 100%;
            padding-left: 30px;
        }

        a {
            color: black;
        }
        
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
	    }
	
	    main .header-list {
	        border: 1px solid rgba(204, 204, 204, 0.8);
	        width: 100%;
	        height: 100px;
	        border-radius: 7px;
	        font-size: 0.8rem;
	        padding: 5px;
	    }
    </style>
    </head>
    <body>
    <!-- 헤더 시작 -->
    <%@include file="../../../includes/header.jsp" %>

    <script type="text/javascript">
        let code = ""; // 이메일 전송 인증번호 저장을 위한 코드

        /* 수정 유효성 검사 통과 유무 변수 */
        let mailCheck = false;            // 이메일
        let mailCodeCheck = false;          // 이메일 인증 코드 일치
        let addressCheck = false            // 주소
        let nicknameCheck = false;

        $(function(){
            /* ============================ 수정 요청 전송 ========================== */
            $("#btn-update").click(function(e){

                /* 입력칸 변수 */
                let nick = $("#mem_nickname").val();
                let mail = $("#mem_email").val();        // 메일주소 입력란
                let addr1 = $('#address1').val();        // 우편번호 입력란
                let addr2 = $('#address2').val();        // 주소 입력란
                let addr3 = $('#address3').val();        // 상세주소 입력란

                alert("수정할 내용 > " + nick + mail + addr1 + addr2 + addr3);


                /* 메일 유효성 검사 */
                if(mail == null || mail ==""){
                    // 메일이 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_mail_ck').attr("hidden", false);
                }else{
                    // 메일이 정상적으로 입력이 되었다면 통과 유무를 true 로 변경한다.
                    $('.final_mail_ck').attr("hidden", true);
                    mailCheck = true;
                }

                /* 주소 유효성 검사 => 우편번호, 주소, 상세주소 모두가 입력이 되어있어야 함. */
                if((addr1 == null || addr1.trim() == "") || (addr2 == null || addr2.trim() == "") || (addr3 == null || addr3.trim() == "") ){
                    // 주소가 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_addr_ck').attr("hidden", false);
                }else{
                    // 주소가 정상적으로 입력이 되었다면 통과 유무를 true 로 변경한다.
                    $('.final_addr_ck').attr("hidden", true);
                    addressCheck = true;
                }

                if(!mailCheck || !mailCodeCheck || !addressCheck || !nicknameCheck){
                    /* 자동 새로고침 방지 */
                    e.preventDefault();
                    return;
                }else{
                    let result = confirm("입력한 정보로 수정하시겠습니까?");
                    if(result){
                        $("input[name=mem_nickname]").val(nick);
                        $("input[name=mem_email]").val(mail);
                        $("input[name=mem_zipcode]").val(addr1);
                        $("input[name=mem_address1]").val(addr2);
                        $("input[name=mem_address2]").val(addr3);
                        alert("수정할 내용 > " + nick + mail + addr1 + addr2 + addr3);

                        $("#updateForm").attr("action", "/mypage/info");
                        $("#updateForm").attr("method", "POST");
                        $("#updateForm").submit();
                    }
                }
            })

            /* ============================ 닉네임 변경 이벤트 ========================== */
            $("#upBtn-nickname").click(function(){
                // 기존 닉네임 숨긴다.
                $("#lb-nickname").attr("hidden", true);
                // 변경 버튼을 숨긴다.
                $("#upBtn-nickname").attr("hidden", true);
                // 닉네임 입력 칸이 나타난다.
                $("#mem_nickname").val("");
                $("#mem_nickname").attr("hidden", false);
            });

            $('#mem_nickname').keyup(function (){
                let nickname = $(this).val();

                /* nickname < 4 */
                if(nickname.length < 2){
                    $('#nicknameCheckDiv').removeClass("alert-success");
                    $('#nicknameCheckDiv').addClass("alert-danger");
                    $('#nicknameCheckDiv').text("닉네임은 두 글자 이상 입력하셔야 합니다.");
                    nicknameCheck = false; // 가입 불가
                    return;
                }
                /* id > 20 */
                if(nickname.length > 20){
                    $('#nicknameCheckDiv').removeClass("alert-success");
                    $('#nicknameCheckDiv').addClass("alert-danger");
                    $('#nicknameCheckDiv').text("닉네임은 20이내로 입력하셔야 합니다.");
                    nicknameCheck = false; // 가입 불가
                    return;
                }

                $("#nicknameCheckDiv").load("/member/nicknameCheck?nickname="+nickname, function(result){
                    if(result.indexOf("가능한")){
                        // 중복이 되지 않은 경우
                        $('#nicknameCheckDiv').addClass("alert-success");
                        $('#nicknameCheckDiv').removeClass("alert-danger");
                        // 중복이 되지 않은 경우 가입이 가능하다.
                        nicknameCheck = true;
                    } else {
                        // 중복된 경우
                        $('#nicknameCheckDiv').removeClass("alert-success");
                        $('#nicknameCheckDiv').addClass("alert-danger");
                        // 중복이 된 경우 가입을 막는다.
                        nicknameCheck = false;
                    }
                });
            })

            /* ============================ 주소 변경 이벤트 ========================== */
            $("#upBtn-addr").click(function(){
                // 우편번호, 주소, 상세주소 칸이 활성화 된다.
                $("#address1").attr("readonly", false);
                $("#address2").attr("readonly", false);
                $("#address3").attr("readonly", false);
                $("#address3").val("");
            });

            /* ============================ 메일 변경 이벤트 ========================== */
            $("#upBtn-mail").click(function(){
                // 기존 이메일 숨긴다.
                $("#lb-mail").attr("hidden", true);
                // 변경 버튼을 숨긴다.
                $("#upBtn-mail").attr("hidden", true);
                // 이메일 입력 칸이 나타나고 기존 이메일을 비운다.
                $("#mem_email").val("");
                $("#mem_email").attr("hidden", false);
                // 인증코드 전송 버튼이 나타난다.
                $("#btn-email-send").attr("hidden", false);
            });

            /* ========================== 인증번호 전송 이벤트 ========================== */
            $("#btn-email-send").click(function(){
                let email = $("#mem_email").val();
                // 메일이 입력되지 않으면 경고창이 뜬다.
                if(email == null || email === "") alert("이메일 주소를 입력해 주세요.");
                else {
                    alert(email + "로 이메일을 전송하였습니다.");
                        /* (2) ajax 코드를 추가한다 > controller 에 요청할 때 화면이 전환되는 것을 방지 */
                        $.ajax({
                            type: "GET",
                            url: "/mail/mailCheck?email=" + email,
                            success: function (data) {
                                /* Controller 단에서 반환받은 랜덤코드가 잘 전송되는 지 확인 */
                                console.log("data : " + data);
                                /* 인증번호 입력 칸의 hidden 속성을 true -> false 로 변경한다. */
                                $("#mem_email_num").attr("hidden", false);
                                $("#message").attr("hidden", false);
                                /* Controller 로부터 전달받은 인증번호를 위에서 선언한 code 변수에 새로 할당한다. */
                                code = data;
                                console.log("code : " + code); // 할당이 되었는지 확인
                            }
                        });
                    }
                });

            /* ===================================== 발송된 인증번호 비교  ===================================== */
            $("#mem_email_num").blur(function (){
                let inputCode = $("#mem_email_num").val(); // 입력한 코드
                let checkResult = $("#mail_check_input_box_warn"); // 비교 결과
                if(inputCode !== code){
                    checkResult.addClass("alert-danger");
                    checkResult.text("인증번호가 일치하지 않습니다.");
                } else{
                    checkResult.removeClass("alert-danger");
                    checkResult.addClass("alert-success");
                    checkResult.text("인증번호가 일치합니다.");
                    // 인증번호가 일치한다면 통과 유무를 true 로 변경한다.
                    mailCodeCheck = true;
                }
            });
        });

    </script>
    <!-- 헤더 끝 -->
    <!-- 마이 페이지 시작 -->
    <section class="mypage wrapper d-flex">
    <!-- 사이드바 시작-->
    <%@include file="../../../includes/sidebar.jsp" %>
    <!-- 사이드바 끝-->
        <%-- ==================== 메인 시작==================--%>
        <main>
        <!-- 페이지 컨텐츠 레이아웃 -->
        <%-- =========================== MEMBER 기본 정보 FORM 시작 ========================== --%>
            <form id="updateForm" style="padding: 50px 250px 50px 70px;">
                <div class="row"><h4> <strong>개인정보 수정</strong> </h4></div><br><br>
                <div class="row">
                    <div class="col-3"><h6> 기본 정보 </h6></div>
                    <div class="col-3"></div>
                    <div class="col-6" style="text-align: right;"> <p style="font-size: x-small">마지막 수정일은
                        <strong>
                            <fmt:parseDate value="${sessionScope.member.getMem_update()}" var="dateType" pattern="yyyy-MM-dd"/>
                            <fmt:formatDate value="${dateType}"  pattern="yyyy-MM-dd"/>
                        </strong>
                        입니다.
                    </div>
                </div>
                <hr style="border: solid 1px black;">
                <!-- 아이디 정보  -->
                <div class="row m-4">
                    <div class="col-3">
                        <h6><strong>아이디</strong></h6>
                        <input type="text" name="mem_id" value="${sessionScope.member.getMem_id()}" hidden/>
                    </div>
                    <div class="col-8 mb-3">
                        <div class="input-group mb-3 w-100">
                            <label>${sessionScope.member.getMem_id()}</label>
                        </div>
                    </div>
                </div>
                <!-- 이름 정보  -->
                <div class="row m-4">
                    <div class="col-3">
                        <h6><strong>이름</strong></h6>
                    </div>
                    <div class="col-8 mb-3">
                        <div class="input-group mb-3 w-100">
                            <label>${sessionScope.member.getMem_name()}</label>
                        </div>
                    </div>
                </div>
                <hr>
                <!-- 닉네임 정보  -->
                <div class="row m-4">
                    <div class="col-3">
                        <h6><strong>닉네임</strong></h6>
                    </div>
                    <div class="col-8 mb-3">
                        <div class="input-group mb-3 w-100">
                            <label id="lb-nickname">${sessionScope.member.getMem_nickname()}</label>
                            <input name="mem_nickname" type="text" id="mem_nickname" hidden
                                   autocomplete="off" class="form-control" aria-describedby="button-addon2"
                                   value="${sessionScope.member.getMem_nickname()}"
                                   placeholder="닉네임을 입력해 주세요." style="background-color: #fffbc5; border-radius: 5px">
                            <button class="btn-circle" id="upBtn-nickname" type="button" style="float: right; border-radius: 10px; border: 0; margin-left: 10px;">변경</button>
                        </div>
                        <div class = "alert alert-dismissible " id="nicknameCheckDiv"></div>                </div>
                    </div>
                </div>
                <hr>
                <!-- 생년월일, 성별 정보  -->
                <div class="row m-4">
                    <div class="col-3">
                        <h6><strong>생년월일/성별</strong></h6>
                    </div>
                    <div class="col-8 mb-3">
                        <div class="input-group mb-3 w-100">
                            <label> ${sessionScope.member.getMem_birthday()} / ${sessionScope.member.getMem_gender()} </label>
                        </div>
                    </div>
                </div>
                <!-- 전화번호  -->
                <div class="row m-4">
                    <div class="col-3">
                        <h6><strong>전화번호</strong></h6>
                    </div>
                    <div class="col-8 mb-3">
                        <div class="input-group mb-3 w-100">
                            <label> ${sessionScope.member.getMem_phone()} </label>
                        </div>
                    </div>
                </div>
                <!-- 이메일 입력 ROW입니다. -->
                <div class="row m-4">
                    <div class="col-3">
                        <h6><strong>이메일 주소</strong></h6>
                        <span class="final_mail_ck" style="font-size: 5px; color: red" hidden>이메일을 입력해 주세요.</span>
                    </div>
                    <div class="col-8 mb-3">
                        <div class="input-group mb-3 w-100">
                            <label id="lb-mail"> ${sessionScope.member.getMem_email()}</label>
                            <input name="mem_email" type="text" id="mem_email" hidden
                                   autocomplete="off" class="form-control" aria-describedby="button-addon2"
                                   value="${sessionScope.member.getMem_email()}"
                                   placeholder="이메일을 입력해 주세요." style="background-color: #fffbc5; border-radius: 5px">
                            <button name="btn-email-send" id="btn-email-send" hidden
                                    class="btn btn-outline-secondary" type="button" style="border-radius: 2px" >인증번호 전송</button>
                            <button class="btn-circle" id="upBtn-mail" type="button" style="float: right; border-radius: 10px; border: 0; margin-left: 10px;">변경</button>
                            <span class="mailCode-ck" style="font-size: 5px; color: red" hidden></span>
                        </div>
                        <div class="row"><span id="message" hidden><p style="font-size: small; color: #535759">인증번호가 전송되었습니다. 미전송 시 이메일 주소를 확인해 주세요.</p></span></div>
                    </div>
                </div>
                <div class="row m-4">
                    <div class="col-3"></div>
                    <div class="col-8 mb-3">
                        <div class="input-group mb-3 w-100">
                            <input type="text" id="mem_email_num" hidden
                                   autocomplete="off" class="form-control" aria-describedby="button-addon2" placeholder="인증번호 6자리" style="background-color: #fffbc5; border-radius: 5px">
                        </div>
                        <div class="row">
                            <span id="mail_check_input_box_warn"></span>
                        </div>
                    </div>
                </div>
                <!-- 주소 ROW : 우편번호  -->
                <div class="row m-4">
                    <div class="col-3">
                        <h6><strong>주소</strong></h6>
                        <span class="final_addr_ck" style="font-size: 5px; color: red" hidden>주소를 입력해 주세요.</span>
                    </div>
                    <div class="col-8">
                        <div class="input-group mb-3 w-100">
                            <input name="mem_zipcode" type="text" id="address1" readonly
                                   class="form-control" value="${sessionScope.member.getMem_zipcode()}" aria-describedby="button-addon2">
                            <button class="btn btn-outline-secondary" id="upBtn-addr" type="button" onclick="exePostCode()" >변경</button>
                        </div>
                    </div>
                </div>
                <!-- 주소 ROW : 주소 1 -->
                <div class="row m-4">
                    <div class="col-3"></div>
                    <div class="col-8">
                        <div class="input-group mb-3 w-100">
                            <input name="mem_address1" type="text" id="address2" readonly
                                   autocomplete="off" class="form-control" value="${sessionScope.member.getMem_address1()}">
                        </div>
                    </div>
                </div>
                <!-- 주소 ROW : 주소 2 -->
                <div class="row m-4">
                    <div class="col-3"></div>
                    <div class="col-8">
                        <div class="input-group mb-3 w-100">
                            <input name="mem_address2" type="text" id="address3" readonly
                                   autocomplete="off" class="form-control" value="${sessionScope.member.getMem_address2()}">
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>
                </div>
                <hr style="border: solid 1px black;">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-2"></div>
                    <div class="col-8" style="text-align: right;">
                        <p style="font-size: x-small">∙ 회원탈퇴 후 동일 아이디로 재가입이 불가합니다.</p>
                        <button style="width: 80px; height: 30px; border: 0; font-size: small"><a href="/mypage/remove" style="text-decoration: none;">회원탈퇴 ‣</a></button>
                    </div>
                </div>

                <%-- 버튼 ROW  --%>
                <div class="row m-auto">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <button id="btn-cancel"
                                class="btn btn-success btn-lg m-2"
                                style="background-color: #9d9d9d"> 취소 </button>
                        <button id="btn-update"
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

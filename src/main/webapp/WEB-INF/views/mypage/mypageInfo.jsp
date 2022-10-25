<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    <%--  daum postcode  --%>
    <%@include file="../../includes/daumPostCode.jsp" %>
    <link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
    <title>MyPage</title>

    <style>
        /** {*/
        /*    border: red solid 1px;*/
        /*}*/

        main {
            width: 100%;
            padding-left: 30px;
        }

        a {
            color: black;
        }

        .modal {
            font-family: "210 Soopilmyungjo";
            position:absolute;
            width:30%; height:50%;
            border-radius: 10px;
            border: 1px solid black;
            background: #ffffff;
            top:50%; left: 40%;
            display:none;
            box-shadow: #343a40;
        }
    </style>
    </head>
    <body>
    <!-- 헤더 시작 -->
    <%@include file="../../includes/header.jsp" %>

    <script type="text/javascript">
        let code = ""; // 이메일 전송 인증번호 저장을 위한 코드

        /* 수정 유효성 검사 통과 유무 변수 */
        let mailCheck = false;            // 이메일
        let mailCodeCheck = false;          // 이메일 인증 코드 일치
        let addressCheck = false            // 주소

        $(function(){
            /* ============================ 수정 요청 전송 ========================== */
            $("#btn-update").click(function(){

                /* 입력칸 변수 */
                let mail = $("#mem_email").val();        // 메일주소 입력란
                let addr1 = $('#address1').val();        // 우편번호 입력란
                let addr2 = $('#address2').val();        // 주소 입력란
                let addr3 = $('#address3').val();        // 상세주소 입력란

                /* 메일 유효성 검사 */
                if(mail == null || mail.trim() == ""){
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

                if(mailCheck&&mailCodeCheck&&addressCheck){
                    $("#updateForm").attr("action", "/mypage/info");
                    $("#updateForm").attr("method", "post");
                    $("#updateForm").submit();
                }else{
                    alert("입력을 다시 한 번 확인해 주세요.");
                }
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
                // 이메일 입력 칸이 나타난다.
                $("#mem_email").attr("hidden", false);
                // 인증코드 전송 버튼이 나타난다.
                $("#btn-email-send").attr("hidden", false);
            });

            /* ========================== 인증번호 전송 이벤트 ========================== */
            $("#btn-email-send").click(function(){
                let email = $("#mem_email").val();
                // 메일이 입력되지 않으면 경고창이 뜬다.
                if(email == null || email.trim() =="") alert("이메일 주소를 입력해 주세요.");
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
                if(inputCode != code){
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
    <%@include file="../../includes/sidebar.jsp" %>
    <!-- 사이드바 끝-->
        <%-- ==================== 메인 시작==================--%>
        <main>
        <!-- 페이지 컨텐츠 레이아웃 -->
        <%-- =========================== MEMBER 기본 정보 FORM 시작 ========================== --%>
            <form id="updateForm" style="padding: 50px 250px 50px 70px;">
                <div class="row">
                    <h4> <strong>회원정보 수정</strong> </h4>
                </div>
                <br>
                <br>
                <div>
                    <h6> 기본 정보 </h6>
                </div>
                <hr style="border: solid 1px black;">

                <!-- 아이디 정보  -->
                <div class="row m-4">
                    <div class="col-3">
                        <h6><strong>아이디</strong></h6>

        <%-- !!!!!  Test용 mem_id
                       value값에 해당이 되는 아이디가 수정이 될 것이다.
       --%>
                        <input type="text" name="mem_id" value="chaeeun94" hidden/>
                    </div>
                    <div class="col-8 mb-3">
                        <div class="input-group mb-3 w-100">
                            <label> hye1363 </label>
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
                            <label> 정채은 </label>
                        </div>
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
                            <label> 1994.09.10 / 여 </label>
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
                            <label> 010-1234-5678 </label>
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
                            <label id="lb-mail"> ninxtxn@gmail.com</label>
                            <input name="mem_email" type="text" id="mem_email" hidden
                                   autocomplete="off" class="form-control" aria-describedby="button-addon2" placeholder="이메일을 입력해 주세요." style="background-color: #fffbc5; border-radius: 5px">
                            <button name="btn-email-send" id="btn-email-send" hidden
                                    class="btn btn-outline-secondary" type="button" style="border-radius: 2px" >인증번호 전송</button>
                            <button class="btn-circle" id="upBtn-mail" type="button" style="float: right; border-radius: 10px; border: 0; margin-left: 10px;">변경</button>
                            <span class="mailCode-ck" style="font-size: 5px; color: red" hidden></span>
                        </div>
                        <div class="row"><span id="message"hidden><p style="font-size: small; color: #535759">인증번호가 전송되었습니다. 미전송 시 이메일 주소를 확인해 주세요.</p></span></div>

                    </div>
                </div>
                <div class="row m-4">
                    <div class="col-3"></div>
                    <div class="col-8 mb-3">
                        <div class="input-group mb-3 w-100">
                            <input type="text" id="mem_email_num" hidden
                                   autocomplete="off" class="form-control" aria-describedby="button-addon2" placeholder="인증번호 6자리">
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
                                   class="form-control" value="12345" aria-describedby="button-addon2">
                            <button class="btn btn-outline-secondary" id="upBtn-addr" type="button" onclick="exePostCode()" >변경</button>
                        </div>
                    </div>
                </div>

                <!-- 주소 ROW : 주소 1 -->
                <div class="row m-4">
                    <div class="col-3"></div>
                    <div class="col-8">
                        <div class="input-group mb-3 w-100">
                            <input name="mem_address" type="text" id="address2" readonly
                                   autocomplete="off" class="form-control" value="00로 00길 55">
                        </div>
                    </div>
                </div>

                <!-- 주소 ROW : 주소 2 -->
                <div class="row m-4">
                    <div class="col-3"></div>
                    <div class="col-8">
                        <div class="input-group mb-3 w-100">
                            <input name="mem_address2" type="text" id="address3" readonly
                                   autocomplete="off" class="form-control" value="00아파트 101호">
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>
                </div>
                <hr style="border: solid 1px black;">
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
    <%@include file="../../includes/footer.jsp" %>
    <!-- 풋터 끝 -->
    </body>
    </html>

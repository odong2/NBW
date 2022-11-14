<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Join</title>
    <%@include file="../../includes/common.jsp" %>
    <%--  daum postcode  --%>
    <%@include file="../../includes/daumPostCode.jsp" %>

    <script type="text/javascript">
        /* ******************************** 전화번호 자동 하이픈 함수 ********************************** */
        const autoHyphen = function(target){
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
        }

        let code = ""; // 이메일 전송 인증번호 저장을 위한 코드
        let result = "";

        /* 유효성 검사 통과유무 변수 > 필수 항목 */
        let idCheck = false;            // 아이디
        let idEqual = false;            // 아이디 일치 여부 검사
        let pwCheck = false;            // 비번
        let pwGrade = false;            // 비밀번호 안전등급 검사
        let pwEqual = false;            // 비밀번호 일치 여부 검사
        let nicknameCheck = false;      // 닉네임
        let nicknameEqual = false;       // 닉네임 일치 여부 검사
        let nameCheck = false;            // 이름
        let mailCheck = false;            // 이메일
        let mailCodeCheck = false;          // 이메일 인증 코드 일치
        let birthCheck = false;              // 생년월일 확인
        let genderCheck = false;            // 성별 체크
        let phoneCheck = false;             // 전화번호 체크
        let addressCheck = false            // 주소
        let privacyCheck = false            // 개인정보 수집 이용 동의 체크


        $(function(){
            <%-- ================================= DatePicker =================================== --%>
            // Function Datepicker
            $(".datepicker").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy-mm-dd",
                dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
                monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
            });

            // datepicker 클래스 이벤트
            var now = new Date();
            var startYear = now.getFullYear();
            var yearRange = (startYear - 120) +":" + startYear ;
            // datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
            //원래 있던 datepicker에 option을 추가하는 방법이다.
            $( ".datepicker" ).datepicker("option", {
                "maxDate" : new Date(),
                yearRange: yearRange
            });
            // Datepicker 끝

            /* ===================================== 아이디 유효성 체크 ========================================= */
            $("#mem_id").blur(function(){
                let id = $(this).val();
                /* id < 4 */
                if(id.length < 4){
                    $('#idCheckDiv').removeClass("alert-success");
                    $('#idCheckDiv').addClass("alert-danger");
                    $('#idCheckDiv').text("아이디는 4자 이상 입력하셔야 합니다.");
                    idCheck = false; // 가입 불가
                    return;
                }
                /* id > 20 */
                if(id.length > 20){
                    $('#idCheckDiv').removeClass("alert-success");
                    $('#idCheckDiv').addClass("alert-danger");
                    $('#idCheckDiv').text("아이디는 20이내로 입력하셔야 합니다.");
                    idCheck = false; // 가입 불가
                    return;
                }
                /* 아이디 중복 체크 */
                $("#idCheckDiv").load("/member/idCheck?id="+id, function(result){
                    if(result.indexOf("중복")){
                        console.log(result);
                        idEqual = false;
                        console.log("가입여부 ==> "+ !idEqual);
                        // 중복된 경우
                        $('#idCheckDiv').removeClass("alert-success");
                        $('#idCheckDiv').addClass("alert-danger");
                    }
                    if(result.indexOf("가능한")) {
                        console.log(result);
                        idEqual = true;
                        console.log("가입여부 ==> " + idEqual);
                        // 중복이 되지 않은 경우
                        $('#idCheckDiv').addClass("alert-success");
                        $('#idCheckDiv').removeClass("alert-danger");
                    }
                });
            });

            $("#mem_pw").mouseover(function(){
                $('#layer').css('display', 'block')
                    .css('background-color', '#ffffff');
            });

            $('#mem_nickname').blur(function (){
                let nickname = $(this).val();

                /* nickname < 4 */
                if(nickname.length < 2){
                    $('#nicknameCheckDiv').removeClass("alert-success");
                    $('#nicknameCheckDiv').addClass("alert-danger");
                    $('#nicknameCheckDiv').text("닉네임은 두 글자 이상 입력하셔야 합니다.");
                    nicknameCheck = false; // 가입 불가
                }
                /* nickname > 20 */
                if(nickname.length > 20){
                    $('#nicknameCheckDiv').removeClass("alert-success");
                    $('#nicknameCheckDiv').addClass("alert-danger");
                    $('#nicknameCheckDiv').text("닉네임은 20이내로 입력하셔야 합니다.");
                    nicknameCheck = false; // 가입 불가
                }

                $("#nicknameCheckDiv").load("/member/nicknameCheck?nickname="+nickname, function(result){
                    if(result.indexOf("가능한")){
                        // 중복이 되지 않은 경우
                        $('#nicknameCheckDiv').addClass("alert-success");
                        $('#nicknameCheckDiv').removeClass("alert-danger");
                        // 중복이 되지 않은 경우 가입이 가능하다.
                        nicknameEqual = true;
                    } else {
                        // 중복된 경우
                        $('#nicknameCheckDiv').removeClass("alert-success");
                        $('#nicknameCheckDiv').addClass("alert-danger");
                        // 중복이 된 경우 가입을 막는다.
                        nicknameEqual = false;
                    }
                });
            })

            /* ===================================== 비밀번호 유효성 처리(길이, 일치여부) ===================================== */
            // 비밀번호 처리 이벤트
            $("#mem_pw").blur(function() {
                let pw = $("#mem_pw").val();
                console.log("입력한 비밀번호 ===> "+ pw);

                $.ajax({
                    type:"GET",
                    url:"/member/pwCheck?pw="+pw,
                    success:function(data){
                        /* Controller 단에서 반환받은 안전도 수준이 잘 전송되었는지 확인 */
                        console.log("data : "+ data);
                        result = data;

                        if(result == "WEAK"){
                            result = "낮음";
                            console.log(result);
                            $('#pwCheckDiv').removeClass("alert-dismissible");
                            $('#pwCheckDiv').addClass("alert-danger");
                            $('#pwCheckDiv').text("보안수준 : "+ result);
                            pwGrade = false; // 보안수준 낮음이면 가입 불가
                        }
                        if(result == "NORMAL"){
                            result = "보통";
                            console.log(result);
                            $('#pwCheckDiv').removeClass("alert-danger");
                            $('#pwCheckDiv').addClass("alert-success");
                            $('#pwCheckDiv').text("보안수준 : "+ result);
                            pwGrade = false;
                        }
                        if(result == "STRONG"){
                            result = "강력";
                            console.log(result);
                            $('#pwCheckDiv').removeClass("alert-info");
                            $('#pwCheckDiv').addClass("alert-info");
                            $('#pwCheckDiv').text("보안수준 : "+ result);
                            pwGrade = true;
                        }
                    }
                });
            });

            /* ===================================== 비밀번호 유효성 처리(일치여부) ===================================== */
            $('#mem_pw2').blur(function(){
                let pw = $('#mem_pw').val();
                let pw2 = $('#mem_pw2').val();
                if(pw!=pw2){
                    $('#pwCheckDiv2').removeClass("alert-dismissible");
                    $('#pwCheckDiv2').addClass("alert-danger");
                    $('#pwCheckDiv2').text("비밀번호가 일치하지 않습니다.");
                    pwEqual = false;

                }else{
                    $('#pwCheckDiv2').removeClass("alert-danger");
                    $('#pwCheckDiv2').addClass("alert-info");
                    $('#pwCheckDiv2').text("비밀번호가 일치합니다.");
                    pwEqual = true;
                }
            });

            /* ===================================== 이메일 전송  ===================================== */
            $("[name=btn-email-send]").click(function(e){
                /* (1) 먼저 이메일 입력 칸에 입력한 이메일이 있는지 확인한다.*/
                const email = $("#mem_email_id").val() // 입력한 이메일 ID

                if(email == null || email.trim() =="") {
                    alert("이메일 주소를 입력해 주세요.");
                    e.preventDefault();
                }
                else {
                    alert(email+"로 이메일을 전송하였습니다.");
                    console.log("인증번호를 보낼 email ==> "+ email)
                }

                /* (2) ajax 코드를 추가한다 > controller 에 요청할 때 화면이 전환되는 것을 방지 */
                $.ajax({
                    type:"GET",
                    url:"/mail/mailCheck?email="+email,
                    success:function(data){

                        /* Controller 단에서 반환받은 랜덤코드가 잘 전송되는 지 확인 */
                        console.log("data : "+ data);
                        /* 인증번호 입력 칸의 disabled 속성을 true -> false 로 변경한다. */
                        $("#mem_email_num").attr("disabled", false);
                        /* Controller 로부터 전달받은 인증번호를 위에서 선언한 code 변수에 새로 할당한다. */
                        code = data;
                        console.log("code : "+ code); // 할당이 되었는지 확인
                    }
                });
            });

            /* ===================================== 발송된 인증번호 비교  ===================================== */
            $("#mem_email_num").blur(function (){

                let inputCode = $("#mem_email_num").val(); // 입력한 코드
                let checkResult = $("#mail_check_input_box_warn"); // 비교 결과
                if(inputCode != code){
                    checkResult.addClass("alert-danger");
                    checkResult.text("인증번호가 일치하지 않습니다.");
                    // 인증번호 불일치시 가입을 막는다.
                    mailCodeCheck = false;
                } else{
                    checkResult.removeClass("alert-danger");
                    checkResult.addClass("alert-success");
                    checkResult.text("인증번호가 일치합니다.");
                    mailCodeCheck = true;
                }
            });

            /* ===================================== 최종 회원가입 전처리 =======================================
            * 회원가입 데이터가 넘어가기 자바로 넘어가기 전에 검사 되어야 할 리스트
            * - (필수)입력란의 데이터가 null 인지 */
            /* 유효성 검사 통과유무 변수를 선언한다. */
            $("#btn-join").click(function(e){

                /* 입력값 변수 */
                let id = $('#mem_id').val();                 // id 입력란
                let pw = $('#mem_pw').val();                // 비밀번호 입력란
                let nickname = $('#mem_nickname').val();
                let name = $('#mem_name').val();            // 이름 입력란
                let mail = $('#mem_email_id').val();            // 이메일 입력란
                let birthday = $('#mem_birthday').val();            // 생년월일 입력란
                let gender = $('input[name=mem_gender]:checked').val();            // 성별 입력란
                let phone = $('#mem_phone').val();            // 전화번호 입력란
                let addr1 = $('#address1').val();        // 우편번호 입력란
                let addr2 = $('#address2').val();        // 주소 입력란
                let addr3 = $('#address3').val();        // 상세주소 입력란
                let isChecked = $('#privacyChk')        // 개인정보 수집 이용 동의 체크박스

                /* 아이디 유효성 검사 */
                if(id == null || id.trim() == ""){
                    // 아이디가 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_id_ck').attr("hidden", false);
                    idCheck = false;
                }else{
                    // 아이디가 정상적으로 입력이 되었다면
                    $('.final_id_ck').attr("hidden", true);
                    idCheck = true;
                }

                if(nickname == null || nickname.trim() == ""){
                    $('.final_nickname_ck').attr("hidden", false);
                    nicknameCheck = false;
                }else{
                    // 비밀번호가 정상적으로 입력이 되었다면
                    $('.final_nickname_ck').attr("hidden", true);
                    nicknameCheck = true;
                }

                /* 비밀번호 유효성 검사 */
                if(pw == null || pw.trim() == ""){
                    // 비밀번호가 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_pw_ck').attr("hidden", false);
                    pwCheck = false;
                }else{
                    // 비밀번호가 정상적으로 입력이 되었다면
                    $('.final_pw_ck').attr("hidden", true);
                    pwCheck = true;
                }

                /* 이름 유효성 검사 */
                if(name == null || name.trim() == ""){
                    // 이름이 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_name_ck').attr("hidden", false);
                    nameCheck = false;
                }else{
                    // 이름 정상적으로 입력이 되었다면
                    $('.final_name_ck').attr("hidden", true);
                    nameCheck = true;
                }

                /* 메일 유효성 검사 */
                if(mail == null || mail.trim() == ""){
                    // 메일이 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_mail_ck').attr("hidden", false);
                    mailCheck = false;
                }else{
                    // 메일이 정상적으로 입력이 되었다면
                    $('.final_mail_ck').attr("hidden", true);
                    mailCheck = true;
                }

                /* 생년월일 유효성 검사 */
                if(birthday == null || birthday.trim() == ""){
                    // 생년월일이 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_birth_ck').attr("hidden", false);
                    birthCheck = false;
                }else{
                    // 생년월일이 정상적으로 입력이 되었다면
                    $('.final_birth_ck').attr("hidden", true);
                    birthCheck = true;
                }

                /* 성별 유효성 검사 */
                if(gender == null || gender.trim() == ""){
                    // 성별이 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_gender_ck').attr("hidden", false);
                    genderCheck = false;
                }else{
                    // 성별이 정상적으로 입력이 되었다면
                    $('.final_gender_ck').attr("hidden", true);
                    genderCheck = true;
                }

                /* 전화번호 유효성 검사 */
                if(phone == null || phone.trim() == ""){
                    // 전화번호가 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_phone_ck').attr("hidden", false);
                    phoneCheck = false;
                }else{
                    // 전화번호가 정상적으로 입력이 되었다면
                    $('.final_phone_ck').attr("hidden", true);
                    phoneCheck = true;
                }

                /* 주소 유효성 검사 => 우편번호, 주소, 상세주소 모두가 입력이 되어있어야 함. */
                if((addr1 == null || addr1.trim() == "") || (addr2 == null || addr2.trim() == "") || (addr3 == null || addr3.trim() == "") ){
                    // 주소가 입력이 되지 않은 경우 숨김처리 되었던 span 태그를 활성화 시킨다.
                    $('.final_addr_ck').attr("hidden", false);
                    addressCheck = false;
                }else{
                    // 주소가 정상적으로 입력이 되었다면
                    $('.final_addr_ck').attr("hidden", true);
                    addressCheck = true;
                }

                /* 개인정보 수집 및 이용 동의 체크 유효성 검사 */
                if(isChecked.is(":checked") == false){
                    console.log('체크 안 된 상태');
                    $('.final_privacy_ck').attr("hidden", false);
                    privacyCheck = false;
                }

                if(isChecked.is(":checked") == true){
                    console.log('체크된 상태');
                    $('.final_privacy_ck').attr("hidden", true);
                    privacyCheck = true;
                }
                <c:if test="${ !empty member }">
                mailCodeCheck = true;
                </c:if>

                /* 최종 유효성 검사 체크 > 모든 것이 참이어야 가입 가능 */
                if(idCheck&&idEqual&&pwCheck&&pwGrade&&pwEqual
                    &&nameCheck && mailCheck&&nicknameEqual
                    && birthCheck&&genderCheck &&phoneCheck&&addressCheck
                    &&privacyCheck&&mailCodeCheck&&nicknameCheck) {
                    $("#joinForm").attr("action", "/member/join");
                    $("#joinForm").attr("method", "post");
                    alert("NBW 회원이 되신 것을 환영합니다!");
                    // e.preventDefault();
                    $("#joinForm").submit();
                }else
                    alert("회원가입 양식을 다시 한 번 확인해 주세요.");
                e.preventDefault();

            });
        });
    </script>

    <style>
        @font-face {
            font-family: 'NEXON Lv1 Gothic OTF';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        main {
            font-family: 'NEXON Lv1 Gothic OTF';
            width:70%;
            margin:auto;
            padding-top: 10px;
        }
        .form-control{
            height: 35px;
        }
        hr {
            height: 1px;
            border: 0px;
            background: brown;
        }
        h6 {
            color: #646161;
            padding-top: 12px;
        }
        #btn-join {
            color: #343a40;
            border: 0;
            outline: 0;
            font-size: x-large;
            font-weight: bolder;
            background-color: transparent;
        }
        #btn-join:hover {
            background-color: #fffbc5;
            font-size: x-large;
            font-weight: bolder;
            color: #801919;
        }
    </style>
</head>
<body class="text-center">
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<!-- MAIN ==> 회원가입 테스트 양식 MAIN 시작! -->
<main>
    <!-- 회원가입 FORM 시작! -->
    <form id="joinForm" style="background-image: url('/images/bg_joinform.jpg'); padding: 90px 50px; margin: 50px 100px; border-radius: 10px">
        <div class="row">
            <div class="col-12 text-center">
                <h2 style="font-family: '210 Soopilmyungjo'; font-weight: bolder; color: #542121;">JOIN</h2>
            </div>
        </div>
        <br>
        <br>
        <br>
        <!-- 아이디 입력 ROW  -->
        <div class="row">
            <div class="col-md-3">
                <h6><span style="color: red; ">*</span> 아이디 </h6>
                <span class="final_id_ck" style="font-size: 5px; color: red" hidden>아이디를 입력해 주세요.</span>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <c:choose>
                        <c:when test="${ empty member}">
                            <input name="mem_id" id="mem_id" required="required" pattern="[A-Za-z0-9]{4,20}" class="form-control"
                                   autocomplete="off" placeholder="아이디를 입력해 주세요.">
                        </c:when>
                        <c:otherwise>
                            <input name="mem_id" id="mem_id" required="required" pattern="[A-Za-z0-9]{4,20}" class="form-control"
                                   autocomplete="off" value="${ member.getMem_id()}" readonly>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class = "alert alert-dismissible w-75" id="idCheckDiv"> </div>
                <label id="warningLabel" class="mb-3 text-danger" style="font-size:0.7rem;"></label>
            </div>
        </div>
        </div>
        <hr>
        <br>
        <!-- 비밀번호 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <h6><span style="color: red; ">*</span>비밀번호 </h6>
                <span class="final_pw_ck" style="font-size: 5px; color: red" hidden>비밀번호를 입력해주세요.</span>
                <div id="layer" style="display: none">
                    <p style="font-size: x-small"> 비밀번호에 <strong>숫자, 소문자, 대문자</strong>를<br>모두 포함해 주세요.<br>
                        <span style="color: red;">강력</span>인 경우만 가입이 가능합니다.</p>
                </div>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name= "mem_pw" id="mem_pw" required="required" pattern=".{8,20} "
                           class="form-control" placeholder="비밀번호를 입력해 주세요." type="password">
                </div>
                <div class = "alert alert-dismissible w-75" id="pwCheckDiv"> </div>
            </div>
        </div>

        <!-- 비밀번호 확인 입력 ROW  -->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name= "mem_pw2" id="mem_pw2" required="required" pattern=".{4,20}"
                           class="form-control" placeholder="비밀번호 확인" type="password">
                </div>
                <div class = "alert alert-dismissible w-75" id="pwCheckDiv2"> </div>
            </div>
        </div>
        <hr>
        <br>

        <!-- 닉네임 입력 ROW  -->
        <div class="row">
            <div class="col-md-3">
                <h6><span style="color: red; ">*</span> 닉네임 </h6>
                <span class="final_nickname_ck" style="font-size: 5px; color: red" hidden>닉네임을 입력해 주세요.</span>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name="mem_nickname" id="mem_nickname" required="required" pattern="[가-힣]{2,20}" class="form-control"
                           autocomplete="off" placeholder="닉네임을 입력해 주세요.">
                </div>
                <div class = "alert alert-dismissible w-75" id="nicknameCheckDiv"></div>                </div>
        </div>


        <!-- 이름 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <h6><span style="color: red; ">*</span>이름</h6>
                <span class="final_name_ck" style="font-size: 5px; color: red" hidden>이름을 입력해 주세요.</span>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-50">
                    <c:choose>
                        <c:when test="${ empty member}">
                            <input name="mem_name" id="mem_name" type="text" required="required" pattern="[가-힣]{2,10}"
                                   autocomplete="off" class="form-control">
                        </c:when>
                        <c:otherwise>
                            <input name="mem_name" id="mem_name" type="text" required="required" pattern="[가-힣]{2,10}"
                                   autocomplete="off" class="form-control" value="${ member.getMem_name() }">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 이메일 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <h6><span style="color: red; ">*</span>이메일</h6>
                <span class="final_mail_ck" style="font-size: 5px; color: red" hidden>이메일을 입력해 주세요.</span>
            </div>
            <div class="col-9">
                <c:choose>
                    <c:when test="${ empty member}">
                        <div class="row">
                            <div class="col-6 input-group mb-3 w-100">
                                <input name="mem_email" id="mem_email_id" placeholder="이메일 입력" required="required"
                                       autocomplete="off" class="form-control w-50" />
                            </div>
                        </div>
                        <%-- 메일 인증번호 입력란 --%>
                        <div class="row">
                            <div class="col-9">
                                <input id="mem_email_num" required="required" aria-describedby="button-addon2"
                                       autocomplete="off" class="form-control " placeholder="인증번호를 입력해 주세요" disabled/>
                            </div>
                            <div class="col-3">
                                <button name="btn-email-send" class="btn btn-outline-secondary" type="button" style="font-size: smaller">인증메일 전송</button>
                            </div>
                        </div>
                        <div class="row">
                            <span id="mail_check_input_box_warn"></span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-6 input-group mb-3 w-100">
                            <input name="mem_email" id="mem_email_id" placeholder="이메일 입력" required="required"
                                   autocomplete="off" class="form-control w-50" value="${ member.getMem_email()}"/>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>

        <hr>
        <br>

        <!-- 생년월일 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <h6><span style="color: red;">*</span>생년월일</h6>
                <span class="final_birth_ck" style="font-size: 5px; color: red" hidden>생년월일을 입력해 주세요.</span>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-50">
                    <c:choose>
                        <c:when test="${ empty member}">
                            <input name="mem_birthday" id="mem_birthday" required="required"
                                   class="form-control datepicker" autocomplete="off">
                        </c:when>
                        <c:otherwise>
                            <input name="mem_birthday" id="mem_birthday" required="required"
                                   class="form-control datepicker" autocomplete="off" value="${ member.getMem_birthday() }">
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 성별 입력 ROW입니다. -->
        <div class="row">
            <div class="col-3">
                <h6><span style="color: red;">*</span>성별</h6>
                <span class="final_gender_ck" style="font-size: 5px; color: red" hidden>성별을 체크해 주세요.</span>
            </div>
            <div class="col-9 mb-3 w-25">
                <label class="radio-inline" style="margin-right: 50px"><input name="mem_gender" type="radio" value="남">남</label>
                <label class="radio-inline"><input name="mem_gender" type="radio" value="여">여</label>
            </div>
        </div>

        <hr>
        <br>

        <!-- 휴대폰 번호 입력 ROW입니다. -->
        <div class="row">
            <div class="col-3">
                <h6><span style="color: red;">*</span>전화번호</h6>
                <span class="final_phone_ck" style="font-size: 5px; color: red" hidden>전화번호를 입력해 주세요.</span>
            </div>
            <div class="col-9 mb-3">
                <div class="input-group mb-3 w-50">
                    <c:choose>
                        <c:when test="${ empty member}">
                            <input type="text" id="mem_phone" name="mem_phone"
                                   placeholder="'-'를 제외하고 입력하세요"
                                   oninput="autoHyphen(this)"
                                   maxlength="13"
                                   autocomplete="off"
                                   pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
                                   class="form-control" value="" />
                        </c:when>
                        <c:otherwise>
                            <%--    fmt:formatNumber 형식 오류 수정   --%>
                            <input type="text" id="mem_phone" name="mem_phone"
                                   placeholder="'-'를 제외하고 입력하세요"
                                   oninput="autoHyphen(this)"
                                   maxlength="13"
                                   autocomplete="off"
                                   pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
                                   class="form-control w-50" value=""/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <hr>
        <br>

        <!-- 주소 ROW : 우편번호  -->
        <div class="row">
            <div class="col-3">
                <h6><span style="color: red; ">*</span>주소</h6>
                <span class="final_addr_ck" style="font-size: 5px; color: red" hidden>주소를 입력해 주세요.</span>
            </div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_zipcode" type="text" id="address1" readonly
                           autocomplete="off" class="form-control" aria-describedby="button-addon2">
                    <button class="btn btn-outline-secondary" type="button" onclick="exePostCode()" >우편번호 찾기</button>
                </div>
            </div>
        </div>

        <!-- 주소 ROW : 주소 1 -->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_address1" type="text" id="address2" readonly
                           autocomplete="off" class="form-control" placeholder="도로명주소">
                </div>
            </div>
        </div>

        <!-- 주소 ROW : 주소 2 -->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_address2" type="text" id="address3" readonly
                           autocomplete="off" class="form-control" placeholder="상세주소">
                </div>
            </div>
        </div>

        <hr>

        <%-- 개인정보 수집 및 이용 약관이 모달창으로 뜰 수 있도록 구현할 예정 --%>
        <input name="privacyChk" type="checkbox" id="privacyChk">
        <span style="color: red; ">(필수)</span><a class="btn btn-default" data-bs-target="#modal" data-bs-toggle="modal" style="text-decoration:underline!important">
        개인정보 수집 및 이용</a>에 동의합니다.
        <div>
            <span class="final_privacy_ck" style="font-size: 5px; color: red" hidden> 개인정보 수집 이용에 동의해 주세요. </span>
        </div>


        <%-- =========================== 인증 MODAL 시작 ============================ --%>
        <div class="modal" id="modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content" style="margin:10px 30px; width:600px;">
                    <div class="modal-header">
                        <h3>개인정보 수집 및 이용</h3>
                        <button class="close" data-bs-dismiss="modal" style="border: 0; outline: 0;">&times;</button>
                    </div>
                    <div class="modal-body" style="text-align:center;">
                        엔비더(이하 ‘회사’라 한다)는 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.<br>
                        <br>
                        <strong>제1조 (개인정보의 처리목적)</strong><br>
                        회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
                        <br>
                        1. 홈페이지 회원 가입 및 관리<br>
                        회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보처리시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 등을 목적으로 개인정보를 처리합니다.<br>
                        <br>
                        2. 재화 또는 서비스 제공<br>
                        물품배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제․정산, 채권추심 등을 목적으로 개인정보를 처리합니다.<br>
                        <br>
                        3. 고충처리<br>
                        민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다.<br>
                        <br>
                        <strong>제2조 (개인정보의 처리 및 보유기간)</strong><br>
                        ① 회사는 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.<br>
                        ② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>
                        <br>
                        1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴시까지<br>
                        다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지<br>
                        1) 관계 법령 위반에 따른 수사․조사 등이 진행중인 경우에는 해당 수사․조사 종료시까지<br>
                        2) 홈페이지 이용에 따른 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지<br>
                        <br>
                        <!-- 쇼핑몰 또는 예약 결제를 받지 않는다면 삭제 --><br>
                        2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료시까지<br>
                        다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료시까지<br>
                        1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록<br>
                        - 표시․광고에 관한 기록 : 6월<br>
                        - 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년<br>
                        - 소비자 불만 또는 분쟁처리에 관한 기록 : 3년<br>
                        2) 「통신비밀보호법」제41조에 따른 통신사실확인자료 보관<br>
                        - 가입자 전기통신일시, 개시․종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년<br>
                        - 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월<br>
                        <br>
                        <!-- 수정 필요. 개인정보 제3자 제공 사용하지 않는다면 삭제 --><br>
                        <strong>제3조 (개인정보의 제3자 제공)</strong><br>
                        ① 회사는 정보주체의 개인정보를 제1조(개인정보의 처리목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>
                        ② 회사는 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.<br>
                        - 개인정보를 제공받는 자 : &lt;예) (주) OOO 카드&gt;<br>
                        - 제공받는 자의 개인정보 이용목적 : &lt;예) 이벤트 공동개최 등 업무제휴 및 제휴 신용카드 발급&gt;<br>
                        - 제공하는 개인정보 항목 : &lt;예) 성명, 주소, 전화번호, 이메일주소, 카드결제계좌정보&gt;<br>
                        - 제공받는 자의 보유․이용기간 : &lt;예) 신용카드 발급계약에 따른 거래기간동안&gt;<br>
                        <br>
                        <!-- 수정 필요. 개인정보처리 위탁 사용하지 않는다면 삭제 --><br>
                        <strong>제4조(개인정보처리의 위탁)</strong><br>
                        ① 회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>
                        <br>
                        1. 전화 상담센터 운영<br>
                        - 위탁받는 자 (수탁자) : OOO CS센터<br>
                        - 위탁하는 업무의 내용 : 전화상담 응대, 부서 및 직원 안내 등<br>
                        <br>
                        2. A/S 센터 운영<br>
                        - 위탁받는 자 (수탁자) : OOO 전자<br>
                        - 위탁하는 업무의 내용 : 고객 대상 제품 A/S 제공<br>
                        <br>
                        ② 회사는 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>
                        ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.<br>
                        <br>
                        <strong>제5조(이용자 및 법정대리인의 권리와 그 행사방법)</strong><br>
                        <br>
                        ① 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br>
                        1. 개인정보 열람요구<br>
                        2. 오류 등이 있을 경우 정정 요구<br>
                        3. 삭제요구<br>
                        4. 처리정지 요구<br>
                        ② 제1항에 따른 권리 행사는 회사에 대해 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이 조치하겠습니다.<br>
                        ③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.<br>
                        ④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>
                        ⑤ 정보주체는 개인정보 보호법 등 관계법령을 위반하여 회사가 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니됩니다.<br>
                        <br>
                        <!-- 사이트 운영 환경에 맞게 1항, 2항 수정 필요 --><br>
                        <strong>제6조(처리하는 개인정보 항목)</strong><br>
                        회사는 다음의 개인정보 항목을 처리하고 있습니다.<br>
                        <br>
                        1. 홈페이지 회원 가입 및 관리<br>
                        필수항목 : &lt;예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 성별, 이메일주소, 아이핀번호&gt;<br>
                        선택항목 : &lt;예) 결혼여부, 관심분야&gt;<br>
                        <br>
                        2. 재화 또는 서비스 제공<br>
                        필수항목 : &lt;예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 이메일주소, 아이핀번호, 신용카드번호, 은행계좌정보 등 결제정보&gt;<br>
                        선택항목 : &lt;관심분야, 과거 구매내역&gt;<br>
                        <br>
                        3. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.<br>
                        IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등<br>
                        <br>
                        <strong>제7조(개인정보의 파기)</strong><br>
                        ① 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>
                        ② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.<br>
                        ③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>
                        1. 파기절차<br>
                        회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>
                        2. 파기방법<br>
                        회사는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 로우레밸포멧(Low Level Format) 등의 방법을 이용하여 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.<br>
                        <br>
                        <strong>제8조(개인정보의 안전성 확보조치)</strong><br>
                        회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.<br>
                        1. 관리적 조치 : 내부관리계획 수립․시행, 정기적 직원 교육 등<br>
                        2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보<br>
                        등의 암호화, 보안프로그램 설치<br>
                        3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제<br>
                        <br>
                        <strong>제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항)</strong><br>
                        ① 엔비더는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.<br>
                        ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.<br>
                        가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해<br>
                        사용됩니다.<br>
                        나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구&gt;인터넷 옵션&gt;개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.<br>
                        다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.<br>
                        <br>
                        <!-- 사이트 운영 환경에 맞게 수정 필요 --><br>
                        <strong>제10조(개인정보 보호책임자)</strong><br>
                        ① 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br>
                        <br>
                        ▶ 개인정보 보호책임자<br>
                        성명 : OOO<br>
                        직책 : OOO<br>
                        연락처 : &lt;전화번호&gt;, &lt;이메일&gt;, &lt;팩스번호&gt;<br>
                        ※ 개인정보 보호 담당부서로 연결됩니다.<br>
                        <br>
                        ▶ 개인정보 보호 담당부서<br>
                        부서명 : OOO 팀<br>
                        담당자 : OOO<br>
                        연락처 : &lt;전화번호&gt;, &lt;이메일&gt;, &lt;팩스번호&gt;<br>
                        <br>
                        ② 정보주체께서는 회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.<br>
                        <br>
                        <!-- 사이트 운영 환경에 맞게 수정 필요 --><br>
                        <strong>제11조(개인정보 열람청구)</strong><br>
                        정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 회사는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.<br>
                        <br>
                        ▶ 개인정보 열람청구 접수․처리 부서<br>
                        부서명 : OOO<br>
                        담당자 : OOO<br>
                        연락처 : &lt;전화번호&gt;, &lt;이메일&gt;, &lt;팩스번호&gt;<br>
                        <br>
                        <strong>제12조(권익침해 구제방법)</strong><br>
                        정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.<br>
                        <br>
                        ▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영)<br>
                        - 소관업무 : 개인정보 침해사실 신고, 상담 신청<br>
                        - 홈페이지 : privacy.kisa.or.kr<br>
                        - 전화 : (국번없이) 118<br>
                        - 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터<br>
                        <br>
                        ▶ 개인정보 분쟁조정위원회<br>
                        - 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)<br>
                        - 홈페이지 : www.kopico.go.kr<br>
                        - 전화 : (국번없이) 1833-6972<br>
                        - 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층<br>
                        <br>
                        ▶ 대검찰청 사이버범죄수사단 : 02-3480-3573 (www.spo.go.kr)<br>
                        ▶ 경찰청 사이버안전국 : 182 (http://cyberbureau.police.go.kr)<br>
                        <br>
                        <!-- 사이트 오픈일에 맞게 수정 필요 --><br>
                        <strong>제13조(개인정보 처리방침 시행 및 변경)</strong><br>
                        이 개인정보 처리방침은 2022. 10. 24부터 적용됩니다.
                    </div>
                </div>
            </div>
        </div>

        <%--  가입하기 버튼 ROW  --%>
        <div class="row m-3 text-center">
            <div class="col p-5">
                <button id="btn-join"
                        class="btn btn-primary btn-lg"> 가입하기 </button>
            </div>
        </div>
    </form>
</main>
<c:if test="${ !empty member }">
    <script type="text/javascript">
        alert('최초 로그인시 개인정보 입력이 추가로 필요합니다.');
    </script>
</c:if>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>

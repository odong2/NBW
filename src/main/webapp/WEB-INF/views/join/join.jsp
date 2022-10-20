<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입 페이지</title>
    <%@include file="../includes/common.jsp" %>
    <!-- 다음 우편번호 검색 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- 다음 우편번호 샘플 코드 시작 -->
    <script type="text/javascript">
    // 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }
                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>
    <!-- 다음 우편번호 샘플 코드 끝 -->

    <script type="text/javascript">
        $(function(){
            // datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능
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

            // 회원가입 전처리
            $("#joinForm").submit(function(){
                alert("회원 등록 처리");
                // submit을 무시하기 때문에 페이지 이동이 되지 않는다.
                return false;
            });

            /* ===================================== 아이디 유효성 체크 ===================================== */
            $("#mem_id").keyup(function(){
                let id = $(this).val();

                /* id < 4 */
                if(id.length < 4){
                    $('#idCheckDiv').removeClass("alert-success");
                    $('#idCheckDiv').addClass("alert-danger");
                    $('#idCheckDiv').text("아이디는 4자 이상 입력하셔야 합니다.");
                    return;
                }
                /* id > 20 */
                if(id.length > 20){
                    $('#idCheckDiv').removeClass("alert-success");
                    $('#idCheckDiv').addClass("alert-danger");
                    $('#idCheckDiv').text("아이디는 20이내로 입력하셔야 합니다.");
                    return;
                }
                /* 중복 아이디가 있을 경우 > 서버로 가서 아이디 중복 체크를 한다
                * url과 입력 데이터는 바뀌면 안되기 때문에 Ajax로 처리한다. */
                // url : /member/idCheck
                // 서버에서 가져온 데이터 즉, result 가 null 이면 사용가능하다. null 이 아니면 사용이 불가하다.
                $("#idCheckDiv").load("/member/idCheck?id="+id, function(result){
                    if(result.indexOf("가능한")){
                        // 중복이 되지 않은 경우
                        $('#idCheckDiv').addClass("alert-success");
                        $('#idCheckDiv').removeClass("alert-danger");
                    } else {
                        // 중복된 경우
                        $('#idCheckDiv').removeClass("alert-success");
                        $('#idCheckDiv').addClass("alert-danger");
                    }
                })



            });

        })
    </script>

    <style>
        /** {*/
        /*    border: solid 1px red;*/
        /*}*/
        main {
            width:70%;
            margin:auto;
            padding-top: 10px;
        }
        /*@media (min-width: 768px) {*/
        /*    .bd-placeholder-img-lg {*/
        /*        font-size: 3.5rem;*/
        /*    }*/
        /*}*/
        .form-control, .form-select{
            height: 45px;
        }
        hr {
            height: 1px;
            border: 0px;
            background: brown;
        }
        label {
            color: #646161;
            font-family: "210 Soopilmyungjo";
            padding-top: 12px;
        }
        #btn-join {
            color: #343a40;
            border: 0;
            outline: 0;
            font-size: x-large;
            font-family: "210 Soopilmyungjo";
            font-weight: bolder;
            background-color: transparent;
        }
        #btn-join:hover {
            background-color: #f6edd3;
            font-size: x-large;
            font-weight: bolder;
            font-family: "210 Soopilmyungjo";
            color: #801919;
        }
    </style>
</head>
<body class="text-center">
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<%-- 사이드 바 시작 --%>
<%@include file="/WEB-INF/includes/sidebar.jsp" %>

<!-- MAIN ==> 회원가입 테스트 양식 MAIN 시작! -->
<main>

    <!-- 회원가입 FORM 시작! -->
    <form action="/member/register" method="post" id="joinForm" style="background-image: url('/bg_joinform.jpg'); padding: 90px 50px; margin: 50px 100px; border-radius: 10px">

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
                <label for="mem_id"> 아이디 </label>
            </div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_id" id="mem_id" required="required" pattern="[A-Za-z0-9]{4,20}" class="form-control"
                           autocomplete="off" placeholder="아이디를 입력해 주세요.">
<%--                    <input onclick="checkLoginIdDup(this);"--%>
<%--                            class="btn btn-outline-secondary" type="button" id="button-addon3" value="아이디 중복 체크"/>--%>
                </div>
<%--                 --%>
                <div class = "alert alert-danger" id="idCheckDiv">
                    아이디는 4글자 이상 입력하셔야 합니다.
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 비밀번호 입력 ROW  -->
        <div class="row">
            <div class="col-3 p-2">
                <label for="mem-pw"> 비밀번호 </label>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name= "mem_pw" id="mem-pw" required="required" pattern=".{4,20} "
                           class="form-control" placeholder="비밀번호를 입력해 주세요." type="password">
                </div>
            </div>
        </div>

        <!-- 비밀번호 확인 입력 ROW  -->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name= "mem_pw2" id="mem-pw2" required="required" pattern=".{4,20}"
                           class="form-control" placeholder="비밀번호 확인" type="password">
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 이름 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <label for="mem_name">이름</label>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name="mem_name" id="mem_name" type="text" required="required" pattern="[가-힣]{2,10}"
                           autocomplete="off" class="form-control">
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 이메일 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <label for="mem_email">이메일</label>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-100">
                    <input name="mem_email" id="mem_email" required="required" aria-describedby="button-addon2"
                           autocomplete="off" class="form-control" />
                    <input class="btn btn-outline-secondary" type="button" id="button-addon2" value="인증메일 발송"/>
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 생년월일 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <label for="mem_birthday">생년월일</label>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name="mem_birthday" id="mem_birthday" required="required"
                           class="form-control datepicker" autocomplete="off">
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 성별 입력 ROW입니다. -->
        <div class="row">
            <div class="col-3">
                <label>성별</label>
            </div>
            <div class="col-9 mb-3">
                    <label class="radio-inline" style="margin-right: 50px"><input type="radio" name="mem_gender" checked value="남">남</label>
                    <label class="radio-inline"><input type="radio" name="mem_gender" value="여">여</label>
            </div>
        </div>

        <hr>
        <br>

        <!-- 휴대폰 번호 입력 ROW입니다. -->
        <div class="row">
            <div class="col-3">
                <label for="mem_phone">휴대폰번호</label>
            </div>
            <div class="col-9 mb-3">
                <div class="input-group mb-3 w-50">
                    <input name="mem_phone" id="mem_phone" placeholder="'-'를 제외한 숫자만 입력해 주세요."
                           autocomplete="off" class="form-control">
                    <%--                        <button class="btn btn-outline-secondary" type="button" id="button-addon3">인증번호 요청</button>--%>
                </div>
            </div>
        </div>
        <hr>
        <br>

        <!-- 주소 ROW : 우편번호  -->
        <div class="row">
            <div class="col-3">
                <label> 주소 </label>
            </div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_zipcode" type="text" id="sample4_roadAddress"
                           autocomplete="off" class="form-control" aria-describedby="button-addon2">
                    <button class="btn btn-outline-secondary" type="button" onclick="sample4_execDaumPostcode()" >우편번호 찾기</button>
                </div>
            </div>
        </div>

        <!-- 주소 ROW : 주소 1 -->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_address" type="text" id="sample5_roadAddress"
                           autocomplete="off" class="form-control" placeholder="도로명주소">
                </div>
            </div>
        </div>

        <!-- 주소 ROW : 주소 2 -->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_address2" type="text" id="sample4_detailAddress"
                           autocomplete="off" class="form-control" placeholder="상세주소">
                </div>
            </div>
        </div>

        <hr>

        <%-- 개인정보 수집 및 이용 약관이 모달창으로 뜰 수 있도록 구현할 예정 --%>
        <div>
            <input type="checkbox">
            (필수) <a href="/?mode=privacy" onclick="SITE.openPrivacy(); return false;" target="_blank" style="text-decoration:underline!important">
            개인정보 수집 및 이용</a>에 동의합니다.
        </div>

        <%--  가입하기 버튼 ROW  --%>
        <div class="row m-3 text-center">
            <div class="col p-5">
                <button class="btn btn-primary btn-lg" id="btn-join" type="submit"> 가입하기 </button>
            </div>
        </div>
    </form>



</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
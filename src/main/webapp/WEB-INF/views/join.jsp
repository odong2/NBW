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
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
        h4 {
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
    <form action="/member/register" method="post" style="background-image: url('/bg_joinform.jpg'); padding: 90px 50px; margin: 50px 100px; border-radius: 10px">

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
                <h4> 아이디 </h4>
            </div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_id" type="text" class="form-control" placeholder="아이디를 입력해 주세요." aria-describedby="button-addon3">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon3">아이디 중복 검사</button>
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 비밀번호 입력 ROW  -->
        <div class="row">
            <div class="col-3 p-2">
                <h4> 비밀번호 </h4>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name= "mem_pw" type="text" class="form-control" placeholder="비밀번호를 입력해 주세요.">
                </div>
            </div>
        </div>

        <!-- 비밀번호 확인 입력 ROW  -->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input type="text" class="form-control" placeholder="비밀번호 확인">
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 이름 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <h4>이름</h4>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name="mem_name" type="text" class="form-control">
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 이메일 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <h4>이메일</h4>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-100">
                    <input name="mem_email" type="text" class="form-control" aria-describedby="button-addon2"/>
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증메일 발송</button>
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 생년월일 입력 ROW  -->
        <div class="row">
            <div class="col-3">
                <h4>생년월일</h4>
            </div>
            <div class="col-9">
                <div class="input-group mb-3 w-75">
                    <input name="mem_birthday" type="text" class="form-control">
                </div>
            </div>
        </div>

        <hr>
        <br>

        <!-- 성별 입력 ROW입니다. -->
        <div class="row">
            <div class="col-3">
                <h4>성별</h4>
            </div>
            <div class="col-9 mb-3 w-50">
                <select name="mem_gender" class="form-select" aria-label="Default select example">
                    <option selected>성별을 선택해 주세요</option>
                    <!-- 생년월일을 입력하면 주민번호 뒷자리에 따라 자동으로 성별이 선택되도록 할 예정입니다. -->
                    <option value="남">남</option>
                    <option value="여">여</option>
                </select>
            </div>
        </div>

        <hr>
        <br>

        <!-- 휴대폰 번호 입력 ROW입니다. -->
        <div class="row">
            <div class="col-3">
                <h4>휴대폰번호</h4>
            </div>
            <div class="col-9 mb-3">
                <div class="input-group mb-3 w-50">
                    <input name="mem_phone" type="text" class="form-control" placeholder="'-'를 제외한 숫자만 입력해 주세요.">
                    <%--                        <button class="btn btn-outline-secondary" type="button" id="button-addon3">인증번호 요청</button>--%>
                </div>
            </div>
        </div>
        <hr>
        <br>

        <!-- 주소 ROW : 우편번호  -->
        <div class="row">
            <div class="col-3">
                <h4> 주소 </h4>
            </div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_zipcode" type="text" class="form-control" id="sample4_roadAddress" aria-label="memberId" aria-describedby="button-addon2">
                    <button class="btn btn-outline-secondary" type="button" onclick="sample4_execDaumPostcode()" >우편번호 찾기</button>
                </div>
            </div>
        </div>

        <!-- 주소 ROW : 주소 1 -->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_address" type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
                </div>
            </div>
        </div>

        <!-- 주소 ROW : 주소 2 -->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <div class="input-group mb-3">
                    <input name="mem_address2" type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소">
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
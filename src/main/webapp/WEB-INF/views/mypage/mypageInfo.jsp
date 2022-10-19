<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="../../includes/common.jsp" %>
<title>MyPage</title>


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

        /* 수정 버튼을 누르면 수정할 수 있는 모달창이 뜬다.*/
        $(function(){
            $("#button-addon3").click(function(){
                $(".modal").fadeIn();
            });
            $(".btn-exit").click(function(){
                $(".modal").fadeOut();
            });
            $(".btn-close").click(function(){
                $(".modal").fadeOut();
            });

            $("#button-addon4").click(function(){
                $(".modal").fadeIn();
            });
            $(".btn-exit").click(function(){
                $(".modal").fadeOut();
            });
            $(".btn-close").click(function(){
                $(".modal").fadeOut();
            });
        });

    </script>
    <!-- 다음 우편번호 샘플 코드 끝 -->

    <style>
        /** {*/
        /*    border: red solid 1px;*/
        /*}*/

        main {
            width: 70%;
            margin: auto;
        }

        a {
            color: black;
        }

        h5 {
            font-family: "210 Soopilmyungjo";
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
    <!-- 헤더 끝 -->
    <!-- 사이드바 시작-->
    <%@include file="../../includes/sidebar.jsp" %>
    <!-- 사이드바 끝-->

    <!-- 마이 페이지 시작 -->
    <!-- 메인 -->
    <div class="row" style="height: 1000px">
        <nav
                id="sidebarMenu"
                class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
        >
            <div class="position-sticky sidebar-sticky">
                <h4 class="border-bottom p-3">마이페이지</h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="#"> 주문조회 </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> 문의내역 </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> 쿠폰등록 </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> 등록한 리뷰 </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> 좋아요 상품 </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                        >
                            개인정보 수정
                        </a>
                        <ul class="dropdown-menu text-center">
                            <li><a class="dropdown-item" href="#">비밀번호 변경</a></li>
                            <li><a class="dropdown-item" href="#">회원 탈퇴</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

<%-- ============================== MAIN 시작 ================================= --%>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <ol class="list-group d-flex flex-row justify-content-center mt-2">
                <li
                        class="d-flex justify-content-center align-items-start col-2 border py-2"
                >
                    <div
                            class="d-flex justify-content-center align-items-center flex-column"
                    >
                        <div
                                class="fw-bold d-flex justify-content-center align-items-center mb-2"
                        >
                            <i class="fas fa-user fs-3"></i>
                        </div>
                        <div class="mb-2">김동현님</div>
                        <div class="badge bg-warning rounded-pill">
                            GOLD
                        </div>
                    </div>
                </li>
                <li
                        class="d-flex justify-content-center align-items-start col-2 border py-2"
                >
                    <div
                            class="d-flex justify-content-center align-items-center flex-column"
                    >
                        <div
                                class="fw-bold d-flex justify-content-center align-items-center mb-2"
                        >
                            <i class="fas fa-stamp fs-3"></i>
                        </div>
                        <div class="mb-2">쿠폰함</div>
                        <div  class="badge bg-primary rounded-pill">
                            1장
                        </div>
                    </div>
                </li>
                <li
                        class="d-flex justify-content-center align-items-start col-2 border py-2"
                >
                    <div
                            class="d-flex justify-content-center align-items-center flex-column"
                    >
                        <div
                                class="fw-bold d-flex justify-content-center align-items-center mb-2"
                        >
                            <i class="fas fa-truck fs-3"></i>
                        </div>
                        <div class="mb-2">배송중</div>
                        <div class="badge bg-primary rounded-pill">0</div>
                    </div>
                </li>
                <li
                        class="d-flex justify-content-center align-items-start col-2 border py-2"
                >
                    <div
                            class="d-flex justify-content-center align-items-center flex-column"
                    >
                        <div
                                class="fw-bold d-flex justify-content-center align-items-center mb-2"
                        >
                            <i class="fas fa-box fs-3"></i>
                        </div>
                        <div class="mb-2">배송완료</div>
                        <div id="state_complete" class="badge bg-primary rounded-pill">
                            0
                        </div>
                    </div>
                </li>
                <li
                        class="d-flex justify-content-center align-items-start col-2 border py-2"
                >
                    <div
                            class="d-flex justify-content-center align-items-center flex-column"
                    >
                        <div
                                class="fw-bold d-flex justify-content-center align-items-center mb-2"
                        >
                            <i class="fas fa-undo-alt fs-3"></i>
                        </div>
                        <div class="mb-2">취소/반품/교환</div>
                        <div id="state_trade" class="badge bg-primary rounded-pill">
                            0
                        </div>
                    </div>
                </li>
            </ol>

        <!-- 페이지 컨텐츠 레이아웃 -->
        <%-- =========================== MEMBER 기본 정보 FORM 시작 ========================== --%>
            <div class="form" style="padding: 50px 70px">
                <div class="row m-4">
                    <div class="col-12">
                        <p style="font-family: '210 Soopilmyungjo'">{mem_id} 님의 정보입니다.</p>
                    </div>
                    <hr>
                </div>

                <%-- 생년월일 info ROW  --%>
                <div class="row m-4">
                    <%--    사용자에게 생년월일을 보이게 할 것인지?
                    어차피 수정이 되지 않는다면 화면에는 보이지 않도록?
                    생년월일(수정 X)
                    --%>
                </div>

                <!-- 전화번호 info ROW. -->
                <div class="row m-4">
                    <div class="col-3">
                        <h5>전화번호</h5>
                    </div>
                    <div class="col-9 mb-3">
                        <div class="input-group mb-3 w-100">
                            <input name="mem_phone" type="text" class="form-control" aria-describedby="button-addon3" value="010-1234-5678" disabled>
                            <button class="btn btn-outline-secondary" type="button" id="button-addon3">수정</button>
                        </div>
                    </div>
                </div>

                <!-- 이메일 입력 ROW입니다. -->
                <div class="row m-4">
                    <div class="col-3">
                        <h5>이메일 주소</h5>
                    </div>
                    <div class="col-9 mb-3">
                        <div class="input-group mb-3 w-100">
                            <input name="mem_email" type="text" class="form-control" aria-describedby="button-addon4" value="dong@mail.com" disabled>
                            <button class="btn btn-outline-secondary" type="button" id="button-addon4">수정</button>
                        </div>
                    </div>
                </div>

                <!-- 주소 ROW : 우편번호  -->
                <div class="row m-4">
                    <div class="col-3">
                        <h5> 주소 </h5>
                    </div>
                    <div class="col-9">
                        <div class="input-group mb-3">
                            <input name="mem_zipcode" type="text" class="form-control" id="sample4_roadAddress" value="12345" aria-describedby="button-addon2" disabled>
                            <button class="btn btn-outline-secondary" type="button" onclick="sample4_execDaumPostcode()" >수정하기</button>
                        </div>
                    </div>
                </div>

                <!-- 주소 ROW : 주소 1 -->
                <div class="row m-4">
                    <div class="col-3"></div>
                    <div class="col-9">
                        <div class="input-group mb-3">
                            <input name="mem_address" type="text" class="form-control" id="sample4_roadAddress" value="00로 00길 55" disabled>
                        </div>
                    </div>
                </div>

                <!-- 주소 ROW : 주소 2 -->
                <div class="row m-4">
                    <div class="col-3"></div>
                    <div class="col-9">
                        <div class="input-group mb-3">
                            <input name="mem_address2" type="text" class="form-control" id="sample4_detailAddress" value="00아파트 101호" disabled>
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>
                    <hr>
                </div>
            </div>
            <%-- =========================== MEMBER 기본 정보 FORM 끝 ========================== --%>

            <%-- =========================== 인증 MODAL 시작 ============================ --%>
            <div class="modal">
                <div class="row">
                        <div class="col-12" style="background-color: #b6d4fe;">
                            <button class="btn-close"/>
                        </div>
                </div>
                <div class="modal_content m-4">
                    <div class="row m-4" style="text-align: center;">
                        <h6>
                            {mem_id}의 회원정보를 </br>
                            수정하기 위한 </br>
                            인증절차가 필요합니다.
                        </h6>
                        <hr>
                    </div>
                    <%--        인증번호 INPUT 시작            --%>
                    <div class="row m-4">
                        <div class="input-group mb-3 w-100">
                            <input type="text" class="form-control" aria-describedby="button-addon2" placeholder="인증번호를 입력해 주세요.">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증번호 발송</button>
                        </div>
                    </div>
                    <%--        인증번호 INPUT 끝            --%>
                </div>
                <%--   취소, 완료 버튼  --%>
                <div class="row m-4 justify-content-sm-center" >
                    <div class="col-6 text-center">
                        <button class="btn-exit"> 취소 </button>
                    </div>
                    <div class="col-6 text-center">
                        <button class="btn-succ"> 완료 </button>
                    </div>
                </div>
            </div>


            </main>
            </div>
            <!-- 메인 -->

            <!-- 마이 페이지 끝 -->

    <!-- 풋터 시작 -->
    <%@include file="../../includes/footer.jsp" %>
    <!-- 풋터 끝 -->
    </body>
    </html>

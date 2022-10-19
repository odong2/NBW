<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    <title>MyPage</title>
    <style>
        a {
            color: black;
        }
        .divTitle {
            margin-top: 10px;
            font-size: large;
        }
        .explainTitle {
            font-size: 25px;
        }
        .typePick {
            width: 300px;
        }
        .sendbtn {
            background-color: #e0e0e0;
            color: black;
            border: 0;
            outline: 0;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 5px;
            padding-bottom: 5px;
        }
        .qnatypepick {
            margin-top: 10px;
        }
        .qnacontent {
            margin-top: 10px;
        }
        .dbtn {
            display: flex;
            justify-content: center;
        }
        .sendbtn {
            font-size: 18px;
            font-weight: bolder;
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
        <div class="divTitle">신청한 이벤트보기</div>
        <hr />
        <div class="explainTitle">제품 / 교환 / 반품 등 이용에 관한 궁금증을 해결하세요.</div>
        <form action="">
            <div class="qnatypepick">문의 유형 선택</div>
            <div class="typePick">
                <select class="" style="width: 600px; height: 30px">
                    <option selected>선택</option>
                    <option value="1">제품</option>
                    <option value="2">교환</option>
                    <option value="3">반품</option>
                </select>
            </div>
            <div class="qnacontent">문의 내용</div>
            <div class="mb-3">
                <textarea rows="3" style="width: 600px"></textarea>
            </div>
            <div class="dbtn"><button class="sendbtn">전송</button></div>
        </form>
    </main>
</div>
<!-- 메인 -->
<!-- 마이 페이지 끝 -->

<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

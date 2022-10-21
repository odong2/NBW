<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    <title>MyPageEvent</title>
    <style>
        a {
            color: black;
        }
        /* 이벤트 전체 */
        .applylist {
            display: flex;
        }
        /* 이벤트 전체 */
        /* 행사 포스터 */
        .classimg {
            flex: 1;
            width: 110px;
            height: 180px;
            margin-right: 10px;
        }
        .classimg > img {
            width: 70%;
            height: 100%;
        }
        /* 행사 포스터 */
        /* 행사 설명 시작 */
        .playcontent {
            flex: 3;
        }
        /* 행사 제목 */
        .titlename {
            font-size: 30px;
            font-weight: bold;
            margin-top: 20px;
        }
        /* 행사 제목 */
        /* 행사기간 */
        .playday {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        /* 행사기간 */
        /* 행사장소 */
        .playspace {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        /* 행사장소 */
        /* 행사시간 */
        .playtime {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        /* 행사시간 */
        /* 행사 설명 끝 */
        /* 상세보기 버튼 */
        .playdetail {
            flex: 1;
            margin-left: 100px;
            margin-top: 60px;
            width: 130px;
            text-align: center;
        }
        .pick-btn {
            height: 38px;
            justify-content: flex-end;
            padding: 0 19px;
            border: 1px solid #d9d9d9;
            color: #505050;
            font-size: 15px;
            text-align: center;
        }
        /* 상세보기 버튼 */
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
        <%-- 신청한 이벤트 시작--%>
        <div>
            <h4 id="divTitle">신청한 이벤트보기</h4>
        </div>
        <hr />
        <div class="applylist">
            <!-- 행사 포스터 시작 -->
            <div class="classimg">
                <img src="https://lib.seoul.go.kr/apload/temp/20221012/1368702620008870.jpg" />
            </div>
            <!-- 행사 포스터 끝 -->
            <!-- 행사 설명 시작-->
            <div class="playcontent">
                <div class="titlename">책읽는 서울광장</div>
                <div class="playday">
                    <div>행사기간&nbsp;:&nbsp;</div>
                    <div>2022/10/12</div>
                    <div>&nbsp;~&nbsp;</div>
                    <div>2022/10/20</div>
                </div>
                <br />
                <div class="playspace">
                    <div>장소&nbsp;:&nbsp;</div>
                    <div>서울광장</div>
                </div>
                <br />
                <div class="playtime">
                    <div>요일/시간&nbsp;:&nbsp;</div>
                    <div>금요일 12:00&nbsp;~&nbsp;13:00</div>
                </div>
            </div>
            <!-- 행사 설명 끝-->
            <!-- 상세보기 버튼 시작 -->
            <div class="playdetail">
                <button class="pick-btn">상세보기</button>
            </div>
            <!-- 상세보기 버튼 끝 -->
        </div>
        <hr />
        <div class="applylist">
            <!-- 행사 포스터 시작 -->
            <div class="classimg">
                <img src="https://lib.seoul.go.kr/apload/temp/20221015/1631677478910955.jpg" />
            </div>
            <!-- 행사 포스터 끝 -->
            <!-- 행사 설명 시작-->
            <div class="playcontent">
                <div class="titlename">동현이와 함께하는 코딩</div>
                <div class="playday">
                    <div>행사기간&nbsp;:&nbsp;</div>
                    <div>2022/10/12</div>
                    <div>&nbsp;~&nbsp;</div>
                    <div>2022/10/20</div>
                </div>
                <br />
                <div class="playspace">
                    <div>장소&nbsp;:&nbsp;</div>
                    <div>개발자카페</div>
                </div>
                <br />
                <div class="playtime">
                    <div>요일/시간&nbsp;:&nbsp;</div>
                    <div>금요일 12:00&nbsp;~&nbsp;13:00</div>
                </div>
            </div>
            <!-- 행사 설명 끝-->
            <!-- 상세보기 버튼 시작 -->
            <div class="playdetail">
                <button class="pick-btn">상세보기</button>
            </div>
            <!-- 상세보기 버튼 끝 -->
        </div>
        <hr />
        <%-- 신청한 이벤트 끝 --%>
    </main>
</div>
<!-- 메인 -->
<!-- 마이 페이지 끝 -->

<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
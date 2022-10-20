<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- sidebar 시작(include) -->
<style>
    body {
        height: 100vh;
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        position: relative;
    }
    .main {
        width: 1200px;
    }
    .mypage {
        margin-top: 50px;
    }
    .sidebar {
        margin-left: 270px;
        width: 270px;
        height: 100vh;
    }
    .sidebar ul {
        padding: 0;
    }
    li {
        list-style: none;
    }
    .sidebar a {
        text-decoration: none;
        color: black;
        font-size: 0.8rem;
        margin-left: 15px;
    }
    .sidebar a:active {
        color: #676bad;
        font-weight: bold;
    }
    .sidebar a:hover {
        color: #676bad;
        font-weight: bold;
        font-size: 0.9rem;
    }

    .sidebar .side-link {
        margin-top: 7px;
        margin-bottom: 7px;
    }
    .sidebarList .title {
        margin-left: 15px;
        font-weight: bold;
        font-size: 0.9rem;
    }
    #userInfo {
        text-align: center;
        width: 150px;
        height: 200px;
        background-color: #676bad;
        border-radius: 10px;
        color: white;
        padding: 20px;
        margin-right: 50px;
    }
    .info-label {
        font-size: 0.9rem;
    }
    .info-detail,
    #membership {
        font-size: 0.8rem;
    }
</style>
    <section class="sidebar">
        <div id="userInfo" class="container-fulid wrapper mb-3">
            <div class="mb-3">
                <img src="/images/mypageuser.png" alt="" width="60px" />
            </div>
            <div class="wrapper">
                <span id="user-name">이유리님</span>
            </div>
            <div class="wrapper d-flex ms-3">
                <div>
                    <img src="/images/gold-medal.png" alt="" width="20px" />
                </div>
                <div class="mt-1">
                    <span id="membership">골드회원</span>
                </div>
            </div>
            <div class="wrapper d-flex mt-2">
                <div class="me-4">
                    <div class="info-label">
                        <span>쿠폰</span>
                    </div>
                    <div class="info-detail">
                        <span>5개</span>
                    </div>
                </div>
                <div>
                    <div class="info-label">
                        <span>포인트</span>
                    </div>
                    <div class="info-detail">
                        <span>2000</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- 사이드바 메뉴 시작 -->
        <section>
            <ul class="sidebarList mt-4">
                <li>
                    <ul>
                        <li class="title">
                            <span>쇼핑내역</span>
                        </li>
                        <li class="side-link">
                            <a href="#"> 주문조회 </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li class="title mt-4">
                            <span>문의내역</span>
                        </li>
                        <li class="side-link">
                            <a href="#"> 문의내역 </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li class="title mt-4">
                            <span>커뮤니티 활동</span>
                        </li>
                        <li class="side-link">
                            <a href="#"> 좋아요 상품</a>
                        </li>
                        <li class="side-link">
                            <a href="#"> 작성리뷰</a>
                        </li>
                        <li class="side-link">
                            <a href="#"> 내가 남긴 댓글</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li class="title mt-4">
                            <span>혜택</span>
                        </li>
                        <li class="side-link">
                            <a href="#"> 쿠폰등록 </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li class="title mt-4">
                            <span>회원정보</span>
                        </li>
                        <li class="side-link">
                            <a href="#"> 배송지 관리</a>
                        </li>
                        <li class="side-link">
                            <a href="#"> 개인정보 수정</a>
                        </li>
                        <li class="side-link">
                            <a href="#"> 비밀번호 변경</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li class="title mt-4">
                            <span>이벤트 </span>
                        </li>
                        <li class="side-link">
                            <a href="#"> 이벤트 신청 내역</a>
                        </li>
                        <li class="side-link">
                            <a href="#"> 참여중 이벤트</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </section>
    </section>

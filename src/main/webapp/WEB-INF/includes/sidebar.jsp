<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- sidebar 시작(include) -->
    <section class="sidebar">
        <div id="userInfo" class="container-fulid wrapper mb-3">
            <div class="mb-3">
                <img src="/images/mypageuser.png" alt="" width="60px" />
            </div>
            <div class="wrapper">
                <span id="user-name">${sessionScope.member.getMem_name()}님</span>
            </div>
            <div class="wrapper d-flex ms-3">
                <div>
                    <img src="/images/gold-medal.png" alt="" width="20px" />
                </div>
                <div class="mt-1">
                    <span id="membership">${sessionScope.member.getG_grade()}회원</span>
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
                        <span>${sessionScope.member.getMem_point()}</span>
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
                            <a href="/mypage/history"> 상품 이력</a>
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
                            <a href="/mypage/info"> 개인정보 수정</a>
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
                            <a href="/mypage/event/list"> 이벤트 신청 내역</a>
                        </li>
                        <li class="side-link">
                            <a href="#"> 참여중 이벤트</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </section>
    </section>

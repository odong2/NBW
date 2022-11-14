<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 모달 시작 --%>
<section class="img-modal-section">
    <div class="modal fade" id="imgModalToggle" aria-hidden="true"
         aria-labelledby="exampleModalToggleLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: 1rem;">
                <div class="modal-header">
                    <c:choose>
                        <c:when test = "${empty myInfo.getMem_img()}">
                            <h1 class="modal-title fs-5" id="exampleModalToggleLabel">프로필 사진 등록</h1>
                        </c:when>
                        <c:otherwise>
                            <h1 class="modal-title fs-5" id="exampleModalToggleLabel">프로필 사진 수정</h1>
                        </c:otherwise>
                    </c:choose>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3 d-flex flex-column text-sm-center" id="myImg-box" style="text-align: center;">
                        <label for="fileInput" style="width: 40px; height: 40px; float: right; margin-bottom: 30px;"><img src="/images/edit.png" alt="" width="40" height="40"></label>
                        <div id="img-box">
                            <!-- 기존 이미지와 변경할 이미지를 보여줄 div  -->
                            <c:choose>
                                <c:when test = "${empty myInfo.getMem_img()}">
                                    <img src="/images/undefine_img.png" width="450" height="450" alt=""/>
                                </c:when>
                                <c:otherwise>
                                    <img src="<c:url value='/mypage/profile/${myInfo.getMem_img()}'/>" alt="" width="450" height="450" style="border-radius: 50%;" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="row">
                            <!-- 파일 전송 Form 태그 -->
                            <form action="/mypage/photo"
                                  method="POST" enctype="multipart/form-data">
                                <input type="file"
                                       accept="image/jpeg, image/gif, image/png"
                                       name="uploadFile"
                                       id="fileInput"
                                       onchange="myImgUrl(this)"
                                       style="display: none;"
                                >
                                <div class="mt-3">
                                    <button type="submit" id="uploadBtn" style="background-color: #2a3b72; border-radius: 10px; width: 120px; height: 50px; color: white; font-size: large; border: none; margin-top: 30px;"> 등록 </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- sidebar 시작(include) -->
    <section class="sidebar">
        <div id="userInfo" class="container-fulid wrapper mb-3">
            <div class="mb-3">
                <c:choose>
                    <c:when test = "${empty myInfo.getMem_img()}">
                        <img src="/images/mypageuser.png" alt="" width="80px" height="80px" style="border-radius: 50%;" />
                    </c:when>
                    <c:otherwise>
                        <img src="<c:url value='/mypage/profile/${myInfo.getMem_img()}'/>" alt="" width="80px" height="80px" style="border-radius: 50%;"/>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="wrapper">
                <span id="user-name">${myInfo.getMem_name()}님</span>
                <%--                모달 여는 버튼              --%>
                <button id="img-change-modal" data-bs-target="#imgModalToggle" data-bs-toggle="modal" style="border-radius: 50px; width: 30px; height: 27px; border: 1px solid white;" >
                    <i class="fas fa-image"></i>
                </button>
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
                            <a href="/mypage/qna/list"> 문의내역 </a>
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
<script type="text/javascript">
    /* 회원 사진 이미지 업로드 */
    function myImgUrl(input) {
        let reader = new FileReader();
        reader.onload = function(e) {
            let src = e.target.result;
            $('#img-box').empty();
            $('#img-box').append('<img class="ms-2 border border-dark" alt="" src="'+src+'" style="width: 450px; height: 450px; border-radius: 50%">')
        };
        reader.readAsDataURL(input.files[0]);
    }
</script>


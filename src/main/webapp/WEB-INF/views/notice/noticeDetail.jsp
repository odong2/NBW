<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Title</title>
    <%@include file="/WEB-INF/includes/common.jsp" %>
    <title>공지사항 상세페이지</title>
    <style>
        li {
            list-style: none;
        }
        body {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        main {
            width: 700px;
            margin: auto;
        }
        #notice-content {
            font-size: 0.8rem;
        }
        .container-title {
            margin-top: 30px;
            margin-bottom: 100px;
            padding: 15px;
        }
        .notice-header {
            border-bottom: solid 1px #8c8c8c;
            padding-bottom: 50px;
        }
        .header-img {
            width: 0.9rem;
        }
        .header-text {
            font-size: 0.8rem;
        }

        .content {
            margin-top: 50px;
            margin-bottom: solid 1px #8c8c8c;
            padding-bottom: 50px;
        }
        .user-contatiner {
            align-items: center;
        }
        #notice-content {
            border-bottom: solid 1px #8c8c8c;
            padding-bottom: 40px;
            margin-bottom: 40px;
        }
        .comment-input {
            margin-top: 50px;
            border: solid 0.8px #8c8c8c;
            border-radius: 10px;
        }
        .user-icon {
            width: 40px;
        }
        .reply-commentBtn,
        .reply-modifyBtn,
        .reply-deleteBtn {
            border: 0;
            outline: 0;
            background-color: white;
            font-size: 0.8rem;
        }

        #foldBtn {
            border: none;
            background-color: white;
            color: #1568d6;
            font-size: 0.8rem;
            padding: 0;
        }

        div > .repMod {
            position: relative;
            right: 5px;
            margin-top: 5px;
        }

        .reply-deleteBtn {
            position: relative;
            right: 10px;
        }
        #wrtRepBtn,
        #delRepBtn {
            border: none;
            border-radius: 10%;
            outline: none;
        }
        #comment-inputBtn {
            height: 40px;
            font-size: 10px;
        }
        #reply-input {
            border-radius: 5px;
        }
        ul {
            padding: 0;
        }
        a {
            text-decoration: none;
            font-size: 0.8rem;
        }
        .comment-display p,
        .comment-display,
        .reply-modifyBtn,
        .reply-deleteBtn,
        #comment-input,
        #noticeListBtn,
        .reply-commentBtn {
            font-size: 0.7rem;
        }

        .comment-content p {
            font-size: 0.8rem;
        }
        .reply-accordion li {
            padding-left: 1rem;
        }
        #reply-input {
            border: 1px solid #8c8c8c;
            padding:5px;
        }
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<%-- ================================ 공지사항 메인 시작 ================================= --%>
<main>
    <section class="container-title text-center">
        <h5>공지사항</h5>
        <h6>NBW 전체 공지사항 페이지</h6>
    </section>
    <%-- ================================ 공지사항 header 시작 ================================= --%>
    <section class="notice-header">
        <h5 class="mb-3">결제시스템 오류로 인해 결제가 불가합니다.</h5>
        <div class="d-flex">
            <div class="me-3">
                <img class="header-img" src="/images/eyes.png" alt="조회수 이미지" />
                <span id="notice-hit" class="header-text me-2">20</span>
            </div>
            <div>
                <img class="header-img" src="/images/clock.png" alt="등록 날짜 이미지" />
                <span id="cdate" class="header-text"> 2022-09-01</span>
            </div>
        </div>
    </section>
    <%-- ================================ 공지사항 header 끝 ================================= --%>
    <%-- ================================ 공지사항 content 시작 ================================= --%>
    <section class="content">
        <div id="notice-content">
            [OKKY 특별 성명]  '앱 마켓 사업자 결제방식 강제 금지' 법안 통과 환영
            '앱 마켓 사업자 결제방식 강제 금지' 법안의 국회 본회의 통과 소식을
            환영한다.  지난해 구글이 밝힌 '인앱 결제' 사용 의무화 방안 시행(모든
            앱과 디지털 콘텐츠에서 오는 10월부터 적용 예정)에 대해 대한민국 세계
            최초로 입법화를 통한 인앱 결제 강요를 금지하였다. 인앱 결제는 구글
            플레이로 출시한 앱에서 웹툰, 음악, 게임 등 콘텐츠를 결제할 때 구글의
            결제 시스템만 이용하게 강제하는 것으로, 구글이 결제액의 30%를 수수료로
            가져가게 되는데 이는 거대 기업의 반독점 적이며 공정한 앱 생태계를
            파괴하는 행위임에 틀림없다.  이에 대한 한국의 '앱 마켓 사업자 결제방식
            강제 금지' 법안은 인앱 결제 강제 방식에 관한 내용뿐만 아니라 부당하게
            앱 심사를 지연하고, 앱 마켓에서 모바일 콘텐츠를 부당하게 삭제하는 것을
            금지하는 내용 또한 포함되어 있어 소비자는 물론 플랫폼 사업자들의 많은
            지지를 받고 있다. 미국 게임 '포트나이트'의 개발사 에픽게임즈의 팀
            스위니 대표가 자신의 트위터로 '나는 한국인이다!'라는 트윗을 남겼고
            세계 1위 소셜 데이팅 앱 틴더의 운영사 매치그룹은 성명을 내고 "공정한
            앱 생태계를 만들어가기 위한 역사적인 조치"라며 기념비적인 날이라고
            환영하기도 했다. 한국의 첫 입법화에 따라 미국과 영국 등에서도 유사한
            입법 논의가 본격화되고 있는 만큼 구글 플레이스토어를 사용하는 다른
            나라에도 널리 확산되기를 바라는 바이다.  또한, 이번 구글의 반독점적
            인앱 결제 사용 의무화 방안 외에도 국내 플랫폼 회사들의 우월적 지위를
            이용한 부당하고 불공정한 행위에 대해 정부와 시장은 감시를 게을리하지
            말아야 할 것이다.
        </div>
        <div class="file">
            <i class="fas fa-file-alt"></i>
            <span style="font-size: 0.7rem">첨부파일</span>
        </div>
        <div class="d-flex justify-content-center mt-5">
            <button id="noticeListBtn" type="button" class="btn btn-secondary">
                목록으로
            </button>
        </div>
    </section>
    <%-- ================================ 공지사항 content 시작 ================================= --%>
    <%-- ================================ 댓글 입력 시작================================= --%>
    <section class="comment-input">
        <div
                class="comment-wrapper d-flex justify-content-center mt-4 mb-4 col-12"
        >
            <div class="user-contatiner d-flex me-2">
                <img src="/images/blueuser.png" alt="댓글입력 유저 기본 이미지" style="width: 40px"/>
            </div>
            <div class="form- col-8">
            <textarea class="form-control" id="comment-input" name="comment" placeholder="댓글을 작성해 주세요"></textarea>
            </div>
            <div class="col-2 d-flex align-items-end justify-content-center ms-2">
                <button id="comment-inputBtn" type="button" class="btn btn-success">댓글 쓰기</button>
            </div>
        </div>
    </section>
    <%-- ================================ 댓글 입력 끝================================= --%>
    <%-- ================================ 댓글 보기 시작================================= --%>
    <section class="comment-display">
        <ul class="mt-5">
            <li class="commentList mt-5">
                <div class="notice-commenter me-2 d-flex align-items-center">
                    <div class="user-icon">
                        <img src="/images/blueuser.png" alt="유저기본이미지" style="width: 40px"/>
                    </div>
                    <div class="flex-column ms-3">
                        <div class="notice-commenter">
                            <span>김민준</span>
                        </div>
                        <div class="commenter-cdate">
                            <span class="text-muted" style="font-size: 0.8rem">2022-10-01 작성</span>
                        </div>
                    </div>
                </div>
                <div class="comment-content mt-3">
                    <p>
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere
                        qui vero consectetur nesciunt, voluptate at aspernatur in? Omnis
                        sunt maiores adipisci odio numquam, sint voluptatum officiis
                        recusandae sit incidunt dolor.
                    </p>
                </div>
                <div class="container d-flex justify-content-end" style="border-bottom: solid 1px #8c8c8c; padding-bottom: 30px" ;>
                    <button class="reply-commentBtn mt-3 me-2 text-muted">댓글 쓰기</button>
                </div>
            </li>
            <li class="commentList mt-5">
                <div class="notice-commenter me-2 d-flex align-items-center">
                    <div class="user-icon">
                        <img src="/images/blueuser.png" alt="유저기본이미지" style="width: 40px"/>
                    </div>
                    <div class="flex-column ms-3">
                        <div class="notice-commenter">
                            <span>김민준</span>
                        </div>
                        <div class="commenter-cdate">
                            <span class="text-muted" style="font-size: 0.8rem">2022-10-01 작성</span>
                        </div>
                    </div>
                </div>
                <div class="comment-content mt-3">
                    <p>
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere
                        qui vero consectetur nesciunt, voluptate at aspernatur in? Omnis
                        sunt maiores adipisci odio numquam, sint voluptatum officiis
                        recusandae sit incidunt dolor.
                    </p>
                </div>
                <%-- ================================ 대댓글 있는 경우 collapse =============================== --%>
                <div class="reply-display">
                    <ul class="reply-accordion">
                        <button id="foldBtn" type="button" aria-selected="false">
                            답글 보기▼
                        </button>
                        <li>
                            <div class="reply-container mt-4">
                                <div class="reply-info me-2 d-flex align-items-center">
                                    <div class="user-icon">
                                        <img src="/images/blueuser.png" alt="유저기본이미지" style="width: 30px"/>
                                    </div>
                                    <div class="flex-column ms-1">
                                        <div class="reply-commenter">
                                            <span>김민준</span>
                                        </div>
                                        <div class="reply-cdate">
                                            <span class="text-muted" style="font-size: 0.8rem">2022-10-01 11:05 작성</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="reply-content mt-2 ms-5">
                                    <span>대댓글 테스트중</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="reply-container mt-4">
                                <div class="reply-info me-2 d-flex align-items-center">
                                    <div class="user-icon">
                                        <img src="/images/blueuser.png" alt="유저기본이미지" style="width: 30px"/>
                                    </div>
                                    <div class="flex-column ms-1">
                                        <div class="reply-commenter">
                                            <span>김민준</span>
                                        </div>
                                        <div class="reply-cdate">
                                            <span class="text-muted" style="font-size: 0.8rem">2022-10-01 13:25 작성</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="reply-content mt-2 ms-5">
                                    <span>대댓글 내용입니다</span>
                                </div>
                                <div class="repMod ms-5">
                                    <button class="reply-modifyBtn text-muted">수정</button>
                                    <button class="reply-deleteBtn text-muted">삭제</button>
                                </div>
                                <div class="ms-5">
                                    <input type="text" class="modify-input col-7" name="modify-input" style="display: none"/>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <%-- ================================ 대댓글 보기 collapse 끝 =============================== --%>
                <div class="container d-flex justify-content-end" style="border-bottom: solid 1px #8c8c8c; padding-bottom: 30px" ;>
                    <button class="reply-commentBtn mt-3 me-2 text-muted">댓글 쓰기</button>
                </div>
            </li>
        </ul>
    </section>
    <%-- ================================ 댓글 보기 끝================================= --%>
    <%-- ================================ 대댓글 입력 폼 시작 =============================== --%>
    <section id="replyForm" style="display: none" class="mt-5">
        <input type="text" name="replyComment" id="reply-input" placeholder="대댓글을 입력해 주세요." class="col-5"/>
        <button id="wrtRepBtn" type="button" class="btn-primary ms-2">등록 </button>
        <button id="delRepBtn" type="button" class="btn-danger ms-2">취소</button>
    </section>
    <%-- ================================ 대댓글 입력 폼 끝 =============================== --%>
</main>
<script>
    $(".commentList").on("click", ".reply-commentBtn", function () {
        const replyCommentBtn = this;
        $(".reply-commentBtn").show();
        $("#replyForm").appendTo($(this).parent());
        $("#replyForm").addClass("d-flex justify-content-end col-12");
        $("#replyForm").css("display", "block");
        // 댓글쓰기 버튼 안보이도록
        $(this).css("display", "none");

        // 대댓글 달기 취소 이벤트
        $("#delRepBtn").click(function () {
            // 댓글 쓰기 버튼 보이도록
            $(replyCommentBtn).css("display", "block");
            $("#replyForm").appendTo("body");
            $("#replyForm").removeClass("d-flex justify-content-end col-12");
            $("#replyForm").css("display", "none");
        });
    });

    // window.onload
    $(function () {
        // 대댓글 답글보기를 위해 숨겨놓기
        $(".reply-container").css("display", "none");

        // 목록으로 가기 이벤트
        $("#noticeListBtn").on("click", function () {
            location.href =
                "<c:url value='/notice/noticePageTest/'/>?page=${page}";
        });
    });

    let active = false;

    //답글보기 클릭 이벤트
    $(".reply-accordion #foldBtn").click(function (e) {
        e.preventDefault();
        $(this)
            .closest("li")
            .find(".reply-container")
            .not(":animated")
            .slideToggle(100);
    });

    $(".commentList").on("click", ".reply-commentBtn", function () {});
    $(".reply-container").on("click", ".reply-modifyBtn", function () {
        $(".modify-input").css("display", "block");
        $();
    });
</script>
</body>
</html>

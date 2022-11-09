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
        #noticeContent li{
            list-style: inherit;
        }
        @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body {
            font-family: GangwonEdu_OTFBoldA;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        main {
            width: 900px;
            margin: auto;
        }
        .container-title {
            margin-top: 30px;
            margin-bottom: 100px;
            padding: 15px;
        }
        .notice-header {
            padding-bottom: 10px;
        }
        .header-img {
            width: 1.3rem;
        }
        .header-text {
            font-size: 1.1rem;
        }

        .content {
            margin-top: 50px;
            padding-bottom: 50px;
        }
        .user-contatiner {
            align-items: center;
        }
        #noticeContent {
            border-top: solid 1px #8c8c8c;
            padding-top: 40px;
            border-bottom: solid 1px #8c8c8c;
            padding-bottom: 40px;
            margin-bottom: 40px;
            font-size: 1.1rem;
        }
        .comment-input {
            margin-top: 50px;
            border: solid 1px #8c8c8c;
            border-radius: 10px;
        }
        .comment-input textarea{
            resize: none;
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
        .comment-modifyBtn,
        .comment-deleteBtn{
            border: 0;
            background-color: white;
        }

        .comment-deleteBtn{
            padding-left:0;
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
        #wrtBtn,
        #modOutBtn {
            border: none;
            border-radius: 10%;
            outline: none;
            width: 50px;
        }
        .comment-inputBtn {
            height: 40px;
            background-color: #065FD4;
            border-radius: 7px;
            font-size: 0.7rem;
            color: white;
        }
        #modifyForm{
            min-height: 30px;
            height: auto;
        }
        /* textArea 스크롤바 없애기*/
        #modifyInput::-webkit-scrollbar {
            display: none;
        }
        #replyInput::-webkit-scrollbar {
            display: none;
        }
        #modifyInput,
        #replyInput{

            resize: none;
            border: none;
            border-bottom: solid 1px rgba(152,152,152,0.8);
            height: auto;
            /*border-radius: 5px;*/
            /*border: 1px solid #8c8c8c;*/
        }
        #modifyInput:focus,
        #replyInput:focus{
            outline-style: none;
        }
        ul {
            padding: 0;
        }
        a {
            text-decoration: none;
            font-size: 0.8rem;
        }
        #comment-display p,
        #comment-display,
        .reply-modifyBtn,
        .reply-deleteBtn,
        #comment-input,
        #noticeListBtn,
        .reply-commentBtn {
            font-size: 0.9rem;
        }
        #noticeListBtn{
            background-color: white;
            border:1px solid #4e73df;
            color:#4e73df
        }

        .reply-accordion li {
            padding-left: 1rem;
        }

        #noticeContent{
            line-height: 2rem;
        }
        .commentMod{
            /*border-bottom: solid 1px #8c8c8c;*/
            /*padding-bottom: 30px*/
        }
        .notice-commenter{
            font-size:0.9rem;
        }
        .reply-commenter,
        .reply-cdate{
            font-size:0.8rem;
        }
        #commentList{
            width:90%;
        }
        .file a{
            color: black;
            margin-left: 5px;
        }
        .file a:hover{
            color: #4e73df;
            font-weight: bold;
        }
        .toast-container{
            z-index: 100;
        }
        .top-comment{
            border-top: 1px solid rgba(152,152,152,0.7);
            padding-top: 30px;
        }
        #repWrtBtn, #wrtBtn{
            background-color: white;
            color: black;
            font-size: 0.9rem;
            border: 1.3px solid #5055b170;
            border-radius: 5px;
            width: 50px;

        }
        #repModOutBtn, #modOutBtn{
            background-color: white;
            color: black;
            font-size: 0.9rem;
            border: 1.3px solid #a5283470;
            border-radius: 5px;
            width: 50px;

        }
        #repWrtBtn:hover,#wrtBtn:hover{
            border: 1.5px solid #5055b1;
            font-size: 1rem;
            background-color: #5055b150;
        }
        #repModOutBtn:hover,#modOutBtn:hover{
            border: 1.5px solid #a52834;
            font-size: 1rem;
            background-color: #a5283450;
        }
    </style>
</head>
<body>
<%-- ====================Header include ==================== --%>
<%@include file="/WEB-INF/includes/header.jsp" %>
<%-- ================================ 공지사항 메인 시작 ================================= --%>
<main>
    <section class="container-title text-center">
        <h5>공지사항</h5>
        <h6>NBW 전체 공지사항 페이지</h6>
    </section>
    <%-- ================================ 공지사항 header 시작 ================================= --%>
    <section class="notice-header">
        <%-- =============== 제목 바인딩 ================ --%>
        <h3 class="mb-4"><c:out value="${noticeDto.nt_title}"/></h3>
        <div class="d-flex">
            <div class="me-3">
                <img class="header-img" src="/images/eyes.png" alt="조회수 이미지" />
                <%-- =============== 조회수 바인딩 ================ --%>
                <span id="noticeHit" class="header-text me-2 "><c:out value="${noticeDto.nt_hit}"/> </span>
            </div>
            <div>
                <img class="header-img" src="/images/clock.png" alt="등록 날짜 이미지" />
                <%-- =============== 날짜 바인딩 ================ --%>
                <span id="cdate" class="header-text "> <fmt:formatDate pattern="yyyy-MM-dd" value="${noticeDto.nt_cdate}"/></span>
            </div>
        </div>
    </section>
    <%-- ================================ 공지사항 header 끝 ================================= --%>
    <%-- ================================ 공지사항 content 시작 ================================= --%>
    <section class="content">
        <div id="noticeContent">${noticeDto.nt_content}</div>
        <div class="file">
            <c:set var="file" value="${noticeDto.nt_file}"/>
            <c:if test="${not empty file}">
                <c:choose>
                    <%-- 한글 파일일 경우 --%>
                    <c:when test="${fn:contains(file, '.hwp')}">
                            <img src="/images/hwp.png" width="25px"/>
                            <a href="/admin/notice/download?fileName=${noticeDto.nt_file}">
                                <c:out value="${noticeDto.nt_filename}"/>
                            </a>
                    </c:when>
                    <%-- 엑셀일 경우 파일일 경우 --%>
                    <c:when test="${fn:contains(file, '.xlsx')}">
                            <img src="/images/xlsx.png" width="20px"/>
                            <a href="/admin/notice/download?fileName=${noticeDto.nt_file}">
                                <c:out value="${noticeDto.nt_filename}"/>
                            </a>
                    </c:when>
                    <%-- pdf일 경우 파일일 경우 --%>
                    <c:when test="${fn:contains(file, '.pdf')}">
                            <img src="/images/pdf.png" width="23px"/>
                            <a href="/admin/notice/download?fileName=${noticeDto.nt_file}">
                                <c:out value="${noticeDto.nt_filename}"/>
                            </a>
                    </c:when>
                    <c:otherwise>
                            <a  href="/admin/notice/download?fileName=${noticeDto.nt_file}">
                                <c:out value="${noticeDto.nt_filename}"/>
                            </a>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
        <div class="d-flex justify-content-center mt-5">
            <button id="noticeListBtn" type="button" class="btn btn-secondary">목록으로</button>
        </div>
    </section>
    <%-- ================================ 공지사항 content 끝 ================================= --%>
    <%-- ================================ 댓글 입력 시작================================= --%>
    <section class="comment-input">
        <div class="comment-wrapper ms-5 d-flex mt-4 mb-4 col-12">
            <div class="user-contatiner d-flex me-3 col-1">
                <img src="/images/blueuser.png" alt="댓글입력 유저 기본 이미지" style="width: 40px"/>
            </div>
            <c:choose>
            <c:when test="${member.mem_id ne null}">
            <div class="form- col-8 d-flex">
                <textarea  name="comment" class="form-control col-8 me-2" id="comment-input" placeholder="댓글을 작성해 주세요"></textarea>
            <div class="ms-2 col-4 align-self-center">
                <button type="button" class="comment-inputBtn btn col-5" data-ntc-no="${noticeDto.nt_no}">댓글 쓰기</button>
            </div>
            </c:when>
                <c:when test="${member.mem_id eq null}">
                <div class="form- col-8 d-flex">
                    <textarea  class="form-control col-8 me-2" id="comment-input" placeholder="로그인 후 작성해주세요." disabled></textarea>
                    <div class="col-4 align-self-center">
                        <button type="button" class="comment-inputBtn btn col-5" disabled>댓글 쓰기</button>
                    </div>
                    </c:when>
            </c:choose>
            </div>

        </div>
    </section>
    <%-- ================================ 댓글 입력 끝 ================================= --%>
    <%-- ================================ 댓글 보기 시작 ================================= --%>
    <section class="container" id="commentList">
        <ul id="comment-display" class="mt-5">
         <%-- ====================== Ajax에 의해 댓글이 삽입되는 곳 ======================== --%>
        </ul>
    </section>
    <%-- ================================ 댓글 보기 끝 ================================= --%>
    <%-- ================================ 댓글 수정 입력 폼 시작 =============================== --%>
    <section id="modifyForm" style="display: none" >
         <textarea  id="modifyInput" placeholder="수정할 내용을 입력해 주세요." class="col-12" rows="2" ></textarea>
        <div class="col-12 d-flex justify-content-end me-2 mt-3">
         <button    id="wrtBtn" type="button" class="modBtn btn-primary ms-2">수정 </button>
         <button    id="modOutBtn" type="button" class="modBtn btn-danger ms-2" onclick="modifyOut(this)">취소</button>
        </div>
    </section>
    <%-- ================================ 댓글 수정 입력 폼 끝 =============================== --%>
    <%-- ================================ 답글 입력 폼 시작 =============================== --%>
    <section id="replyForm" style="display: none" >
        <textarea  id="replyInput" placeholder="답글을 입력해 주세요." class="col-12" rows="2"></textarea>
        <div class="col-12 d-flex justify-content-end me-2 mt-3">
            <button    id="repWrtBtn" type="button" class="repBtn ms-2">등록</button>
            <button    id="repModOutBtn" type="button" class="repBtn ms-2" onclick="repModOut(this)">취소</button>
        </div>
    </section>
    <%-- ================================ 답글 입력 폼 끝 =============================== --%>

    <%--================================ 댓글 msg 알림창 ===================================--%>
    <section class="toast-container position-fixed top-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <div id="colorBox"style="width: 25px; height: 25px; border-radius: 7px"></div>
                <strong class="me-auto ms-2" id="msgTitle"></strong>
                <small>방금</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body" id="msgContent"></div>
        </div>
    </section>
</main>
<%-- ==================== Footer include ==================== --%>
<%@include file="/WEB-INF/includes/footer.jsp" %>

<%-- ================================== 이벤트 관련 스크립트 ================================= --%>
<script>
    /* 오디오 객체 */
    const audio = new Audio('/sound.mp3');

    /* ajax요청 결과 메시지 출력 함수 */
    let showMsg = function (title, content, color){
        if(color == 'green'){
            $('#colorBox').css('background-color', '#0f6848');
        }
        else if(color == 'red'){
            $('#colorBox').css('background-color', 'red');
        }
        $('#msgTitle').text(title);
        $('#msgContent').text(content);
        const toastLive = document.getElementById('liveToast');
        const toast = new bootstrap.Toast(toastLive);
        toast.show();
    }
    <%-- 댓글 쓰기 textarea 높이 자동 변경--%>
    $('#comment-input').on('keydown keyup', function(){
        $(this).height(1).height($(this).prop('scrollHeight')+12);
    })
    <%-- 답글 달기 textarea 높이 자동 변경--%>
    $('#replyInput').on('keydown', function(){
        $(this).parent().height(1).height($(this).prop('scrollHeight')+12);
        $(this).height(1).height($(this).prop('scrollHeight')+12);
    })
    <%-- 댓글 수정 textarea 높이 자동 변경--%>
    $('#modifyInput').on('keydown', function(){
        $(this).parent().height(1).height($(this).prop('scrollHeight')+12);
        $(this).height(1).height($(this).prop('scrollHeight')+12);
    })
    <%-- ============================ 댓글 작성일 날짜 변환함수  ============================== --%>
    <%-- (fmt 자바스크립트에서 안되어 함수로 처리) --%>
    let getCdate = function(ntc_cdate){
        let date = new Date(ntc_cdate);
        let year = date.getFullYear();
        let month = String(date.getMonth()).padStart(2, "0");
        let day = String(date.getDay()).padStart(2,"0");
        const hours = String(date.getHours()).padStart(2, "0");
        const minutes = String(date.getMinutes()).padStart(2, "0");
        return year + "-" + month + "-" + day + " " + hours + ":" + minutes;
    }
    <%-- ============================ 댓글 수정모드 ============================== --%>
    let modifyMode = function(modifyBtn){
        /* 수정모드 section의 크기 초기화*/
        let formHeight  = $(modifyBtn).parent().parent().height();
        let textHeight = $(modifyBtn).parent().prev().height();
        let ntc_no= $(modifyBtn).parent().attr('data-ntc-no');
        $(".reply-commentBtn").show();
        /* 수정, 댓글 버튼 숨기기 */
        $('.comment-modifyBtn').css('display','none');
        $('.comment-deleteBtn').css('display','none');

        $(modifyBtn).parent().prev().css("display", "none");
        $(modifyBtn).parent().css("display", "none");
        $("#modifyForm").prependTo($(modifyBtn).parent().parent());
        $("#modifyForm").addClass("col-12");
        $("#modifyForm").css({
            'display':'block',
            'height' : formHeight
        });
        $("#modifyForm textarea").css({
            'height' : textHeight
        });

        $("#modifyInput").attr('data-ntc-no',ntc_no);
        $("#modifyInput").focus();
        // 댓글쓰기 버튼 안보이도록
        $(modifyBtn).css("display", "none");
        $(modifyBtn).next().css("display","none");
        // 기존 댓글 내용
        let oldComment = $(modifyBtn).prev().html();
        oldComment = oldComment.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
        $("#modifyInput").val(oldComment);

    }
    <%-- ============================ 댓글 수정모드 나가기 ============================== --%>
    let modifyOut = function(outBtn) {
        let height = $(outBtn).parent().parent().next().height();
        /* 댓글 내용 담고있는 p 태그 원래대로*/
        $(outBtn).parent().parent().next().css({
            'display':'block',
            'height' : 'auto'
        });

        $('.comment-modifyBtn').css('display','block');
        $('.comment-deleteBtn').css('display','block');

        $("#modifyForm").appendTo("main");
        $("#modifyForm").removeClass("d-flex col-12");
        $("#modifyForm").css({
            'display':'none',
            'height' : height + 40
        });
        $("#modifyForm textarea").css({
            'height' : height
        });
    }


    <%-- ============================= 답글 입력모드 ============================== --%>
    let replyMod = function(replyBtn){
        let pcno = $(replyBtn).parent().parent().attr('value');
        $('.comment-modifyBtn').css('display','none');
        $('.comment-deleteBtn').css('display','none');
        $("#repWrtBtn").attr('data-pcno', pcno);
        $(replyBtn).css("display", "none");
        $("#replyForm").appendTo($(replyBtn).parent().parent());
        $("#replyForm").attr('data-pcno',pcno);
        $("#replyForm").addClass("col-12");
        $("#replyForm").css({
            'display': 'block'
        });
        $("#replyInput").focus();
    }

    <%-- ============================= 답글 입력모드 나가기 ============================== --%>
    let repModOut = function(replyBtn){
        $("#replyInput").val('');
        $('.comment-modifyBtn').css('display','block');
        $('.comment-deleteBtn').css('display','block');
        $(replyBtn).parent().prev().css("display", "block");
        $("#replyForm").appendTo("main");
        $("#replyForm").removeClass("d-flex col-12");
        $("#replyForm").css({
            'display': 'none',
            'height' : '50px'
        });
        $("#replyInput").css("height",  "30px")
    }

    <%-- =================  Ajax 결과 json값(댓글)을 태그로 변경하는 함수 ================== --%>
    let toHtml = function (comments) {
        let commentList = '';
        let mem_nickname = '${member.mem_nickname}';
        comments.forEach(function (comment) {
            let ntc_cdate = getCdate(comment.ntc_cdate);
            let ntc_update = getCdate(comment.ntc_update);
            <%-- ===== ntc_no == nt_pcno 일 경우 댓글이다. ===== --%>
            if(comment.ntc_no == comment.ntc_pcno){
            commentList +=`
                  <li class="commentList top-comment mt-3" value="${'${comment.ntc_no}'}">
                    <div class="notice-commenter me-2 d-flex align-items-center">
                        <div class="user-icon">
                            <img src="/images/blueuser.png" alt="유저기본이미지" style="width: 40px"/>
                        </div>
                        <div class="flex-column ms-3">
                            <div class="notice-commenter">
                                <span><c:out value="${'${comment.ntc_commenter}'}"/></span>
                            </div>
                            <div class="commenter-cdate">
                            <span class="text-muted" style="font-size: 0.8rem">`;
                  if(comment.ntc_update != null){
                    commentList+= `
                                <%-- ============ 댓글 수정 했을 경우 날짜 =============== --%>
                                    <c:out value="${'${ntc_update}'}"/>
                                </span>
                                <span class="text-muted">수정됨</span>`;
                  }else{
                        commentList+= `
                                    <%-- ============ 댓글 작성 날짜 =============== --%>
                                        <c:out value="${'${ntc_cdate}'}"/>
                                    </span>`;
                  }
                commentList+=`
                            </div>
                        </div>
                    </div>
                    <div class="comment-content mt-3">
                        <p class="col-12">
                        <%-- ============ 댓글 내용 =============== --%>
                           <c:out value="${'${comment.ntc_comment}'}"/>
                        </p>
                        <%-- ================ 댓글 수정,삭제 ================= --%>
                        <div class="commentMod d-flex justify-content-start mb-1" data-ntc-no="${'${comment.ntc_no}'}" >
                            <p style="display:none">${'${comment.ntc_comment}'}</p>`
                if(mem_nickname == comment.ntc_commenter){
                    commentList+=`
                            <button type="button"  class="commentBtn comment-modifyBtn text-muted" onclick="modifyMode(this)">수정</button>
                            <button type="button"  class="commentBtn comment-deleteBtn text-muted me-1" onclick="deleteCom(this)">삭제</button>
                            `;
                }
                if(mem_nickname.trim() != ''){
               commentList +=`
                        </div>
                    </div>
                    <div class=" d-flex justify-content-start">
                        <button type="button"  class="reply-btn comment-modifyBtn text-muted" onclick="replyMod(this)">답글 달기</button>
                    </div>`;
                }
                commentList +=`</li>`;
                return;
                <%-- ===== 답글일 경우 ===== --%>
            }else if(comment.ntc_no != comment.ntc_pcno){
                commentList +=`
                <div class="mt-4">
                    <li class="reply-container ms-4" value="${'${comment.ntc_no}'}">
                    <div class="notice-commenter me-2 d-flex align-items-center">
                        <div class="me-2">
                           <img src="/images/reply-message.png" style="width:27px">
                        </div>
                        <div class="user-icon">
                            <img src="/images/blueuser.png" alt="유저기본이미지" style="width: 30px"/>
                        </div>
                        <div class="flex-column ms-1">
                            <div class="reply-commenter">
                                <span><c:out value="${'${comment.ntc_commenter}'}"/></span>
                            </div>
                            <div class="reply-cdate">
                                <span class="text-muted" style="font-size: 0.8rem">`;
                  if(comment.ntc_update != null){
                    commentList+= `
                    <%-- ============ 댓글 수정 했을 경우 날짜 =============== --%>
                    <c:out value="${'${ntc_update}'}"/>
                    </span>
                <span class="text-muted">수정됨</span>`;
                  }else{
                        commentList+= `
                <%-- ============ 댓글 작성 날짜 =============== --%>
                <c:out value="${'${ntc_cdate}'}"/>
                </span>`;
            }
            commentList+=`
                            </div>
                        </div>
                    </div>
                    <div class="comment-content mt-3 ms-5">
                        <p class="col-12 ms-4">
                        <%-- ============ 댓글 내용 =============== --%>
                           <c:out value="${'${comment.ntc_comment}'}"/>
                        </p>
                        <%-- ================ 댓글 수정,삭제 ================= --%>
                        <div class="commentMod d-flex justify-content-start mb-1 ms-4" data-ntc-no="${'${comment.ntc_no}'}" >
                            <p style="display:none">${'${comment.ntc_comment}'}</p>`
                if(mem_nickname == comment.ntc_commenter){
                    commentList +=`
                            <button type="button"  class="commentBtn comment-modifyBtn text-muted" onclick="modifyMode(this)">수정</button>
                            <button type="button"  class="commentBtn comment-deleteBtn text-muted me-1" onclick="deleteCom(this)">삭제</button>
                            `
                }
                commentList += `
                         </div>
                        </div>
                    </li>
                </div>
                 `
            }
        });
        return commentList;
    }
</script>
<%-- ================================ Ajax관련 스크립트 =============================== --%>
<script>
    <%-- 게시글 번호는 페이지 로딩 될 때 미리 전역변수로 설정하여 스크립트 전역에서 사용한다--%>
    let nt_no = ${noticeDto.nt_no};
    let title = "";     /* msg 알림창에 사용 */
    let content = "";   /* msg 알림창에 사용 */
    <%-- ============================== 댓글 리스트 Ajax 요청 ============================== --%>
    let showComments = function(nt_no){
        $.ajax({
            type: 'GET',
            url: '/notice/comments?nt_no=' + nt_no,
            success : function(result){
                $("#comment-display").html(toHtml(result));
            }
        })
    }
    <%-- window.onload --%>
    $(function(){
        <%-- ====================== 목록으로 가기 페이징 이벤트 =================== --%>
        $("#noticeListBtn").on("click", function () {
            location.href="<c:url value='/notice/list${searchCondition.queryString}'/>";
        });
        <%-- 해당 페이지 로딩 시 댓글 Ajax로 불러옴 --%>
        showComments(nt_no);

        <%-- ================================ 댓글 등록 이벤트 =============================== --%>
        $(".comment-inputBtn").click(function(){
            let comment = $(this).parent().prev().val();                      <%-- 입력한 댓글 내용 --%>
            comment = comment.replace(/(?:\r\n|\r|\n)/g, '<br/>');   <%-- 줄바꿈 처리 --%>
            $(this).parent().prev().val('');                                  <%-- TextArea 초기화 --%>
            <%-- ====== 댓글 공배 검사. 공백 시 return ===== --%>
            if(comment.trim()==''){
                alert("댓글을 입력하세요");
                $("textarea[name=comment]").focus();
                return;
            }
            <%-- ================================ 댓글 등록 Ajax =============================== --%>
            $.ajax({
                type:'POST',
                url:'/notice/comments?nt_no=' + nt_no, <%--요청 URI : noitce/comments?nt_no=1 --%>
                headers : {"content-type": "application/json"},
                data: JSON.stringify({nt_no:nt_no, ntc_comment: comment}),
                success : function(result){
                    $('#comment-input').css('height', '40px');
                    title = "댓글 등록 완료";
                    content = "해당 게실글에 댓글을 등록하였습니다.";
                    audio.play();
                    showMsg(title, content, 'green');
                    showComments(nt_no); <%-- 데이터 변경으로 인해 댓글을 다시 가져온다 --%>
                },
                error : function (){alert("댓글 등록에 실패하였습니다")}
            });
        })
    });

    <%-- ================================ 답글 등록 Ajax =============================== --%>
    $("#repWrtBtn").on('click',function(){
        let ntc_pcno = $(this).attr("data-pcno");
        let comment= $("#replyInput").val();
        comment = comment.replace(/(?:\r\n|\r|\n)/g, '<br/>');   <%-- 줄바꿈 처리 --%>
        let ntc_commenter = '${member.mem_nickname}';                 <%-- !!!!! 이후 세션에서 꺼내서 작성자 삽입되도록 변경 필요 !!!!! --%>
        $.ajax({
            type: "POST",
            url:'/notice/comments?nt_no=' + nt_no,
            headers : {"content-type": "application/json"},
            data: JSON.stringify({nt_no:nt_no, ntc_pcno:ntc_pcno, ntc_comment:comment, ntc_commenter: ntc_commenter}),
            success:function(){
                audio.play();
                title = "답글 등록 완료";
                content = "해당 댓글에 답을 등록하였습니다.";
                showMsg(title, content, "green");
                showComments(nt_no);
            },
            error: function(){
                audio.play();
                alert("답글 등록에 실패하였습니다.");
            }
        })
        repModOut(); <%-- 댓글 수정모드 나가기(TextArea 기존 위치로 옮긴다) --%>
    })

    <%-- ================================ 댓글 수정 Ajax=============================== --%>
    $("#wrtBtn").on('click',function(){
        let ntc_no = $(this).parent().prev().attr('data-ntc-no');
        let comment= $("#modifyInput").val();
        comment = comment.replace(/(?:\r\n|\r|\n)/g, '<br/>');   <%-- 줄바꿈 처리 --%>
        let ntc_commenter = "admin";                             <%-- !!!!! 이후 세션에서 꺼내서 작성자 삽입되도록 변경 필요 !!!!! --%>
        $.ajax({
            type: "PATCH",
            url: '/notice/comments/' + ntc_no,
            headers : {"content-type": "application/json"},
            data: JSON.stringify({nt_no:nt_no, ntc_comment: comment,ntc_commenter: ntc_commenter}),
            success:function(){
                audio.play();
                title = "댓글 수정 완료";
                content = "해당 댓글을 수정하였습니다."
                showMsg(title, content, 'green');
                showComments(nt_no);
                modifyOut();
            },
            error: function(){
                audio.play();
                title = "댓글 수정 실패";
                content = "해당 댓글 수정을 실패하였습니다. 다시 시도하세요."
                showMsg(title, content, 'red')
                alert("댓글 수정에 실패하였습니다.");
            }
        })
        repModOut(); <%-- 댓글 수정모드 나가기(TextArea 기존 위치로 옮긴다) --%>
    })

    <%-- ================================ 댓글 삭제 Ajax=============================== --%>
    let deleteCom = function(delBtn){
        let ntc_no = $(delBtn).parent().attr('data-ntc-no');
        if(!confirm("정말로 댓글을 삭제하시겠습니까?")){
            alert('댓글 삭제를 취소하였습니다');
            return;
        }
        $.ajax({
            type: 'DELETE',
            url: '/notice/comments/' + ntc_no + '?nt_no=' + nt_no,
            success: function (result) {
                audio.play();
                title = "댓글 삭제 완료";
                content = "선택하신 댓글을 삭제하였습니다.";
                showMsg(title, content, 'red')
                showComments(nt_no);<%-- 댓글 리스트 갱신 --%>
            },
            error: function () {
                audio.play();
                alert("댓글 삭제에 실패하였습니다.");
            }
        })
    }
</script>
</body>
</html>

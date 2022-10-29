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
            width: 900px;
            margin: auto;
        }
        .container-title {
            margin-top: 30px;
            margin-bottom: 100px;
            padding: 15px;
        }
        .notice-header {
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
            padding-bottom: 50px;
        }
        .user-contatiner {
            align-items: center;
        }
        #noticeContent {
            border-bottom: solid 1px #8c8c8c;
            padding-bottom: 40px;
            margin-bottom: 40px;
            font-size: 1rem;
        }
        .comment-input {
            margin-top: 50px;
            border: solid 1px #8c8c8c;
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
        .comment-modifyBtn,
        .comment-deleteBtn{
            border: 0;
            background-color: white;
        }
        .comment-deleteBtn{
            padding-left:0;
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
        #wrtBtn,
        #modOutBtn {
            border: none;
            border-radius: 10%;
            outline: none;
        }
        #comment-inputBtn {
            height: 40px;
            font-size: 10px;
        }
        #modify-input {
            border-radius: 5px;
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
            font-size: 0.7rem;
        }

        .comment-content p {
            font-size: 0.8rem;
        }
        .reply-accordion li {
            padding-left: 1rem;
        }
        #modify-input {
            border: 1px solid #8c8c8c;
            padding:5px;
        }
        #noticeContent{
            line-height: 2rem;
        }
        .commentMod{
            border-bottom: solid 1px #8c8c8c;
            padding-bottom: 30px
        }
        .notice-commenter{
            font-size:0.9rem;
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
                <span id="noticeHit" class="header-text me-2"><c:out value="${noticeDto.nt_hit}"/> </span>
            </div>
            <div>
                <img class="header-img" src="/images/clock.png" alt="등록 날짜 이미지" />
                <%-- =============== 날짜 바인딩 ================ --%>
                <span id="cdate" class="header-text"> <fmt:formatDate pattern="yyyy-MM-dd" value="${noticeDto.nt_cdate}"/></span>
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
            <c:if test="${empty noticeDto.nt_file}">
                <span>첨부파일 없음</span>
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
            <div class="form- col-8 d-flex">
            <textarea  name="comment" class="form-control col-8 me-2" id="comment-input" placeholder="댓글을 작성해 주세요"></textarea>
            <button id="comment-inputBtn" type="button" class="btn btn-success col-2" data-ntc-no="${noticeDto.nt_no}">댓글 쓰기</button>
            </div>

        </div>
    </section>
    <%-- ================================ 댓글 입력 끝 ================================= --%>
    <%-- ================================ 댓글 보기 시작 ================================= --%>
    <section>
        <ul id="comment-display" class="mt-5">
         <%-- ====================== Ajax에 의해 댓글이 삽입되는 곳 ======================== --%>
        </ul>
    </section>
    <%-- ================================ 댓글 보기 끝 ================================= --%>
    <%-- ================================ 댓글 수정 입력 폼 시작 =============================== --%>
    <section id="modifyForm" style="display: none" class="mt-5">
         <textarea  id="modify-input" placeholder="대댓글을 입력해 주세요." class="col-5" rows="2"></textarea>
         <button    id="wrtBtn" type="button" class="modBtn btn-primary ms-2">수정 </button>
         <button    id="modOutBtn" type="button" class="modBtn btn-danger ms-2" onclick="modifyOut()">취소</button>
    </section>
    <%-- ================================ 댓글 수정 입력 폼 끝 =============================== --%>
</main>
<%-- ==================== Footer include ==================== --%>
<%@include file="/WEB-INF/includes/footer.jsp" %>

<%-- ================================ 이벤트 관련 스크립트 ================================= --%>
<script>
    <%-- ========================== 댓글 작성일 날짜 변환함수  ============================== --%>
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
    <%-- ========================== 댓글 수정모드 ============================== --%>
    let modifyMode = function(modifyBtn){
        let ntc_no= $(modifyBtn).parent().attr('data-ntc-no');
        $(".reply-commentBtn").show();
        $("#modifyForm").appendTo($(modifyBtn).parent());
        $("#modifyForm").addClass("d-flex justify-content-end col-12");
        $("#modifyForm").css("display", "block");
        $("#modify-input").attr('data-ntc-no',ntc_no);
        // 댓글쓰기 버튼 안보이도록
        $(modifyBtn).css("display", "none");
        $(modifyBtn).next().css("display","none");
        // 기존 댓글 내용
        let oldComment = $(modifyBtn).prev().html();
        oldComment = oldComment.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
        $("#modify-input").val(oldComment);

    }
    <%-- ========================== 댓글 수정모드 나가기 ============================== --%>
    let modifyOut = function() {
        $(".commentBtn").css("display", "block");
        $("#modifyForm").appendTo("main");
        $("#modifyForm").removeClass("d-flex justify-content-end col-12");
        $("#modifyForm").css("display", "none");
    }
    <%-- =================  Ajax 결과 json값(댓글)을 태그로 변경하는 함수 ================== --%>
    let toHtml = function (comments) {
        let commentList = "";
        comments.forEach(function (comment) {
            let ntc_cdate = getCdate(comment.ntc_cdate)
            console.log(ntc_cdate);
            commentList +=`
              <li class="commentList mt-5" value="${'${comment.ntc_no}'}">
                <div class="notice-commenter me-2 d-flex align-items-center">
                    <div class="user-icon">
                        <img src="/images/blueuser.png" alt="유저기본이미지" style="width: 40px"/>
                    </div>
                    <div class="flex-column ms-3">
                        <div class="notice-commenter">
                            <span><c:out value="${'${comment.ntc_commenter}'}"/></span>
                        </div>
                        <div class="commenter-cdate">
                            <span class="text-muted" style="font-size: 0.8rem">
                            <%-- ============ 댓글 작성 날짜 =============== --%>
                                <c:out value="${'${ntc_cdate}'}"/>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="comment-content mt-3">
                    <p>
                    <%-- ============ 댓글 내용 =============== --%>
                       <c:out value="${'${comment.ntc_comment}'}"/>
                    </p>
                </div>
                <%-- ================ 댓글 수정,삭제 ================= --%>
                <div class="commentMod container d-flex justify-content-end" data-ntc-no="${'${comment.ntc_no}'}" >
                    <p style="display:none">${'${comment.ntc_comment}'}</p>
                    <button type="button"  class="commentBtn comment-modifyBtn text-muted" onclick="modifyMode(this)">수정</button>
                    <button type="button"  class="commentBtn comment-deleteBtn text-muted me-1" onclick="deleteCom(this)">삭제</button>
                </div>
            </li>`
        });
        return commentList;
    }
</script>
<%-- ================================ Ajax관련 스크립트 =============================== --%>
<script>
    <%-- 게시글 번호는 페이지 로딩 될 때 미리 전역변수로 설정하여 스크립트 전역에서 사용한다--%>
    let nt_no = ${noticeDto.nt_no};

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
        $("#comment-inputBtn").click(function(){
            let comment = $(this).prev().val();                      <%-- 입력한 댓글 내용 --%>
            comment = comment.replace(/(?:\r\n|\r|\n)/g, '<br/>');   <%-- 줄바꿈 처리 --%>
            $(this).prev().val('');                                  <%-- TextArea 초기화 --%>
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
                    alert("댓글을 등록하였습니다.");
                    showComments(nt_no); <%-- 데이터 변경으로 인해 댓글을 다시 가져온다 --%>
                },
                error : function (){alert("댓글 등록에 실패하였습니다")}
            });

        })
    });

    <%-- ================================ 댓글 수정 Ajax=============================== --%>
    $("#wrtBtn").on('click',function(){
        let ntc_no = $(this).prev().attr('data-ntc-no');
        let comment= $("#modify-input").val();
        comment = comment.replace(/(?:\r\n|\r|\n)/g, '<br/>');   <%-- 줄바꿈 처리 --%>
        let ntc_commenter = "admin";                             <%-- !!!!! 이후 세션에서 꺼내서 작성자 삽입되도록 변경 필요 !!!!! --%>
        $.ajax({
            type: "PATCH",
            url: '/notice/comments/' + ntc_no,
            headers : {"content-type": "application/json"},
            data: JSON.stringify({nt_no:nt_no, ntc_comment: comment,ntc_commenter: ntc_commenter}),
            success:function(){
                alert("댓글 수정에 성공하였습니다.");
                showComments(nt_no);
            },
            error: function(){
                alert("댓글 수정에 실패하였습니다.");
            }
        })
        modifyOut(); <%-- 댓글 수정모드 나가기(TextArea 기존 위치로 옮긴다) --%>
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
                alert("댓글을 삭제하였습니다.");
                showComments(nt_no);<%-- 댓글 리스트 갱신 --%>
            },
            error: function () {
                alert("댓글 삭제에 실패하였습니다.");
            }
        })
    }
</script>
</body>
</html>

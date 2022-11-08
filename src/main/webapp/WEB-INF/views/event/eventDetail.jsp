<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    <title>event</title>
    <style>
        body {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        main {
            width: 1000px;
            margin: auto;
        }
        h2 {
            padding-top: 30px;
        }
        .headerTit {
            font-weight: bolder;
            font-size: 24px;
        }
        .lectureHeader {
            background-color: #f2f2f2;
            /* text-align: left; */
            margin: 10px;
            padding-left: 30px;
            padding-right: 30px;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        a {
            color: black;
        }
        .programnote {
            font-size: small;
            color: #969696;
        }
        .eventcare {
            color: red;
        }
        .detailcontents {
            list-style: none;
            padding: 40px 0px 39px;
            display: flex;
        }
        #title {
            margin-top: 50px;
            margin-bottom: 100px;
            padding: 15px;
        }
        .search-box {
            display: flex;
            justify-content: right;
            margin: 10px;
            width: auto;
            height: auto;
        }
        #search-txt {
            width: 200px;
        }
        #search-btn {
            background-color: #006eaf;
            color: white;
            border: 0;
            outline: 0;
        }
        .picking {
            display: flex;
            justify-content: center;
            margin-top: 5px;
        }
        .picturepeople {
            margin-left: 10px;
            margin-right: 40px;
        }
        .img {
            float: left;
        }
        .classimg {
            width: 146px;
            height: 225px;
        }
        .receiving {
            width: 62px;
            padding: 5px 0;
            color: white;
            background-color: #fa4b4b;
            text-align: center;
            margin-left: 3px;
            margin-right: 3px;
        }
        .receivingpeople {
            width: 62px;
            text-align: center;
            border: 1px solid #fa4b4b;
            padding: 5px 0;
            margin-left: 3px;
            margin-right: 3px;
        }
        .bookname {
            margin-left: 10px;
            margin-bottom: 8px;
            font-size: 20px;
            font-weight: bold;
            color: #ff0000;
        }
        .bodycontent {
            margin-left: 10px;
        }
        .playpeople {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .playplace {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .studyday {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .studytime {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .applicationday {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .phone {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .recruitment {
            display: inline-flex;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .buttonpick {
            margin-top: 5px;
            margin-bottom: 5px;
            width: 100%;
            display: flex;
            justify-content: center;
        }
        #listBtn {
            margin: 0 5px;
            padding: 0 19px;
        }
        #addBtn {
            margin: 0 5px;
        }
        /************************* [[댓글]] **************************/

</style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="../../includes/header.jsp" %>
<!-- 헤더 끝 -->

<main>
    <session id="title" class="container text-center">
        <h2>프로그램 신청</h2>
    </session>
    <hr />
    <div class="lectureHeader">
        <p class="headerTit">프로그램신청 시 유의사항</p>
        <div class="programnote">
            <div>1. 프로그램명을 클릭하시면 신청할 수 있으며, 프로그램신청은 로그인 후 이용가능합니다.</div>
            <div>2. 신청자의 인적사항(성명,휴대폰번호,주소)은 정확하게 확인 바랍니다.</div>
            <div class="eventcare">3. 수강 취소 없이 불참 시 다음 프로그램 참여가 제한될 수 있습니다. "마이페이지"에서 신청내역을 확인 가능합니다.</div>
        </div>
    </div>

    <ul>
<%--    <c:forEach var="event" items="${eventSelect}">--%>
    <li class="detailcontents">
        <!-- 왼쪽 그림 시작 -->
        <div class="picturepeople">
            <!-- 이미지 사진 시작 -->
            <img
                    class="classimg"
                    src="${eventSelect.ev_img}"/>
            <!-- 이미지 사진 끝 -->
            <div class="picking">
                <span class="receiving">접수중</span>
                <span class="receivingpeople">
                    ${eventSelect.ev_people-eventSelect.ev_nowpeople}
                </span>
            </div>
        </div>
        <!-- 왼쪽 그림 끝 -->
        <!-- 오른쪽 설명 시작 -->
        <div class="detail">
            <span class="bookname">
                ${eventSelect.ev_title}
            </span>
            <div class="bodycontent">
                <div class="playpeople">
                    <div>대상&nbsp;:&nbsp;</div>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_target}
                    </span>
                </div>
                <br />
                <div class="playplace">
                    <span>장소&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_place}
                    </span>
                </div>
                <br />
                <div class="studyday">
                    <span>행사기간&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${event.ev_today}
                    </span>
                </div>
                <br />
                <div class="studytime">
                    <div>시간&nbsp;:&nbsp;</div>
                    <span style="color: #7c7c7c">
                        ${event.ev_time}
                    </span>
                </div>
                <br />
                <div class="applicationday">
                    <span>접수기간&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_start}
                            ~
                        ${eventSelect.ev_end}
                    </span>
                </div>
                <br />
                <div class="phone">
                    <span>문의번호&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_phone}
                    </span>
                </div>
                <br />
                <div class="recruitment">
                    <span>모집정원&nbsp;:&nbsp;</span>
                    <span style="color: #7c7c7c">
                        ${eventSelect.ev_people}
                    </span>
                </div>
                <br />
                <div class="recruitment">
                    <span>첨부파일&nbsp;:&nbsp;</span>
                    <c:set var="file" value="${eventSelect.ev_file}"/>
                    <c:if test="${not empty file}">
                        <c:choose>
                            <%-- 한글 파일일 경우 --%>
                            <c:when test="${fn:contains(file, '.hwp')}">
                                <img src="/images/hwp.png" width="25px"/>
                                <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:when>
                            <%-- 엑셀일 경우 파일일 경우 --%>
                            <c:when test="${fn:contains(file, '.xlsx')}">
                                <img src="/images/xlsx.png" width="20px"/>
                                <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:when>
                            <%-- pdf일 경우 파일일 경우 --%>
                            <c:when test="${fn:contains(file, '.pdf')}">
                                <img src="/images/pdf.png" width="23px"/>
                                <a href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a  href="/admin/event/download?fileName=${eventSelect.ev_file}">
                                    <c:out value="${eventSelect.ev_filename}"/>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <c:if test="${empty eventSelect.ev_file}">
                        <span>첨부파일 없음</span>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- 오른쪽 설명 끝 -->
        </li>
        <div>
            <p>${eventSelect.ev_content}</p>
        </div>
    </ul>
    <hr />
    <div class="buttonpick">
        <button type="button" class="btn btn-secondary btn-lg" id="listBtn">
            목록
        </button>
        <form action="/event/add" method="post">
            <input type="hidden" value="${eventSelect.ev_no}" name="ev_no">
        <button type="submit" id="addBtn"  class="btn btn-primary btn-lg">
            신청하기
        </button>
        </form>
    </div>

<%--    &lt;%&ndash; ================================ 댓글 입력 시작================================= &ndash;%&gt;--%>
<%--    <section class="comment-input">--%>
<%--        <div class="comment-wrapper ms-5 d-flex mt-4 mb-4 col-12">--%>
<%--            <div class="form- col-8 d-flex">--%>
<%--                <textarea  name="comment" class="form-control col-8 me-2" id="comment-input" placeholder="댓글을 작성해 주세요"></textarea>--%>
<%--                <button id="comment-inputBtn" type="button" class="btn btn-outline-secondary col-2" data-evc-no="${eventSelect.ev_no}">댓글 쓰기</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
<%--    &lt;%&ndash; ================================ 댓글 입력 끝 ================================= &ndash;%&gt;--%>
<%--    &lt;%&ndash; ================================ 댓글 보기 시작 ================================= &ndash;%&gt;--%>
<%--    <section class="container" id="commentList">--%>
<%--        <ul id="comment-display" class="mt-5">--%>
<%--            &lt;%&ndash; ====================== Ajax에 의해 댓글이 삽입되는 곳 ======================== &ndash;%&gt;--%>
<%--        </ul>--%>
<%--    </section>--%>
<%--    &lt;%&ndash; ================================ 댓글 보기 끝 ================================= &ndash;%&gt;--%>
<%--    &lt;%&ndash; ================================ 댓글 수정 입력 폼 시작 =============================== &ndash;%&gt;--%>
<%--    <section id="modifyForm" style="display: none" >--%>
<%--        <textarea  id="modifyInput" placeholder="대댓글을 입력해 주세요." class="col-8" rows="2"></textarea>--%>
<%--        <button    id="wrtBtn" type="button" class="modBtn btn-primary ms-2">수정 </button>--%>
<%--        <button    id="modOutBtn" type="button" class="modBtn btn-danger ms-2" onclick="modifyOut(this)">취소</button>--%>
<%--    </section>--%>
<%--    &lt;%&ndash; ================================ 댓글 수정 입력 폼 끝 =============================== &ndash;%&gt;--%>
<%--    &lt;%&ndash; ================================ 답글 입력 폼 시작 =============================== &ndash;%&gt;--%>
<%--    <section id="replyForm" style="display: none" >--%>
<%--        <textarea  id="replyInput" placeholder="대댓글을 입력해 주세요." class="col-8" rows="2"></textarea>--%>
<%--        <button    id="repWrtBtn" type="button" class="repBtn btn-primary ms-2">등록</button>--%>
<%--        <button    id="repModOutBtn" type="button" class="repBtn btn-danger ms-2" onclick="repModOut(this)">취소</button>--%>
<%--    </section>--%>
<%--    &lt;%&ndash; ================================ 답글 입력 폼 끝 =============================== &ndash;%&gt;--%>

</main>

<script>
/****************************************************************************************************/
    $(document).ready(function (){
         $('#listBtn').on("click", function (){
            location.href = "<c:url value='/event/list'/>";
         })
        $('#addbtn').on("click", function (){
            alert("이벤트 신청 완료");
            <%--location.href = "<c:url value='/event/add'/>";--%>
            <%--attr("action", "<c:url value="/event/add"/>");--%>
            <%--attr("method", "post");--%>
            <%--submit();--%>
        })
    })
</script>
<%--<script>--%>
<%--    &lt;%&ndash; ============================ 댓글 작성일 날짜 변환함수  ============================== &ndash;%&gt;--%>
<%--    let getCdate = function(evc_cdate){--%>
<%--        let date = new Date(evc_cdate);--%>
<%--        let year = date.getFullYear();--%>
<%--        let month = String(date.getMonth()).padStart(2, "0");--%>
<%--        let day = String(date.getDay()).padStart(2,"0");--%>
<%--        const hours = String(date.getHours()).padStart(2, "0");--%>
<%--        const minutes = String(date.getMinutes()).padStart(2, "0");--%>
<%--        return year + "-" + month + "-" + day + " " + hours + ":" + minutes;--%>
<%--    }--%>
<%--</script>--%>
<%--<script>--%>
<%--    &lt;%&ndash; ============================ 댓글 수정모드 ============================== &ndash;%&gt;--%>
<%--    let modifyMode = function(modifyBtn){--%>
<%--        let evc_no= $(modifyBtn).parent().attr('data-evc-no');--%>
<%--        $(".reply-commentBtn").show();--%>
<%--        $(modifyBtn).parent().prev().css("display", "none");--%>
<%--        $(modifyBtn).parent().css("display", "none");--%>
<%--        $("#modifyForm").prependTo($(modifyBtn).parent().parent());--%>
<%--        $("#modifyForm").addClass("d-flex col-12");--%>
<%--        $("#modifyForm").css("display", "block");--%>
<%--        $("#modifyInput").attr('data-evc-no',evc_no);--%>
<%--        $("#modifyInput").focus();--%>
<%--        // 댓글쓰기 버튼 안보이도록--%>
<%--        $(modifyBtn).css("display", "none");--%>
<%--        $(modifyBtn).next().css("display","none");--%>
<%--        // 기존 댓글 내용--%>
<%--        let oldComment = $(modifyBtn).prev().html();--%>
<%--        oldComment = oldComment.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');--%>
<%--        $("#modifyInput").val(oldComment);--%>
<%--        &lt;%&ndash; ============================ 댓글 수정모드 나가기 ============================== &ndash;%&gt;--%>
<%--        let modifyOut = function(outBtn) {--%>
<%--            $(outBtn).parent().next().css("display","block");--%>
<%--            $(".commentBtn").css("display", "block");--%>
<%--            $("#modifyForm").appendTo("main");--%>
<%--            $("#modifyForm").removeClass("d-flex col-12");--%>
<%--            $("#modifyForm").css("display", "none");--%>
<%--        }--%>
<%--        &lt;%&ndash; ============================= 답글 입력모드 ============================== &ndash;%&gt;--%>
<%--        let replyMod = function(replyBtn){--%>
<%--            let pcno = $(replyBtn).parent().parent().attr('value');--%>
<%--            $("#repWrtBtn").attr('data-pcno', pcno);--%>
<%--            $(replyBtn).css("display", "none");--%>
<%--            $("#replyForm").appendTo($(replyBtn).parent());--%>
<%--            $("#replyForm").attr('data-pcno',pcno);--%>
<%--            $("#replyForm").addClass("d-flex col-12");--%>
<%--            $("#replyForm").css("display", "block");--%>
<%--            $("#replyInput").focus();--%>
<%--        }--%>

<%--        &lt;%&ndash; ============================= 답글 입력모드 나가기 ============================== &ndash;%&gt;--%>
<%--        let repModOut = function(replyBtn){--%>
<%--            $("#replyInput").val('');--%>
<%--            $(replyBtn).parent().prev().css("display", "block");--%>
<%--            $("#replyForm").appendTo("main");--%>
<%--            $("#replyForm").removeClass("d-flex col-12");--%>
<%--            $("#replyForm").css("display", "none");--%>
<%--        }--%>
<%--    }--%>
<%--    &lt;%&ndash; =================  Ajax 결과 json값(댓글)을 태그로 변경하는 함수 ================== &ndash;%&gt;--%>
<%--    let toHtml = function (comments) {--%>
<%--        let commentList = '';--%>
<%--        let mem_id = '${member.mem_id}';--%>
<%--        comments.forEach(function (comment) {--%>
<%--            let evc_cdate = getCdate(comment.evc_cdate)--%>
<%--            &lt;%&ndash; ===== ntc_no == nt_pcno 일 경우 댓글이다. ===== &ndash;%&gt;--%>
<%--            if(comment.evc_no == comment.evc_pcno){--%>
<%--                commentList +=`--%>
<%--                  <li class="commentList mt-5" value="${'${comment.evc_no}'}">--%>
<%--                    <div class="notice-commenter me-2 d-flex align-items-center">--%>
<%--                        <div class="user-icon">--%>
<%--                            <img src="/images/blueuser.png" alt="유저기본이미지" style="width: 40px"/>--%>
<%--                        </div>--%>
<%--                        <div class="flex-column ms-3">--%>
<%--                            <div class="event-commenter">--%>
<%--                                <span><c:out value="${'${comment.evc_commenter}'}"/></span>--%>
<%--                            </div>--%>
<%--                            <div class="commenter-cdate">--%>
<%--                                <span class="text-muted" style="font-size: 0.8rem">--%>
<%--                                &lt;%&ndash; ============ 댓글 작성 날짜 =============== &ndash;%&gt;--%>
<%--                                    <c:out value="${'${evc_cdate}'}"/>--%>
<%--                                </span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="comment-content mt-3">--%>
<%--                        <p class="col-12">--%>
<%--                        &lt;%&ndash; ============ 댓글 내용 =============== &ndash;%&gt;--%>
<%--                           <c:out value="${'${comment.evc_comment}'}"/>--%>
<%--                        </p>--%>
<%--                        &lt;%&ndash; ================ 댓글 수정,삭제 ================= &ndash;%&gt;--%>
<%--                        <div class="commentMod d-flex justify-content-start mb-1" data-ntc-no="${'${comment.evc_no}'}" >--%>
<%--                            <p style="display:none">${'${comment.evc_comment}'}</p>`--%>
<%--                if(mem_id == comment.evc_commenter){--%>
<%--                    commentList+=`--%>
<%--                            <button type="button"  class="commentBtn comment-modifyBtn text-muted" onclick="modifyMode(this)">수정</button>--%>
<%--                            <button type="button"  class="commentBtn comment-deleteBtn text-muted me-1" onclick="deleteCom(this)">삭제</button>--%>
<%--                            `;--%>
<%--                }--%>
<%--                commentList +=`--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class=" d-flex justify-content-start">--%>
<%--                        <button type="button"  class="reply-btn comment-modifyBtn text-muted" onclick="replyMod(this)">답글 달기</button>--%>
<%--                    </div>--%>
<%--                   </li>`;--%>
<%--                return;--%>
<%--                &lt;%&ndash; ===== 답글일 경우 ===== &ndash;%&gt;--%>
<%--            }else if(comment.evc_no != comment.evc_pcno){--%>
<%--                commentList +=`--%>
<%--                <div>--%>
<%--                    <li class="reply-container ms-4 mt-1" value="${'${comment.evc_no}'}">--%>
<%--                    <div class="notice-commenter me-2 d-flex align-items-center">--%>
<%--                        <div class="me-2">--%>
<%--                           <img src="/images/reply-message.png" style="width:27px">--%>
<%--                        </div>--%>
<%--                        <div class="user-icon">--%>
<%--                            <img src="/images/blueuser.png" alt="유저기본이미지" style="width: 30px"/>--%>
<%--                        </div>--%>
<%--                        <div class="flex-column ms-1">--%>
<%--                            <div class="reply-commenter">--%>
<%--                                <span><c:out value="${'${comment.evc_commenter}'}"/></span>--%>
<%--                            </div>--%>
<%--                            <div class="reply-cdate">--%>
<%--                                <span class="text-muted" style="font-size: 0.8rem">--%>
<%--                                &lt;%&ndash; ============ 댓글 작성 날짜 =============== &ndash;%&gt;--%>
<%--                                    <c:out value="${'${evc_cdate}'}"/>--%>
<%--                                </span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="comment-content mt-3 ms-5">--%>
<%--                        <p class="col-12">--%>
<%--                        &lt;%&ndash; ============ 댓글 내용 =============== &ndash;%&gt;--%>
<%--                           <c:out value="${'${comment.evc_comment}'}"/>--%>
<%--                        </p>--%>
<%--                        &lt;%&ndash; ================ 댓글 수정,삭제 ================= &ndash;%&gt;--%>
<%--                        <div class="commentMod container d-flex justify-content-start mb-2" data-ntc-no="${'${comment.evc_no}'}" >--%>
<%--                            <p style="display:none">${'${comment.evc_comment}'}</p>--%>
<%--                            `--%>
<%--                if(mem_id == comment.evc_commenter){--%>
<%--                    commentList +=`--%>
<%--                            <button type="button"  class="commentBtn comment-modifyBtn text-muted" onclick="modifyMode(this)">수정</button>--%>
<%--                            <button type="button"  class="commentBtn comment-deleteBtn text-muted me-1" onclick="deleteCom(this)">삭제</button>--%>
<%--                            `--%>
<%--                }--%>
<%--                commentList += `--%>
<%--                         </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </div>--%>
<%--                 `--%>
<%--            }--%>
<%--        });--%>
<%--        return commentList;--%>
<%--    }--%>
<%--</script>--%>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
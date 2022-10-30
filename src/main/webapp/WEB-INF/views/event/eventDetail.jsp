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
        #pick-btn {
            height: 38px;
            display: inline-block;
            margin: 0 5px;
            padding: 0 19px;
            border: 1px solid #d9d9d9;
            color: #505050;
            font-size: 15px;
            line-height: 2.5em;
            vertical-align: top;
            text-align: center;
        }
        #list-btn {
            display: inline-block;
            height: 40px;
            margin: 0 5px;
            padding: 0 40px;
            background-color: #006eaf;
            border: none;
            color: #fff;
            font-size: 15px;
            line-height: 2.8em;
            vertical-align: top;
        }
        .dotted {
            height: 1px;
            background: url(https://www.iei.or.kr/resources/images/common/point_bar.png);
        }
        #board_reply {
            background: #f2f5f9;
            border-top: 1px solid #dae0e9;
            padding: 30px;
        }
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

    <li class="detailcontents">
        <!-- 왼쪽 그림 시작 -->
        <div class="picturepeople">
            <!-- 이미지 사진 시작 -->
            <img class="classimg" src="https://lib.seoul.go.kr/apload/temp/20221012/1368702620008870.jpg" />
            <!-- 이미지 사진 끝 -->
            <div class="picking">
                <span class="receiving">접수중</span>
                <span class="receivingpeople"><c:out value="${eventDto.ev_people-eventDto.ev_nowpeople}"/></span>
            </div>
        </div>
        <!-- 왼쪽 그림 끝 -->
        <!-- 오른쪽 설명 시작 -->
        <div class="detail">
            <div class="bookname">
                <c:out value="${eventDto.ev_title}"/>
            </div>
            <div class="bodycontent">
                <div class="playpeople">
                    <div>대상&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c"><c:out value="${eventDto.ev_target}"/></div>
                </div>
                <br />
                <div class="playplace">
                    <div>장소&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c"><c:out value="${eventDto.ev_place}"/></div>
                </div>
                <br />
                <div class="studyday">
                    <div>교육기간&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c"><c:out value="${eventDto.ev_today}"/></div>
                </div>
                <br />
                <div class="studytime">
                    <div>시간&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c"><c:out value="${eventDto.ev_time}"/></div>
                </div>
                <br />
                <div class="applicationday">
                    <div>접수기간&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c"><c:out value="${eventDto.ev_start}"/></div>
                    <div style="color: #7c7c7c">&nbsp;~&nbsp;</div>
                    <div style="color: #7c7c7c"><c:out value="${eventDto.ev_end}"/></div>
                </div>
                <br />
                <div class="phone">
                    <div>문의번호&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c"><c:out value="${eventDto.ev_phone}"/></div>
                </div>
                <br />
                <div class="recruitment">
                    <div>모집정원&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c"><c:out value="${eventDto.ev_people}"/></div>
                </div>
                <br />
                <div class="recruitment">
                    <div>첨부파일&nbsp;:&nbsp;</div>
<%--                    <div style="color: #7c7c7c">문화행사.pdf</div>--%>
                </div>
            </div>
        </div>
        <!-- 오른쪽 설명 끝 -->
    </li>
    <div>
        <c:out value="${eventDto.ev_content}"/>
    </div>
    <hr />
    <div class="buttonpick"><button id="pick-btn">목록</button><button id="list-btn">신청하기</button></div>
    <%-- 댓글 시작 --%>
    <hr />
    댓글: <input type="text" name="comment"><br>
    <button id="sendBtn" type="button">SEND</button>
    <div id="commentList"></div>

    <%-- 댓글 끝 --%>
</main>
<script>
    /***************** 댓글 시작 ***************/
    let ev_no = 2
<%--        ${eventDto.ev_no};--%>

    let showList = function (ev_no) {
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/event/comments?ev_no=' +ev_no,  // 요청 URI
            success : function(result){
                 $("#commentList").html(toHtml(result));
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }
/***************************** [[댓글 추가]] ****************************/
    $(document).ready(function(){
        showList(ev_no);

        $("#sendBtn").click(function() {
            let comment = $("input[name=comment]").val();

            if(comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("input[name=comment]").fucus()
                return;
            }

            $.ajax({
                type: 'Post',       // 요청 메서드
                url: '/event/comments?'+ev_no,  // 요청 URI
                headers: {"content-type": "application/json"},
                dataType: 'text', // 전송받을 데이터의 타입
                data: JSON.stringify({ev_no:ev_no, comment:comment}), // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert(result);
                    showList(ev_no);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            });
        });
/***************************** [[댓글 추가]] ****************************/
/***************************** [[댓글 삭제]] ****************************/
        // $(".delbtn").click(function(){
        $("#commentList").on("click", ".delBtn", function(){
            let evc_no = $(this).parent().attr("data-evc_no");
            let ev_no = $(this).parent().attr("data-ev_no");

            $.ajax({
                type:'DELETE',       // 요청 메서드
                url: '/event/comments/' +evc_no+ '?ev_no'+ev_no,  // 요청 URI
                success : function(result){
                  alert(result);
                  showList(ev_no);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });
    });
/***************************** [[댓글 삭제]] ****************************/

    let toHtml = function (comments) {
        let tmp = "<ul>"

        comments.forEach(function (evc_comment){
            tmp += ' <li data-evc_no='+ evc_comment.evc_no
            tmp += ' data-evc_pcno=' + evc_comment.evc_pcno
            tmp += ' data-ev_no=' + evc_comment.ev_no + '>'
            tmp += ' evc_commenter = <span class="commenter">' + evc_comment.evc_commenter + '</span>'
            tmp += ' evc_comment=<span class="comment">' + evc_comment.evc_comment + '</span>'
            tmp += ' evc_update' +evc_comment.evc_update
            tmp += '<button class="delBtn">삭제</button>'
            tmp += '<button class="modBtn">수정</button>'
            tmp += '</li>'
        })

        return tmp + "<ul>";
    }
</script>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
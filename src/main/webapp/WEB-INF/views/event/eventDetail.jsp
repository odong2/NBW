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
        #pickBtn {
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
<%--                    <div style="color: #7c7c7c">문화행사.pdf</div>--%>
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
        <button id="listBtn">
            목록
        </button>
        <button id="pickBtn">
            신청하기
        </button>
    </div>

    <%-- ================================ 댓글 입력 시작================================= --%>
    <section class="comment-input">
        <div class="comment-wrapper ms-5 d-flex mt-4 mb-4 col-12">
            <div class="form- col-8 d-flex">
                <textarea  name="comment" class="form-control col-8 me-2" id="comment-input" placeholder="댓글을 작성해 주세요"></textarea>
                <button id="comment-inputBtn" type="button" class="btn btn-outline-secondary col-2" data-evc-no="${eventSelect.ev_no}">댓글 쓰기</button>
            </div>
        </div>
    </section>
    <%-- ================================ 댓글 입력 끝 ================================= --%>

</main>
<script>
    ClassicEditor
        .create(document.querySelector("#editor"),
            {
                language: "ko",
            })
        .then(newEditor => {
            editor = newEditor;
        })
        .catch(error => {
            console.error(error);
        });
</script>
<script>
/****************************************************************************************************/

/****************************************************************************************************/
    $(document).ready(function (){
         $('#listBtn').on("click", function (){
            location.href = "<c:url value='/event/list'/>";
         })
    })
</script>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
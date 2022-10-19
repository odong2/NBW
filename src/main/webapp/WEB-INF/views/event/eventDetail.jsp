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
            width: 70%;
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
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="../../includes/header.jsp" %>
<!-- 헤더 끝 -->
<!-- 사이드바 시작-->
<%@include file="../../includes/sidebar.jsp" %>
<!-- 사이드바 끝-->
<main>
    <div>
        <h2 id="divTitle" class="fl">프로그램 신청</h2>
    </div>
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
                <span class="receivingpeople">7</span>
            </div>
        </div>
        <!-- 왼쪽 그림 끝 -->
        <!-- 오른쪽 설명 시작 -->
        <div class="detail">
            <div class="bookname">
                움직이는 책방
            </div>
            <div class="bodycontent">
                <div class="playpeople">
                    <div>대상&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">시민 누구나</div>
                </div>
                <br />
                <div class="playplace">
                    <div>장소&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">서울광장</div>
                </div>
                <br />
                <div class="studyday">
                    <div>교육기간&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">2022/10/21</div>
                </div>
                <br />
                <div class="studytime">
                    <div>시간&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">12:00~13:00</div>
                </div>
                <br />
                <div class="applicationday">
                    <div>접수기간&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">2022/10/12</div>
                    <div style="color: #7c7c7c">&nbsp;~&nbsp;</div>
                    <div style="color: #7c7c7c">2022/10/20</div>
                </div>
                <br />
                <div class="phone">
                    <div>문의번호&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">02-1122-3344</div>
                </div>
                <br />
                <div class="recruitment">
                    <div>모집정원&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">30명</div>
                </div>
                <br />
                <div class="recruitment">
                    <div>첨부파일&nbsp;:&nbsp;</div>
                    <div style="color: #7c7c7c">문화행사.pdf</div>
                </div>
            </div>
        </div>
        <!-- 오른쪽 설명 끝 -->
    </li>
    <div>
        2022 움직이는 책방 📚 9회 ​ ‘책읽는 서울광장’에서 만나는 동네책방! 특별한 한 권을 찾는 그대를 위한 동네책방의 큐레이션 도서 전시·문화 프로그램 운영 ▷ 서
        점 명 : 미스터리 유니온 ▷ 일 시 : '22. 10. 21.(금) 12:00~13:00 ▷ 장 소 : 서울광장 ▷ 프로그램 [제목] 정탐소설에서 K-스릴러까지 [형식] 북토크 [대담자]
        김용언(미스터리 전문 격월간지 《미스테리아》 편집장), 박광규(추리소설 평론가) [내용] 미스터리의 지평을 넓히는 김용언 편집장과 한국 추리소설사를 발굴하는
        박광규 평론가가 추리소설, 특히 한국 추리소설을 주제로 이야기를 나눕니다. 20세기 초 정탐소설에서 21세기 초 K-스릴러에 이르기까지 한국 추리소설이 걸어온
        길을 돌아보며, 알고 보면 흥미롭고 친숙한 이야깃거리가 넘치는 한국 추리소설의 세계를 작품과 함께 소개합니다. ﻿▷ 참여방법 : 서울도서관 홈페이지(로그인) >
        신청·참여 > 프로그램 신청 ★프로그램 사전 신청 혜택★ 프로그램 종료 후 설문조사 참여 시 다과패키지 제공(1인 1개, 폴콘 협찬) ※ 우천 등 운영 상황에 따라
        프로그램이 변경될 수 있습니다!
    </div>
    <hr />
    <div class="buttonpick"><button id="pick-btn">신청</button><button id="list-btn">목록</button></div>
</main>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
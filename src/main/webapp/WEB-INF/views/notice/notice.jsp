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
    <style>
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
            width: 1000px;
            margin: auto;
        }
        #notice-header > .wrapper {
            margin-bottom: 50px;
        }
        .title {
            margin-top: 60px;
            padding: 15px;
            font-weight: bold;
        }
        .notice-title {
            font-size: 1rem;
            font-weight: bold;
        }
        #search-mode {
            margin-top: 1px;
            height:35px
        }
        #search-input {
            display: flex;
            width: 100%;
            justify-content: center;
            height: 35px;
        }
        #searchBtn {
            height: 35px;
        }
        li {
            list-style: none;
        }
        #notice-main .wrapper {
            border-top: 1px solid rgba(204, 204, 204, 0.6);
            border-bottom: 1px solid rgba(204, 204, 204, 0.6);
            padding: 1rem;
        }
        .form-control {
            font-size: 0.7rem;
        }
        #search-input {
            height: 35px;
        }
        #searchBtn {
            height: 35px;
        }
        #search-select {
            position: relative;
            left: 10em;
        }
        #search-select button{
            height: 35px;
        }
        #search-select li,
        #search-select button {
            font-size: 0.7rem;
            color: black;
            background-color: white;
        }
        .search {
            position: relative;
            left: 2rem;
        }
        #search-input {
            width: 300px;
        }
        span {
            font-size: 0.8rem;
        }
        .page-item {
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
<!-- ?????? ?????? -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- ?????? ??? -->
<%-- ================================= ???????????? Main ?????? ====================================--%>
<main>
    <section id="notice-header" class="container">
        <form method="get" action="/notice/list">
        <div class="text-center">
            <h4 class="title">????????????</h4>
        </div>
        <%-- ================================= ???????????? ?????? ?????? ====================================--%>
        <div class="wrapper d-flex mt-3 justify-content-center">
            <div class="search me-2">
                <select id="search-mode" name="option" class="form-select form-select-sm form-control">
                    <option value="title" selected>??????</option>
                    <option value="content">??????</option>
                </select>
            </div>
            <div class="search">
                <input id="search-input" name="keyword" class="form-control me-2" type="search" value="<c:out value=""/>" placeholder="???????????? ???????????????"/>
            </div>
            <div class="search ms-1">
                <button id="searchBtn" type="submit" class="btn btn-dark form-control">??????</button>
            </div>
            <div id="search-select" class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    ?????????
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item" href="#" onclick="keywordSort(this);">?????????</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="#" onclick="keywordSort(this);">?????????</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="#" onclick="keywordSort(this);">?????????</a>
                    </li>
                </ul>
            </div>
        </div>
        <%-- ================================= ???????????? ?????? ??? ====================================--%>
        </form>
    </section>
    <!-- ====================================== ???????????? Content ?????? =========================================== -->
    <section id="notice-main" class="container">
        <ul>
        <c:forEach var="notice" items="${noticeList}">
            <li>
                <div class="wrapper d-flex flex-column">
                    <div class="ms-3 mb-3">
                        <img src="/images/admin.png" alt="????????? ?????????" width="20px" />
                        <span class="notice-writer me-3">NBW</span>
                <%-- ================ ????????? ?????? ?????? ===============--%>
                        <span class="notice-cdate">
                             <fmt:formatDate value="${notice.nt_cdate}" pattern="yyyy-MM-dd"/>
                        </span>
                    </div>
                    <h5 class="notice-title">
                <%-- ================ ????????? ?????? ?????? ===============--%>
                        <a href="<c:url value="/notice/read${ph.sc.queryString}&nt_no=${notice.nt_no}"/>" class="ms-3 board-content mb-3 text-decoration-none text-dark">

                            <c:out value="${notice.nt_title}"/>
                        </a>
                    </h5>
                    <div class="d-flex align-items-center justify-content-end me-3">
                        <div>
                            <img class="header-img" src="/images/eyes.png" alt="????????? ?????????" width="20px"/>
                <%-- ================= ????????? ????????? =================--%>
                            <span class="notice-hit ms-1">
                                <c:out value="${notice.nt_hit}"/>
                            </span>
                        </div>
                        <div>
                            <img class="header-img ms-1" src="/images/comment.png" alt="?????? ?????? ?????????" width="20px"/>
                <%-- ================= ????????? ????????? (commenter controller ?????? ??? ???????????????) =================--%>
                            <span class="comment-count ms-1"><c:out value="${notice.nt_cocnt}"/></span>
                        </div>
                    </div>
                </div>
            </li>
        </c:forEach>
        </ul>
    </section>
    <%-- ================================= ???????????? context ??? ====================================--%>
    <%-- ================================= ???????????? ????????? nav ?????? ====================================--%>
    <nav aria-label="Page navigation ">
        <ul class="pagination d-flex justify-content-center">
         <%-- ================== ?????? ????????? ?????? ?????? ================== --%>
        <c:if test="${ph.totalCnt==null || ph.totalCnt==0}">
            <div> ???????????? ????????????. </div>
        </c:if>
        <%-- ================== ?????? ????????? ?????? ?????? ?????? ================== --%>
        <c:if test="${ph.totalCnt!=null || ph.totalCnt!=0}">
            <%-- =================== ?????? ????????? ?????? ????????? ??? ?????? ================--%>
            <c:if test="${ph.showPrev}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value="/notice/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </c:if>
            <%-- =================== ??? ????????? ???????????? ????????? ?????? ================--%>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <li class="page-item page-list">
                    <a class="page-link page-num" href="<c:url value="/notice/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                </li>
            </c:forEach>
            <%-- =================== ?????? ????????? ?????? ????????? ??? ?????? ================--%>
            <c:if test="${ph.showNext}">
                <li class="page-item">
                    <a class="page-link"href="<c:url value="/notice/list${ph.sc.getQueryString(ph.endPage+1)}"/>">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:if>
        </c:if>
        <%-- ================== ?????? ????????? ?????? ?????? ?????? ??? ================== --%>
        </ul>
    </nav>
    <%-- ================================= ???????????? ????????? nav ??? ====================================--%>
</main>
<!-- ?????? ?????? -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- ?????? ??? -->
<script>
    let params = new URLSearchParams(document.location.search);
    /* ?????? ????????? */
    let nowPage = params.get("page");
    console.log(nowPage);
    $(function(){
        $('.page-list').each(function(index, item){
            let page =$(item).children('.page-num').text();
            console.log(page);
            if(nowPage == page){
                $(item).addClass('active');
            }
        })
    })
    <%-- ???????????? ?????? ????????? --%>
    function keywordSort(keyword) {
        let search_keyword = $(keyword).text();
        $("#search-select button").text(search_keyword);
    }
</script>
</body>
</html>

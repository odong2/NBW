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
        body {
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
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<%-- ================================= 공지사항 Main 시작 ====================================--%>
<main>
    <section id="notice-header" class="container">
        <div class="text-center">
            <h4 class="title">공지사항</h4>
        </div>
        <%-- ================================= 공지사항 검색 시작 ====================================--%>
        <div class="wrapper d-flex mt-3 justify-content-center">
            <div class="search me-2">
                <select id="search-mode" class="form-select form-select-sm form-control">
                    <option value="title" selected>제목</option>
                    <option value="content">내용</option>
                </select>
            </div>
            <div class="search">
                <input id="search-input" class="form-control me-2" type="search" placeholder="검색어를 입력하세요"/>
            </div>
            <div class="search ms-1">
                <button id="searchBtn" type="button" class="btn btn-dark form-control">검색</button>
            </div>
            <div id="search-select" class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    최신순
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item" href="#" onclick="keywordSort(this);">최신순</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="#" onclick="keywordSort(this);">조회순</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="#" onclick="keywordSort(this);">댓글순</a>
                    </li>
                </ul>
            </div>
        </div>
        <%-- ================================= 공지사항 검색 끝 ====================================--%>
    </section>
    <!-- ====================================== 공지사항 Content 시작 =========================================== -->
    <section id="notice-main" class="container">
        <ul>
        <c:forEach var="notice" items="${noticeList}">
            <li>
                <div class="wrapper d-flex flex-column">
                    <div class="ms-3 mb-3">
                        <img src="/images/admin.png" alt="관리자 아이콘" width="20px" />
                        <span class="notice-writer me-3">NBW</span>
                <%-- ================ 게시글 작성 날짜 ===============--%>
                        <span class="notice-cdate">
                             <fmt:formatDate value="${notice.nt_cdate}" pattern="yyyy-MM-dd"/>
                        </span>
                <%-- ============== 게시글 번호(테스트용) =============--%>
                        <span>번호 : <c:out value="${notice.nt_no}"/></span>
                    </div>
                    <h5 class="notice-title">
                <%-- ================ 게시글 제목 링크 ===============--%>
                        <a href="<c:url value='/notice/read?nt_no=${notice.nt_no}&page=${param.page}'/>" class="ms-3 board-content mb-3 text-decoration-none text-dark">
                            <c:out value="${notice.nt_title}"/>
                        </a>
                    </h5>
                    <div class="d-flex align-items-center justify-content-end me-3">
                        <div>
                            <img class="header-img" src="/images/eyes.png" alt="조회수 이미지" width="20px"/>
                <%-- ================= 게시글 조회수 =================--%>
                            <span class="notice-hit ms-1">
                                <c:out value="${notice.nt_hit}"/>
                            </span>
                        </div>
                        <div>
                            <img class="header-img ms-1" src="/images/comment.png" alt="댓글 개수 이미지" width="20px"/>
                <%-- ================= 게시글 댓글수 (commenter controller 작성 후 작성해야함) =================--%>
                            <span class="comment-count ms-1">10</span>
                        </div>
                    </div>
                </div>
            </li>
        </c:forEach>
        </ul>
    </section>
    <%-- ================================= 공지사항 context 끝 ====================================--%>
    <%-- ================================= 공지사항 페이지 nav 시작 ====================================--%>
    <nav aria-label="Page navigation ">
        <ul class="pagination d-flex justify-content-center">
            <%-- =================== 이전 페이지 링크 보여줄 지 여부 ================--%>
            <c:if test="${ph.showPrev}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value='/notice/list?page=${ph.beginPage-1}'/>">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </c:if>
            <%-- =================== 총 게시물 개수만큼 페이징 처리 ================--%>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value='/notice/list?page=${i}'/>">${i}</a>
                </li>
            </c:forEach>
            <%-- =================== 다음 페이지 링크 보여줄 지 여부 ================--%>
            <c:if test="${ph.showNext}">
                <li class="page-item">
                    <a class="page-link"href="<c:url value='/notice/list?page=${ph.endPage+1}'/>">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
    <%-- ================================= 공지사항 페이지 nav 끝 ====================================--%>
    <script>
        // 검색정렬 버튼 이벤트
        function keywordSort(keyword) {
            let search_keyword = $(keyword).text();
            $("#search-select button").text(search_keyword);
        }
    </script>
</main>
</body>
</html>

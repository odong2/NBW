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
            width: 70%;
            margin: auto;
        }

        #title {
            margin-top: 50px;
            padding: 15px;
        }
        #search-mode {
            margin-top: 1px;
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

        .notice-wrapper {
            border-top: 1px solid #8c8c8c;
            border-bottom: 1px solid #8c8c8c;
            padding: 1rem;
        }

        .search-wrapper {
            width: 100%;
            margin-bottom: 50px;
        }
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<%-- ================================= 공지사항 Main 시작 ====================================--%>
<main>
    <section class="notice-header">
        <div id="title" class="container text-center">
            <h3>공지사항</h3>
        </div>
<%-- ================================= 공지사항 검색 시작 ====================================--%>
        <div class="search-wrapper d-flex col-12 mt-3">
            <div class="col-4"></div>
            <div class="col-1">
                <select id="search-mode" class="form-select form-select-sm mb-3">
                    <option value="A" selected>내용+제목</option>
                    <option value="T" selected>제목</option>
                    <option value="C">내용</option>
                </select>
            </div>
            <div class="col-3 ms-3">
                <input id="search-input" class="form-control me-2" type="search" placeholder="검색어를 입력하세요"/>
            </div>
            <div class="col-1">
                <button id="searchBtn" type="button" class="btn btn-dark">검색</button>
            </div>
        </div>
    </section>
    <%-- ================================= 공지사항 검색 끝 ====================================--%>
    <%-- ================================= 공지사항 context 시작 ====================================--%>
    <section class="container notice-main">
        <ul>
        <c:forEach var="notice" items="${noticeList}">
            <li>
                <div class="notice-wrapper d-flex flex-column">
                    <div class="ms-3 mb-3">
                        <i class="fas fa-user"></i>
                        <span class="notice-writer">관리자</span>
                        <%-- ================ 게시글 작성 날짜 ===============--%>
                        <span class="notice-cdate">
                            <fmt:formatDate value="${notice.nt_cdate}" pattern="yyyy-MM-dd"/>
                        </span>
                        <span>게시글 번호 : <c:out value="${notice.nt_no}"/></span>
                    </div>
                    <h4>
                        <%-- ================ 게시글 제목 링크 ===============--%>
                        <a href="<c:url value='/notice/read?nt_no=${notice.nt_no}&page=${param.page}'/>" class="ms-3 board-content mb-3 text-decoration-none text-dark">
                            <c:out value="${notice.nt_title}"/>
                        </a>
                    </h4>
                    <div class="d-flex align-items-center justify-content-end me-3">
                        <i class="fas fa-eye"></i>
                        <%-- ================= 게시글 조회수 =================--%>
                        <span class="notice-hit me-2">
                            <c:out value="${notice.nt_hit}"/>
                        </span>
                        <i class="fas fa-comment-alt"></i><span class="comment-count">10</span>
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
                    <a class="page-link" href="<c:url value='/notice/noticePageTest?page=${ph.beginPage-1}'/>">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </c:if>
            <%-- =================== 총 게시물 개수만큼 페이징 처리 ================--%>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value='/notice/noticePageTest?page=${i}'/>">${i}</a>
                </li>
            </c:forEach>
            <%-- =================== 다음 페이지 링크 보여줄 지 여부 ================--%>
            <c:if test="${ph.showNext}">
                <li class="page-item">
                    <a class="page-link"href="<c:url value='/notice/noticePageTest?page=${ph.endPage+1}'/>">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
    <%-- ================================= 공지사항 페이지 nav 끝 ====================================--%>
</main>
</body>
</html>

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

        #search-input {
            display: flex;
            width: 100%;
            justify-content: center;
            width: 250px;
            border-radius: 20px;
        }
        li {
            list-style: none;
        }
        .notice-wrapper {
            border-top: 1px solid #8c8c8c;
            border-bottom: 1px solid #8c8c8c;
            padding: 1rem;
        }
        .search-wrapper{
            width: 100%;
            margin-bottom: 50px;
        }
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<div class="container">
    <h3>공지사항</h3>
</div>
<!--  공지사항 메인-->
<main>
    <section class="notice-header">
        <div id="title" class="container text-center">
            <h3>공지사항</h3>
        </div>
        <!-- 공지사항 검색-->
        <div class="search-wrapper d-flex col-12 mt-3">
            <div class="col-4"></div>
            <div class="col-4 d-flex justify-content-center search-input">
                <input
                        id="search-input"
                        class="form-control me-2"
                        type="search"
                        placeholder="공지사항 검색"
                        aria-label="Search"
                />
            </div>
            <div class="dropdown col-3 d-flex justify-content-end ">
                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    최신순
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">댓글순</a></li>
                    <li><a class="dropdown-item" href="#">조회순</a></li>
                    <li><a class="dropdown-item" href="#"></a></li>
                </ul>
            </div>
        </div>
    </section>
    <!-- 공지사항 Content 시작 -->
    <section class="container notice-main">
        <ul>
            <li>
                <div class="notice-wrapper d-flex flex-column">
                    <div class="ms-3 mb-3">
                        <i class="fas fa-user"></i>
                        <span class="notice-writer">관리자</span>
                        <span class="notice-cdate">2022-09-01</span>
                    </div>
                    <div class="ms-3 board-content mb-3">
                        <h5 class="board-title">[중요]공지사항 테스트</h5>
                    </div>
                    <div class="d-flex align-items-center justify-content-end me-3">
                        <i class="fas fa-eye"></i><span class="notice-hit me-2">20</span>
                        <i class="fas fa-comment-alt"></i><span class="comment-count">10</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="notice-wrapper d-flex flex-column">
                    <div class="ms-3 mb-3">
                        <i class="fas fa-user"></i>
                        <span class="notice-writer">관리자</span>
                        <span class="notice-cdate">2022-09-01</span>
                    </div>
                    <div class="ms-3 board-content mb-3">
                        <h5 class="board-title">[중요]공지사항 테스트</h5>
                    </div>
                    <div class="d-flex align-items-center justify-content-end me-3">
                        <i class="fas fa-eye"></i><span class="notice-hit me-2">20</span>
                        <i class="fas fa-comment-alt"></i><span class="comment-count">10</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="notice-wrapper d-flex flex-column">
                    <div class="ms-3 mb-3">
                        <i class="fas fa-user"></i>
                        <span class="notice-writer">관리자</span>
                        <span class="notice-cdate">2022-09-01</span>
                    </div>
                    <div class="ms-3 board-content mb-3">
                        <h5 class="board-title">[중요]공지사항 테스트</h5>
                    </div>
                    <div class="d-flex align-items-center justify-content-end me-3">
                        <i class="fas fa-eye"></i><span class="notice-hit me-2">20</span>
                        <i class="fas fa-comment-alt"></i><span class="comment-count">10</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="notice-wrapper d-flex flex-column">
                    <div class="ms-3 mb-3">
                        <i class="fas fa-user"></i>
                        <span class="notice-writer">관리자</span>
                        <span class="notice-cdate">2022-09-01</span>
                    </div>
                    <div class="ms-3 board-content mb-3">
                        <h5 class="board-title">[중요]공지사항 테스트</h5>
                    </div>
                    <div class="d-flex align-items-center justify-content-end me-3">
                        <i class="fas fa-eye"></i><span class="notice-hit me-2">20</span>
                        <i class="fas fa-comment-alt"></i><span class="comment-count">10</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="notice-wrapper d-flex flex-column">
                    <div class="ms-3 mb-3">
                        <i class="fas fa-user"></i>
                        <span class="notice-writer">관리자</span>
                        <span class="notice-cdate">2022-09-01</span>
                    </div>
                    <div class="ms-3 board-content mb-3">
                        <h5 class="board-title">[중요]공지사항 테스트</h5>
                    </div>
                    <div class="d-flex align-items-center justify-content-end me-3">
                        <i class="fas fa-eye"></i><span class="notice-hit me-2">20</span>
                        <i class="fas fa-comment-alt"></i><span class="comment-count">10</span>
                    </div>
                </div>
            </li>
        </ul>
    </section>
    <nav aria-label="Page navigation ">
        <ul class="pagination d-flex justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </nav>
</main>
</body>
</html>

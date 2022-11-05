<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 분류 페이지</title>
    <%@include file="../../includes/common.jsp" %>
    <link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
    <style>
        /** {*/
        /*    border: red solid 1px;*/
        /*}*/

        main {
            width: 100%;
            padding-left: 20px;
        }

        ul {
            list-style: none;
        }

        .product_container {
            width: 80%;
            /*margin-bottom: 100px;*/
        }

        .product_list {
            margin-bottom: 40px;
            padding:10px 5px;
        }

        #product_list>a {
            text-decoration: none;
            text-align: center;
        }

        .col-4>a {
            color: rgb(21, 30, 61);
            font-size: smaller;
            text-decoration: none;
        }

        a {
            text-decoration: none;
        }

        .pagination_info {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 100px;
        }

        .pagination_info li {
            width: 30px;
            height: 30px;
            text-align: center;
            padding-top: 2px;
            border-radius: 20px;
            border: 1px #6b6969 solid;
            background-color: white;
            font-size: medium;
            margin-right: 5px;
            float: left;
        }

        .pagination_info li a {
            color: #767474;
        }

    </style>
</head>

<body>
    <!-- 헤더 시작 -->
    <%@include file="/WEB-INF/includes/header.jsp" %>
    <!-- 헤더 끝 -->
    <section class="product-wrap wrapper d-flex">
    <%--    카테고리 시작    --%>
    <%@include file="/WEB-INF/views/search/category.jsp" %>


<%--            <!-- *상품분류* NAV END. -->--%>
<%--            <br>--%>
<%--            <!-- *검색조건* NAV START 입니다. -->--%>
<%--            <nav>--%>
<%--                <div class="row justify-content-md-center">--%>
<%--                    <div class="col"--%>
<%--                        style="text-align: center;--%>
<%--                        padding-top:5px;--%>
<%--                        color: rgb(21, 30, 61);--%>
<%--                        font-size: larger;--%>
<%--                        background-color: rgb(242, 242, 242);--%>
<%--                        height: 40px;--%>
<%--                        border-radius: 5px;">--%>
<%--                        <label style="font-size: medium"> 검색/조건 </label>--%>
<%--                    </div>--%>
<%--                    <div class="col-4 col-lg-1"><a href="#">할인률</a></div>--%>
<%--                    <div class="col-4 col-lg-2"><a href="#">높은가격</a></div>--%>
<%--                    <div class="col-4 col-lg-2"><a href="#">낮은가격</a></div>--%>
<%--                    <div class="col-4 col-lg-1"><a href="#">평점순</a></div>--%>
<%--                    <div class="col-4 col-lg-2"><a href="#">발행일순</a></div>--%>
<%--                    <div class="col-4 col-lg-1"><a href="#">리뷰순</a></div>--%>
<%--                    <div class="col-4 col-lg-1"><a href="#">판매량</a></div>--%>
<%--                </div>--%>
<%--            </nav>--%>
            <!-- *검색조건* NAV END. -->
    <main>
        <br>

        <h6><span style="font-weight: bolder; color: #83b72e;">'${criteria.keyword}'</span> 에 대한 <span style="color: darkgreen"><fmt:formatNumber value="${pagination.totalCount}" type="number"/> </span>개의 검색 결과</h6>
        <div class="product_container">
        <hr>
            <c:forEach items = "#{list}" var="list">
<%--                            상품 div --%>
                <div class="row" style="padding: 10px 10px;">
                                <div class="row" id="product_list" >
                                    <div class="col-3">
                                        <a href="#"><img alt=""  width="150px" src="${list.getP_img()}" style="border-radius: 5px;"/></a>
                                    </div>
                                   <div class="col">
                                       <div class="row"><p style="font-weight: bolder"><a href="#">${list.getP_title()}</a></p></div>
                                       <div class="row"><p style="font-size: smaller; color: #343a40;">${list.getP_author()} 저자</p></div>
                                       <div class="row"><p style="font-size: smaller; color: #343a40;">${list.getP_publisher()} | ${list.getP_pubdate()} 출간</p></div>
                                       <div class="row"><p style="font-size: 15px; font-weight: bolder;"><fmt:formatNumber value="${list.getP_price()}" type="number"/>  원</p></div>
                                       <div class="row"><p style="font-size: small;">♥️ ${list.getP_like()} </p></div>
                                   </div>
                                    <div class="col-2" style="padding-top:55px">
                                        <div class="row-cols-md-auto text-center"><button style="margin-bottom: 5px; color: white; background-color: gray; border-radius: 5px; border: none; width: 100%; height: 40px; ">장바구니</button></div>
                                        <div class="row-cols-md-auto text-center"><button style="color: white; background-color: midnightblue; border-radius: 5px; border: none; width: 100%; height: 40px; ">바로구매</button></div>
                                    </div>
                               </div>
                                <br>
                </div>
<%--                            상품 div 끝--%>
                <hr>
            </c:forEach>
            <c:if test="${pagination.totalCount == null || pagination.totalCount == 0}">
                <div class="card" style="width: 100%; border-style: none; background-color: #f1f2f6; padding: 180px 100px; text-align: center;">
                    <div class="card-body">
                        <i class="far fa-info-square fa-3x"></i><br><br>
                        <h6><strong>검색 결과가 존재하지 않습니다.</strong></h6>
                        <p style="color: #5e6269; font-size: smaller;">검색어의 철자가 정확한지 다시 한 번 확인해주세요.</p>
                    </div>
                </div>
            </c:if>
            <%--  [[검색 결과가 존재하는 경우]] 서버로부터 전송받은 pagination 속성에 저장된 startPage, endPage 값을 가지고 forEach 태그를 이용해서 페이지 번호를 화면에 출력한다.   --%>
            <c:if test="${pagination.totalCount != null || pagination.totalCount != 0}">
                <div class="row text-center">
                    <div class="pagination_info">
                        <c:if test="${pagination.prev}">
                            <li class="pagination_info prev">
                                <a href="/product/search?keyword=${criteria.keyword}&pageNum=${pagination.startPage-1}">이전</a>
                            </li>
                        </c:if>
                        <c:forEach var="num" begin="${pagination.startPage}" end="${pagination.endPage}">
                            <li class="paging_btn">
                                <a href="/product/search?keyword=${criteria.keyword}&pageNum=${num}">${num}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pagination.next}">
                            <li class="pagination_info next">
                                <a href="/product/search?keyword=${criteria.keyword}&pageNum=${pagination.endPage+1}">다음</a>
                            </li>
                        </c:if>
                    </div>
                </div>
            </c:if>
        </div>
        <br>
    </main>
    </section>
</body>
</html>

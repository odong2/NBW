<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 분류 페이지</title>
    <%@include file="../../includes/common.jsp" %>
    <link href="/commoncss/sidebar.css" rel="stylesheet" type="text/css" />
    <style>
        /**{*/
        /*    border: 1px solid red;*/
        /*}*/
        @font-face {
            font-family: 'NEXON Lv1 Gothic OTF';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        main {
            width: 100%;
            padding-left: 20px;
            font-family: NEXON Lv1 Gothic OTF;
        }
        ul {
            list-style: none;
        }
        .product_container {
            width: 80%;
            /*margin-bottom: 100px;*/
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
        .paging_btn {
            text-align: center;
        }
        a {
            text-decoration: none;
        }
        .pagination_info {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 100px;
        }
        li.paging_btn.active {
            background-color: #f8f8a1;
            color: #454545;
            font-weight: bolder;
        }
        .pagination_info li {
            width: 40px;
            height: 40px;
            text-align: center;
            padding-top: 8px;
            padding-right: 13px;
            border-radius: 20px;
            border: 1px #6b6969 solid;
            background-color: white;
            font-size: medium;
            margin-right: 5px;
        }
        .pagination_info li a {
            color: #767474;
        }
    </style>
    <script type="text/javascript">
        $(function (){
            let params = new URLSearchParams(document.location.search);
            /* 현재 페이지 */
            let nowPage = params.get("pageNum");
            console.log("nowPage ===>"+nowPage);
            $(function(){
                $('.paging_btn').each(function(index, item){
                    let page =$(item).children('.page-num').text();
                    console.log("page ===> "+page);
                    if(nowPage == page){
                        $(item).addClass('active');
                    }
                })
            })
        })
    </script>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
<section class="product-wrap wrapper d-flex">
    <%--  ========================  카테고리 목록 시작  ===================  --%>
    <%@include file="/WEB-INF/views/product/category.jsp" %>
    <%--  ========================  카테고리 목록 끝  ===================  --%>
    <main>
        <br>
        <%--  ======================== 상품 소개 시작 ===================  --%>
        <c:choose>
            <c:when test="${criteria.keyword != null}">
                <h6><span style="font-weight: bolder; color: #83b72e;">'${criteria.keyword}'</span> 에 대한 <span style="color: darkgreen"><fmt:formatNumber value="${pagination.totalCount}" type="number"/> </span>개의 검색 결과</h6>
                <c:if test='${criteria.keyword !=null && criteria.type == "C"} '>
                    <h6>${criteria.keyword} 에 대한 검색 결과 중 ${criteria.p_category} 에 해당하는 검색 결과입니다.</h6>
                </c:if>
            </c:when>
            <c:when test='${criteria.p_category != null && criteria.p_category != "total"}'>
                <h6><span style="font-weight: bolder; color: #83b72e;">${criteria.p_category}</span> 상품은 <span style="color: darkgreen"><fmt:formatNumber value="${pagination.totalCount}" type="number"/> </span>건 입니다. </h6>
            </c:when>
            <c:when test='${criteria.p_category == "total"}'>
                <h6><span style="font-weight: bolder; color: #83b72e;">"전체"</span> 상품은 <span style="color: darkgreen"><fmt:formatNumber value="${pagination.totalCount}" type="number"/> </span>건 입니다. </h6>
            </c:when>
        </c:choose>
        <div class="row">
            <%--  ========================  상품정렬 시작  ===================  --%>
            <%@include file="/WEB-INF/views/product/sort.jsp" %>
            <%--  ========================  상품정렬 끝  ===================  --%>
        </div>
        <%--  ========================  상품목록  ===================  --%>
        <div class="product_container">
            <hr>
            <c:forEach items = "${list}" var="list">
                <%-- 상품 div --%>
                <div class="row" style="padding: 10px 10px;">
                    <div class="row" id="product_list" >
                        <div class="col-3">
                            <a href="/product/<c:out value="${list.getP_no()}"/>"> <img alt=""  width="150px" src="${list.getP_img()}" style="border-radius: 5px;"/></a>
                        </div>
                        <div class="col">
                            <div class="row"><p style="font-weight: bolder"><a href="/product/<c:out value="${list.getP_no()}"/>">${list.getP_title()}</a></p></div>
                            <div class="row"><p style="font-size: smaller; color: #343a40;">${list.getP_author()} 저자</p></div>
                            <div class="row"><p style="font-size: smaller; color: #343a40;">${list.getP_publisher()} |
                                                                            <fmt:parseDate value="${list.getP_pubdate()}" var="date1" pattern="yyyy-MM-dd"/>
                                                                            <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd"/>
                                                                            출간</p>
                            </div>
                            <div class="row"><p style="font-size: 15px; font-weight: bolder;"><fmt:formatNumber value="${list.getP_price()}" type="number"/>  원</p></div>
                            <div class="row"><p style="font-size: small;">♥️ ${list.getP_like()} </p></div>
                        </div>
                    </div>
                    <br>
                </div>
                <%--                            상품 div 끝                            --%>
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
                    <div class="row pagination_info justify-content-sm-center">
                        <%--  ----------------------------- 이전 페이지 존재 여부 --------------------------  --%>
                        <c:if test="${pagination.prev}">
                            <li class="paging_btn prev">
                                <a href="/product/search?p_category=${criteria.p_category}&keyword=${criteria.keyword}&type=${criteria.type}&sort=${criteria.sort}&pageNum=${pagination.startPage-1}">&laquo;</a>
                            </li>
                        </c:if>
                        <%--  ----------------------------- 총 갯수만큼 페이징 --------------------------  --%>
                            <c:forEach var="num" begin="${pagination.startPage}" end="${pagination.endPage}">
                                <li class="paging_btn">
                                    <a class="page-num" href="/product/search?p_category=${criteria.p_category}&keyword=${criteria.keyword}&type=${criteria.type}&sort=${criteria.sort}&pageNum=${num}">${num}</a>
                                </li>
                         </c:forEach>
                        <%--  ----------------------------- 다음 페이지 존재 여부 --------------------------  --%>
                        <c:if test="${pagination.next}">
                        <li class="paging_btn next">
                                <a href="/product/search?p_category=${criteria.p_category}&keyword=${criteria.keyword}&type=${criteria.type}&sort=${criteria.sort}&pageNum=${pagination.endPage+1}">&raquo;</a>
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
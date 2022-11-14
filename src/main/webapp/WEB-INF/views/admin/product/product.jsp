<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <%@include file="../../../includes/admin/common.jsp" %>
  <title>관리자 상품관리</title>
  <style>
    @font-face {
      font-family: 'InfinitySans-RegularA1';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
    *{
      /*border: 1px solid red;*/
      font-family: 'InfinitySans-RegularA1';
    }
    tr{
      font-size: small;
      text-align: center;
    }
    table{
      margin-top: 100px;
      border-radius: 10px;
    }
    .sortBar {
      padding-top: 30px;
      width: 100%;
    }
    .sort-link {
      float: left;
      margin-left: 1rem;
      font-size: small;
      border: 1px solid #929292;
      border-radius: 30px;
      width: 80px;
      height: 25px;
      color: #343a40;
      text-align: center;
      padding-top: 3px;
      list-style: none;
    }
    li.sort-link.active {
      border: 2px solid yellow;
    }
    .sort-a{
      color: #67696f;
      text-decoration: none;
    }
    .sort-a:hover{
      font-weight: bolder;
      color: #112e56;
    }
    .paging_btn {
      list-style: none;
      text-align: center;
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
    .cate-a {
      color: #7e7f80;
      font-size: small;
    }
    .cate-a:hover{
      color: #1c1cb7;
      font-weight: bolder;
      text-decoration: none;
    }
    .side-link{
      font-size: medium;
      height: 40px;
      width: 100%;
      border-radius: 40px;
      padding-top: 8px;
    }
    .side-link>span {
      color: #3b5998;
    }
    li.side-link.active {
      background-color: #fdfde7;
      border-radius: 50px;
    }
  </style>
</head>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <%@include file="../../../includes/admin/common.jsp" %>
  <title>관리자 상품관리</title>
  <style>
    @font-face {
      font-family: 'InfinitySans-RegularA1';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
    *{
      /*border: 1px solid red;*/
      font-family: 'InfinitySans-RegularA1';
    }
    tr{
      font-size: small;
      text-align: center;
    }
    table{
      margin-top: 100px;
      border-radius: 10px;
    }
    .sortBar {
      padding-top: 30px;
      width: 100%;
    }
    .sort-link {
      float: left;
      margin-left: 1rem;
      font-size: small;
      border: 1px solid #929292;
      border-radius: 30px;
      width: 80px;
      height: 25px;
      color: #343a40;
      text-align: center;
      padding-top: 3px;
      list-style: none;
    }
    li.sort-link.active {
      border: 2px solid yellow;
    }
    .sort-a{
      color: #67696f;
      text-decoration: none;
    }
    .sort-a:hover{
      font-weight: bolder;
      color: #112e56;
    }
    .paging_btn {
      list-style: none;
      text-align: center;
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
    .cate-a {
      color: #7e7f80;
      font-size: small;
    }
    .cate-a:hover{
      color: #1c1cb7;
      font-weight: bolder;
      text-decoration: none;
    }
    .side-link{
      font-size: medium;
      height: 40px;
      width: 100%;
      border-radius: 40px;
      padding-top: 8px;
    }
    .side-link>span {
      color: #3b5998;
    }
    li.side-link.active {
      background-color: #fdfde7;
      border-radius: 50px;
    }
  </style>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div class="d-flex justify-content-start">
  <!-- Sidebar -->
  <%@include file="../../../includes/admin/sidebar.jsp" %>
  <!-- Content Wrapper -->
  <section class="contentdiv d-flex" style="margin-left: 224px">
    <!-- Topbar -->
    <%@include file="../../../includes/admin/header.jsp" %>
    <!-- Main Content -->
    <main class="container-fluid">
      <!-- Begin Page Content -->
      <section id="main">
        <section class="container-fluid" style="padding-bottom: 40px;">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800 mt-4">상품관리 페이지</h1>
          <p class="mt-3 mb-1 info">
            상품을 관리하는 페이지 입니다. 클라이언트 페이지의 상품 목록으로 이동하시려면 <a href="/product/search" class="font-weight-bold" style="color: green">링크</a>를 눌러주세요.
          </p>
          <div id="insertBtn" style="float: right;">
            <a href="/admin/product/write"><button style="border: none; font-size: medium; background-color: grey; color: white; width: 200px; height: 40px; border-radius: 10px; margin-top: 10px;"><i class="fas fa-plus">상품 등록</i></button></a>
          </div><br>
          <%--  ========================  상품소개 SECTION  ===================  --%>
          <c:choose>
            <c:when test="${not empty criteria.keyword}">
              <h5><span style="font-weight: bolder; color: #83b72e;">'${criteria.keyword}'</span> 에 대한 <span style="color: darkgreen"><fmt:formatNumber value="${pagination.totalCount}" type="number"/> </span>개의 검색 결과</h5>
              <c:if test='${criteria.keyword !=null && criteria.type == "C"} '>
                <h5>${criteria.keyword} 에 대한 검색 결과 중 ${criteria.p_category} 에 해당하는 검색 결과입니다.</h5>
              </c:if>
            </c:when>
            <c:when test='${not empty criteria.p_category  && criteria.p_category ne "total"}'>
              <h5><span style="font-weight: bolder; color: #83b72e;">${criteria.p_category}</span> 상품은 <span style="color: darkgreen"><fmt:formatNumber value="${pagination.totalCount}" type="number"/> </span>건 입니다. </h5>
            </c:when>
            <c:when test='${criteria.p_category eq "total"}'>
              <h5><span style="font-weight: bolder; color: #83b72e;">"전체"</span> 상품은 <span style="color: darkgreen"><fmt:formatNumber value="${pagination.totalCount}" type="number"/> </span>건 입니다. </h5>
            </c:when>
            <c:otherwise>
              <h5><span style="font-weight: bolder; color: #83b72e;">"전체"</span> 상품은 <span style="color: darkgreen"><fmt:formatNumber value="${pagination.totalCount}" type="number"/> </span>건 입니다. </h5>
            </c:otherwise>
          </c:choose>
          <%--  ========================  상품소개 SECTION  ===================  --%>
          <%--  ========================  상품정렬 시작  ===================  --%>
          <section class="sortBar">
            <div class="sort-section">
              <c:if test="${pagination.totalCount ne 0}">
                <section>
                  <ul class="sortList" style="float: right;">
                    <li class="sort-link"><a class ="sort-a" href="recent">최신순</a></li>
                    <li class="sort-link"><a class ="sort-a" href="sell">판매순</a></li>
                    <li class="sort-link"><a class ="sort-a" href="lowerprice">낮은가격순</a></li>
                    <li class="sort-link"><a class ="sort-a" href="higherprice">높은가격순</a></li>
                    <li class="sort-link"><a class ="sort-a" href="review">리뷰순</a></li>
                    <li class="sort-link"><a class ="sort-a" href="like">좋아요순</a></li>
                    <li class="sort-link"><a class ="sort-a" href="score">평점순</a></li>
                  </ul>
                  <form class="sort_search_form" method="get" action="/admin/product/list" hidden>
                    <input type="text" name="keyword"/>
                    <input type="text" name="type"/>
                    <input type="text" name="p_category"/>
                    <input type="text" name="sort"/>
                  </form>
                </section>
              </c:if>
            </div>
          </section>
          <%--  ========================  상품정렬 끝  ===================  --%>
          <%--  =========== =============  카테고리 필터링 시작  ===================  --%>
          <section>
            <ul class="sidebarList mt-3" style="position: fixed; left: 180px; border: solid 1px #dcdbdb; padding-top: 20px; padding-bottom: 20px; padding-right: 25px; border-radius: 10px; width: 170px;">
              <ul class="category_wrap">
                <li class="title" style="border-radius: 10px;"><span style="color:gray">Category</span></li>
                <br>
                <li class="side-link"><a class="cate-a" href="철학">∙ 철학 </a></li>
                <li class="side-link"><a class="cate-a" href="종교">∙ 종교 </a></li>
                <li class="side-link"><a class="cate-a" href="사회과학">∙ 사회과학 </a></li>
                <li class="side-link"><a class="cate-a" href="자연과학">∙ 자연과학</a></li>
                <li class="side-link"><a class="cate-a" href="기술과학">∙ 기술과학 </a></li>
                <li class="side-link"><a class="cate-a" href="예술">∙ 예술 </a></li>
                <li class="side-link"><a class="cate-a" href="언어">∙ 언어 </a></li>
                <li class="side-link"><a class="cate-a" href="문학">∙ 문학 </a></li>
                <li class="side-link"><a class="cate-a" href="역사">∙ 역사 </a></li>
              </ul>
              </li>
            </ul>
            <%--            카테고리 검색을 요청할 form 을 숨김으로 해놓은 뒤 사용자가 위의 a 태그를 클릭하면 그에 해당하는 카테고리 이름을 input 의 value 로 넘긴다.--%>
            <form class="category_search_form" method="get" action="/admin/product/list" hidden>
              <input type="text" name="p_category"/>
              <input type="text" name="keyword"/>
              <input type="text" name="type"/>
            </form>
          </section>
          <%--  =========== =============  카테고리 필터링 끝 ===================  --%>
          <%--  ============================     [[ 검색창 ]]   =============================  --%>
          <div class="ad-product-search" style="margin-top: 50px; margin-bottom: 50px;" >
            <form id="ad-product-search" action="/admin/product/list" method="get" style="width: 60%; float: right;" >
              <div class="col-12 d-flex align-items-center justify-content-start" >
                <div class="input-group ms-3">
                  <input
                          type="text"
                          id="mainSearch"
                          name="keyword"
                          class="form-control"
                          placeholder="검색어를 입력해주세요."
                          aria-label="Recipient's username"
                          aria-describedby="button-addon2"
                          autocomplete="off"
                          style="border-radius: 15px; border: solid 1px; border-color: #3b5998; height: 40px; width:100px;"
                  />
                  <button
                          class="btn btn-outline-secondary"
                          id="button-addon2"
                          type="submit"
                          style="border-radius: 15px; border: solid 1px; border-color: #3b5998; height: 40px;width:55px; padding-bottom: 10px;"
                  >
                    <i class="fas fa-search fa-1x"></i>
                  </button>
                </div>
              </div>
            </form>
          </div>
          <%--  ================♥︎============     [[  검색창  ]]   =============================  --%>
          <%--  ========================  [[상품 컨테이너]]  ===================  --%>
          <div class="product_container" style="margin-top: 40px; margin-bottom: 50px; width: 93%; float: right;">
            <%-- [[상품 테이블]] --%>
            <c:if test="${not empty list}">
              <table class="table table-dark table-striped table-hover" style="margin-top:50px; margin-bottom: 50px;">
                <thead>
                <tr>
                  <th scope="col">No</th>
                  <th scope="col">사진</th>
                  <th scope="col" >제목</th>
                  <th scope="col" style="width: 8%;">카테고리</th>
                  <th scope="col" style="width: 7%;">저자</th>
                  <th scope="col" style="width: 7%;">출판사</th>
                  <th scope="col">가격</th>
                  <th scope="col" style="width: 10%;">출간일</th>
                  <th scope="col" style="width: 5%;">♥️</th>
                  <th scope="col" style="width: 5%;">리뷰</th>
                  <th scope="col" style="width: 5%;">평점</th>
                  <th scope="col" style="width: 5%;">재고</th>
                  <th scope="col" style="width: 9%;">총 판매수</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items = "${list}" var="list">
                  <tr>
                    <th scope="row">${list.getP_no()}</th>
                    <td><img src="${list.getP_img()}" alt="" width="60" height="80" style="border-radius: 5px;"></td>
                    <td><a href="/admin/product/<c:out value="${list.getP_no()}"/>" style="text-decoration: none; color: white;">${list.getP_title()}</a></td>
                    <td>${list.getP_category()}</td>
                    <td>${list.getP_author()}</td>
                    <td>${list.getP_publisher()}</td>
                    <td>${list.getP_price()}</td>
                    <td>${list.getP_pubdate()}</td>
                    <td>${list.getP_like()}</td>
                    <td>${list.getP_review()}</td>
                    <td>${list.getP_avgscore()}</td>
                    <td>${list.getP_count()}</td>
                    <td>${list.getP_tsell()}</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </c:if>


            <%--  [[검색 결과가 존재하는 경우]] 서버로부터 전송받은 pagination 속성에 저장된 startPage, endPage 값을 가지고 forEach 태그를 이용해서 페이지 번호를 화면에 출력한다.   --%>
            <c:if test="${pagination.totalCount != null || pagination.totalCount != 0}">
              <div>
                <div class="row pagination_info justify-content-sm-center">
                    <%--  ----------------------------- 이전 페이지 존재 여부 --------------------------  --%>
                  <c:if test="${pagination.prev}">
                    <li class="paging_btn prev">
                      <a href="/admin/product/list?p_category=${criteria.p_category}&keyword=${criteria.keyword}&type=${criteria.type}&sort=${criteria.sort}&pageNum=${pagination.startPage-1}">&laquo;</a>
                    </li>
                  </c:if>
                    <%--  ----------------------------- 총 갯수만큼 페이징 --------------------------  --%>
                  <c:forEach var="num" begin="${pagination.startPage}" end="${pagination.endPage}">
                    <li class="paging_btn">
                      <a class="page-num" href="/admin/product/list?p_category=${criteria.p_category}&keyword=${criteria.keyword}&type=${criteria.type}&sort=${criteria.sort}&pageNum=${num}" style="text-decoration: none;">${num}</a>
                    </li>
                  </c:forEach>
                    <%--  ----------------------------- 다음 페이지 존재 여부 --------------------------  --%>
                  <c:if test="${pagination.next}">
                    <li class="paging_btn next">
                      <a href="/admin/product/list?p_category=${criteria.p_category}&keyword=${criteria.keyword}&type=${criteria.type}&sort=${criteria.sort}&pageNum=${pagination.endPage+1}">&raquo;</a>
                    </li>
                  </c:if>
                </div>
              </div>
            </c:if>

            <%-- 검색결과가 존재하지 않는 경우 --%>
            <c:if test="${pagination.totalCount == null || pagination.totalCount == 0}">
              <div class="card" style="width: 100%; border-style: none; background-color: #f1f2f6; padding: 180px 100px; text-align: center;">
                <div class="card-body">
                  <i class="far fa-info-square fa-3x"></i><br><br>
                  <h6><strong>검색 결과가 존재하지 않습니다.</strong></h6>
                  <p style="color: #5e6269; font-size: smaller;">검색어의 철자가 정확한지 다시 한 번 확인해주세요.</p>
                </div>
              </div>
            </c:if>
          </div>
        </section>
        <br>
      </section>
    </main>
    <!-- Footer -->
    <%@include file="../../../includes/admin/footer.jsp" %>
    <!-- End of Footer -->
    <!-- End of Content Wrapper -->
  </section>
</div>
<!-- [[ 오른쪽 div 끝 ]] -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>
</body>
</html>
<script type="text/javascript">
  $(function(){
    const href = window.location.href;
    console.log("현재 URL ==>" + href);
    if(href.indexOf("admin")){
      console.log("true");
    }

    $(".sortList a").on("click", function(e){
      e.preventDefault();
      let sortName = $(this).attr("href");
      console.log(sortName);
      $(".sort_search_form input[name='keyword']").val('${criteria.keyword}');
      $(".sort_search_form input[name='type']").val('${criteria.type}');
      $(".sort_search_form input[name='p_category']").val('${criteria.p_category}');
      $(".sort_search_form input[name='sort']").val(sortName);
      $(".sort_search_form").submit();
    });

    let sortParams = new URLSearchParams(document.location.search);
    /* 현재 분류기준 */
    let nowSort = sortParams.get("sort");
    console.log("nowSort ===>"+nowSort);
    $(function(){
      $('.sort-link').each(function(index, item){
        //console.log(item);
        let sort =$(item).children('.sort-a').attr("href");
        console.log("sort ===> "+sort);
        if(nowSort == sort){
          $(item).addClass('active');
        }
      })
    })

    // 카테고리 필터링
    $(".category_wrap a").on("click", function(e){
      e.preventDefault();
      let categoryCode = $(this).attr("href");
      console.log(categoryCode); // 내가 클릭한 a 태그의 href 값 (예: 기술과학, 사회과학..)
      $(".category_search_form input[name='keyword']").val('${criteria.keyword}');
      $(".category_search_form input[name='p_category']").val(categoryCode);
      $(".category_search_form input[name='type']").val('C');
      $(".category_search_form").submit();
    })

    let Params = new URLSearchParams(document.location.search);
    let nowCate = Params.get("p_category");
    let nowPage = Params.get("pageNum");
    $(function(){
      $('.side-link').each(function(index, item){
        let cate = $(item).children('.cate-a').attr("href");
        if(nowCate == cate) $(item).addClass('active');
      })
    })

    $(function(){
      $('.paging_btn').each(function(index, item){
        let page =$(item).children('.page-num').text();
        console.log("page ===> "+page);
        if(nowPage == page){
          $(item).addClass('active');
        }
      })
    })
  });
</script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/search/mainSearch.jsp" %>
<div class="d-flex flex-wrap">
    <div class="col-2"></div>
    <nav class="d-flex align-items-center flex-column col-8">
        <ul
                class="col-12 nav nav-pills d-flex justify-content-end p-2"
                style="font-size: 13px;"
        >
            <c:choose>
                <c:when test="${ !empty sessionScope.member}">
                    <li class="nav-item">
                        <a href="/mypage/info" class="text-decoration-none px-3 border-end rounded-0"
                        ><strong><span style="color: #0055ec; ">${sessionScope.member.getMem_name()}</span></strong>님 환영합니다!
                            <div id="state_ing" class="badge bg-warning rounded-pill">
                                    ${sessionScope.member.getG_grade()}
                            </div></a
                        >
                    </li>
                    <li class="nav-item">
                        <a id="logout" href="#" class="text-decoration-none px-3 border-end rounded-0"
                        >로그아웃</a
                        >
                    </li>
                    <li class="nav-item">
	                <a href="/mypage/payment/list" class="text-decoration-none px-3 border-end rounded-0"
		                >마이페이지</a
		                >
		            </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a href="/login" class="text-decoration-none px-3 border-end rounded-0"
                        >로그인</a
                        >
                    </li>
                    <li class="nav-item">
                        <a href="/member/register" class="text-decoration-none px-3 border-end rounded-0"
                        >회원가입</a
                        >
                    </li>
                </c:otherwise>
            </c:choose>
            <li class="nav-item">
                <a href="/cart/list" class="text-decoration-none px-3">
                    <i class="fas fa-shopping-cart"></i>
                    장바구니
                </a>
            </li>
            <li class="nav-item">
                <a href="/mypage/qna/write" class="text-decoration-none px-3 border-start rounded-0"
                >문의하기</a
                >
            </li>
        </ul>
        <br>
        <form id="searchForm" action="/product/search" method="get" style="width: 100%;">
            <div class="col-12 d-flex align-items-center justify-content-start" >
                <a href="/home"><img alt="" src="/images/NBW_title.gif" style="width: 200px;"></a>
                <div class="input-group ms-3">
                    <%--  ============================      검색창    =============================  --%>
                    <input
                            type="text"
                            id="mainSearch"
                            name="keyword"
                            class="form-control"
                            placeholder="검색어를 입력해주세요."
                            aria-label="Recipient's username"
                            aria-describedby="button-addon2"
                            autocomplete="off"
                            style="border-radius: 15px; border: solid 2px; border-color: #3b5998; height: 50px; background-image: url('/images/search_background.png')"
                    />
                    <button
                            class="btn btn-outline-secondary"
                            id="button-addon2"
                            type="submit"
                            style="border-radius: 15px; border: solid 2px; border-color: #3b5998;width:55px"
                    >
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <%@include file="/WEB-INF/views/search/autocomplete.jsp" %>
    </nav>
    <div class="col-2"></div>
</div>
<nav class="navbar" aria-label="Light offcanvas navbar" style="">
    <div class="col-2"></div>
    <ul class="nav nav-pills d-flex align-items-center p-1 col-10">
        <li class="nav-item fs-5 px-4 border-end dropdown border-danger">
            <a
                    class="text-decoration-none"
                    type="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
            >
                <i class="fas fa-bars"></i>
            </a>
            <ul class="dropdown-menu" style="width: 800px; margin-top: 11p; border-radius: 10px;">

                <div class="d-flex justify-content-between py-3">
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="total"><h5>전체</h5></a></ul>
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="철학"><h5>철학</h5></a></ul>
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="종교"><h5>종교</h5></a></ul>
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="사회과학"><h5>사회과학</h5></a></ul>
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="자연과학"><h5>자연과학</h5></a></ul>
                </div>
                <hr />
                <div class="d-flex justify-content-between py-2">
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="기술과학"><h5>기술과학</h5></a></ul>
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="예술"><h5>예술</h5></a></ul>
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="언어"><h5>언어</h5></a></ul>
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="문학"><h5>문학</h5></a></ul>
                    <ul class="px-5" style="list-style: none; padding: 0px"><a href="역사"><h5>역사</h5></a></ul>
                </div>
            </ul>
        </li>
        <li class="nav-item px-4 border-end border-danger">
            <a href="/notice/list" class="text-decoration-none">공지사항</a>
        </li>
        <li class="nav-item px-4 border-end border-danger">
            <a href="/mypage/qna/list" class="text-decoration-none">문의사항</a>
        </li>
        <li class="nav-item px-4 border-end border-danger">
            <a href="/event/list" class="text-decoration-none">프로그램 신청</a>
        </li>
        <li class="nav-item px-4">
            <a href="#" class="text-decoration-none">커뮤니티</a>
        </li>
    </ul>
    <div class="col-1"></div>
    <form id="navForm" method="get" action="/product/search">
        <!-- 네비게이션 상품 분류 카테고리로 이동 요청할 input -->
        <input type="text" name="type" value="C" hidden>
        <input type="text" name="p_category" hidden>
    </form>
</nav>
<hr style="border: 1px #1d1d6a;">
<!-- 스크립트 -->
<script type="text/javascript">
	let url =  document.location.href.substring(16);
	
	$('#logout').attr('href','/logout?url='+url);

    /* ----------------------------------- [[ 검색>메인검색창 유효성 검사]] ----------------------------------*/
    $("#button-addon2").on('click', function(e){
        let keyword = $.trim($("input[name='keyword']").val());
       if(!keyword){
           e.preventDefault();
           alert("검색어를 입력해 주세요.");
       }
    });
    /* ----------------------------------- [[ 검색>메인검색창 유효성 검사]] ----------------------------------*/
    /* ----------------------------------- [[ 검색>네비게이션 카테고리]] ----------------------------------*/
    $(".dropdown-menu a").on("click", function(e){
        e.preventDefault();
        let menu = $(this).attr("href");
        console.log(menu); // 내가 클릭한 a 태그의 href 값 (예: 기술과학, 사회과학..)
        if(menu == "total"){ // 클라이언트가 전체 메뉴를 클릭할 경우
            $("#navForm input[name='type']").val("");
            $("#navForm").submit();
        }
        $("#navForm input[name='p_category']").val(menu);
        $("#navForm").submit();
    })
    /* ----------------------------------- [[ 검색>네비게이션 카테고리]] ----------------------------------*/
</script>
<style>
    @font-face {
        font-family: 'Cafe24Simplehae';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Simplehae.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    @font-face {
        font-family: 'NeoDunggeunmo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.3/NeoDunggeunmo.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    .navbar {
        font-family: 'Cafe24Simplehae';
    }
    .px-5>a {
        text-decoration: none;
        font-family: 'NeoDunggeunmo';
    }
    a>h6:hover {
        background-color: #dfeafa;
        border-radius: 50px;
    }
</style>

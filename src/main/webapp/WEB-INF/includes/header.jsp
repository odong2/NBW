<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function(){
        let keywordList; // 자동완성 창에 띄울 키워드를 저장할 변수
        $('#mainSearch').autocomplete({
            source: function (request, response) { //source 는 자동완성의 대상
<<<<<<< HEAD
                // ajax 시작
=======
            // ajax 시작
>>>>>>> 8cb07cf (Feat: 상품 검색(~ 카테고리 필터링 검색까지))
                $.ajax({
                    url: "/product/search"
                    , type: "POST"
                    , dataType: "json"
                    , data: {keyword: $('#mainSearch').val()} // 검색창에 입력된 키워드가 url 요청에서 파라미터로 전송된다.
                    // 통신에 성공하면
                    , success: function (data) {
                        /* data.resultList 는 배열임 */
                        const array = data.resultList;
                        array.forEach((value) => {
                            console.log(value["P_TITLE"]); // 출력해야 할 값
                            keywordList = value["P_TITLE"]; // 전역에 선언해둔 변수에 담는다.
                        })
<<<<<<< HEAD
                        response(
                            $.map(data, function (item) {
                                return {
                                    label: keywordList
                                    , value: keywordList // 선택 시 input에 표시되는 값
                                };
                            })
                        );// response
=======
                            response(
                                $.map(data, function (item) {
                                    return {
                                        label: keywordList
                                        , value: keywordList // 선택 시 input에 표시되는 값
                                    };
                                })
                            );// response
>>>>>>> 8cb07cf (Feat: 상품 검색(~ 카테고리 필터링 검색까지))
                    }// success 끝
                    , minLength: 2 // 두 자 이상이 입력될 때 서버로 요청을 보낸다.
                    , autoFocus: true
                    , select: function (evt, ui) {
                        console.log("전체 data: " + JSON.stringify(ui));
                        console.log("검색 데이터: " + ui.item);
                    }
                    , focus: function (evt, ui) {
                        return false;
                    }
                    , close: function (evt) {}
                })
                // ajax 끝
            }
        })
    });
    /* ================ 검색어 자동 완성 기능 추가 ================== */
<<<<<<< HEAD
=======

>>>>>>> 8cb07cf (Feat: 상품 검색(~ 카테고리 필터링 검색까지))
</script>
<style>
    .ui-autocomplete {
        position: absolute;
        top: 100%;
        left: 0;
        z-index: 1000;
        display: none;
        float: left;
        min-width: 160px;
        padding: 10px 0;
        margin: 5px 0 0;
        list-style: none;
        font-size: 14px;
        text-align: left;
        background-color: #ffffff;
        border-radius: 10px;
        -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
        background-clip: padding-box;
    }
<<<<<<< HEAD
=======

>>>>>>> 8cb07cf (Feat: 상품 검색(~ 카테고리 필터링 검색까지))
    .ui-autocomplete > li > div {
        display: block;
        padding: 3px 10px;
        clear: both;
        font-weight: normal;
        line-height: 1.42857143;
        color: #333333;
        white-space: nowrap;
    }
<<<<<<< HEAD
=======

>>>>>>> 8cb07cf (Feat: 상품 검색(~ 카테고리 필터링 검색까지))
    .ui-state-hover,
    .ui-state-active,
    .ui-state-focus {
        text-decoration: none;
        color: #262626;
        background-color: #f5f5f5;
        cursor: pointer;
    }
<<<<<<< HEAD
=======

>>>>>>> 8cb07cf (Feat: 상품 검색(~ 카테고리 필터링 검색까지))
    .ui-helper-hidden-accessible {
        border: 0;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        overflow: hidden;
        padding: 0;
        position: absolute;
        width: 1px;
    }
</style>

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
                        <a href="/logout" class="text-decoration-none px-3 border-end rounded-0"
                        >로그아웃</a
                        >
                    </li>
                    <li class="nav-item">
	                <a href="/mypage/payment/list" class="text-decoration-none px-3 border-end rounded-0"
		                >주문내역</a
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
                <a href="#" class="text-decoration-none px-3 border-start rounded-0"
                >문의하기</a
                >
            </li>
        </ul>
        <br>
        <form id="searchForm" action="/product/search" method="get" style="width: 100%;">
<<<<<<< HEAD
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
=======
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
>>>>>>> 8cb07cf (Feat: 상품 검색(~ 카테고리 필터링 검색까지))
        </form>
        <%@include file="/WEB-INF/views/product/autocomplete.jsp" %>
    </nav>
    <div class="col-2"></div>
</div>
<nav class="navbar" aria-label="Light offcanvas navbar" style="background-image: url('/images/bg_navi.jpeg');">
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
            <ul class="dropdown-menu" style="width: 800px; margin-top: 11px">
                <div class="d-flex justify-content-between py-3">
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목1</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목2</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목3</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목4</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목5</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                </div>
                <hr />
                <div class="d-flex justify-content-between py-3">
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목6</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목7</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목8</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목9</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                    <ul class="px-5" style="list-style: none; padding: 0px">
                        <h5>제목10</h5>
                        <li>소제목</li>
                        <li>소제목</li>
                        <li>소제목</li>
                    </ul>
                </div>
            </ul>
        </li>
        <li class="nav-item px-4 border-end border-danger">
            <a href="/notice/list" class="text-decoration-none">공지사항</a>
        </li>
        <li class="nav-item px-4 border-end border-danger">
            <a href="#" class="text-decoration-none">문의사항</a>
        </li>
        <li class="nav-item px-4 border-end border-danger">
            <a href="#" class="text-decoration-none">프로그램 신청</a>
        </li>
        <li class="nav-item px-4">
            <a href="#" class="text-decoration-none">커뮤니티</a>
        </li>
    </ul>
    <div class="col-1"></div>
</nav>
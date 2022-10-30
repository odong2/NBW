<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="/WEB-INF/includes/common.jsp" %>
    <title>Login</title>
  </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 메인 시작 -->
<main
      class="container form-signin d-flex flex-column align-items-center mt-4"
      style="height: 1000px"
    >
    	<img alt="" src="/images/NBW_title.png" class="mt-5" style="width: 200px;">
      <section class="col-5 mt-3 px-5 py-3">
        <div
          class="list-group d-flex flex-row justify-content-center mb-5"
          id="list-tab"
        >
          <a
            class="active text-decoration-none pe-4 fs-5"
            data-bs-toggle="list"
            href="#list-login"
            >회원로그인</a
          >
          <a
            class="text-decoration-none ps-4 border-start fs-5"
            data-bs-toggle="list"
            href="#list-order"
            >비회원 주문조회</a
          >
        </div>
        
        <div class="tab-content" id="nav-tabContent">
          <div class="tab-pane fade show active" id="list-login">
            <form class="d-flex flex-column" action="/login" method="post">
              <input
              	id="inputId"
                type="text"
                class="form-control mb-1"
                name="userId"
                placeholder="아이디를 입력해 주세요."
              />
              <input
              	id="inputPw"
                type="password"
                class="form-control mb-1"
                name="userPassword"
                placeholder="비밀번호를 입력해 주세요."
              />
              <label id="warningLabel" class="mb-3 text-danger" style="font-size:0.7rem;"></label>
              <button class="w-100 btn btn-lg btn-secondary mb-1" type="submit">
                로그인
              </button>
              
             <div class="d-flex justify-content-between">
	             <div>
		             <input type="checkbox" value="remember-me" />
		             <label class="text-muted" style="font-size: 0.7rem;"> 아이디 저장 </label>
	             </div>
	              <a
	              	style="font-size: 0.7rem;"
	                class="text-decoration-none mt-1 text-muted"
	                href="/login/find"
	                >아이디/비밀번호 찾기</a
	              >
            </div>
            </form>
            <div class="d-flex justify-content-center mb-3" style="height: 45px">
              <a class="" href="${	NaverUrl }">
                <img
                  src="/images/naver_icon.png"
                  alt=""
                  style="width: auto%; height: 100%"
                />
              </a>
              <a class="mx-3" href="${ KakaoUrl }">
                <img
                  src="/images/kakao_icon.png"
                  alt=""
                  style="width: auto%; height: 100%"
                />
              </a>
              <a class="" href="javascript:alert('준비중 입니다.')">
                <img
                  src="/images/google_icon.png"
                  alt=""
                  style="width: auto%; height: 100%"
                />
              </a>
            </div>
            <label class="text-muted mb-3" style="font-size: 0.7rem;">개인정보 보호를 위해 공용 PC에서 사용 시 SNS계정의 로그아웃 상태를 꼭 확인해 주세요.</label>
            <a class="col-12 btn btn-lg btn-primary mt-1" href="/member/register">회원가입</a>
          </div>


          <div class="tab-pane fade" id="list-order">
            <form
              class="d-flex flex-column mb-3"
              action="/login"
              method="post"
            >
              <label>주문자명</label>
              <input
              	id="orderName"
                type="text"
                class="form-control mb-1"
                name=""
                placeholder="주문자명을 입력해 주세요."
              />
              <label>휴대폰 번호</label>
              <input
              	id="orderPhone"
                type="text"
                class="form-control mb-1"
                id="floatingPassword"
                name=""
                placeholder="휴대폰 번호를 입력해 주세요."
              />
              <label>주문번호</label>
              <input
              	id="orderNo"
                type="text"
                class="form-control mb-1"
                id="floatingInput"
                name=""
                placeholder="주문번호를 입력해 주세요."
              />
			  <label id="warningLabel2" class="mb-3 text-danger" style="font-size:0.7rem;"></label>
              <button
                class="w-100 btn btn-lg btn-secondary mb-1"
                type="submit"
                style="height: 50px"
              >
                검색
              </button>
            </form>
          </div>
        </div>
      </section>
      <c:if test="${!empty LoginFailMsg}" >
      	<div id="LoginFailMsg" class="col-5 text-center mt-2 list-group-item list-group-item-danger">${LoginFailMsg}</div>
      </c:if>
      <script>
        $("#LoginFailMsg").delay(1500).fadeOut(500);
      </script>
    </main>
<!-- 메인 끝 -->

<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script type="text/javascript">
	$('#inputId').blur(function(){
		let id = $('#inputId').val().length;
		let pw = $('#inputPw').val().length;
		
		if (id == 0 && pw == 0){
			$('#warningLabel').empty();
			$('#warningLabel').append('* 아이디를 입력해주세요.');
		} else if (id > 0 && pw == 0){
			$('#warningLabel').empty();
			$('#warningLabel').append('* 비밀번호를 입력해주세요.');
		} else if (id == 0 && pw > 0){
			$('#warningLabel').empty();
			$('#warningLabel').append('* 아이디를 입력해주세요.');
		} else if ( id > 0 && pw > 0) {
			$('#warningLabel').empty();
		}
	})
	
	$('#inputPw').blur(function(){
		let id = $('#inputId').val().length;
		let pw = $('#inputPw').val().length;

		if (id == 0 && pw == 0){
			$('#warningLabel').empty();
			$('#warningLabel').append('* 아이디를 입력해주세요.');
		} else if (id > 0 && pw == 0){
			$('#warningLabel').empty();
			$('#warningLabel').append('* 비밀번호를 입력해주세요.');
		} else if (id == 0 && pw > 0){
			$('#warningLabel').empty();
			$('#warningLabel').append('* 아이디를 입력해주세요.');
		} else if ( id > 0 && pw > 0) {
			$('#warningLabel').empty();
		}
		
	})
	
	$('#orderName').blur(function(){
		let value = $('#orderName').val();
		let size = $('#orderName').val().length;
		
		if (!value || size == 0){
			$('#warningLabel2').empty();
			$('#warningLabel2').append('* 주문자명을 입력해주세요.');
		}
	})
	
	$('#orderPhone').blur(function(){
		let value = $('#orderPhone').val();
		let size = $('#orderPhone').val().length;
		
		if (!value || size == 0){
			$('#warningLabel2').empty();
			$('#warningLabel2').append('* 휴대폰번호를 입력해주세요.');
		}
	})
	
	$('#orderNo').blur(function(){
		let value = $('#orderNo').val();
		let size = $('#orderNo').val().length;
		
		if (!value || size == 0){
			$('#warningLabel2').empty();
			$('#warningLabel2').append('* 주문번호를 입력해주세요.');
		}
	})
</script>
</body>
</html>

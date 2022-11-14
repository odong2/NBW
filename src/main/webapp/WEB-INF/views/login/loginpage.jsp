<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="/WEB-INF/includes/common.jsp" %>
  <title>Login</title>
  <style>
    #searchErrorMsg{
      border-radius: 10px;
      height: 60px;
      display: none;
      font-weight: bold;
    }
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
              <button class="w-100 btn btn-outline-secondary mb-1" type="submit">
                로그인
              </button>
              
             <div class="d-flex justify-content-between mb-3">
	             <div>
		             <input id="id_checkbox" name="rememberme" type="checkbox" value="true"/>
		             <label class="text-muted" style="font-size: 0.7rem;"> 아이디 저장 </label>
	             </div>
	              <a
	              	style="font-size: 0.7rem;"
	                class="text-decoration-none mt-1 text-muted"
	                href="/login/find">아이디/비밀번호 찾기</a>
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
              <a class="ms-3" href="${ KakaoUrl }">
                <img
                  src="/images/kakao_icon.png"
                  alt=""
                  style="width: auto%; height: 100%"
                />
              </a>
              <a class="ms-3" href="javascript:alert('준비중 입니다.')">
                <img
                  src="/images/google_icon.png"
                  alt=""
                  style="width: auto%; height: 100%"
                />
              </a>
              <a class="ms-3" href="javascript:alert('준비중 입니다.')">
                <img
                  src="/images/github-icon.webp"
                  alt=""
                  style="width: auto%; height: 100%"
                />
              </a>
            </div>
            <label class="w-100 text-muted text-center mb-3" style="font-size: 0.7rem;">개인정보 보호를 위해 공용 PC에서 사용 시 SNS계정의 로그아웃 상태를 꼭 확인해 주세요.</label>
            <a class="col-12 btn btn-outline-primary mt-1" href="/member/register">회원가입</a>
          </div>

          <div class="tab-pane fade" id="list-order">
            <form
              class="d-flex flex-column mb-3"
              id="searchOrderForm"
            >
              <label>주문자명</label>
              <input
              	id="orderNameInput"
                type="text"
                class="form-control mb-1"
                name="order_name"
                placeholder="주문자명을 입력해 주세요."
              />
              <label>주문 비밀번호</label>
              <input
                type="password"
                class="form-control mb-1"
                id="orderPwInput"
                name="order_pw"
                placeholder="비밀번호를 입력해 주세요."
              />
              <label>주문번호</label>
              <input
              	id="orderNoInput"
                type="text"
                class="form-control mb-1"
                name="order_no"
                placeholder="주문번호를 입력해 주세요."
              />
			  <label id="warningLabel2" class="mb-3 text-danger" style="font-size:0.7rem;"></label>
              <button
                id="orderSearchBtn"
                class="w-100 btn btn-lg btn-outline-secondary mb-1"
                type="button"
                style="height: 50px"
              >
                검색
              </button>
            </form>
            <div id="searchErrorMsg" class="col-12 mt-2 py-3 text-center alert-danger"></div>
          </div>
        </div>
      </section>
    </main>
<!-- 메인 끝 -->

<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script type="text/javascript">
	$(function(){
		  const text = '${LoginFailMsg}';
		  if(text.length > 0){
			  msg(text)
		  }
	});

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
	
	$(function(){
		let cookie = $.cookie('remember_id');
		console.log(cookie);
		
		if(cookie == undefined){
			$('#inputId').val('');
			$("#id_checkbox").removeAttr("checked");
		}else {
			$('#inputId').val(cookie);
			$("#id_checkbox").attr("checked", "checked");
		}
	});
	
	let msg = function(text){
		if(!$('#msg-box').length){
			$('body').append('<div id="msg-box" class="position-fixed top-50 start-50 translate-middle"></div>');
			$('#msg-box').append('<div id="LoginFailMsg" class="text-center list-group-item list-group-item-danger">'+text+'</div>');
			$("#LoginFailMsg").delay(500).fadeOut(500);
		}
		$("#LoginFailMsg").text(text);
		$("#LoginFailMsg").show();
		$("#LoginFailMsg").delay(500).fadeOut(500);
	}
  /* 비회원 주문내역 조회 */
  $('#orderSearchBtn').click(()=>{
     let orderName = $('#orderNameInput').val();
     let orderPw = $('#orderPwInput').val();
     let orderNo = $('#orderNoInput').val();
      $.ajax({
        type: 'GET',
        url: '/payment/unmem/order',
        data:{order_name: orderName, order_pw: orderPw, order_no: orderNo},
        success:(result)=>{
          console.log(result);
          /* (1) 주문 내역이 존재*/
          if(result == 'Y'){
            location.replace('/payment/pay/' + orderNo);
            return;
          }
          $('#searchOrderForm')[0].reset();
          /* (2) 주문내역이 존재하지 않음*/
          let msg = "주문 내역이 없습니다. 확인후 다시 입력하세요."
          errorMsgPrint(msg);
        }
      })
  });

    // 에러 메시지 출력 함수
    let errorMsgPrint = function(msg){
      $('#searchErrorMsg').text(msg);
      $('#searchErrorMsg').fadeIn(300);
      $("#searchErrorMsg").delay(1800).fadeOut(500);
    }

</script>
</body>
</html>

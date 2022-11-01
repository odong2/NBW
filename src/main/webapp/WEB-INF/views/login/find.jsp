<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="/WEB-INF/includes/common.jsp" %>
    <title>Login</title>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 메인 시작 -->
<main
      class="container form-signin d-flex flex-column align-items-center mt-4"
      style="height: 1000px;"
    >
      <div class="col-10 text-start my-1 fs-5">아이디/비밀번호 찾기</div>
      <hr class="col-10 text-center" />

      <section class="col-5 border rounded-4 mt-5 px-5 py-3">
        <div
          class="list-group d-flex flex-row justify-content-start"
          id="list-tab"
        >
          <a
          	id="findId"
            class="active text-decoration-none pe-4 fs-5"
            data-bs-toggle="list"
            href="#list-login"
            >아이디 찾기</a
          >
          <a
          	id="findPw"
            class="text-decoration-none px-4 border-start fs-5"
            data-bs-toggle="list"
            href="#list-order"
            >비밀번호 찾기</a
          >
        </div>
        <hr />

        <div class="tab-content" id="nav-tabContent">
          <div class="tab-pane fade show active" id="list-login">
            <div class="d-flex flex-column">
                <div class="form-floating">
                  <input
                    type="text"
                    class="form-control"
                    id="inputEmail"
                    placeholder="name@example.com"
                  />
                  <label for="floatingInput">가입시 작성한 이메일</label>
                </div>
                <div class="form-floating my-1">
                  <input
                    type="text"
                    class="form-control"
                    id="inputName"
                    placeholder="name"
                  />
                  <label for="floatingPassword">가입시 작성한 이름</label>
                </div>
              <div id="find_id" class="w-100 btn btn-lg btn-primary">
             	아이디 검색
              </div>
            </div>
          </div>
          
          <div class="tab-pane fade" id="list-order">
            <div class="d-flex flex-column">
            
                <input id="inputId" placeholder="아이디를 입력해 주세요" required="required"
	                     autocomplete="off" class="form-control" />
	                     
	            <div class="input-group my-1">
		            <input id="inputEmail2" required="required" aria-describedby="button-addon2"
		                   autocomplete="off" class="form-control " placeholder="이메일을 입력해 주세요"/>
		            <button id="code-submit" class="btn btn-outline-primary" >인증코드 전송</button>
	          	</div>         
	            
	            <div class="d-flex justify-content-between mb-5">
	            	<div id="timer" class="text-muted text-center mt-2 w-25">00:00</div>
	            	<div class="input-group w-75">
		          		<input id="inputCode" required="required" aria-describedby="button-addon2"
			                   autocomplete="off" class="form-control" placeholder="인증번호를 입력해 주세요" disabled/>
			            <button id="code-check" class="btn btn-outline-primary" type="button" disabled="disabled">인증번호 확인</button>
	          		</div>
	            </div>
	           
              	<button id="find_pw" class="w-100 btn btn-outline-secondary mb-1" disabled="disabled">비밀번호 변경하기</button>
            </div>
          </div>
        </div>
      </section>
      <div id="result" class="col-5 mt-3">
      </div>
      <!-- <div id="LoginFailMsg" class="col-4 text-center mt-2 list-group-item list-group-item-danger">MSG</div> -->
      <div id="msg" style="display: none;"></div>
    </main>
    
<!-- 메인 끝 -->

<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script type="text/javascript" >
	let time = 180;
	let code = "";
	let isPause = false;

	/* 비밀번호 찾기를 누르면 아이디값을 보여주는 태그 삭제 */
	$('#findPw').click(function(){
		$('#result').empty();
	})
	
	$('#find_id').click(function(){
	 	const request = {
			mem_email: $('#inputEmail').val(),
			mem_name: $('#inputName').val(),
		}
		$.ajax({
			type: "POST", //요청 메소드 방식
			url:"/login/find/id",
			dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			data:JSON.stringify(request),
			contentType: "application/json; charset=UTF-8",
			success : function(result){
				if(result.success){
					clear();
					resultId(result.dto);
				}else {
					clear();
					alert(result.msg);
				}
			},
			error : function(){
				//통신 실패시 발생하는 함수(콜백)
				alert('ERROR: 서버와 연결이 끊어졌습니다.');
				clear();
			}
		});
	})
	
	let resultId = function(object){
		$('#result').empty();
		const id = object.mem_id;
		const date = getCdate(object.mem_cdate);
		$('#result').append('<ul class="list-group"><li class="list-group-item mx-2">가입일자: '+date+'</li><li class="list-group-item mx-2">가입한 아이디: '+id+'</li></ul>');
	}
	
    let getCdate = function(ntc_cdate) {
        let date = new Date(ntc_cdate);
        let year = date.getFullYear();
        let month = String(date.getMonth()).padStart(2, "0");
        let day = String(date.getDay()).padStart(2,"0");
        const hours = String(date.getHours()).padStart(2, "0");
        const minutes = String(date.getMinutes()).padStart(2, "0");
        return year + "-" + month + "-" + day + " " + hours + ":" + minutes;
    }
    
	let clear = function(){
		$('#inputEmail').val('');
		$('#inputEmail2').val('');
		$('#inputName').val('');
		$('#inputId').val('');
		$("#inputCode").val('');
	}
	
	$('#code-submit').click(function(){
		let request = {
				mem_email: $('#inputEmail2').val(),
				mem_id: $('#inputId').val()
			}
		if (!request.mem_id){
			errorMsg('아이디를 입력해주세요.')
		}else if (!request.mem_email){
			errorMsg('이메일을 입력해주세요.')
		}else {
			emailSubmit(request);
		}
	})
	
	date = function(seconds){
		let min = parseInt((seconds%3600)/60) < 10 ? '0'+ parseInt((seconds%3600)/60) : parseInt((seconds%3600)/60);
		let sec = seconds % 60 < 10 ? '0'+seconds % 60 : seconds % 60;
		return min+":" + sec;
	}
	
	let emailSubmit = function(request){
		loding(true);
		
		$.ajax({
			type: "POST", //요청 메소드 방식
			url:"/login/find/emailcheck",
			dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			data:JSON.stringify(request),
			contentType: "application/json; charset=UTF-8",
			success : function(result){
				successMsg('메일을 전송했습니다!');
				console.log(result);
				if(result.success){
					let timer = setInterval(()=>{
						$('#timer').text(date(time));
						if(time == 0){
							$("#inputCode").attr("disabled", "disabled");
							$("#code-check").attr("disabled", "disabled");
							$('#code-submit').removeAttr('disabled');
							$('#inputEmail2').removeAttr('disabled');
							$('#inputId').removeAttr('disabled');
							clear();
							clearInterval(timer);
							code = '';
							errorMsg('제한시간 초과!!')
						}else if(isPause){
							clearInterval(timer);
						}else {
							time--;
						}
					},1000);
					$('#code-check').removeAttr('disabled');
					$('#inputCode').removeAttr('disabled');
					$('#code-submit').attr("disabled", "disabled");
					$('#inputEmail2').attr("disabled", "disabled");
					$('#inputId').attr("disabled", "disabled");
					code = result.code;
					loding(false);
				}else {
					clear();
					errorMsg(result.msg);
					loding(false);
				}
			},
			error : function(){
				//통신 실패시 발생하는 함수(콜백)
				alert('ERROR: 서버와 연결이 끊어졌습니다.');
				clear();
			}
		});
	}
	
	$('#code-check').click(function(){
		let reulstcode = $("#inputCode").val();
		
		if(code == reulstcode){
			successMsg('인증되었습니다.');
			isPause = true;
			$('#code-check').attr('disabled','disabled');
			$('#inputCode').attr('disabled','disabled');
			$('#find_pw').removeAttr('disabled');
		}else {
			errorMsg('인증코드가 다릅니다. 다시 입력해주세요.');
		}
	});
	
	$('#find_pw').click(function(){
		const email = $('#inputEmail2').val();
		const id = $('#inputId').val()
		window.open("${contextPath}/login/change?mem_email="+email+"&mem_id="+id,"","width=600px, height=400px")
	});
	
	let loding = function(command){
		if(!$('#icon-box').length){
			$('body').append('<div id="icon-box" style="display:none;"></div>');
			$('#icon-box').append('<img alt="" src="/images/loding_icon.gif">');
		}
		
		if (command){
			$('#icon-box').css({
					'display': 'flex',
					'justify-content': 'center',
					'align-items':'center',
			 		'min-height': '100vh',
			 		'min-width': '100%',
					'position':'absolute',
					'z-index':'2', 
					'left':'0',
					'top':'0',
			        'background-color': 'rgba( 255, 255, 255, 0.5 )'
			});
		}else {
			$('#icon-box').hide();
		}
	}
	
	let errorMsg = function(text){
		$('#msg').removeAttr('class');
		$('#msg').attr('class','col-4 text-center mt-2 list-group-item list-group-item-danger');
		$('#msg').text(text);
		$('#msg').show();
		$('#msg').delay(1500).fadeOut(500);
	}
	
	let successMsg = function(text){
		$('#msg').removeAttr('class');
		$('#msg').attr('class','col-4 text-center mt-2 list-group-item list-group-item-success');
		$('#msg').text(text);
		$('#msg').show();
		$('#msg').delay(1500).fadeOut(500);
	}
	
 	let moveLoginPage = function(){
		$('#msg').removeAttr('class');
		$('#msg').attr('class','col-4 text-center mt-2 list-group-item list-group-item-success');
		$('#msg').text('비밀번호가 성공적으로 변경되었습니다. 3초후 로그인 페이지로 이동합니다.');
		$('#msg').show();
		$('#msg').delay(2500).fadeOut(500);
		
		
		setTimeout(() => {
			window.location.href = "/login";
		}, 3000);
	}
	
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="/WEB-INF/includes/common.jsp" %>
<meta charset="UTF-8">
<title>비밀번호 변경 페이지</title>
<style type="text/css">
</style>
</head>
<body>
<main class="form-signin w-75 m-auto">

    <h1 class="h3 mb-3 fw-normal text-center mt-5">비밀번호 변경</h1>
	<hr/>
    <div class="form-floating">
      <input id="mem_pw" type="password" class="form-control" placeholder="Password">
      <label id="pwCheckDiv" for="floatingPassword">비밀번호</label>
    </div>

    <div class="form-floating my-2">
      <input id="mem_pw2"" type="password" class="form-control" placeholder="Password">
      <label id="pwCheckDiv2" for="floatingPassword">비밀번호 확인</label>
    </div>
    
    <input id="mem_id" type="hidden" value="${ dto.getMem_id() }">
    <input id="mem_email" type="hidden" value="${ dto.getMem_email() }">
    
	<div class="mb-3 text-muted text-center" style="font-size: 0.7rem">* 비밀번호에 숫자, 소문자, 대문자를 모두 포함해 주세요.</div>
    <button id="change_submit" class="w-100 btn btn-lg btn-primary mb-3">변경</button>
	<div id="msg" style="display: none;"></div>
</main>
<script type="text/javascript">
	/* ===================================== 비밀번호 유효성 처리(길이, 일치여부) ===================================== */
	let pwCheck = false;
	
	// 비밀번호 처리 이벤트
	$("#mem_pw").blur(function() {
	    let pw = $("#mem_pw").val();
	
	    /* (2) ajax 코드를 추가한다 > controller 에 요청할 때 화면이 전환되는 것을 방지 */
	    $.ajax({
	        type:"GET",
	        url:"/member/pwCheck?pw="+pw,
	        success:function(result){
	            /* Controller 단에서 반환받은 안전도 수준이 잘 전송되었는지 확인 */
	            if(result == "WEAK"){
	                $('#pwCheckDiv').removeAttr('class');
	                $('#pwCheckDiv').attr('class','text-danger');
	                $('#pwCheckDiv').text("보안수준 : 낮음");
	            }
	            if(result == "NORMAL"){
	                $('#pwCheckDiv').removeAttr('class');
	                $('#pwCheckDiv').attr('class','text-warning');
	                $('#pwCheckDiv').text("보안수준 : 보통");
	            }
	            if(result == "STRONG"){
	                $('#pwCheckDiv').removeAttr('class');
	                $('#pwCheckDiv').attr('class','text-success');
	                $('#pwCheckDiv').text("보안수준 : 강력");
	            }
	           /* 비밀번호를 입력했다가 지웠을 때 처리도 해줘야 한다.*/
	        }
	    });
	});
	
	/* ===================================== 비밀번호 유효성 처리(길이, 일치여부) ===================================== */
	$('#mem_pw2').blur(function(){
	    let pw = $('#mem_pw').val();
	    let pw2 = $('#mem_pw2').val();
	    if(pw != pw2 || ( !pw && !pw2 ) ){
            $('#pwCheckDiv2').removeAttr('class');
            $('#pwCheckDiv2').attr('class','text-danger');
	        $('#pwCheckDiv2').text("비밀번호가 일치하지 않습니다.");
	    }else{
            $('#pwCheckDiv2').removeAttr('class');
            $('#pwCheckDiv2').attr('class','text-success');
	        $('#pwCheckDiv2').text("비밀번호가 일치합니다.");
	        pwCheck = true;
	    }
	});
	
	$('#change_submit').click(function(){
		let request = {
				mem_id: $('#mem_id').val(),
				mem_pw: $('#mem_pw').val(),
				mem_email: $('#mem_email').val()
		}
		
		if(pwCheck){
			console.log(request);
			$.ajax({
				type: "POST", //요청 메소드 방식
				url:"/login/find/pw",
				dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
				data:JSON.stringify(request),
				contentType: "application/json; charset=UTF-8",
				success : function(result){
					if(result.success){
						$(opener.location).attr("href", "javascript:moveLoginPage();");
						window.close();
					}
				},
				error : function(){
					//통신 실패시 발생하는 함수(콜백)
					errorMsg('ERROR: 서버와 연결이 끊어졌습니다.');
				}
			});
		}else {
			errorMsg('입력한 비밀번호가 일치하지 않습니다.');
		}
	})
	
	let errorMsg = function(text){
		$('#msg').removeAttr('class');
		$('#msg').attr('class','col-4 text-center mt-2 list-group-item list-group-item-danger');
		$('#msg').text(text);
		$('#msg').show();
		$('#msg').delay(1500).fadeOut(500);
	}
</script>
</body>
</html>
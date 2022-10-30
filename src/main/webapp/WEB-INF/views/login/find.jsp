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
      style="height: 1000px"
    >
      <div class="col-10 text-start my-1 fs-5">아이디/비밀번호 찾기</div>
      <hr class="col-10 text-center" />

      <section class="col-5 border rounded-4 mt-5 px-5 py-3">
        <div
          class="list-group d-flex flex-row justify-content-start"
          id="list-tab"
        >
          <a
            class="active text-decoration-none pe-4 fs-5"
            data-bs-toggle="list"
            href="#list-login"
            >아이디 찾기</a
          >
          <a
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
                <div class="form-floating">
                  <input
                    type="text"
                    class="form-control"
                    id="inputId"
                    placeholder="name@example.com"
                  />
                  <label for="floatingInput">가입시 작성한 아이디</label>
                </div>
                <div class="form-floating my-1">
                  <input
                    type="text"
                    class="form-control"
                    id="inputEmail"
                    placeholder="password"
                  />
                  <label for="floatingPassword">가입시 작성한 이메일</label>
                </div>
              <div id="find_pw" class="w-100 btn btn-lg btn-primary mb-1">
                비밀번호 검색
              </div>
            </div>
          </div>
        </div>
      </section>
      <div id="result" class="col-5 mt-3">

      </div>
    </main>
<!-- 메인 끝 -->

<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script type="text/javascript" >
	$('#find_id').click(function(){
		sumbit('id');
	})
	
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
		$('#inputName').val('');
		$('#inputId').val('');
	}
	
	let sumbit = function(path){
		let email = $('#inputEmail').val();
		let name = $('#inputName').val();
		let id = $('#inputId').val();

		let request = {
			mem_email:email,
			mem_name:name,
			mem_id:id
		}
		
		$.ajax({
			type: "POST", //요청 메소드 방식
			url:"/login/find/"+path,
			dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			data:JSON.stringify(request),
			contentType: "application/json; charset=UTF-8",
			success : function(result){
				console.log(result);
				if(result.success){
					addNode(result.dto);
					clear();
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
	}
	
	let addNode = function(object){
		$('#result').empty();
		
		const id = object.mem_id;
		const date = getCdate(object.mem_cdate);
		
		$('#result').append('<ul class="list-group"><li class="list-group-item mx-2">가입일자: '+date+'</li><li class="list-group-item mx-2">가입한 아이디: '+id+'</li></ul>');
	}
	
</script>
</body>
</html>

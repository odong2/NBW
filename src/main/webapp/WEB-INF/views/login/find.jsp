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
                    id="email"
                    placeholder="name@example.com"
                  />
                  <label for="floatingInput">가입시 이메일</label>
                </div>
                <div class="form-floating my-1">
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    placeholder="name"
                  />
                  <label for="floatingPassword">가입시 이름</label>
                </div>
              <div id="btn_summit" class="w-100 btn btn-lg btn-primary">
             	아이디 검색
              </div>
            </div>
          </div>

          <div class="tab-pane fade" id="list-order">
            <form
              class="d-flex align-items-end mb-3"
              action="/login"
              method="post"
            >
              <div class="col-8 me-1">
                <div class="form-floating mb-1">
                  <input
                    type="text"
                    class="form-control"
                    id="floatingInput"
                    name="id"
                    placeholder="name@example.com"
                  />
                  <label for="floatingInput">주문자명</label>
                </div>
                <div class="form-floating">
                  <input
                    type="password"
                    class="form-control"
                    id="floatingPassword"
                    name="password"
                    placeholder="password"
                  />
                  <label for="floatingPassword">핸드폰번호</label>
                  <div class="form-floating my-1">
                    <input
                      type="text"
                      class="form-control"
                      id="floatingInput"
                      name="id"
                      placeholder="name@example.com"
                    />
                    <label for="floatingInput">비밀번호</label>
                  </div>
                </div>
              </div>
              <button
                class="w-100 btn btn-lg btn-primary mb-1"
                type="submit"
                style="height: 50px"
              >
                검색
              </button>
            </form>
            <div class="d-flex justify-content-center" style="height: 50px">
              <a class="col-3" href="#">
                <img
                  src="/images/btnG_축약형.png"
                  alt=""
                  style="width: 100%; height: 100%"
                />
              </a>
              <a class="col-3 mx-2" href="#">
                <img
                  src="/images/kakao_login_large.png"
                  alt=""
                  style="width: 100%; height: 100%"
                />
              </a>
              <a class="col-3 btn btn-lg btn-primary mt-1" href="/member/register">회원가입</a>
            </div>
          </div>
        </div>
      </section>
    </main>
<!-- 메인 끝 -->

<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script type="text/javascript" >
	$('#btn_summit').click(function(){
		let email = $('#email').val();
		let name = $('#name').val();

		let request = {
			mem_email:email,
			mem_name:name
		}
		
		$.ajax({
			type: "POST", //요청 메소드 방식
			url:"/login/find/id",
			dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			data:JSON.stringify(request),
			contentType: "application/json; charset=UTF-8",
			success : function(result){
				console.log(result);
					
				if(result.success){
					
				}else {
					
				}
			},
			error : function(a, b, c){
				//통신 실패시 발생하는 함수(콜백)
				alert('error');
			}
		}); 
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
	
</script>
</body>
</html>

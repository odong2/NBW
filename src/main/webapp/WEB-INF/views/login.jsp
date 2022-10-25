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
      <div class="col-10 text-start my-2 fs-5">로그인</div>
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
            >회원로그인</a
          >
          <a
            class="text-decoration-none px-4 border-start fs-5"
            data-bs-toggle="list"
            href="#list-order"
            >비회원 주문조회</a
          >
        </div>
        <hr />

        <div class="tab-content" id="nav-tabContent">
          <div class="tab-pane fade show active" id="list-login">
            <form class="d-flex" action="/login" method="post">
              <div class="col-8 me-1">
                <div class="form-floating mb-1">
                  <input
                    type="text"
                    class="form-control"
                    id="floatingInput"
                    name="id"
                    placeholder="name@example.com"
                  />
                  <label for="floatingInput">아이디</label>
                </div>
                <div class="form-floating">
                  <input
                    type="password"
                    class="form-control"
                    id="floatingPassword"
                    name="password"
                    placeholder="password"
                  />
                  <label for="floatingPassword">비밀번호</label>
                </div>
              </div>
              <button class="w-100 btn btn-lg btn-primary" type="submit">
                로그인
              </button>
            </form>
            <div class="text-center my-3">
              <input type="checkbox" value="remember-me" />
              <label class="pe-2"> 아이디 저장 </label>
              <a
                class="text-decoration-none border-dark border-start ps-2"
                href="#"
                >아이디/비밀번호 찾기</a
              >
            </div>
            <div class="d-flex justify-content-center" style="height: 50px">
              <a class="col-3" href="${ url }" target="_blank">
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
</body>
</html>

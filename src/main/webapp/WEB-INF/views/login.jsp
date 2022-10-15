<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="/WEB-INF/includes/common.jsp" %>
    <title>Login</title>
  <style>
    a {
      color: black;
    }
  </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<%@include file="/WEB-INF/includes/sidebar.jsp" %>
<!-- 헤더 끝 -->

<!-- 메인 시작 -->
<main class="form-signin d-flex flex-column align-items-center m-5" style="height:1000px">
  <img alt="" src="/NBW_logo.png" style="width: 300px; height: auto;">
  <form class="col-3" action="/login" method="post">
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="id">
      <label for="floatingInput">UserName</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox m-1 text-center">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
  	<a class="w-100 btn btn-lg btn-primary mt-1" href="#">Sign up</a>
  </form>
</main>
<!-- 메인 끝 -->

<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

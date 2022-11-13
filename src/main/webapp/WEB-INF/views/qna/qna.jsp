<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%@include file="../../includes/common.jsp" %>
  <title>event</title>
  <style>
    /* * {
      border: 1px solid red;
    } */
    @font-face {
      font-family: 'GangwonEdu_OTFBoldA';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
    body {
      font-family: GangwonEdu_OTFBoldA;
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    main {
      width: 1000px;
      margin: auto;
    }
    h2 {
      padding-top: 30px;
    }
  </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="../../includes/header.jsp" %>
<!-- 헤더 끝 -->
<main>
  <div class="category mb-3" style="display: flex">
    <div class="btn-keyword">
      <form action="/admin/qna/list" method="get" id="form">
        <button class="btn-kw btn-2" id="allask" type="button"><span>전체</span></button>
      </form>
    </div>
    <div class="btn-keyword">
      <form action="/admin/qna/list" method="get" id="Nform">
        <input type="hidden" value="N" name="keyword" />
        <button class="btn-kw btn-2" id="Processing" type="button"><span>처리중</span></button>
      </form>
    </div>
    <div class="btn-keyword">
      <form action="/admin/qna/list" method="get" id="Yform">
        <input type="hidden" value="Y"   name="keyword" />
        <button class="btn-kw btn-2" id="finish" type="button"><span>답변완료</span></button>
      </form>
    </div>
  </div>
</main>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
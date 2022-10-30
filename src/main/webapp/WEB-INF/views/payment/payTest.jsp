<%--
  Created by IntelliJ IDEA.
  User: MJ
  Date: 2022-10-30
  Time: 오후 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.js"></script>
</head>
<body>
<form method="GET" action="/payment/list">
<input type="hidden" name="cartProducts[0].p_no" value="1">
<input type="hidden" name="cartProducts[0].p_title" value="제목1">
<input type="hidden" name="cartProducts[0].p_price" value="2000">
<input type="hidden" name="cartProducts[0].p_p_img" value="www.naver.com">
<input type="hidden" name="cartProducts[0].p_categry" value="과학">
<input type="hidden" name="cartProducts[0].p_mcart_count" value="3">
<input type="hidden" name="cartProducts[1].p_no" value="1">
<input type="hidden" name="cartProducts[1].p_title" value="제목1">
<input type="hidden" name="cartProducts[1].p_price" value="2000">
<input type="hidden" name="cartProducts[1].p_p_img" value="www.naver.com">
<input type="hidden" name="cartProducts[1].p_categry" value="과학">
<input type="hidden" name="cartProducts[1].p_mcart_count" value="3">
<button type="submit" id="commentbtn" />같은 name 여러개 테스트</button>

</form>
<script type="text/javascript">
  $(function(){

    // $('#commentbtn').on('click', function(){
    //   //값들의 갯수 -> 배열 길이를 지정
    //   var grpl = $("input[name=p_no]").length;
    //   //배열 생성
    //   var grparr = new Array(grpl);
    //   //배열에 값 주입
    //   for(var i=0; i<grpl; i++){
    //     grparr[i] = $("input[name=p_no]").eq(i).val();
    //   }
    //     console.log(grparr);
    // });
  });
</script>
</body>
</html>

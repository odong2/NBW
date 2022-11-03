<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.js"></script>
</head>
<body>
<%--
        장바구니에서 결제페이지로 넘겨줄 값 테스트
  (List<CartProduct>의 형태로 넘기기 위해 아래와 같이 작성)
--%>
<form method="GET" action="/payment/list">
<input type="hidden" name="cartProducts[0].p_no" value="1">
<input type="hidden" name="cartProducts[0].p_title" value="넘버스 스틱!">
<input type="hidden" name="cartProducts[0].p_price" value="15300">
<input type="hidden" name="cartProducts[0].p_img" value="http://image.yes24.com/goods/112929848/XL">
<input type="hidden" name="cartProducts[0].p_category" value="과학">
<input type="hidden" name="cartProducts[0].p_count" value="3">
<input type="hidden" name="cartProducts[1].p_no" value="2">
<input type="hidden" name="cartProducts[1].p_title" value="마흔에 읽는 니체">
<input type="hidden" name="cartProducts[1].p_price" value="18000">
<input type="hidden" name="cartProducts[1].p_img" value="https://image.aladin.co.kr/product/30006/52/cover500/k162838352_1.jpg">
<input type="hidden" name="cartProducts[1].p_category" value="예술">
<input type="hidden" name="cartProducts[1].p_count" value="4">
<input type="hidden" name="cartProducts[2].p_no" value="3">
<input type="hidden" name="cartProducts[2].p_title" value="NBW CEO의 자서전">
<input type="hidden" name="cartProducts[2].p_price" value="10000">
<input type="hidden" name="cartProducts[2].p_img" value="https://image.aladin.co.kr/product/29489/3/cover500/k252837531_1.jpg">
<input type="hidden" name="cartProducts[2].p_category" value="인문학">
<input type="hidden" name="cartProducts[2].p_count" value="1">
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

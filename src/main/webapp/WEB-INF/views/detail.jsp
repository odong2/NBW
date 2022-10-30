<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="/WEB-INF/includes/common.jsp" %>
    <title>Login</title>
  <style>
    a {
      color: black;
    }
    main {
    	width : 70%;
    	margin: auto;
    }
  </style>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		/* 장바구니에 담을 수량 증가 */
		$("#plus_btn").on("click", function(){
			let inputQTY = $("#inputQuantity").val();
			$("#inputQuantity").val(++inputQTY);
	  	});
	  	/* 장바구니에 담을 수량 감소 */
	  	$("#minus_btn").on("click", function(){
	  		let inputQTY = $("#inputQuantity").val();
	  		if(inputQTY > 1){
	  			$("#inputQuantity").val(--inputQTY);
	  		}
	  	});
	  	
  	});
	function add_cart(p_no) {
		$.ajax({
			type : "post",
			url : "${contextPath}/cart/check",
			success : function(result) {
				if(result == "member"){
					$.ajax({
						type : "post",
						url : "${contextPath}/cart/add",
						data : {
							p_no:${product.getP_no()},
							cart_count: $("#inputQuantity").val()
						},
						success : function(msg) {
							cartAlert(msg);
						},
						error : function(data, textStatus) {
							alert("에러가 발생했습니다."+data);
						},
						complete : function(data, textStatus) {
						}
					}); //end of second ajax	
				} else if(result == "nonMember"){
					let c_cart = $.cookie('cart'); // 쿠키의 'cart'에 담긴 value를 문자열로 받아온다
					if(c_cart == null){  // 비회원 장바구니에 담긴 상품이 한 건도 없을 경우
						// json형식으로 객체 생성
						let cookie = {
										cart : [ 
													{
													pno : ${product.getP_no()},
													title : ${product.getP_title()},
													img : ${product.getP_img()},
													price : ${product.getP_price()},
													count : $("#inputQuantity").val()
													}
												]
									};
							
					} else { // 비회원 장바구니에 상품이 담겨있을 경우
						let cookie = $.cookie.json
						let result = JSON.parse(cookie);
						result.cart.push(1)
						
						data : JSON.stringify(result);
						
							
					}// end of 쿠키 존재여부 if-else
				} // end of 회원 비회원 구분 if-else
			}, error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); // end of first ajax
	}// end of add_cart()
		
	function cartAlert(msg){
			if(msg == 'fail'){
				alert("장바구니에 추가에 실패하였습니다.");
			} else if(msg == 'addCart'){
				alert("장바구니에 새 상품이 추가되었습니다.");
			} else if(msg == 'modifyCart'){
				alert("장바구니에 이미 담은 상품이 있어 수량이 추가되었습니다.");
			} 
	}
</script>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<%@include file="/WEB-INF/includes/sidebar.jsp" %>
<!-- 헤더 끝 -->

<!-- 메인 시작 -->
<main>
    <section class="">
      <div class="px-4 px-lg-5 my-5">
        <div class="d-flex">
          <div class="col-3 me-5">
            <img
              class="card-img-top"
              src="${product.getP_img()}"
              alt="..."
            />
          </div>
          <div class="col-9">
            <div class="mb-3 fs-4">${product.getP_title()}</div>
            <div class="mb-3 d-flex">
            	<div class="pe-2">${product.getP_author()} 지음</div>
            	<div class="px-2 border-primary border-start border-end">${product.getP_publisher()}</div>
            	<div class="ps-2">${product.getP_pubdate()} 출간</div>
            </div>
            <div class="mb-2 d-flex align-items-center">
            	<div class="pe-2">별점: ${product.getP_avgscore()}</div>
            	<div class="pe-2">좋아요: ${product.getP_like()}</div>
            	<div class="pe-2">리뷰: ${product.getP_review()} 개</div>
            	<button class="btn btn-primary btn-sm">리뷰작성하기</button>
            </div>
            <div class="mb-2 d-flex">정가: ${product.getP_price()}</div>
          	<div class="mb-5 d-flex align-items-center">
          		<div class="me-1">회원가:</div>
          		<div class="me-1">${product.getP_price() * 0.9}</div>
          		<div id="state_ing" class="badge bg-danger rounded-pill">-10%</div>
          	</div>
            <div class="d-flex mb-2">
              <input
                class="form-control text-center me-3"
                id="inputQuantity"
                type="num"
                value="1"
                min="1"
                style="max-width: 3rem"
              />
              <button id="plus_btn" class="btn btn-outline-dark me-1" type="button"><i class="fas fa-plus-circle"></i></button>
              <button id="minus_btn" class="btn btn-outline-dark me-3" type="button"><i class="fas fa-minus-circle"></i></button>
            </div>
            <button class="btn btn-outline-dark me-1 flex-shrink-0" type="button" onclick="add_cart(${product.getP_no()})">장바구니</button>
            <button class="btn btn-outline-dark" type="button">구매하기</button>
          </div>
        </div>
        <hr/>
        <h5>상세내용</h5>
        <p class="lead">${product.getP_description()}</p>
        <hr/>
        <h5>관련상품</h5>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<div class="col-2">
							<div class="card h-100">
								<!-- Product image-->
								<a href="#">
									<img
										class="card-img-top"
										src="${product.getP_img()}"
										 alt="..."
									/>
								</a>
								<!-- Product details-->
								<div class="card-body">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">제목</h5>
										<!-- Product price-->
										가격
									</div>
								</div>
							</div>
						</div>
		</div>
		<hr/>
		<h5>리뷰보기</h5>
	  </div>
    </section>
</main>
<!-- 메인 끝 -->

<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>

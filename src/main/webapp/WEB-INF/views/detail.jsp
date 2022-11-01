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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
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
              <c:set var="c_count" value="1" />
              <button id="plus_btn" class="btn btn-outline-dark me-1" type="button"><i class="fas fa-plus-circle"></i></button>
              <button id="minus_btn" class="btn btn-outline-dark me-3" type="button"><i class="fas fa-minus-circle"></i></button>
            </div>
            <button class="btn btn-outline-dark me-1 flex-shrink-0" type="button" onclick="add_cart()">장바구니</button>
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
<script type="text/javascript">
let c_count = '';
	$(document).ready(function(){
	  	c_count = $("#inputQuantity").val();
	  		console.log(c_count);
	  	/* 장바구니에 담을 수량 증가 */
		$("#plus_btn").on("click", function(){
			let inputQTY = $("#inputQuantity").val();
			$("#inputQuantity").val(++inputQTY);
	  		c_count = inputQTY;
	  		console.log(c_count);
	  	});
	  	/* 장바구니에 담을 수량 감소 */
	  	$("#minus_btn").on("click", function(){
	  		let inputQTY = $("#inputQuantity").val();
	  		if(inputQTY > 1){
	  			$("#inputQuantity").val(--inputQTY);
	  		}
	  		c_count = inputQTY;
	  		console.log(c_count);
	  	});
	});
	  	
  	
	function add_cart() {
		//let promise = new Promise(function )
		console.log(c_count);
		$.ajax({
			type : "post",
			url : "${contextPath}/cart/check",
			success : function(result) { // result로 회원이면 member를 가져오고 비회원의 경우 nonMember를 받아온다.
				if(result == "member"){ //회원일 경우
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
					if(c_cart == undefined){  // 비회원 장바구니에 담긴 상품이 한 건도 없을 경우
						// json형식으로 객체 생성
						let cookie = {
 										cart : [ 
													{
													pno : "${product.getP_no()}",
													title : "${product.getP_title()}",
													img : "${product.getP_img()}",
													price : "${product.getP_price()}",
													count : c_count
													}
												]
									};
						$.ajax({
							type : "POST",
							url : "/cart/unmemAdd",
							data : JSON.stringify(cookie),
							dataType:"text",
							headers : {"content-type": "text/application"},
							success : function(msg) {
								if(msg == "success"){
									alert('비회원장바구니에 상품이 추가되었습니다.');
								}
							},
							error : function(data, textStatus) {
								alert("에러가 발생했습니다."+data);
								console.log(data);
							},
							complete : function(data, textStatus) {
							}
						}); //end of second ajax
					} else { // 비회원 장바구니에 한건이라도 상품이 담겨있을 경우
						let cookie = JSON.parse(c_cart);
						let cnt = 0;
						let text = "";
						// 가지고 있는 pno인지 비교하자
						$.each(cookie, function (index, item) {
						    // 두 번째 매개변수로는 콜백함수인데 콜백함수의 매개변수 중
						    // 첫 번째 index는 배열의 인덱스 또는 객체의 키를 의미하고
						    // 두 번째 매개 변수 item은 해당 인덱스나 키가 가진 값을 의미합니다.
						    if(item.pno == ${product.getP_no()}){
						    	++cnt;
						    } 
						}); // end of $.each()
						if(cnt == 0){ // 장바구니에 존재하지 않는 상품
							text = "not_exist";
						}else{
							text = "is_exist";
						} // end of text값 설정해주는 if-else
						
						
						if(text == "is_exist"){ // 이미 담아둔 상품일 경우 
							alert('이미 장바구니에 담아둔 상품입니다.');
						} else { // 장바구니에 담겨있지 않은 상품일 경우
							cookie.push({
										pno : "${product.getP_no()}",
										title : "${product.getP_title()}",
										img : "${product.getP_img()}",
										price : "${product.getP_price()}",
										count : c_count
										});
							$.ajax({
								type : "POST",
								url : "/cart/unmemAdd",
								data : JSON.stringify(cookie),
								dataType:"text",
								headers : {"content-type": "text/application"},
								success : function(msg) {
									if(msg == "success"){
										alert('비회원장바구니에 상품이 추가되었습니다.');
									}
								},
								error : function(data, textStatus) {
									alert("에러가 발생했습니다."+data);
									console.log(data);
								},
								complete : function(data, textStatus) {
								}
							}); //end of second ajax
						} // end of 장바구니에 담은 상품인지아닌지 if-else
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
</body>
</html>

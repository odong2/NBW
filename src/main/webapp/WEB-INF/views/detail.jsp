<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<%@include file="/WEB-INF/includes/common.jsp"%>
<title>ProductDetail</title>
<style>
a {
	color: black;
}

main {
	width: 70%;
	margin: auto;
}

#header {
	position: fixed;
	bottom: 0;
	width: 100%;
	z-index: 5;
	background-color: white;
	height: 80px;
}

#review-box fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#review-box fieldset legend {
	text-align: right;
}

#review-box input[type=radio] {
	display: none;
}

#review-box label {
	font-size: 1.5rem;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#review-box label:hover {
	/* text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); */
	text-shadow: 0 0 0 orange;
}

#review-box label:hover ~ label {
	/* text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); */
	text-shadow: 0 0 0 orange;
}

#review-box input[type=radio]:checked ~ label {
	/* text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); */
	text-shadow: 0 0 0 orange;
}

#imgDelete {
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<%@include file="/WEB-INF/includes/header.jsp"%>
	<!-- 헤더 끝 -->

	<div class="modal fade" id="reviewModalToggle" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="border-radius: 1rem;">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalToggleLabel">리뷰
						작성</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3 d-flex flex-column" id="review-box">
						<ul class="py-3 rounded bg-light" style="font-size: 0.7rem">
							<li class="ms-1 mb-2">리뷰 작성시
								<div class="badge bg-primary">200 point</div> 적립
							</li>
							<li class="ms-1">사진 리뷰 작성시로
								<div class="badge bg-primary">200 point</div> 추가 적립
							</li>
						</ul>

						<div class="d-flex align-items-center mb-3">
							<fieldset>
								<input type="radio" name="reviewStar" value="5" id="rate1">
								<label for="rate1" data-score="5">★</label> <input type="radio"
									name="reviewStar" value="4" id="rate2"> <label
									for="rate2" data-score="4">★</label> <input type="radio"
									name="reviewStar" value="3" id="rate3"> <label
									for="rate3" data-score="3">★</label> <input type="radio"
									name="reviewStar" value="2" id="rate4"> <label
									for="rate4" data-score="2">★</label> <input type="radio"
									name="reviewStar" value="1" id="rate5"> <label
									for="rate5" data-score="1">★</label>
							</fieldset>
							<div id="reviewPoint" class="ms-2 text-warning">0</div>
							<div class="text-warning">/5</div>
						</div>

						<span class="mb-2" style="font-size: 0.9rem">리뷰 작성</span>

						<div class="form-floating mb-3">
							<textarea id="reviewContent" class="form-control"
								placeholder="name@example.com" style="height: 100px;"></textarea>
							<label id="floatingValue" class="text-muted" for="reviewContent"
								style="font-size: 0.9rem">내용을 10자 이상 입력해주세요. 주제와 무관한 댓글,
								악플, 배송문의 등의 글은 임의 삭제될 수 있습니다.</label>
						</div>

						<div class="d-flex align-items-center mb-2">
							<div id="fileCount" style="font-size: 0.9rem">사진 첨부(선택) 0/3</div>
							<div id="imgDelete" class="badge bg-danger rounded-pill ms-3">모두
								삭제</div>
						</div>


						<div class="mb-5 d-flex">
							<input type="file" class="" id="input-file"
								accept="image/jpeg,image/png" onchange="reviewImgUrl(this);"
								style="display: none;"> <label
								class="fs-1 d-flex align-items-center justify-content-center border border-opacity-25"
								for="input-file" style="width: 100px; height: 100px;">+</label>
							<div id="img-box" class="d-flex align-items-center"></div>
						</div>
						<button id="reviewSubmmitBtn"
							class="btn btn-outline-secondary col-3 m-auto">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 고정바 시작 -->
	<div id="header"
		class="border-top border-dark d-flex align-items-center justify-content-evenly">
		<div class="d-flex">
			<div class="m-auto">총 상품 금액</div>
			<div class="fs-3 fw-bold d-flex ms-5">
				<div id="price">
					<fmt:formatNumber value="${product.getP_price() }" />
				</div>
				<div>원</div>
			</div>
		</div>
		<div class="d-flex">
			<div class="input-group input-group-sm me-2" style="width: 100px;">
				<button id="minus_btn"
					class="btn btn-outline-secondary border border-drak border-opacity-75">
					<i class="fas fa-minus"></i>
				</button>
				<input id="inputQuantity" type="text" class="form-control" value="1">
				<button id="plus_btn"
					class="btn btn-outline-secondary border border-drak border-opacity-75">
					<i class="fas fa-plus"></i>
				</button>
			</div>

			<div id="add_like"
				class="fs-5 btn btn-outline-light border border-drak rounded fs-5 d-flex align-items-center me-2"
				style="height: 40px;"></div>

			<button
				class="btn btn-outline-light border border-drak rounded text-muted d-flex align-items-center me-2"
				style="height: 40px;">
				<i class="fas fa-share-alt" style="color: skyblue;"></i>
			</button>

			<button id="reviewModal" class="btn btn-outline-warning me-2"
				style="width: 120px; height: 40px;"
				data-bs-target="#reviewModalToggle">
				<i class="fas fa-pen"></i>리뷰작성
			</button>

			<button class="btn btn-outline-secondary me-2" type="button"
				style="width: 120px; height: 40px;" onclick="add_cart()">
				<i class="fas fa-shopping-cart"></i>장바구니
			</button>
			<button class="btn btn-outline-primary" type="button"
				style="width: 120px; height: 40px;">
				<i class="fas fa-dollar-sign"></i> 구매하기
			</button>
		</div>
	</div>
	<!-- 고정바 끝 -->

	<!-- 메인 시작 -->
	<main>
		<section class="">
			<div class="px-4 px-lg-5 my-5">
				<div class="mb-3 d-flex align-items-center justify-content-start bg-light px-5 py-3 border rounded">
				
					<img class="me-5 card-img-top border rounded" src="${product.p_img}" alt="..." style="width: 200px; height: 300px;"/>
					
					<div class="d-flex flex-column justify-content-center">
						<div class="my-3 fs-4">${product.getP_title()}</div>
						<div class="mb-3 d-flex">
							<div class="pe-2">${product.getP_author()}</div>
							<div class="px-2 border-dark border-start border-end">${product.getP_publisher()}</div>
							<div class="ps-2">${product.getP_pubdate()}</div>
						</div>
						<div class="mb-2 d-flex align-items-center">
							<span class="pe-2">별점:</span>
							<div class="text-warning" style="font-size: 0.9rem">${product.star}</div>
						</div>
						<div class="mb-2 d-flex align-items-center">
							<span class="pe-2">좋아요:</span>
							<i class="fas fa-heart" style="color:red; font-size: 0.9rem;"></i>
							<span style="color:red; font-size: 0.9rem;">(${product.p_like})</span>
						</div>
						<div class="mb-2 d-flex align-items-center">
							<div class="pe-2">리뷰: ${product.getP_review()} 개</div>
						</div>
						<div class="mb-2 d-flex">
							정가:
							<fmt:formatNumber value="${product.getP_price() }" />원
						</div>
						<div class="mb-5 d-flex align-items-center">
							<div class="me-1">회원가:</div>
							<div class="me-1">
								<fmt:formatNumber value="${product.getP_price() * 0.9}" />원
							</div>
							<div id="state_ing" class="badge bg-danger rounded-pill">10%</div>
						</div>
					</div>
					
				</div>

				<div class="mb-3 bg-light px-5 py-3 border rounded">
					<h5>상세내용</h5>
					<hr/>
					<p class="lead" style="font-size: 1rem; margin: 0px;">${product.getP_description()}</p>
				</div>

				<div class="mb-3 bg-light px-5 py-3 border rounded">
					<h5>관련상품</h5>
					<hr/>
					<div
						class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<div class="col-2">
							<div class="card h-100">
								<!-- Product image-->
								<a href="#"> <img class="card-img-top"
									src="${product.getP_img()}" alt="..." />
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
				</div>

				<div class="mb-3 bg-light px-5 py-3 border rounded">
					<h5>리뷰보기(${ product.getP_review()})</h5>
					<ul style="list-style: none; margin: 0px; padding: 0px;">
					<c:if test="${ empty product.reviewList }">
						<hr/>
						<p class="lead" style="font-size: 1rem; margin: 0px;">등록된 리뷰가 없습니다.</p>
					</c:if>
					<c:forEach var="review" items="${product.reviewList}">
						<hr/>
						<li class="">
							<div class="mb-3 d-flex align-items-center justify-content-between" >
								<div>
									<span class="pe-2 border-end border-opacity-50" style="font-size:0.8rem;"><c:out value="${review.mem_nickname}"/></span>
									<span class="px-2 border-end border-opacity-50" style="font-size:0.8rem;"><c:out value="${review.rv_date}"/></span>
									<span class="ps-2" style="font-size:0.8rem;">신고</span>
								</div>
								<span class="ps-2 text-warning" style="font-size:0.8rem;"><c:out value="${ review.star }"/></span>
							</div>
							<div class="d-flex align-items-start justify-content-between">
								<span style="font-size: 1rem;"><c:out value="${review.rv_content}"/></span>
								<div>
								<c:forEach var="img" items="${ review.fileNames }">
									<img id="reviewImg" alt="" src="/product/images/${ img }" style="width: 70px; height: 70px;">
								</c:forEach>
								</div>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</section>
	</main>
	<!-- 메인 끝 -->

	<!-- 풋터 시작 -->
	<%@include file="/WEB-INF/includes/footer.jsp"%>
	<!-- 풋터 끝 -->
	<script type="text/javascript">
		let reviewList = [
			<c:forEach var="review" items="${ product.reviewList }" >
				{
					mem_id : '${review.mem_id}',
					mem_nickname : '${review.mem_nickname}',
					p_no : ${review.p_no},
					rv_score : '${review.star}',
					rv_content : '${review.rv_content}',
					fileNames : [ <c:forEach var="img" items="${review.fileNames}" >'${img}',</c:forEach> ]
				},
			</c:forEach>
		]
	</script>
	
	<script type="text/javascript">
	let c_count = '1';
	let booleanValue = ${empty isLike ?false :isLike};
	let rv_img = [];
	
	$(document).ready(function(){
		isLike(booleanValue);
		
		let sum = ${product.getP_price() };
		$('#price').text(insertCommas(sum));
		
	  	/* 장바구니에 담을 수량 증가 */
		$("#plus_btn").on("click", function(){
			c_count = $("#inputQuantity").val();
	  		c_count++;
	  		$("#inputQuantity").val(c_count);
	  		sum = ${product.getP_price()} * parseInt(c_count);
	  		$('#price').text(insertCommas(sum));
	  	});
	  	/* 장바구니에 담을 수량 감소 */
	  	$("#minus_btn").on("click", function(){
	  		c_count = $("#inputQuantity").val();
	  		c_count > 1 ? c_count-- : c_count
	  		$("#inputQuantity").val(c_count);
	  		sum = ${product.getP_price()} * parseInt(c_count);
	  		$('#price').text(insertCommas(sum));
	  	});
	  	
	  	$('#inputQuantity').blur(function(){
	  		let value = $('#inputQuantity').val();
	  		sum = ${product.getP_price()} * value;
	  		$('#price').text(insertCommas(sum));
	  	})
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
													ctg : "${product.getP_category()}",
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
										ctg : "${product.getP_category()}",
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

	function insertCommas(n) {
		  // get stuff before the dot
		  let s1 = n.toString();
		  var d = s1.indexOf('.');
		  var s2 = d === -1 ? s1 : s1.slice(0, d);

		  // insert commas every 3 digits from the right
		  for (var i = s2.length - 3; i > 0; i -= 3)
		    s2 = s2.slice(0, i) + ',' + s2.slice(i);

		  // append fractional part
		  if (d !== -1)
		    s2 += s1.slice(d);

		  return s2;
	}
	
	$('#add_like').click(function(){
		$.ajax({
			type : "POST",
			url : "/member/like",
			data : JSON.stringify({p_no:'${ product.getP_no() }'}), 
			contentType: "application/json; charset=UTF-8", 
			dataType:"json",
			success : function(response) {
				console.log(response);
				if(response.isLogin){
					if(response.success){
						isLike(true);
						msg(response.msg);
					}else{
						isLike(false);
						msg(response.msg);
					}
				}else{
					if(confirm('로그인이 필요합니다. 로그인 페이지로 이동히시겠습니까?')){
						location.href = '/login?pno=${product.getP_no()}';
					}
				}
			},
			error : function(data, textStatus) {
				msg("에러가 발생했습니다."+data);
				console.log(data);
			}
		})
	});
	
	let isLike = function(request){
		if(request){
			$('#add_like').empty();
			$('#add_like').append('<i class="fas fa-heart" style="color:red;"></i>');
		}else{
			$('#add_like').empty();
			$('#add_like').append('<i class="far fa-heart" style="color:red;"></i>');
		}
	}
	
	let msg = function(text){
		if(!$('#msg-box').length){
			$('body').append('<div id="msg-box" class="position-fixed top-50 start-50 translate-middle"></div>');
			$('#msg-box').append('<div id="LoginFailMsg" class="text-center list-group-item list-group-item-danger">'+text+'</div>');
			$("#LoginFailMsg").delay(500).fadeOut(500);
		}
		$("#LoginFailMsg").text(text);
		$("#LoginFailMsg").show();
		$("#LoginFailMsg").delay(500).fadeOut(500);
	}
	
	$('#reviewModal').click(function(){
		$.ajax({
			type : "POST",
			url : "/login/exist",
			dataType:"json",
			success : function(response) {
				if(response.isLogin){
					$('#reviewModalToggle').modal("show");
				}else{
					if(confirm('로그인이 필요합니다. 로그인 페이지로 이동히시겠습니까?')){
						location.href = '/login?pno=${product.getP_no()}';
					}
				}
			},
			error : function(data, textStatus) {
				msg("에러가 발생했습니다."+data);
				console.log(data);
			}
		})
	})
	
	$('label').click(function(e){
		let text = e.target.dataset.score;
		$('#reviewPoint').text(text);
	})
	
	$('#reviewContent').focus(function(){
		const size = $('#reviewContent').val().length;
		$('#floatingValue').text(size+'/3000');
	})
	
	/* 리뷰 내용 작성시 작성된 니용이 없으면 돌림 */
	$('#reviewContent').blur(function(){
		const size = $('#reviewContent').val().length;
		if(size <= 0)
			$('#floatingValue').text('내용을 10자 이상 입력해주세요. 주제와 무관한 댓글, 악플, 배송문의 등의 글은 임의 삭제될 수 있습니다.')
	})
	
	/* 리뷰 내용 작성시 최대 글자수 탐지 */
	$('#reviewContent').keyup(function(){
		const size = $('#reviewContent').val().length;
		if(size > 0)
			$('#floatingValue').text(size+'/3000');
	})
	
	/* 리뷰 이미지 업로드 */
	function reviewImgUrl(input) {
		if(rv_img.length === 3){
			return alert('최대 3개까지만 등록 가능합니다.');
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
		 	let src = e.target.result;
		 	$('#img-box').append('<img class="ms-2 border border-dark" alt="" src="'+src+'" style="width: 100px; height: 100px;">')
	 	};
		reader.readAsDataURL(input.files[0]);
		rv_img.push(input.files[0]);
		$('#fileCount').text('사진 첨부(선택) '+rv_img.length+'/3');
	}
	
	/* 리뷰 전송시 검사 */
	$('#reviewSubmmitBtn').click(function(){
		const rv_score = $('#reviewPoint').text();
		const rv_content = $('#reviewContent').val();
		
		if(rv_score <= 0){
			alert('별점을 입력해주세요.');
		}else if(!rv_content) {
			alert('리뷰를 작성해주세요.');
		}else if(rv_img.length === 0){
			if(confirm('리뷰사진 없이 등록 하시겠습니까?')){
				review_submmit();
			}
		}else {
			review_submmit();
		}
	})
	
	/* 작성한 리뷰 내용 초기화 */
	let review_clear = () => {
		$('#reviewModalToggle').modal("hide");
		$('#reviewPoint').text('0');
		$('#reviewContent').val('');
		$('#img-box').empty();
		$('#floatingValue').text('0/3000');
		$('#fileCount').text('사진 첨부(선택) 0/3');
		rv_img = [];
	}
	
	/* 리뷰 업로드 사진 초기화 */
	$('#imgDelete').click(function(){
		$('#img-box').empty();
		$('#fileCount').text('사진 첨부(선택) 0/3');
		rv_img = [];
	})
	
	/* 리뷰 전송 */
	let review_submmit = () => {
		const formData = new FormData();
		
		const rv_score = $('#reviewPoint').text();
		const rv_content = $('#reviewContent').val();
		const p_no = '${ product.getP_no() }';
		
		formData.append('p_no',p_no);
		formData.append('rv_score',rv_score);
		formData.append('rv_content',rv_content);
		
		rv_img.forEach((item)=>{
			formData.append('files',item);
		})
		
		$.ajax({
			type : "POST",
			url : "/product/review",
			data : formData,
			processData: false,
			contentType: false,				
			success : function(result) {
				console.log(result);
				if(result.success){
					review_clear();
					msg(result.msg);
				}else {
					review_clear();
					msg(result.msg);
				}
		 	},
		 	error : function(request, status, error) {
		 		console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			}
		});
	}
</script>
</body>
</html>

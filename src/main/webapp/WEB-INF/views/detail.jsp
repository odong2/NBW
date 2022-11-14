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

.switch {
	position: fixed;
	top: 35%;
	right: 5%;
	background-color: white;
	right: 5%;
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

	<div
		class="switch rounded-pill bg-light border border-dark d-flex justify-content-center align-items-center flex-column"
		style="width: 70px; height: 150px;">
		<button id="scrollTop"
			class="mb-3 fs-1 btn-outline-primary rounded-pill" style="">
			<i class="fas fa-angle-up"></i>
		</button>

		<div data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
			class="position-relative">
			<img id="recentThumbnail"
				class="border border-dark border-1 rounded-circle" alt=""
				src="${product.p_img}"
				style="width: 50px; height: 50px; cursor: pointer;"> <span
				id="RecentProductSize"
				class="position-absolute bottom-0 start-100 translate-middle translate-middle badge rounded-pill bg-danger">0
				<span class="visually-hidden"></span>
			</span>
		</div>
	</div>

	<div class="offcanvas offcanvas-end m-auto me-5" tabindex="-1"
		id="offcanvasRight" aria-labelledby="offcanvasRightLabel"
		style="height: 80%; border-radius: 10px;">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasRightLabel">최근 본 상품</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body" style="padding-top: 0px;">
			<div class="sticky-top bg-body mb-3">
				<div class="mb-3 d-flex align-items-center">
					<span class="badge bg-secondary me-1">전체</span> <span
						class="badge bg-secondary me-1">가격순</span> <span
						class="badge bg-secondary">리뷰순</span>
				</div>

				<div class="mb-2 d-flex justify-content-between align-items-center">
					<div>
						<span id="RecentProductSize2" class="ms-1 text-success">0</span>
						<span> 건</span>
					</div>
					<div id="removeAllRecentProduct"
						class="me-1 btn btn-outline-danger" style="font-size: 0.7rem">
						<i class="far fa-trash-alt"></i> <span class="ms-1">모두 삭제</span>
					</div>
				</div>
				<hr/>
			</div>

			<div id="RecentProduct" class="d-flex flex-column overflow-auto"></div>
		</div>
	</div>

	<!-- 고정바 시작 -->
	<div id="header"
		class="border-top border-dark d-flex align-items-center justify-content-evenly">
		<div class="d-flex">
			<div class="m-auto">총 상품 금액</div>
			<div class="fs-3 fw-bold d-flex ms-5">
				<div id="price">
					<fmt:formatNumber value="${product.p_price }" />
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
				<div
					class="mb-3 d-flex align-items-center justify-content-start bg-light px-5 py-3 border rounded">

					<img class="me-5 card-img-top border rounded"
						src="${product.p_img}" alt="..."
						style="width: 200px; height: 300px;" />

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
							<span class="pe-2">좋아요:</span> <i class="fas fa-heart"
								style="color: red; font-size: 0.9rem;"></i> <span
								style="color: red; font-size: 0.9rem;">(${product.p_like})</span>
						</div>
						<div class="mb-2 d-flex align-items-center">
							<div class="pe-2">리뷰: ${product.getP_review()} 개</div>
						</div>
						<div class="mb-2 d-flex">
							정가:
							<fmt:formatNumber value="${product.getP_price() }" />
							원
						</div>
						<div class="mb-5 d-flex align-items-center">
							<div class="me-1">회원가:</div>
							<div class="me-1">
								<fmt:formatNumber value="${product.getP_price() * 0.9}" />
								원
							</div>
							<div id="state_ing" class="badge bg-danger rounded-pill">10%</div>
						</div>
					</div>

				</div>

				<div class="mb-3 bg-light px-5 py-3 border rounded">
					<h5>상세내용</h5>
					<hr />
					<p class="lead text-muted" style="font-size: 1rem; margin: 0px;">${product.getP_description()}</p>
				</div>

				<div class="mb-3 bg-light px-5 py-3 border rounded">
					<h5>관련상품</h5>
					<hr />
					<div class="row justify-content-center">
						<c:forEach var="product" items="${BestProduct}">
							<div class="col-3">
								<div class="card h-100">
									<a href="/product/${product.p_no}"><img
										class="card-img-top" src="${product.p_img}" alt="..."
										style="height: 300px;" /></a>
									<div class="card-body">
										<div class="text-center d-flex flex-column">
											<span class="fw-bolder fs-5"><c:out value="${product.p_title}"/></span>
											<span><c:out value="${product.p_author}"/> 지음</span>
											<span><fmt:formatNumber value="${product.p_price }" /> 원</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="mb-3 bg-light px-5 py-3 border rounded">
					<c:choose>
						<c:when test="${empty member}">
							<h5 class="btnFold">내가 최근에 작성한 리뷰</h5>
							<hr />
							<span class="text-danger">로그인이 필요합니다.</span>
						</c:when>
						<c:when test="${empty memberReview}">
							<h5 class="btnFold text-danger">내가 최근에 작성한 리뷰</h5>
							<hr />
							<span>작성한 리뷰가 없습니다.</span>
						</c:when>
						<c:otherwise>
							<h5 class="btnFold" style="cursor: pointer;">
								내가 최근에 작성한 리뷰 <i class="fas fa-caret-down"></i>
							</h5>
							<hr />
							<div class="fold">
								<ul style="list-style: none; margin: 0px; padding: 0px;">
									<li id="rv_body">
										<div
											class="mb-3 d-flex align-items-center justify-content-between">
											<div>
												<span class="pe-1 border-end" style="font-size: 0.8rem;"><c:out
														value="${memberReview.mem_nickname}" /></span> <span
													class="px-1 border-end" style="font-size: 0.8rem;"><c:out
														value="${memberReview.rv_date}" /></span> <span class="ps-1"
													style="font-size: 0.8rem;">신고</span>
											</div>
											<span id="scoreUpdate" class="ps-2 text-warning"
												style="font-size: 1rem;"><c:out
													value="${memberReview.star}" /></span>
										</div>


										<div id="rv_content"
											class="d-flex align-items-center justify-content-between">
											<span id="contentUpdate" style="font-size: 1.2rem;"><c:out
													value="${memberReview.rv_content}" /></span>
											<div id="imgUpdate-box">
												<c:if test="${!empty memberReview.rv_img }">
													<button type="button"
													class="me-2 btn btn-outline-dark btn-sm"
													onclick="imgToggle(this)">펼치기</button>
												</c:if>
											</div>
										</div>

										<div id="rv_btns" class="mt-3 d-flex justify-content-end">
											<button onclick="review_modify()"
												class="me-1 btn-outline-primary rounded-pill"
												style="font-size: 0.8rem;">수정</button>
											<button onclick="review_delete()"
												class="me-3 btn-outline-danger rounded-pill"
												style="font-size: 0.8rem;">삭제</button>
										</div>
									</li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="mb-3 bg-light px-5 py-3 border rounded">
					<h5>전체 리뷰(${ product.getP_review()})</h5>
					<ul id="reviewList"
						style="list-style: none; margin: 0px; padding: 0px;"></ul>
					<nav aria-label="Page navigation">
						<ul id="pageNavigation"
							class="pagination d-flex justify-content-center"></ul>
					</nav>
					<form id="pageForm" action="/product/review/list" method="post">
						<input name="p_no" value="${product.p_no}" type="hidden">
						<input id="selectPage" name="page" value="" type="hidden">
					</form>
				</div>
			</div>
		</section>
	</main>
	<!-- 메인 끝 -->

	<!-- 풋터 시작 -->
	<%@include file="/WEB-INF/includes/footer.jsp"%>
	<!-- 풋터 끝 -->

	<!-- 리뷰 수정 JS -->
	<script type="text/javascript">
		let reviewBackup;
		
	    /* 리뷰 수정 시도 */
	    const review_modify = () => {
	    	reviewBackup = $('#rv_body').children();
	    	
	    	$('#rv_body').empty();
	    	
	    	$('#rv_body').append(`
					<div id="review-box" class="d-flex align-items-center mb-3">
						<fieldset>
							<input type="radio" value="5" id="modify_rate1" name="modify_reviewStar" onclick="pointChange(5)">
							<label for="modify_rate1" data-score="5">★</label> 
							<input type="radio" value="4" id="modify_rate2" name="modify_reviewStar" onclick="pointChange(4)">
							<label for="modify_rate2" data-score="4">★</label>
							<input type="radio" value="3" id="modify_rate3" name="modify_reviewStar" onclick="pointChange(3)">
							<label for="modify_rate3" data-score="3">★</label>
							<input type="radio" value="2" id="modify_rate4" name="modify_reviewStar" onclick="pointChange(2)">
							<label for="modify_rate4" data-score="2">★</label> 
							<input type="radio" value="1" id="modify_rate5" name="modify_reviewStar" onclick="pointChange(1)">
							<label for="modify_rate5" data-score="1">★</label>
						</fieldset>
						<div id="modify_reviewPoint" class="ms-2 text-warning">0</div>
						<div class="text-warning">/5</div>
					</div>
	    			`);
	    	
	    	$('#rv_body').append('<textarea id="modify_content" class="mb-3 form-control" placeholder="내용을 10자 이상 입력해주세요. 주제와 무관한 댓글,악플, 배송문의 등의 글은 임의 삭제될 수 있습니다."/>');
	    	
	    	$('#rv_body').append('<div id="modifyImg" class="d-flex flex-column align-items-start"></div');
	    	$('#modifyImg').append(`
	    					<div class="mb-3">
	    						<button onclick="modifyImg_delete()" class="badge bg-danger rounded-pill me-1">이미지 삭제</button>
								<span class="text-danger" style="font-size:0.7rem;">* 리뷰 수정시 기존 이미지는 모두 삭제됩니다.</span>
							</div>
							<div id="modifyImg-box" class="d-flex">
								<input type="file" onchange="memberReviewImgUrl(this)" id="modify_input" accept="image/jpeg,image/png" style="display: none;">
								<label
									class="me-1 fs-1 d-flex align-items-center justify-content-center border border-opacity-25"
									for="modify_input" style="width: 60px; height: 60px;">+</label>
								<div id="img-box2" class="d-flex align-items-center"></div>
							</div>
	    			`);
	    	
	    	$('#rv_body').append('<div id="rv_btns" class="mt-3 d-flex justify-content-end"></div>');
	    	$('#rv_btns').append('<button onclick="modify_submmit()" class="me-1 btn-outline-primary rounded-pill" style="font-size:0.8rem;">확인</button>');
	    	$('#rv_btns').append('<button onclick="modify_cancel()" class="me-3 btn-outline-secondary rounded-pill" style="font-size:0.8rem;">취소</button>');
	    };
	    
	    /* 리뷰 수정 취소 */ 
	    let modify_cancel = (obj) => {
	    	console.log(obj);
	    	
	    	if (!obj){
		    	$('#rv_body').empty();
		    	$('#rv_body').append(reviewBackup);
		    	rv_imgs = [];
	    	}else {
	    		let rv_content = obj.rv_content;
	    		let rv_score = obj.rv_score;
	    		let fileNames = obj.fileNames;
	    		
		    	$('#rv_body').empty();
		    	$('#rv_body').append(reviewBackup);
		    	rv_imgs = [];
	    		$('#contentUpdate').text(rv_content.trim());
	    		$('#scoreUpdate').text(getStar(rv_score));
	    		
	    		$('#imgUpdate-box').empty();
	    		
	    		if(fileNames != null)
	    			$('#imgUpdate-box').append('<button type="button" class="me-2 btn btn-outline-dark btn-sm" onclick="imgToggle(this)">펼치기</button>')
	 			
	    		fileNames.forEach((item,i)=>{
	    			$('#imgUpdate-box').append('<img id="imgUpdate'+i+'" class="me-2 border border-dark" id="reviewImg" alt="" src="/product/images/'+item+'" style="width: 60px; height: 60px;">');
	    		})
	    	}
	    	
	    }
	    
		/* 리뷰 이미지 업로드 */
		let memberReviewImgUrl = (input) => {		
			if(rv_imgs.length === 3){
				return alert('최대 3개까지만 등록 가능합니다.');
			}
			
			let reader = new FileReader();
			
			reader.onload = function(e) {
			 	let src = e.target.result;
			 	$('#img-box2').append('<img class="me-1 border border-dark" alt="" src="'+src+'" style="width: 60px; height: 60px;">');
		 	};
		 	
			reader.readAsDataURL(input.files[0]);
			rv_imgs.push(input.files[0]);
		}
		
		let pointChange = (number) => {
			$('#modify_reviewPoint').text(number);
		}
		
		/* 리뷰 이미지 삭제 */
		let modifyImg_delete = () => {
			$('#img-box2').empty();
			rv_imgs = [];
			console.log('rv_imgs.length: '+rv_imgs.length);
			console.log(rv_imgs);
		}
		
		/* 리뷰 수정 요청 */
		let modify_submmit = () => {			
			let rv_score = $('#modify_reviewPoint').text();
			let rv_content = $('#modify_content').val();
			let p_no = '${product.getP_no()}';
			
			let formData = new FormData();
			
			formData.append('p_no',p_no);
			formData.append('rv_score',rv_score);
			formData.append('rv_content',rv_content.trim());
			
			rv_imgs.forEach((item)=>{
				formData.append('files',item);
			})
			
			if(rv_score <= 0){
				alert('별점을 입력해주세요.');
			}else if(!rv_content) {
				alert('리뷰를 작성해주세요.');
			}else {
				$.ajax({
					type : "POST",
					url : "/product/review/modify",
					data : formData,
					dataType : "json",
					processData: false,
					contentType: false,				
					success : function(result) {
						console.log(result);
						if(result.success){
							msg(result.msg);
							reviewPage(1);
							modify_cancel(result.review);
						}else {
							msg(result.msg);
							modify_cancel();
						}
				 	},
				 	error : function(request, status, error) {
				 		console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
					}
				});
			}
		}
		
		/* 리뷰 삭제 요청 */
		let review_delete = () => {
			if(confirm('정말로 리뷰를 삭제하시겠습니까?')){
				let rv_content = '${memberReview.rv_content}';
				let p_no = '${memberReview.p_no}';
				let rv_score = '${memberReview.rv_score}';
				
				let obj = {}
				obj.rv_content = rv_content.trim();
				obj.p_no = p_no;
				obj.rv_score = rv_score;
				obj.rv_no = '${memberReview.rv_no}';
				
				console.log(obj)
				
				$.ajax({
					type : "POST",
					url : "/product/review/delete",
					contentType: "application/json; charset=UTF-8", 
					data : JSON.stringify(obj),
					dataType:"json",
					success : function(response) {
						location.reload();
					},
					error : function(data, textStatus) {
						msg("에러가 발생했습니다."+data);
						console.log(data);
					}
				}) 
			}
		}
	</script>

	<!-- 리뷰 JS -->
	<script type="text/javascript">
		let now_page = 1;
		let rv_imgs = [];
		
		$(document).ready(function(){			
			reviewPage(now_page);
			imgAppend();
			
			let value = $('#contentUpdate').text();
			$('#contentUpdate').text(value.replaceAll('<br>','\r\n'));
		})
		
		let imgAppend = () => {
			let rv_img = '${memberReview.rv_img}';
			let rv_img2 = '${memberReview.rv_img2}';
			let rv_img3 = '${memberReview.rv_img3}';
			
			if(rv_img != '')
				$('#imgUpdate-box').append('<img id="imgUpdate1" class="me-2 border border-dark" id="reviewImg" alt="" src="/product/images/'+encodeURIComponent(rv_img)+'" style="width: 60px; height: 60px;">');
			if(rv_img2 != '')
				$('#imgUpdate-box').append('<img id="imgUpdate1" class="me-2 border border-dark" id="reviewImg" alt="" src="/product/images/'+encodeURIComponent(rv_img2)+'" style="width: 60px; height: 60px;">');
			if(rv_img3 != '')
				$('#imgUpdate-box').append('<img id="imgUpdate1" class="me-2 border border-dark" id="reviewImg" alt="" src="/product/images/'+encodeURIComponent(rv_img3)+'" style="width: 60px; height: 60px;">');
		}

		$(".fold").hide();
		
	    $(".btnFold").click(function (e) {
	        e.preventDefault();
	        $(".fold").slideToggle(100);
	    });
		
		let reviewPage = (page) => {
			now_page = page;
			
			$('#selectPage').val(page);
			let formValues = $('#pageForm').serialize();
	        $.ajax({
	            type : 'post',
	            url : '/product/review/list',
	            data : formValues,
	            dataType : 'json',
	            success : function(json){
	                review_Append(json.reviewList);
	                pageNavigation_Append(json.ph);
	            },
	            error: function(xhr, status, error){
	                console.log(error);
	            }
	        });
		}
		
		let pageNavigation_Append = (obj) => {
			$('#pageNavigation').empty();

			let beginPage = obj.beginPage;
			let endPage   = obj.endPage;
			let naviSize  = obj.naviSize;
			let page      = obj.page;
			let pageSize  = obj.pageSize;
			let showNext  = obj.showNext;
			let showPrev  = obj.showPrev;
			let totalCnt  = obj.totalCnt;
			let totalPage = obj.totalPage;
			
			if(totalCnt != null){
				if(showPrev){
					$('#pageNavigation').append('<li class="page-item"><button class="page-link" onclick="reviewPage('+(beginPage-1)+')"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></button></li>');
				}
				
				for(let i = beginPage; i<=endPage; i++){
					if(i === now_page){
						$('#pageNavigation').append('<li class="page-item page-list active"><button class="page-link page-num" onclick="reviewPage('+i+')">'+i+'</button></li>');
					}else{
						$('#pageNavigation').append('<li class="page-item page-list"><button class="page-link page-num" onclick="reviewPage('+i+')">'+i+'</button></li>');
					}
				}
				
				if(showNext){
					$('#pageNavigation').append('<li class="page-item"><a class="page-link" onclick="reviewPage('+(endPage+1)+')"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>')
				}
			}
		}
		
		let review_Append = (array) => {
			$('#reviewList').empty();
			
			if(array.length === 0){
				$('#reviewList').append('<hr/><p class="lead" style="font-size: 1rem; margin: 0px;">등록된 리뷰가 없습니다.</p>');
			}else{
				array.forEach((review, i) => {
					let mem_nickname = review.MEM_NICKNAME;
					let rv_content = review.RV_CONTENT;
					let rv_date = review.RV_DATE;
					let rv_img = review.RV_IMG;
					let rv_img2 = review.RV_IMG2;
					let rv_img3 = review.RV_IMG3;
					let rv_score = review.RV_SCORE;
					
					$('#reviewList').append('<hr/><li id="review_li'+i+'"></li>');
					
					$('#review_li'+i).append('<div id="top'+i+'" class="mb-3 d-flex align-items-center justify-content-between"></div>');
					$('#review_li'+i).append('<div id="bottom'+i+'" class="d-flex align-items-center justify-content-between"></div>');
					
					$('#top'+i).append('<div id="top_content'+i+'"></div>');
					$('#top_content'+i).append('<span class="pe-1 border-end" style="font-size:0.8rem;">'+mem_nickname+'</span>');
					$('#top_content'+i).append('<span class="px-1 border-end" style="font-size:0.8rem;">'+rv_date+'</span>');
					$('#top_content'+i).append('<span class="ps-1" style="font-size:0.8rem;">신고</span>');
					$('#top'+i).append('<span class="ps-2 text-warning" style="font-size:1rem;">'+getStar(rv_score)+'</span>');
					
					$('#bottom'+i).append('<span style="font-size: 1.2rem;">'+rv_content+'</span>');
					$('#bottom'+i).append('<div id="bottom_content'+i+'"></div>');
					
					if(rv_img != null) {
						$('#bottom_content'+i).append('<button id="imgToggle" type="button" class="me-2 btn btn-outline-dark btn-sm" onclick="imgToggle(this)">펼치기</button>');
						$('#bottom_content'+i).append('<img class="me-1 border border-dark" id="reviewImg" alt="" src="/product/images/'+encodeURIComponent(rv_img)+'" style="width: 60px; height: 60px;">');
					}
					if(rv_img2 != null)
						$('#bottom_content'+i).append('<img class="me-1 border border-dark" id="reviewImg" alt="" src="/product/images/'+encodeURIComponent(rv_img2)+'" style="width: 60px; height: 60px;">');
					if(rv_img3 != null)
						$('#bottom_content'+i).append('<img class="border border-dark" alt="" src="/product/images/'+encodeURIComponent(rv_img3)+'" style="width: 60px; height: 60px;">');
				});
			}
		}
		
		let imgToggle = (tag) => {
			let imgToggle = $(tag).text();
			
			if(imgToggle === '펼치기'){
				$(tag).nextAll().removeAttr('style');
				$(tag).nextAll().attr('style','width: 400px; height: 400px;');
			}
			
			if(imgToggle === '접기'){
				$(tag).nextAll().removeAttr('style');
				$(tag).nextAll().attr('style','width: 60px; height: 60px;');
			}
			
			let toggleValue = imgToggle === '펼치기' ?'접기' :'펼치기';
			$(tag).text(toggleValue);
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
			if(rv_imgs.length === 3){
				return alert('최대 3개까지만 등록 가능합니다.');
			}
			
			let reader = new FileReader();
			reader.onload = function(e) {
			 	let src = e.target.result;
			 	$('#img-box').append('<img class="ms-2 border border-dark" alt="" src="'+src+'" style="width: 100px; height: 100px;">')
		 	};
			reader.readAsDataURL(input.files[0]);
			rv_imgs.push(input.files[0]);
			$('#fileCount').text('사진 첨부(선택) '+rv_imgs.length+'/3');
		}
		
		/* 리뷰 전송시 검사 */
		$('#reviewSubmmitBtn').click(function(){
			const rv_score = $('#reviewPoint').text();
			const rv_content = $('#reviewContent').val();
			
			if(rv_score <= 0){
				alert('별점을 입력해주세요.');
			}else if(!rv_content) {
				alert('리뷰를 작성해주세요.');
			}else if(rv_imgs.length === 0){
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
			rv_imgs = [];
		}
		
		/* 리뷰 업로드 사진 초기화 */
		$('#imgDelete').click(function(){
			$('#img-box').empty();
			$('#fileCount').text('사진 첨부(선택) 0/3');
			rv_imgs = [];
		})
		
		/* 리뷰 전송 */
		let review_submmit = () => {
			const formData = new FormData();
			
			const rv_score = $('#reviewPoint').text();
			const rv_content = $('#reviewContent').val().replace(/\n/g,'<br>');
			const p_no = '${ product.getP_no() }';
			
			formData.append('p_no',p_no);
			formData.append('rv_score',rv_score);
			formData.append('rv_content',rv_content.trim());
			
			rv_imgs.forEach((item)=>{
				formData.append('files',item);
			})
			
			$.ajax({
				type : "POST",
				url : "/product/review/register",
				data : formData,
				processData: false,
				contentType: false,				
				success : function(result) {
					console.log(result);
					if(result.success){
						location.reload();
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
		
	    
		let getStar = (score) => {
			let star = "★"; 
			return star.repeat(score)+"("+score+")";
		}
	</script>

	<!-- switch -->
	<script type="text/javascript">
		$('#scrollTop').click(function(){
			window.scrollTo(0,0);
		})
		
		$(document).ready(function(){
			// 페이지 로딩시 클릭한 상품정보를 담음
			let product = {
					p_no : '${product.p_no}',
					p_title : '${product.p_title}',
					p_author : '${product.p_author}',
					p_publisher : '${product.p_publisher}',
					p_pubdate : '${product.p_pubdate}',
					p_price : '<fmt:formatNumber value="${product.p_price}"/>',
					p_img : '${product.p_img}',
					p_category : '${product.p_category}',
				}
			
			// 클릭한 상품정보를 서버로 보내서 쿠키에 담음
			$.ajax({
				type : "POST",
				url : "/product/recent",
				contentType: "application/text; charset=UTF-8",
				data : JSON.stringify(product),
				success : function() {
					let cookie = $.cookie('recent_product');
					let cookieArray = cookie.split("'");
					let array = JSON.parse(cookieArray);
					addRecentProduct(array);
				},
				error : function(data, textStatus) {
					msg("에러가 발생했습니다."+data);
					console.log(data);
				}
			})			
		});
		
		// 쿠키값으로 화면에 그려주는 메서드
		let addRecentProduct = (array) => {
			$('#RecentProduct').empty();
			
			array.forEach((product,i)=>{
				$('#RecentProduct').append('<div id="RecentProductBoody'+i+'" class="mb-3 d-flex w-100 p-2 border border-opacity-50 rounded"><div>');
				$('#RecentProductBoody'+i).append('<a href="/product/'+product.p_no+'"><img alt="" src="'+product.p_img+'" style="width: 70px; height: 100px;"></a>');
				$('#RecentProductBoody'+i).append('<div class="col-8 ms-2 d-flex flex-column justify-content-between"><span>'+product.p_title+'</span><span style="font-size: 0.8rem">'+product.p_author+'</span><span style="font-size: 0.8rem">'+product.p_price+'원</span></div>');
				$('#RecentProductBoody'+i).append('<button class="btn btn-outline-secondary h-25" style="font-size: 0.9rem" onclick="removeRecentProduct('+product.p_no+')"><i class="far fa-trash-alt"></i></button>');
			})
			$('#RecentProductSize').text(array.length);
			$('#RecentProductSize2').text(array.length);
		}
		
		// 단건 상품 삭제 메서드
		let removeRecentProduct = (pno) => {
			if(confirm('선택 하신 상품을 삭제하시겠습니까?')){
				let cookie = $.cookie('recent_product');
				let cookieArray = cookie.split("'");
				let array = JSON.parse(cookieArray);
				
				console.log(array);
				
				let obj = {};
				
				array.forEach((product)=>{
					if(product.p_no === pno.toString())
						obj = product; // 쿠키에서 선택한 요소 객체 가져오기;
				});
	 			
				$.ajax({
					type : "POST",
					url : "/product/recent/remove",
					contentType: "application/text; charset=UTF-8",
					data : JSON.stringify(obj),
					success : function() {
						if(array.length === 1){
							$('#RecentProduct').empty();
							$('#RecentProductSize').text(0); // 총 개수 변경
							$('#RecentProductSize2').text(0); // 총 개수 변경 
							$('#RecentProduct').append('<span class="mt-5 text-center">최근 본 상품이 없습니다.</span>');
						}else{
							let cookie = $.cookie('recent_product');
							let cookieArray = cookie.split("'");
							let array = JSON.parse(cookieArray);
							console.log(array);
							addRecentProduct(array);
						}
					},
					error : function(data, textStatus) {
						msg("에러가 발생했습니다."+data);
						console.log(data);
					}
				});
			}
		}
		
		// 서버에 쿠키 모두 삭제 요청
		let removeAllRecentProduct = () => {
			$.ajax({
				type : "POST",
				url : "/product/recent/removeall",
				success : function() {
					$('#RecentProduct').empty();
					$('#RecentProduct').append('<span class="mt-5 text-center">최근 본 상품이 없습니다.</span>');
					$('#RecentProductSize').text(0);
					$('#RecentProductSize2').text(0);
				},
				error : function(data, textStatus) {
					msg("에러가 발생했습니다."+data);
					console.log(data);
				}
			})
		}
		// 모두삭제 쿨릭시 모두 삭제 메서드 실행
		$('#removeAllRecentProduct').click(function(){
			if(confirm('모두 삭제하시겠습니까?'))
				removeAllRecentProduct();
		})
	</script>

	<script type="text/javascript">
	let c_count = '1';
	let booleanValue = ${empty isLike ?false :isLike};
	
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
			$("#LoginFailMsg").delay(500).fadeOut(1200);
		}
		$("#LoginFailMsg").text(text);
		$("#LoginFailMsg").show();
		$("#LoginFailMsg").delay(500).fadeOut(500);
	}
</script>
</body>
</html>

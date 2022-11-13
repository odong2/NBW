<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/common.jsp" %>
    
    <title>MyHistory</title>
    <style>
        main {
            width: 100%;
            padding-left: 30px;
        }
        .sidebar span{
	    	font-size: 1rem;
		}
		.sidebar a{
		    font-size: 1rem;
		}
		.sidebarList .title span{
		    font-size: 1.3rem;
		    font-weight: bold;
		    color: #5055b1;
		}
		.font_1{
			font-size: 0.7rem;
		}
    </style>
    </head>
    <body>
    <!-- 헤더 시작 -->
    <%@include file="../../includes/header.jsp" %>

    <!-- 헤더 끝 -->
    <!-- 마이 페이지 시작 -->
    <section class="mypage wrapper d-flex">
    <!-- 사이드바 시작-->
    <%@include file="../../includes/sidebar.jsp" %>
    <!-- 사이드바 끝-->
        <main>
			<div class="row d-flex flex-column">
			
			  <!-- 메뉴 버튼 -->
			  <div class="col-11">
			    <div class="list-group d-flex flex-row">
			      <a class="me-1 font_1 btn btn-outline-primary active" data-bs-toggle="list" href="#list-home">좋아요 상품</a>
			      <a class="me-1 font_1 btn btn-outline-primary" data-bs-toggle="list" href="#list-profile">작성한 리뷰</a>
			      <a class="me-1 font_1 btn btn-outline-primary" data-bs-toggle="list" href="#recent_product">최근 본 상품</a>
			    </div>
			    <hr/>
			  </div>

			  
			  <div class="col-12 m-auto">
			    <div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">1</div>
			      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">2</div>
			      
			      <!-- 최근 본 상품 -->
			      <div class="d-flex flex-column tab-pane fade" id="recent_product">
					<div class="col-11 mb-2 d-flex justify-content-between">
						<div>
							<span id="recnetCnt" class="ms-1 text-success">0</span>
							<span> 건</span>
						</div>
						<div id="recnetRemoveAll"
							class="me-1 btn btn-outline-danger" style="font-size: 0.7rem">
							<i class="far fa-trash-alt"></i> <span class="ms-1">모두 삭제</span>
						</div>
					</div>
					<div id="recentBody"></div>
			      </div>
			      
			    </div>
			  </div>
			  
			</div>
        </main>
    </section>
    <!-- 마이 페이지 끝 -->
    <!-- 풋터 시작 -->
    <%@include file="../../includes/footer.jsp" %>
    <!-- 풋터 끝 -->
   	<script type="text/javascript">
   		/* 최근 본 상품 쿠키에서 가져오기 */
   		$(document).ready(function(){
			let cookie = $.cookie('recent_product');
			
			if (!cookie) { /* 존재하지 않을 경우에는 메시지만 삽입 */
				$('#recentBody').append('<span class="mt-5 text-center">최근 본 상품이 없습니다.</span>');
			} else { /* 존재하는 경우에는 쿠키값을 꺼내서 최근 본 상품 삽입 */
				let cookieArray = cookie.split("'");
				let array = JSON.parse(cookieArray);
				addRecentProduct(array);	
			}
		});
   		
   		/* 최근 본 상품 그리기 */
   		let addRecentProduct = (array) => {			
			array.forEach((product,i)=>{
				/* 최근 본 상품 부모 태그 생성 */
				$('#recentBody').append('<div id="RecentProductBoody'+i+'" class="col-11 mb-3 d-flex p-2 border border-opacity-50 rounded"><div>');
				
				/* 상품 이미지 태그 추가 */
				$('#RecentProductBoody'+i).append('<a href="/product/'+product.p_no+'"><img class="me-3 border border-dark" alt="" src="'+product.p_img+'" style="width: 100px; height: 130px;"></a>');
				/* 상품 상세 태그 추가 */
				$('#RecentProductBoody'+i).append('<div id="product_content'+i+'" class="col-10 ms-2 d-flex flex-column justify-content-between"></div>');
				$('#product_content'+i).append('<span style="font-size: 1.5rem">'+product.p_title+'</span>');
				$('#product_content'+i).append('<span style="font-size: 0.8rem">'+product.p_author+'</span>');
				$('#product_content'+i).append('<span style="font-size: 0.8rem">'+product.p_publisher+'</span>');
				$('#product_content'+i).append('<span style="font-size: 0.8rem">'+product.p_price+'원</span>');
				/* 개별 삭제 요청 버튼 */
				$('#RecentProductBoody'+i).append('<button class="mt-2 ms-2 btn btn-outline-secondary h-25" style="font-size: 1rem" onclick="recnetRemove('+product.p_no+')"><i class="far fa-trash-alt"></i></button>');
			})
			/* 전체 개수 입력 */
			let cnt = array.length;
			$('#recnetCnt').text(cnt);
		}
   		
		/* 단건 상품 삭제 메서드 */
 		let recnetRemove = (pno) => {
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
					url : "/product/recentRemove",
					contentType: "application/text; charset=UTF-8",
					data : JSON.stringify(obj),
					success : function() {
						if(array.length === 1){
							$('#recentBody').empty();
							$('#recnetCnt').text(0); // 총 개수 변경
							$('#recentBody').append('<span class="mt-5 text-center">최근 본 상품이 없습니다.</span>');
						}else{
							let cookie = $.cookie('recent_product');
							let cookieArray = cookie.split("'");
							let array = JSON.parse(cookieArray);
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
   	</script>
    </body>
    </html>
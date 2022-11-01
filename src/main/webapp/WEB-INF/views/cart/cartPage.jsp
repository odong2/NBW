<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>장바구니</title>
  	<%@include file="/WEB-INF/includes/common.jsp" %>
	<style>
      main {
        width: 1000px;
        margin: auto;
      }
      /* 체크박스 꾸미기 */
      input[type="checkbox"] {
        width: 1rem;
        height: 1rem;
        border-radius: 50%;
        border: 1px solid #999;
        appearance: none;
        cursor: pointer;
        transition: background 0.2s;
      }

      input[type="checkbox"]:checked {
        background: #5055b1;
        border: none;
      }

      .select-all {
        width: 100%;
        height: 40px;
        display: flex;
        align-items: center;
        padding-left: 10px;
        background-color: #eee;
        border-radius: 0.5rem;
      }
      .discount {
        color: goldenrod;
        font-size: small;
      }
      .mem_discount{
      	margin-top: 5px;
      }
      table {
        border-collapse: collapse;
      }
      .order_info,
      .only_chk,
      .prod {
        text-align: center;
        padding: 5px;
      }
      .price {
        color: #999;
        font-size: small;
      }
      i {
        color: #6e6e6e;
      }
      button {
        border: 0;
        outline: 0;
        background-color: white;
      }
      .payments_info_area {
        border: 1px solid #aaa;
        border-radius: 0.5rem;
      }
      ul {
        list-style: none;
        padding-left: 0px;
      }
      #order_btn {
        border: 1px;
        outline: 1px;
        border-radius: 0.5rem;
        padding: 3px;
        font-weight: bold;
        background-color: #5055b1;
        color: white;
      }
      .row{
      	margin-left: 0;
      }
      .img-thumbnail{
      	width: 100px;
		height: 130px;      	
      }
      /* 빈장바구니 담는 div */
      .emptyCart {
        margin-top: 80px;
        text-align: center;
        align-items: center;
      }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
  </head>
  <body>
<c:set var = "c_totalPrice" value = "0" /><!-- 총 주문금액 -->
<script type="text/javascript">
	$(document).ready(function () {
  		/* 체크박스 전체 선택하기 */
    	$("#cbx_chkAll").click(function () {
      		if ($("#cbx_chkAll").is(":checked"))
        		$("input[class=one_chk]").prop("checked", true);
     		else $("input[class=one_chk]").prop("checked", false);
      		/* 체크박스 선택 유무에 따라 총 주문 정보 설정하기 */
      		setTotalCart($(".cart_info"));
    	});
    	$("input[class=one_chk]").click(function () {
     		var total = $("input[class=one_chk]").length;
      		var checked = $("input[class=one_chk]:checked").length;

      		if (total != checked) $("#cbx_chkAll").prop("checked", false);
      		else $("#cbx_chkAll").prop("checked", true);
      		/* 체크박스 선택 유무에 따라 총 주문 정보 설정하기 */
      		setTotalCart($(".cart_info"));
    	});
  		
    	/* 장바구니 총 주문정보 불러오기 */
    	setTotalCart();
	}); // end of ready
  
	/* 총 주문 정보 세팅(배송비, 총 가격, 총 갯수) */
	function setTotalCart(){
		/* 종합 정보 섹션 정보 삽입 */
		let totalPrice = 0;				// 총 가격
		let totalCount = 0;				// 총 갯수
		let deliveryPrice = 0;			// 배송비
		let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
			
		$(".cart_info").each(function(index, element){
			if($(element).find(".one_chk").is(":checked") === true){	//체크여부
				// 총 가격
				totalPrice += parseInt($(element).find(".h_totalPrice").val());
				// 총 갯수
				totalCount += parseInt($(element).find(".h_cart_count").val());
			}
		});	
			
		/* 배송비 결정 - 2만원 이상 구매시 무료배송, 2만원 미만은 배송비 2500원 */
		if(totalPrice >= 20000){
			deliveryPrice = 0;
		} else if(totalPrice == 0){
			deliveryPrice = 0;
		} else {
			deliveryPrice = 2500;	
		}	
			
		/* 최종 가격 */
		finalTotalPrice = totalPrice + deliveryPrice;
			
		/* 값 삽입 */
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString()); //  (###,###)-> js number객체의 toLocaleString()
		// 총 갯수
		$(".totalCount_span").text(totalCount);
		// 배송비
		$(".delivery_price").text(deliveryPrice);	
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	} // end of setTotalCart()
	
	/* 체크여부에 따른 종합 정보 변화 */
	$(".one_chk").on("change", function(){
		/* 총 주문 정보 세팅(배송비, 총 가격, 총 갯수) */
		setTotalInfo($(".cart_info"));
	});
</script>
  <!-- 헤더 시작 -->
	<%@include file="/WEB-INF/includes/header.jsp" %>
  <!-- 헤더 끝 -->
   <!-- 메인 시작 -->
    <main style="position: relative" id="cartmain">
      <section class="title">
        <div class="row mt-3">
          <h2><b>장바구니</b></h2>
        </div>
      </section>
      <section class="d-flex">
        <div class="left d-flex" style="width: 70%; flex-direction: column">
          <!-- [[ 장바구니 전체 선택 시작 ]]-->
          <div class="select-all mt-3 mb-3">
            <input type="checkbox" class="all_chk me-3" id="cbx_chkAll" />
            <label for="all"><b>전체선택</b></label>
          </div>
          <!-- [[ 장바구니 전체 선택  끝 ]]-->
          <div class="container d-flex col-12 justify-content-between" style="width: 100%">
            <section class="cartProduct col-12">
              <table class="tb_product col-12">
                <tbody>
                  <!-- [[ 장바구니에 담은 상품 목록]] -->
                  <c:choose>
		          	<c:when test="${cartList != null && cartList.size() > 0 && sessionScope.member != null}">
		                  <c:forEach var="cart" items="${cartList}">
			                  <tr class="row">
			                    <td class="col-1 d-flex justify-content-center align-items-center only_chk cart_info">
			                      	<input type="checkbox" class="one_chk" />
								  	<input type="hidden" class="h_p_price" value="${cart.P_PRICE}">
									<input type="hidden" class="h_cart_count" value="${cart.CART_COUNT}">
									<input type="hidden" class="h_totalPrice" value="${cart.P_PRICE * cart.CART_COUNT}">
									<input type="hidden" class="h_p_no" value="${cart.P_NO}">								
			                    </td>
			                    <td class="col-2 d-flex prod">
			                      <div class="prod_img">
			                        <img
			                          class="img-thumbnail"
			                          src="${cart.P_IMG}"
			                        />
			                      </div>
			                    </td>
			                    <td
			                      class="col-5 d-flex justify-content-center align-items-center product_info"
			                      style="flex-direction: column"
			                    >
			                      <div class="prod_title d-flex">
			                        <b>${cart.P_TITLE}</b>
			                      </div>
			                      <div class="mem_discount">
			                        <span class="price">
			                          <span class="price">권당 가격:</span>
			                          <span class="price">${cart.P_PRICE}</span>
			                          <span class="price">원</span>
			                        </span>
			                      </div>
			                    </td>
			                    <td
			                      class="col-3 d-flex justify-content-center align-items-center order_info"
			                      style="flex-direction: column"
			                    >
			                      <div class="order_price" style="font-weight: bold">
			                        <span><fmt:formatNumber value="${cart.P_PRICE*cart.CART_COUNT}" type="number" pattern="#,### 원"/></span>
			                      </div>
			                      <div class="product_count mt-3">
			                      	<c:choose>
					                <c:when test="${cart.CART_COUNT eq 1}">
					                	 <button disabled><i class="fas fa-minus-circle"></i></button>	                
					                </c:when>
					                <c:otherwise>
				                        <button class="count_btn" data-btn="minus" data-pno="${cart.P_NO}" data-cnt="${cart.CART_COUNT}" onClick=update_cart(this);><i class="fas fa-minus-circle"></i></button>
					                </c:otherwise>
					                </c:choose>
			                        <span>${cart.CART_COUNT}</span>
			                        <button class="count_btn"  data-btn="plus" data-pno="${cart.P_NO}" data-cnt="${cart.CART_COUNT}" onClick=update_cart(this);><i class="fas fa-plus-circle"></i></button>
			                      </div>
			                    </td>
			                    <td
			                      class="col-1 d-flex justify-content-center align-items-center"
			                    >
			                    <!-- 삭제 보내는 form -->
			                    <form action="/cart/remove" method="post">
			                      <input type="hidden" value="${cart.P_NO}" name="p_no" >
			                      <button type="submit">
			                        <i class="fas fa-trash-alt" style="color: #e9967a"></i>
			                      </button>
			                    </form>
			                    </td>
			                  </tr>
			                  <c:set var= "c_totalPrice" value="${c_totalPrice + cart.P_PRICE*cart.CART_COUNT}"/>
		                  </c:forEach>
                  	</c:when>
                  	<c:when test="${sessionScope.member == null && cookie.cart != null}">
                  		<div class="cart_cookie"></div>
                  	</c:when>
                  	<c:otherwise>
                  		<div class="emptyCart">장바구니에 담긴 상품이 없어요.</div>
                  	</c:otherwise>
                  </c:choose>
                  <!-- [[ 장바구니에 담은 상품 목록]] -->
                </tbody>
              </table>
            </section>
          </div>
        </div>
        <!-- [[ 결제 정보 시작 - 페이지 내에서 고정 ]] -->
        <div
          class="right d-flex"
          style="
            width: 300px;
            height: 270px;
            display: flex;
            justify-content: end;
            position: fixed;
            left: 67%;
          "
        >
          <!-- 상품 금액+배송비 -->
          <div
            class="payments_info_area container m-3 p-3 d-flex col-12"
            style="width: 90%; flex-direction: column"
          >
            <div class="row d-flex" style="width: 100%">
              <div class="col-4 d-flex">
                <p style="font-size: small">상품금액</p>
              </div>
              <div class="col-8 d-flex justify-content-end">
                <span style="font-size: small" class="totalPrice_span"><b></b></span>
                <span style="font-size: small"><b>원</b></span>
              </div>
            </div>
            <div class="row d-flex" style="width: 100%">
              <div class="col-4 d-flex">
                <p style="font-size: small">배송비</p>
              </div>
              <div class="col-8 d-flex justify-content-end">
                <span style="align-items: center">+</span>
                <span style="font-size: small" class="delivery_price"><b></b></span>
                <span style="font-size: small"><b>원</b></span>
              </div>
            </div>
            <!-- 결제 예정금액 + 주문버튼 -->
            <div
              class="row d-flex"
              style="width: 100%; border-top: 1px solid #999"
            >
              <div class="col-8 d-flex mt-3">
                <p style="font-size: small"><b>결제 예정 금액</b></p>
              </div>
              <div class="col-4 d-flex justify-content-end mt-3">
                <span class="finalTotalPrice_span"><b></b></span>
                <span><b>원</b></span>
              </div>
            </div>
            <button type="button" class="mt-3" id="order_btn">
              <span>주문하기(</span>
              <span class="totalCount_span"></span>
              <span>)</span>
            </button>
          </div>
        </div>
        <!-- [[ 결제 정보 시작 - 페이지 내에서 고정 ]] -->
      </section>
    </main>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
<script type="text/javascript">
	/* 상품 수량 변경하기 */
	function update_cart(button) {
		
		let btn = $(button).attr("data-btn");
		let pno = $(button).attr("data-pno");
		let cnt = $(button).attr("data-cnt");
		
 		$.ajax({
				type : "post",
				url : "${contextPath}/cart/modify",
				data : {
					p_no:pno,
					btn: btn,
					cart_count: cnt
				},
				success : function(count) {
					location.reload();
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
				},
				complete : function(data, textStatus) {
				}
		}); //end of ajax
	}// end of update_cart()
	
	/* 비회원 장바구니 화면 그려주기 시작 */
	// 배열 형태의 쿠키값 얻어오기
	if($.cookie('cart') != undefined){
		
		let carts = JSON.parse($.cookie('cart'));
		
		// 배열에 있는 쿠키 값 꺼내오기
	 	let cartInfo = function (carts) {
			let oneRow = '';
			carts.forEach(function(cart){
				let pno = cart.pno;
				let title = cart.title;
				let img = cart.img;
				let price = parseInt(cart.price);
				let count = parseInt(cart.count);
				console.log(cart);	
				oneRow +=`<tr class="row">
				            <td class="col-1 d-flex justify-content-center align-items-center only_chk cart_info">
				              	<input type="checkbox" class="one_chk" />
							  	<input type="hidden" class="h_p_price" value="${'${price}'}">
								<input type="hidden" class="h_cart_count" value="${'${count}'}">
								<input type="hidden" class="h_totalPrice" value="${'${price*count}'}">
								<input type="hidden" class="h_p_no" value="${'${pno}'}">								
				            </td>
				            <td class="col-2 d-flex prod">
				              <div class="prod_img">
				                <img
				                  class="img-thumbnail"
				                  src="${'${img}'}"
				                />
				              </div>
				            </td>
				            <td
				              class="col-5 d-flex justify-content-center align-items-center product_info"
				              style="flex-direction: column"
				            >
				              <div class="prod_title d-flex">
				                <b>${'${title}'}</b>
				              </div>
				              <div class="mem_discount">
				                <span class="price">
				                  <span class="price">권당 가격:</span>
				                  <span class="price">${'${price}'}</span>
				                  <span class="price">원</span>
				                </span>
				              </div>
				            </td>
				            <td
				              class="col-3 d-flex justify-content-center align-items-center order_info"
				              style="flex-direction: column"
				            >
				              <div class="order_price" style="font-weight: bold">
				                <span>${'${price*count}'}원</span>
				              </div>
				              <div class="product_count mt-3">
				                <button class="count_btn"><i class="fas fa-minus-circle"></i></button>
				                <span>${'${count}'}</span>
				                <button class="count_btn"><i class="fas fa-plus-circle"></i></button>
				              </div>
				            </td>
				            <td
				              class="col-1 d-flex justify-content-center align-items-center"
				            >
				              <input type="hidden" value="${'${pno}'}" name="p_no" >
				              <button type="submit">
				                <i class="fas fa-trash-alt" style="color: #e9967a"></i>
				              </button>
				            </td>
				          </tr>
				          `;
			}); // end of forEach
			
			
			return oneRow;
		}// end of cartInfo
		
		$(".cart_cookie").html(cartInfo(carts));
	}// end of if
		
	/* 비회원 화면 그려주기 끝 */
</script>
  </body>
</html>
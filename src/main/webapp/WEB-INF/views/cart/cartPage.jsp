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
  </head>
  <body>
<c:set  var="totalProductsNum" value="0" />  <!--주문 개수 -->
<c:set var = "totalPrice" value = "0" /><!-- 총 주문금액 -->
  <script type="text/javascript">
  /* 체크박스 전체 선택하기 */
  $(document).ready(function () {
    $("#cbx_chkAll").click(function () {
      if ($("#cbx_chkAll").is(":checked"))
        $("input[class=one_chk]").prop("checked", true);
      else $("input[class=one_chk]").prop("checked", false);
    });

    $("input[class=one_chk]").click(function () {
      var total = $("input[class=one_chk]").length;
      var checked = $("input[class=one_chk]:checked").length;

      if (total != checked) $("#cbx_chkAll").prop("checked", false);
      else $("#cbx_chkAll").prop("checked", true);
    });
  });
  </script>
  <!-- 헤더 시작 -->
	<%@include file="/WEB-INF/includes/header.jsp" %>
  <!-- 헤더 끝 -->
   <!-- 메인 시작 -->
    <main style="position: relative">
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
		          	<c:when test="${cartList != null && cartList.size() > 0}">
		                  <c:forEach var="cart" items="${cartList}">
			                  <tr class="row">
			                    <td class="col-1 d-flex justify-content-center align-items-center only_chk">
			                      <input type="checkbox" class="one_chk" />
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
			                      <div class="prod_title">
			                        <b>${cart.P_TITLE}</b>
			                      </div>
			                      <div class="mem_discount">
			                        <span class="price">
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
			                        <span><fmt:formatNumber value="${cart.P_PRICE*cart.CART_COUNT}" type="number"/></span>
			                        <span>원</span>
			                      </div>
			                      <div class="product_count mt-3">
			                        <button><i class="fas fa-minus-circle"></i></button>
			                        <span>${cart.CART_COUNT}</span>
			                        <button><i class="fas fa-plus-circle"></i></button>
			                      </div>
			                    </td>
			                    <td
			                      class="col-1 d-flex justify-content-center align-items-center"
			                    >
			                      <button>
			                        <i class="fas fa-trash-alt" style="color: #e9967a"></i>
			                      </button>
			                    </td>
			                  </tr>
			                  <c:set var= "totalPrice" value="${totalPrice + cart.P_PRICE*cart.CART_COUNT}"/>
		                  </c:forEach>
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
                <span style="font-size: small"><b>${totalPrice }</b></span>
                <span style="font-size: small"><b>원</b></span>
              </div>
            </div>
            <div class="row d-flex" style="width: 100%">
              <div class="col-4 d-flex">
                <p style="font-size: small">배송비</p>
              </div>
              <div class="col-8 d-flex justify-content-end">
                <span style="align-items: center">+</span>
                <span style="font-size: small"><b>0</b></span>
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
                <span><b>${totalPrice }</b></span>
                <span><b>원</b></span>
              </div>
            </div>
            <button type="button" class="mt-3" id="order_btn">
              <span>주문하기</span>
              <span>(1)</span>
            </button>
          </div>
        </div>
        <!-- [[ 결제 정보 시작 - 페이지 내에서 고정 ]] -->
      </section>
    </main>
<!-- 풋터 시작 -->
<%@include file="../../includes/footer.jsp" %>
<!-- 풋터 끝 -->
  </body>
</html>
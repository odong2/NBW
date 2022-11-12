<%@ page contentType="text/html;charset=UTF-8" language="java" %>
      <!-- Sidebar -->
      <section class="fixed-top" style="width: 224px">
        <ul
          class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion p-0"
          id="accordionSidebar"
        >
          <!-- Sidebar - Brand -->
          <a
            class="sidebar-brand d-flex align-items-center justify-content-center"
            href="index.html"
          >
            <div class="sidebar-brand-icon">
              <img src="/images/nbwlogo.png" alt="로고" class="logo" />
            </div>
            <div class="sidebar-brand-text mx-3"><b> NBW</b></div>
          </a>

          <!-- Divider -->
          <hr class="sidebar-divider my-0" />

          <!-- Nav Item - [상품, 공지사항, 문의사항 관리] -->
          <li class="nav-item active">
            <a class="nav-link" href="/admin/product/list">
              <img
                src="/images/books.png"
                alt=""
                class="img-icon"
                style="margin-right: 16px"
              />
              <span><b>상품 관리</b></span></a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/notice/list">
              <img
                src="/images/notice.png"
                alt=""
                class="img-icon"
                style="margin-right: 16px"
              />
              <span><b>공지사항 관리</b></span></a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/coupon/list">
              <img
                      src="/images/coupon.png"
                      alt=""
                      class="img-icon"
                      style="margin-right: 16px"
              />
              <span><b>쿠폰 관리</b></span></a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/qna/list">
              <img
                src="/images/qna.png"
                alt=""
                class="img-icon"
                style="margin-right: 16px"
              />
              <span><b>문의사항 관리</b></span></a
            >
          </li>
          <!-- Divider -->
          <hr class="sidebar-divider" />

          <!-- Nav Item - [주문(배송 전 상품, 교환&반품)관리, 행사(글, 신청자)관리] -->
          <li class="nav-item">
            <a
              class="nav-link collapsed"
              href="#"
              data-toggle="collapse"
              data-target="#collapseOne"
              aria-expanded="true"
              aria-controls="collapseOne"
            >
              <img
                src="/images/received.png"
                alt=""
                class="img-icon"
                style="margin-right: 16px"
              />
              <span><b>주문 관리</b></span>
            </a>
            <div
              id="collapseOne"
              class="collapse"
              aria-labelledby="headingOne"
              data-parent="#accordionSidebar"
            >
              <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="/admin/payment/shipmentlist">배송 전 상품</a>
                <a class="collapse-item" href="/admin/payment/cancellist">반품 요청 상품</a>
                <a class="collapse-item" href="/admin/payment/list">전체 주문 조회</a>
              </div>
            </div>
          </li>
          <li class="nav-item">
            <a
              class="nav-link collapsed"
              href="#"
              data-toggle="collapse"
              data-target="#collapseTwo"
              aria-expanded="true"
              aria-controls="collapseTwo"
            >
              <img
                src="/images/calendar.png"
                alt=""
                class="img-icon"
                style="margin-right: 16px"
              />
              <span><b>행사 관리</b></span>
            </a>
            <div
              id="collapseTwo"
              class="collapse"
              aria-labelledby="headingTwo"
              data-parent="#accordionSidebar"
            >
              <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="buttons.html">글 등록</a>
                <a class="collapse-item" href="cards.html">신청자 관리</a>
              </div>
            </div>
          </li>
          <!-- Divider -->
          <hr class="sidebar-divider" />

          <!-- Nav Item - [채팅 -- 나중에 채팅 후 수정할 부분] -->
          <li class="nav-item">
            <a
              class="nav-link collapsed"
              href="#"
              data-toggle="collapse"
              data-target="#collapseChat"
              aria-expanded="true"
              aria-controls="collapseChat"
            >
              <img
                src="/images/chat.png"
                alt=""
                class="img-icon"
                style="margin-right: 16px"
              />
              <span><b>채팅</b></span>
            </a>
            <div
              id="collapseChat"
              class="collapse"
              aria-labelledby="headingChat"
              data-parent="#accordionSidebar"
            >
              <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Login Screens:</h6>
                <a class="collapse-item" href="login.html">Login</a>
                <a class="collapse-item" href="register.html">Register</a>
                <a class="collapse-item" href="forgot-password.html"
                  >Forgot Password</a
                >
                <div class="collapse-divider"></div>
                <h6 class="collapse-header">Other Pages:</h6>
                <a class="collapse-item" href="404.html">404 Page</a>
                <a class="collapse-item" href="blank.html">Blank Page</a>
              </div>
            </div>
          </li>

          <!-- Divider -->
          <hr class="sidebar-divider d-none d-md-block" />
        </ul>
      </section>
      <!-- End of Sidebar -->

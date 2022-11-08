<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- jstl formating tags--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- jstl core tags--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var = "questionIngList" value = "${questionIngList}"/>
        <c:set var = "ingCnt" value = "${ingCnt}"/>
        <!-- Topbar -->
        <nav
          class="navbar navbar-expand navbar-light bg-white topbar shadow p-0"
          id="main-header"
        >
          <!-- Sidebar Toggle (Topbar) -->
          <button
            id="sidebarToggleTop"
            class="btn btn-link d-md-none rounded-circle mr-3"
          >
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
            <!-- Nav Item - [문의사항 알림] -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="alertsDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="fas fa-bell fa-fw"></i>
                <!-- 문의 온 갯수 -->
                <span class="badge badge-danger badge-counter">${ingCnt}</span>
              </a>
              <!-- 문의사항 목록 -->
              <div
                class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="alertsDropdown"
              >
                <h6 class="dropdown-header">문의사항 알림</h6>
                <!-- [[ 목록 리스트  시작 ]] -->
                <c:forEach var="ingList" items="${questionIngList}" varStatus="status"  begin="0" end="4">
                <a class="dropdown-item d-flex align-items-center" href="/admin/qna/answer?qn_no=${ingList.qn_no}">
                  <div class="mr-3">
                    <!-- 문의사항 카테고리-[제품: primary] -->
                    <c:choose>
                    <c:when test="${ingList.qn_category eq '제품'}">
                    	<div class="icon-circle bg-primary">
                      		<i class="fas fa-book text-white"></i>
                    	</div>
                    </c:when>
                    <c:when test="${ingList.qn_category eq '교환'}">
                     	<!-- 문의사항 카테고리-[교환: success] -->
	                    <div class="icon-circle bg-success">
	                      <i class="fas fa-sync-alt text-white"></i>
	                    </div>
                    </c:when>
                    <c:when test="${ingList.qn_category eq '반품'}">
                    	<!-- 문의사항 카테고리-[반품: warning] -->
	                    <div class="icon-circle bg-warning">
	                      <i class="fas fa-times text-white"></i>
	                    </div>
                    </c:when>
                    <c:otherwise>
                    	<!-- 문의사항 카테고리-[기타: secondary] -->
	                    <div class="icon-circle bg-secondary">
	                      <i class="fas fa-question text-white"></i>
	                    </div>
                    </c:otherwise>
                    </c:choose>
                  </div>
                  <div>
                    <!-- 문의 온 시간 -->
                    <div class="small text-gray-500"><fmt:formatDate value="${ingList.qn_cdate}" pattern="yyyy-MM-dd"/></div>
                    ${ingList.qn_title}
                  </div>
                </a>
                </c:forEach>
                <!-- [[ 목록 리스트  끝  ]] -->
                <a
                  class="dropdown-item text-center small text-gray-500"
                  href="/admin/qna/list"
                  >문의사항 모두 보기</a
                >
              </div>
            </li>

            <!-- Nav Item - [교환 및 반품 알림] -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="messagesDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="fas fa-box"></i>
                <!-- 알림이 온 갯수 -->
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              <!-- Dropdown - 알림 내용 -->
              <div
                class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="messagesDropdown"
              >
                <h6 class="dropdown-header">교환 및 반품 신청 목록</h6>
                <!-- [[ 목록 리스트 시작 ]] -->
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <!-- 문의사항 카테고리-[교환: success] -->
                    <div class="icon-circle bg-success">
                      <i class="fas fa-sync-alt text-white"></i>
                    </div>
                  </div>
                  <div>[책 제목]</div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <!-- 문의사항 카테고리-[반품: warning] -->
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-times text-white"></i>
                    </div>
                  </div>
                  <div>[책 제목]</div>
                </a>
                <!-- [[ 목록 리스트  끝  ]] -->
                <a
                  class="dropdown-item text-center small text-gray-500"
                  href="#"
                  >교환 및 반품 목록 확인하기</a
                >
              </div>
            </li>
            <div class="topbar-divider d-none d-sm-block"></div>
            <!-- Nav Item - [관리자 정보] -->
            <li class="nav-item dropdown no-arrow">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="userDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                  >관리자 님</span
                >
                <img
                  class="img-profile rounded-circle"
                  src="/images/protection.png"
                />
              </a>
              <!-- Dropdown - [로그아웃] -->
              <div
                class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="userDropdown"
              >
                <a
                  class="dropdown-item"
                  href="#"
                  data-toggle="modal"
                  data-target="#logoutModal"
                >
                  <i
                    class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"
                  ></i>
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- End of Topbar -->
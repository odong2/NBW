<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>관리자 메인페이지</title>

    <!-- Custom fonts for this template-->
    <link
      href="/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />

    <!-- Custom styles for this template-->
    <link href="/vendor/css/sb-admin-2.min.css" rel="stylesheet" />
    <style>
      body {
        width: 100%;
        padding: 0px;
        height: 130vh;
        box-sizing: border-box;
      }
      #content {
        height: 80vh;
      }
      /* 엔비더 로고 */
      .logo {
        width: 100%;
      }
      /* 사이드 바 배경 색 */
      .bg-gradient-primary {
        background-color: #d81bfe;
        background-image: linear-gradient(180deg, #d81bfe 10%, #8000ff 100%);
        background-size: cover;
      }
      /* 검색 누르는 곳 버튼 색상 */
      .btn-primary {
        color: #fff;
        background-color: #d81bfe;
        border-color: #cf18f4;
      }
      /* 사이드바 아이콘 이미지 사이즈 결정 */
      .img-icon {
        width: 24px;
        height: 24px;
      }
      /* 사이드바 구분 선 색상 */
      .sidebar-dark hr.sidebar-divider {
        border-top: 1px solid #eee;
      }
      /* 상단 알림바 드롭다운 배경색 변경 */
      .topbar .dropdown-list .dropdown-header {
        background-color: #d81bfe;
        border: 1px solid #d81bfe;
        padding-top: 0.75rem;
        padding-bottom: 0.75rem;
        color: #fff;
      }
      .contentdiv {
        flex-direction: column;
        /* position: relative;
        left: 224px; */
        width: 100%;
        padding: 0;
      }
    </style>
  </head>
  <body id="page-top">
    <!-- Page Wrapper -->
    <div class="d-flex justify-content-start">
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
            <a class="nav-link" href="index.html">
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
            <a class="nav-link" href="index.html">
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
            <a class="nav-link" href="index.html">
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
                <a class="collapse-item" href="buttons.html">배송 전 상품</a>
                <a class="collapse-item" href="cards.html">교환 & 반품</a>
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

      <!-- Content Wrapper -->
      <!-- [[ 오른쪽 div 시작 ]] -->
      <section class="contentdiv d-flex" style="margin-left: 224px">
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
                <span class="badge badge-danger badge-counter">4+</span>
              </a>
              <!-- 문의사항 목록 -->
              <div
                class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="alertsDropdown"
              >
                <h6 class="dropdown-header">문의사항 알림</h6>
                <!-- [[ 목록 리스트  시작 ]] -->
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <!-- 문의사항 카테고리-[제품: primary] -->
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-book text-white"></i>
                    </div>
                  </div>
                  <div>
                    <!-- 문의 온 시간 -->
                    <div class="small text-gray-500">2022-10-19</div>
                    책 언제 들어와요?
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <!-- 문의사항 카테고리-[교환: success] -->
                    <div class="icon-circle bg-success">
                      <i class="fas fa-sync-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">2020-11-15</div>
                    교환 해줘
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <!-- 문의사항 카테고리-[반품: warning] -->
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-times text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">2019-02-21</div>
                    책 상태가 이상해요 반품해주세요
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <!-- 문의사항 카테고리-[기타: secondary] -->
                    <div class="icon-circle bg-secondary">
                      <i class="fas fa-question text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">2019-02-21</div>
                    배송 언제와요????????
                  </div>
                </a>
                <!-- [[ 목록 리스트  끝  ]] -->
                <a
                  class="dropdown-item text-center small text-gray-500"
                  href="#"
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
        <div id="content-wrapper" class="d-flex flex-column">
          <!-- Main Content -->
          <div id="content">
            <!-- Begin Page Content [[ 메인 시작 ]] -->
            <div class="container-fluid">
              <!-- ******************[[ 이부분이 메인 들어갈 부분 ]]****************** -->
            </div>
            <!-- /.container-fluid -->
          </div>
          <!-- End of Main Content [[ 메인 끝 ]]-->
        </div>
        <!-- Footer -->
        <footer class="bg-white mt-auto">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright &copy; <b>No Book is Worthless</b> 2022</span>
            </div>
          </div>
        </footer>
        <!-- End of Footer -->
        <!-- End of Content Wrapper -->
      </section>
    </div>
    <!-- [[ 오른쪽 div 끝 ]] -->
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>

    <!-- Custom scripts for all pages-->
    <script src="/vendor/js/sb-admin-2.min.js" type="text/javascript"></script>
  </body>
</html>
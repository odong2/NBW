<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div class="d-flex flex-wrap">
    <div class="col-2"></div>
    <nav class="d-flex align-items-center flex-column mb-3 col-8">
        <ul
                class="col-12 nav nav-pills d-flex justify-content-end p-2"
                style="font-size: 13px"
        >
            <li class="nav-item">
                <a href="#" class="text-decoration-none px-3 border-end rounded-0"
                >김동현님
                    <div id="state_ing" class="badge bg-warning rounded-pill">
                        GOLD
                    </div></a
                >
            </li>
            <li class="nav-item">
                <a href="#" class="text-decoration-none px-3 border-end rounded-0"
                >로그인</a
                >
            </li>
            <li class="nav-item">
                <a href="#" class="text-decoration-none px-3 border-end rounded-0"
                >주문내역</a
                >
            </li>
            <li class="nav-item">
                <a href="#" class="text-decoration-none px-3">
                    <i class="fas fa-shopping-cart"></i>
                    장바구니
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="text-decoration-none px-3 border-start rounded-0"
                >문의하기</a
                >
            </li>
        </ul>
        <div class="col-12 d-flex">
          <span class="col-2 fs-4 text-center"
          ><i class="fas fa-book"></i> 엔비더</span
          >
            <div class="input-group">
                <input
                        type="text"
                        class="form-control"
                        placeholder="검색어를 입력해주세요."
                        aria-label="Recipient's username"
                        aria-describedby="button-addon2"
                />
                <button
                        class="btn btn-outline-secondary"
                        type="button"
                        id="button-addon2"
                >
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </nav>
    <div class="col-2"></div>
</div>
<nav class="navbar bg-primary" aria-label="Light offcanvas navbar">
    <div class="col-2"></div>
    <ul class="nav nav-pills d-flex align-items-center p-1 col-10">
        <li
                class="nav-item px-4 border-end text-white"
                data-bs-toggle="offcanvas"
                data-bs-target="#offcanvasNavbarLight"
                aria-controls="offcanvasNavbarLight"
                style="cursor: pointer"
        >
            <i class="fas fa-bars"></i>
        </li>
        <li class="nav-item px-4 border-end">
            <a href="#" class="text-decoration-none text-white">공지사항</a>
        </li>
        <li class="nav-item px-4 border-end">
            <a href="#" class="text-decoration-none text-white">문의사항</a>
        </li>
        <li class="nav-item px-4 border-end">
            <a href="#" class="text-decoration-none text-white">프로그램 신청</a>
        </li>
        <li class="nav-item px-4">
            <a href="#" class="text-decoration-none text-white">커뮤니티</a>
        </li>
    </ul>
    <div class="col-1"></div>
</nav>
</body>
</html>

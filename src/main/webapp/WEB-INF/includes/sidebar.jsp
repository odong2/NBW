<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div
        class="offcanvas offcanvas-start text-center"
        tabindex="-1"
        id="offcanvasNavbarLight"
        aria-labelledby="offcanvasNavbarLightLabel"
        style="width: 200px"
>
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLightLabel">
            국내 도서
        </h5>
        <button
                type="button"
                class="btn-close"
                data-bs-dismiss="offcanvas"
                aria-label="Close"
        ></button>
    </div>
    <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
            <li class="nav-item">
                <a class="nav-link" href="#">자연과학</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">사회과학</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">기술과학</a>
            </li>
            <li class="nav-item dropdown">
                <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        role="button"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                >
                    철학
                </a>
                <ul class="dropdown-menu text-center">
                    <li><a class="dropdown-item" href="#">심리학</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li>
                        <a class="dropdown-item" href="#">윤리학</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        role="button"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                >
                    역사
                </a>
                <ul class="dropdown-menu text-center">
                    <li><a class="dropdown-item" href="#">지리</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li>
                        <a class="dropdown-item" href="#">과학</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="/WEB-INF/includes/common.jsp" %>
    <title>Home</title>
  <style>
      /**{*/
      /*    border: 1px solid red;*/
      /*}*/
    a {
      color: black;
    }
    main{
        width:70%;
        margin:auto;
    }
  </style>
</head>
<body>
<!-- 헤더 시작 -->
<%@include file="/WEB-INF/includes/header.jsp" %>
<!-- 헤더 끝 -->
    <main>
        <br>
        <section class="slide-img-wrap">
            <section>
                <div class="recent=product">
                    <div class="slide-img-wrap">
                        <div class="slide-img" style="height: 400px; ">
                            <div><a><img src="/images/main-img1.png" width="950" /></a></div>
                            <div><a><img src="/images/main-img2.png" width="950"/></a></div>
                            <div><a><img src="/images/main-img3.png" width="950"/></a></div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
        <br>
        <br>
        <section class="recomand-product-sec">
            <section>
                <div class="card" style="padding-top: 30px; padding-bottom: 20px; background-color: #dae8ff">
                    <div class="card-title" style="text-align: right; padding-right: 40px;"><h3>📚 새로 나온 책</h3></div>
                    <hr>
                    <div class="card-body" style="text-align: center; padding-top:20px; padding-left: 40px;">
                        <div><img src="/images/testbook1.png" width="200"/></div>
                        <div><img src="/images/testbook2.png" width="200"/></div>
                        <div><img src="/images/testbook3.png" width="200"/></div>
                        <div><img src="/images/testbook4.png" width="200"/></div>
                        <div><img src="/images/testbook5.png" width="200"/></div>
                        <div><img src="/images/testbook6.png" width="200"/></div>
                    </div>
                </div>
            </section>
        </section>

    </main>
<!-- 풋터 시작 -->
<%@include file="/WEB-INF/includes/footer.jsp" %>
<!-- 풋터 끝 -->
</body>
</html>
<script type="text/javascript">
    	$(function(){
                $(".slide-img").slick(
                    {
                        dots: true,
                        autoplay: true,
                        autoplaySpeed: 2000
                    }
                );

                $('.card-body').slick({
                      dots: true,
                      infinite: false,
                      speed: 300,
                      slidesToShow: 4,
                      slidesToScroll: 4,
                      responsive: [
                        {
                          breakpoint: 1024,
                          settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3,
                            infinite: true,
                            dots: true
                          }
                        },
                        {
                          breakpoint: 600,
                          settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
                          }
                        },
                        {
                          breakpoint: 480,
                          settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                          }
                        }
                      ]
                    });
        })
</script>
<style>
    @font-face {
        font-family: 'ChosunLo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunLo.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    h3{
        font-family: 'ChosunLo';
        color: #343a40;
    }
</style>
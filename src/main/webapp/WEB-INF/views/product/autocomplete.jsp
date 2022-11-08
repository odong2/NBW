<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #autocomplete {
        border: 1px solid #747474;
        padding: 20px 20px;
        position: fixed;
        background-color: white;
        z-index: 999;
        top: 125px;
        left: 480px;
        width: 670px;
        height: 450px;
        border-radius: 10px;
    }
    *{
        border: 1px solid red;
    }

</style>
<script>
    $(function(){
    //    사용자가 메인 검색창에 마우스를 올리면 .autocomplete 가 hidden false 로 변경된다.
    //  그리고 ajax 통신을 통해 사용자가 입력한 키워드에 맞는 상품이 미리보기로 조회된다.
    })
</script>
<section class="main_search">
    <section>
            <div class="row" id="autocomplete" style="padding: 30px 20px;"> <%--    사용자가 검색창에 focus 를 맞추면 hidden 이 해제될 예정입니다.    --%>
                <div class="col-7">
                <div class="row" id="recommand">
<%--                    <div class="row" style="height: 50px; float: right;">--%>
<%--                        <div class="col-10"></div>--%>
<%--                        <div class="col" style="width: 10px;"><button id="auto_btn_close" style="border: none; background-color: transparent; float: left;"><i class="fas fa-times-circle fa-2x"></i></button></div>--%>
<%--                    </div>--%>
                    <div class="row" style="height: 120px;">
                        <div class="col-3" style="padding-top: 5px;"><span style="height: 100px;"><img src="https://image.aladin.co.kr/product/26556/36/cover/k602738939_1.jpg" style="height: 102px; border-radius: 10px;"></span></div>
                        <div class="col-9" style="padding-top:10px;">
                            <div class="row" style="height: 30px;"><p style="font-size: medium; font-weight: bolder">흔한 남매</p></div>
                            <div class="row" style="height: 30px;"><p style="font-size: small">저자</p></div>
                            <div class="row" style="height: 30px;"><p style="font-size: 13px;">가격</p></div>
                        </div>
                    </div>
                </div>
                </div>
                <div class="col-5">
                    <h6><strong>최근 검색어</strong></h6>
                    <div class="card" style="width: 100%; border-style: none; padding: 100px 30px; text-align: center;">
                        <div class="card-body">
                            <i class="far fa-info-square fa-2x"></i><br><br>
                            <p style="color: #5e6269; font-size: smaller;">최근 검색어가 없습니다.</p>
                        </div>
                    </div>
                </div>
        </div>
    </section>
</section>


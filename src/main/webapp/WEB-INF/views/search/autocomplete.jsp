<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #autocomplete {
        border: 1px solid #747474;
        padding: 20px 20px;
        position: fixed;
        background-color: white;
        z-index: 999;
        top: 110px;
        left: 480px;
        width: 670px;
        height: 450px;
        border-radius: 10px;
    }
</style>
    <section>
            <div class="row" id="autocomplete" style="padding: 10px 10px;" hidden> <%--    사용자가 검색창에 focus 를 맞추면 hidden 이 해제될 예정입니다.    --%>
                <div class="row" style="width: 100%;">
                    <div class="col"><button id="auto_btn_close" style="border: none; background-color: transparent; float: right;"><i class="fas fa-times-circle fa-2x"></i></button></div>
                </div>
                <div class="col-7">
                    <div class="row" id="recommand">
                </div>
                </div>

                <div class="col-5">
                    <h6><strong>최근 검색어</strong></h6>
                    <div class="card" style="width: 100%;  border: 1px solid #3b5998; padding: 100px 30px; text-align: center;">
                        <div class="card-content">
                            <i class="far fa-info-square fa-2x"></i><br><br>
                            <p style="color: #5e6269; font-size: smaller;">최근 검색어가 없습니다.</p>
                        </div>
                    </div>
                </div>
        </div>
    </section>



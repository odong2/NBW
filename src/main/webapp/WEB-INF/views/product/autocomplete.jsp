<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .autocomplete {
        border: 1px solid #747474;
        padding: 20px 20px;
        position: fixed;
        background-color: white;
        z-index: 999;
        top: 112px;
        left: 460px;
        width: 680px;
        height: 500px;
        border-radius: 10px;
    }
</style>
<section class="main_search">
    <section>
        <div class="autocomplete" hidden> <%--    사용자가 검색창에 focus 를 맞추면 hidden 이 해제될 예정입니다.    --%>
            <div class ="row" id="autocomplete_header" style="float: right;">
                <button id="auto_btn_close" style="margin-right:10px; border: none; background-color: transparent;"><i class="fas fa-times-circle fa-2x"></i></button>
            </div>
            <div class="row" id="recommand">
                <div class="col">여기에 검색어 추천 상품들이 미리보기로 뜰 예정입니다.</div>
                <div class="col">여기에 최근 검색한 키워드가 저장되어 뜰 예정입니다.
                        <div class="row-1">
                            <label>검색어저장</label><input type="button" value="끄기">
                        </div>
                </div>
            </div>
        </div>
    </section>
</section>


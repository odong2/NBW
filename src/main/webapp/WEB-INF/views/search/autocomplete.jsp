<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    @font-face {
        font-family: 'InfinitySans-RegularA1';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    #autocomplete {
        font-family: 'InfinitySans-RegularA1';
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
            <div class="row" id="autocomplete" style="padding: 10px 30px;" hidden>
                <div>
                    <div class="col"><button id="auto_btn_close" style="border: none; background-color: transparent; float: right;"><i class="fas fa-times-circle fa-2x"></i></button></div>
                </div>

                    <div class="row" id="recommand">
                    </div>
                </div>
        </div>
    </section>



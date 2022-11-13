<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    $(function(){

        $("#mainSearch").keyup(function(){
            $('#autocomplete').attr("hidden", false);
            let keyword = $(this).val();
            $.ajax({
                type:"POST",
                async: true,
                url:"/product/autocomplete?keyword="+keyword,
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success:
                    function(data, textStatus){
                            /* 입력창이 빌 경우는 추천 데이터가 들어갈 공간을 비운다.*/
                            if (keyword == null && keyword =="")
                                alert("공간을 비웁니다. ");
                                $('#recommand').empty();
                            if(data != null) displayResult(data);
                    }
            })
        });

        $("#auto_btn_close").click(function(){
            $('#autocomplete').attr("hidden", true);
        })

        function displayResult(jsonInfo){
            let html;
                for (let i in jsonInfo.autocProduct){
                html =
                             `<div class="row" style="height: 120px;">`+
                                 `<div class="col-3" style="padding-top: 5px;">`+
                                     `<span style="height: 100px;">`+
                                        `<img src="`+jsonInfo.autocProduct[i]["p_img"]+ `"style="height: 102px; width: 70px; border-radius: 10px; color: #0a53be; font-weight: bolder;" >`+
                                     `</span>`+
                                 `</div>`+
                                 `<div id="autocProduct" class="col-9" style="padding-top:10px;">`+
                                      `<div class="row" style="height: 30px; margin-bottom: 20px;"><a href="/product/`+JSON.stringify(jsonInfo.autocProduct[i]["p_no"])+`" class='searchName' style="text-decoration: none; "><p style="font-size: smaller; font-weight: bolder">`+jsonInfo.autocProduct[i]["p_title"]+`</p></a></div>`+
                                      `<div class="row" style="height: 30px;"><p style="font-size: small">`+jsonInfo.autocProduct[i]["p_author"]+`</p></div>`+
                                      `<div class="row" style="height: 30px;"><p style="font-size: 13px; color: darkgreen;">`+jsonInfo.autocProduct[i]["p_price"]+`</p></div>`+
                                 `</div>`+
                             `</div>`+
                             `<hr>`
                 $("#recommand").append(html);
            }
        }

        /* ----------------------------------- [[ 검색>메인검색창 유효성 검사]] ----------------------------------*/
        $("#button-addon2").on('click', function(e){
            let keyword = $.trim($("input[name='keyword']").val());
            if(!keyword){
                e.preventDefault();
                alert("검색어를 입력해 주세요.");
            }
        });

        /* ----------------------------------- [[ 검색>네비게이션 카테고리]] ----------------------------------*/
        $(".dropdown-menu a").on("click", function(e){
            e.preventDefault();
            let menu = $(this).attr("href");
            console.log(menu); // 내가 클릭한 a 태그의 href 값 (예: 기술과학, 사회과학..)
            if(menu == "total"){ // 클라이언트가 전체 메뉴를 클릭할 경우
                $("#navForm input[name='type']").val("");
                $("#navForm").submit();
            }
            $("#navForm input[name='p_category']").val(menu);
            $("#navForm").submit();
        })
    })
</script>

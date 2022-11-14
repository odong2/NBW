let url =  document.location.href.substring(16);

$('#logout').attr('href','/logout?url='+url);

/* ----------------------------------- [[ 검색>메인검색창 유효성 검사]] ----------------------------------*/
$("#button-addon2").on('click', function(e){
    let keyword = $.trim($("input[name='keyword']").val());
    if(!keyword){
        e.preventDefault();
        alert("검색어를 입력해 주세요.");
    }
});
/* ----------------------------------- [[ 검색>메인검색창 유효성 검사]] ----------------------------------*/
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
/* ----------------------------------- [[ 검색>네비게이션 카테고리]] ----------------------------------*/
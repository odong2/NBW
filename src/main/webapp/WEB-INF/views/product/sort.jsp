<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .sortBar {
        padding-top: 30px;
        width: 80%;
    }
    .sort-link {
        float: left;
        margin-left: 1rem;
        font-size: small;
        border: 1px solid #929292;
        border-radius: 30px;
        width: 80px;
        height: 25px;
        color: #343a40;
        text-align: center;
        padding-top: 3px;
    }
    li.sort-link.active {
        border: 2px solid yellow;
    }
</style>
<script type="text/javascript">
          $(function(){

            $(".sortList a").on("click", function(e){
                  e.preventDefault();
                  let sortName = $(this).attr("href");
                  console.log(sortName);
                  $(".sort_search_form input[name='keyword']").val('${criteria.keyword}');
                  $(".sort_search_form input[name='type']").val('${criteria.type}');
                  $(".sort_search_form input[name='p_category']").val('${criteria.p_category}');
                  $(".sort_search_form input[name='sort']").val(sortName);
                  $(".sort_search_form").submit();
            });

              let params = new URLSearchParams(document.location.search);
              /* 현재 분류기준 */
              let nowSort = params.get("sort");
              console.log("nowSort ===>"+nowSort);
              $(function(){
                  $('.sort-link').each(function(index, item){
                      //console.log(item);
                      let sort =$(item).children('.sort-a').attr("href");
                      console.log("sort ===> "+sort);
                      if(nowSort == sort){
                          $(item).addClass('active');
                      }
                  })
              })
          });
</script>
<section class="sortBar">
    <c:if test="${pagination.totalCount ne 0}">
        <section>
          <ul class="sortList" style="float: right;">
              <li class="sort-link"><a class ="sort-a" href="recent">최신순</a></li>
              <li class="sort-link"><a class ="sort-a" href="sell">판매순</a></li>
              <li class="sort-link"><a class ="sort-a" href="lowerprice">낮은가격순</a></li>
              <li class="sort-link"><a class ="sort-a" href="higherprice">높은가격순</a></li>
              <li class="sort-link"><a class ="sort-a" href="review">리뷰순</a></li>
              <li class="sort-link"><a class ="sort-a" href="like">좋아요순</a></li>
              <li class="sort-link"><a class ="sort-a" href="score">평점순</a></li>
          </ul>
            <form class="sort_search_form" method="get" action="/product/search" hidden>
              <input type="text" name="keyword"/>
              <input type="text" name="type"/>
              <input type="text" name="p_category"/>
              <input type="text" name="sort"/>
            </form>
        </section>
    </c:if>
</section>
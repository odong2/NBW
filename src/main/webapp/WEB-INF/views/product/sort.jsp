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
    })
  })
</script>
<section class="sortBar">
    <section>
      <ul class="sortList" style="float: right;">
          <li class="sort-link"><a href="recent">최신순</a></li>
          <li class="sort-link"><a href="sell">판매순</a></li>
          <li class="sort-link"><a href="lowerprice">낮은가격순</a></li>
          <li class="sort-link"><a href="higherprice">높은가격순</a></li>
          <li class="sort-link"><a href="review">리뷰순</a></li>
          <li class="sort-link"><a href="like">좋아요순</a></li>
          <li class="sort-link"><a href="recent">평점순</a></li>
      </ul>
        <form class="sort_search_form" method="get" action="/product/search" hidden>
          <input type="text" name="keyword"/>
          <input type="text" name="type"/>
          <input type="text" name="p_category"/>
          <input type="text" name="sort"/>
        </form>
    </section>
</section>
package com.finalpj.nbw.notice.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SearchCondition {
    private Integer page = 1;
    private Integer pageSize = 10;
    private String keyword = "";
    private String option = "";

    public SearchCondition(Integer page, String keyword, String option){
        this.page = page;
        this.keyword = keyword;
        this.option = option;
    }

    /* offset 계산 */
    public Integer getOffset(){return (page-1) * pageSize;}

    public Integer getOffsetTo(){return  page == 1 ? 10 : page * pageSize;}



    /* 목록으로 가기 시 메서드 호출하여 리스트로 이동(페이지 지정) */
    public String getQueryString(Integer page){
        return UriComponentsBuilder.newInstance()
                .queryParam("page",page)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .build().toString();
    }
    /* 조건검색 결과 페이징 */
    public String getQueryString(){
        // ?page=1&option=T&keyword="title"
        return getQueryString(page);
    }

}

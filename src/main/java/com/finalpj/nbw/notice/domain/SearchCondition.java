package com.finalpj.nbw.notice.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchCondition {
    private Integer page = 1;
    private Integer pageSize = 10;
    private Integer offset = 0;
    private String keyword = "";
    private String option = "";

    public SearchCondition(Integer page, Integer pageSize, String keyword, String option){
        this.page = page;
        this.pageSize = pageSize;
        this.keyword = keyword;
        this.option = option;
    }

}

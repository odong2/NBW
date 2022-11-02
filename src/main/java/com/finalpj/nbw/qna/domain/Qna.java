package com.finalpj.nbw.qna.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Qna {
    Integer qn_no;
    String qn_from;
    String qn_category;
    Date qn_cdate;
    String qn_content;
    String qn_state;
    String qn_title;

    public Qna(Integer qn_no, String qn_category, String qn_content,
    String qn_state, String qn_title) {
        this.qn_no = qn_no;
        this.qn_category = qn_category;
        this.qn_content = qn_content;
        this.qn_state = qn_state;
        this.qn_title = qn_title;
    }
}

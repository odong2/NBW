package com.finalpj.nbw.event.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EventComment {
    private Integer ev_no; // 이벤트 번호
    private Integer evc_no; // 댓글 번호
    private String evc_commenter; // 댓글 작성자
    private String evc_content; // 댓글 내용
    private Date evc_cdate; // 작성일
    private Date evc_update; // 댓글 수정일
    private Integer evc_pcno; // ㅐ댓글

    public EventComment(Integer ev_no, Integer evc_no, String evc_commenter, String evc_content, Integer evc_pcno) {
        this.ev_no = ev_no;
        this.evc_no = evc_no;
        this.evc_commenter = evc_commenter;
        this.evc_content = evc_content;
        this.evc_pcno = evc_pcno;
    }

}

package com.finalpj.nbw.notice.domain;

import lombok.*;

import java.util.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class NtComment {
    private Integer ntc_no;         // 댓글 번호(pk)
    private Integer nt_no;          // 공지글 번호(fk)
    private Integer ntc_pcno;       // 댓글의 부모(대댓글용) 
    private String  ntc_comment   ;     // 댓글 내용
    private String ntc_commenter;   // 댓글 작성자
    private Date ntc_cdate;         // 댓글 작성일
    private Date ntc_update;        // 댓글 수정일
    private String ntc_img;         // 댓글 이미지

    public NtComment(Integer ntc_no,Integer nt_no, Integer ntc_pcno, String ntc_comment, String ntc_commenter, String ntc_img){
        this.ntc_no = ntc_no;
        this. nt_no = nt_no;
        this.ntc_pcno = ntc_pcno;
        this.ntc_comment = ntc_comment;
        this.ntc_commenter = ntc_commenter;
        this.ntc_img = ntc_img;
    }
}

package com.finalpj.nbw.notice.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
    Integer nt_no;
    String nt_title;
    String nt_content;
    Date nt_cdate;
    String nt_file;
    Integer nt_hit;
    Integer nt_cocnt;

    public Notice(Integer nt_no, String nt_title, String nt_content){
        this.nt_no = nt_no;
        this.nt_title = nt_title;
        this.nt_content = nt_content;
    }
}

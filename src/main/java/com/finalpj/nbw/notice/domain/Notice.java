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
}

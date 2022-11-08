package com.finalpj.nbw.member.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
    private String mem_id;
    private String mem_pw;
    private String mem_name;
    private String mem_gender;
    private String mem_birthday;
    private String mem_phone;
    private String mem_zipcode;
    private String mem_address1;
    private String mem_address2;
    private String g_grade;
    private String mem_cdate;
    private String mem_update;
    private String mem_tprice;
    private String mem_email;
    private String mem_nickname;
    private String mem_email_domain;
    private Integer mem_point;

    private Integer coupon_count;
    private Integer g_discount;
}
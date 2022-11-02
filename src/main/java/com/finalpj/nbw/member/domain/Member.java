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
    private String mem_email_domain;
    private Integer mem_point;


//    public Member(String mem_id, String mem_pw, String mem_name, String mem_gender, String mem_birthday, String mem_phone
//            , String mem_zipcode, String mem_address, String mem_address2, String mem_cdate, String mem_email, String g_grade, String mem_email_domain){
//        this.mem_id = mem_id;
//        this.mem_pw = mem_pw;
//        this.mem_name = mem_name;
//        this.mem_gender = mem_gender;
//        this.mem_birthday = mem_birthday;
//        this.mem_phone = mem_phone;
//        this.mem_zipcode = mem_zipcode;
//        this.mem_address = mem_address;
//        this.mem_address2 = mem_address2;
//        this.mem_cdate = mem_cdate;
//        this.mem_email = mem_email;
//        this.g_grade = g_grade;
//        this.mem_email_domain = mem_email_domain;
//    }

//    @Builder
//    public Member(String mem_email, String mem_zipcode, String mem_address, String mem_address2, String mem_update){
//        this.mem_email = mem_email;
//        this.mem_zipcode = mem_zipcode;
//        this.mem_address = mem_address;
//        this.mem_address2 = mem_address2;
//        this.mem_update = mem_update;
//    }
}

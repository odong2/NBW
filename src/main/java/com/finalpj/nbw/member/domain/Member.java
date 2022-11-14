package com.finalpj.nbw.member.domain;

import com.finalpj.nbw.cart.domain.Cart;
import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.event.domain.EventMember;
import com.finalpj.nbw.payment.domain.Payment;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

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

    private String mem_img;

}
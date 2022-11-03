package com.finalpj.nbw.payment.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
    private Integer[] p_no;
    private String[] p_title;
    private Integer[] p_price;
    private String[] p_img;
    private Integer[] p_count;
    private Integer used_point = 0;
    private Integer cp_no = 0;
    private Integer total_price;
    private String receiver_name;
    private String receiver_phone;
    private String receiver_zipcode;
    private String receiver_address1;
    private String receiver_address2;
    private String delevery_memo;

}

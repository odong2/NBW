package com.finalpj.nbw.coupon.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Coupon {
    private Integer cp_no;
    private String cp_name;
    private Integer cp_price;
}

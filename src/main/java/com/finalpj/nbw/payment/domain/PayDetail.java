package com.finalpj.nbw.payment.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayDetail {
    private String order_no;
    private Integer p_no;
    private Integer p_count;
}

package com.finalpj.nbw.payment.domain;

import com.finalpj.nbw.product.domain.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CartProduct {
    private String p_no;
    private String p_title;
    private String p_price;
    private String p_img;
    private String p_category;
    private int p_count;

}

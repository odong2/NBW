package com.finalpj.nbw.payment.domain;

import com.finalpj.nbw.product.domain.Product;
import lombok.*;
import org.springframework.lang.Nullable;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class CartProduct {
    private String p_no;
    private String p_title;
    private Integer p_price;
    private String p_img;
    private String p_category;
    private Integer p_count;
    @Nullable
    private String order_status;

}

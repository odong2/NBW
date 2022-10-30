package com.finalpj.nbw.payment.domain;

import com.finalpj.nbw.product.domain.Product;

import java.util.List;

public class CartProduct {
    private String p_no;
    private String p_title;
    private String p_price;
    private String p_img;
    private String p_category;
    private int mcart_count;
    private String mem_id;
    private Product product;

    private List<CartProduct> cartProductList;
}

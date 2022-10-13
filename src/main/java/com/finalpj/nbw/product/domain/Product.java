package com.finalpj.nbw.product.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private String p_no;
	private String p_title;
	private String p_author;
	private String p_publisher;
	private String p_pubdate;
	private String p_price;
	private String p_img;
	private String p_description;
	private String p_category;
	private String p_like;
	private String p_avgscore;
	private String p_review;
}

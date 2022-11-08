package com.finalpj.nbw.product.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	private Integer p_no;
	private String p_title;
	private String p_author;
	private String p_publisher;
	private String p_pubdate;
	private String p_price;
	private String p_img;
	private String p_description;
	private String p_category;
	private Integer p_like;
	private Integer p_review;
	private Integer p_tsell;
	private Integer p_count;
	private Integer p_avgscore;

	private List<Review> reviewList;
}

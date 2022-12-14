package com.finalpj.nbw.product.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	/* ============ Validation 으로 상품 등록시 data 유효성 검사 추가 =========== */
	private Integer p_no;

	@NotNull
	@NotBlank(message = "제목을 입력해 주세요.")
	private String p_title;

	private String p_author;
	private String p_publisher;
	private String p_pubdate;

	@NotNull
	@NotBlank(message = "가격을 입력해 주세요.")
	@Positive(message="0이하 숫자는 입력할 수 없습니다.") // 값을 양수만 허용
	private String p_price;

	private String p_img;
	private String p_description;
	private String p_category;
	private Integer p_like;
	private Integer p_review;
	private Integer p_tsell;

//	@NotNull
//	@Pattern(regexp="(?=.*[0-9])", message = "숫자만 입력해 주세요.")
//	@NotBlank(message = "수량을 입력해 주세요.")
//	@Positive(message="0이하 숫자는 입력할 수 없습니다.") // 값을 양수만 허용
	private Integer p_count;
	private Integer p_avgscore;

	private List<Review> reviewList;
	
	public String getStar() {
		String star = "★"; 
		
		if(p_avgscore == null) {
			star = "(0)";
		}else {
			star = star.repeat(this.p_avgscore)+"("+p_avgscore+")";
		}
		
		return star;
	}
}

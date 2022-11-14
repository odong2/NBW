package com.finalpj.nbw.product.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Review {
	private Integer rv_no;
	private String mem_id;
	private String mem_nickname;
	private String p_no;
	private Integer rv_score;
	private String rv_content;
	private String rv_img;
	private String rv_img2;
	private String rv_img3;
	private Date rv_date;
	private List<MultipartFile> files;
	private List<String> fileNames;
	private Integer fileSize;
	
	public String getRv_image() {
		return fileNames.get(0);
	}
	public String getRv_image2() {
		return fileNames.get(1);
	}
	public String getRv_image3() {
		return fileNames.get(2);
	}
	
	public String getStar() {
		String star = "★";
		
		if(this.rv_score == null) {
			star = "(0)";
		}else {
			star = star.repeat(this.rv_score)+"("+this.rv_score+")";
		}
		return star;
	}
}

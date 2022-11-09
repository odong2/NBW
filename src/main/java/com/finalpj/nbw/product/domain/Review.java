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
	private String mem_id;
	private String mem_nickname;
	private Integer mem_point;
	private String p_no;
	private Integer rv_score;
	private String rv_content;
	private String rv_img;
	private String rv_img2;
	private String rv_img3;
	private String rv_date;
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
}

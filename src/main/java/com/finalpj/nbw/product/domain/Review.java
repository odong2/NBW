package com.finalpj.nbw.product.domain;

import java.util.Iterator;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Review {
	private String mem_id;
	private String p_no;
	private String rv_score;
	private String rv_content;
	private List<MultipartFile> files;
	private List<String> fileNames;
	private Integer fileSize;
	
	public String getRv_img() {
		return fileNames.get(0);
	}
	
	public String getRv_img2() {
		return fileNames.get(1);
	}
	public String getRv_img3() {
		return fileNames.get(2);
	}

}

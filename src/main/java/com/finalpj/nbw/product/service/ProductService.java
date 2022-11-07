package com.finalpj.nbw.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalpj.common.exception.FileUploader;
import com.finalpj.nbw.product.dao.ProductDao;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.domain.Review;


@Service
public class ProductService {
	

	private ProductDao productDao;

	@Autowired
	public ProductService(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public Map<String, Object> reviewRegister(Review review) {
		
		if(review.getFiles() != null) {
			System.out.println("파일존재함!");
			List<String> fileNames =  FileUploader.fileUpload(review.getFiles());
			review.setFileNames(fileNames);
			review.setFileSize(fileNames.size());
		}
		
		productDao.reviewCountUpdate(review);
		productDao.reviewInsert(review);
		
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("success", true);
		map.put("msg", "리뷰가 등록되었습니다.");
		return map;
	}

	public Product getProduct(String p_no) {
		return productDao.getProduct(p_no);
	}
}

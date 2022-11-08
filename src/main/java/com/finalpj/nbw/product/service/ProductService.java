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

import com.finalpj.nbw.product.dao.ProductDao;
import com.finalpj.nbw.product.domain.CategoryFilter;
import com.finalpj.nbw.product.domain.Criteria;
import com.finalpj.nbw.product.domain.Product;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
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
    

//    /* 추천 검색어 조회 */
//    public List<Product> search(Criteria criteria) throws Exception {
//        return  productDao.selectProductByWord(criteria);
//    }

    /* 상품 등록 */
    public int insertProduct(Product product) throws Exception{
        return productDao.insertProduct(product);
    }

    /* 상품 목록 조회 > 페이징*/
    public List<Product> searchProduct(Criteria criteria) throws Exception {
        log.info("SERVICE 에서 매개로 전달될 criteria ====> "+ criteria);
        return productDao.selectProduct(criteria);
    }

    /* 조회된 상품 총 갯수 */
    public int getTotalCount(Criteria criteria) throws Exception{
        //log.info("SERVICE ===> 조회된 상품 총 갯수 ");
        return productDao.selectSearchCnt(criteria);
    }

    /* 조회된 상품의 기존 검색 조건에(Criteria) 카테고리 필터링 추가 */
    public List<CategoryFilter> getCategoryFilter(Criteria criteria) throws Exception {

        List<CategoryFilter> categoryFilterList = new ArrayList<>();
        categoryFilterList = productDao.selectProductCategory(criteria);
        return categoryFilterList;
    }
}

package com.finalpj.nbw.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalpj.common.FileUploader;
import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.product.dao.ProductDao;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.domain.Review;

import com.finalpj.nbw.product.domain.CategoryFilter;
import com.finalpj.nbw.product.domain.Criteria;

import lombok.extern.slf4j.Slf4j;
import java.util.ArrayList;

@Service
@Slf4j
public class ProductService {
    
	private ProductDao productDao;
	private MemberDao memberDao;
	private FileUploader fileUploader;

	@Autowired
	public ProductService(ProductDao productDao,  MemberDao memberDao, FileUploader fileUploader) {
		this.productDao = productDao;
		this.memberDao = memberDao;
		this.fileUploader = fileUploader;
	}
	
	@Transactional
	public Map<String, Object> reviewRegister(Review review, HttpSession session) throws Exception {
		
		Map<String,Object> pointMap = new HashMap<>();
		pointMap.put("mem_id", review.getMem_id());
		pointMap.put("mem_point", review.getMem_point()+200);
		
		if(review.getFiles() != null) {
			System.out.println("파일존재함!");
			List<String> fileNames =  fileUploader.fileUpload(review.getFiles(),"review");
			review.setFileNames(fileNames);
			review.setFileSize(fileNames.size());
			pointMap.put("mem_point", review.getMem_point()+400);
		}
		
		productDao.reviewInsert(review);
		productDao.reviewCountUpdate(review);
		memberDao.updateMemPoint(pointMap);
		
		Member member = (Member) session.getAttribute("member");
		int mem_point = (Integer) pointMap.get("mem_point");
		member.setMem_point(mem_point);
		session.setAttribute("member", member);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("success", true);
		map.put("msg", "리뷰가 등록되었습니다.");
		return map;
	}

	@Transactional
	public Product getProduct(String p_no) {
		Product product = productDao.getProduct(p_no);
		List<Review> rewivewList = productDao.SelectReviewList(p_no);
		product.setReviewList(rewivewList);
		return product;
	}
    

    /* 추천 검색어 조회 */
    public List<Map<String, Object>> search(Map<String, Object> paramMap) throws Exception {
        // log.info("service ==> productDao의 List<Map<String, Object>> 반환값 " + productDao.selectProductByWord(paramMap));
        return  productDao.selectProductByWord(paramMap);
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
        /*  */
//        for(String code : category){
//            criteria.setCategoryCode(category); // 반환받은 코드를 하나씩 뽑아서 criteria의 카테고리 변수에 넣어줌
//            System.out.println(category + "가 set 된 criteria 의 결과 ==> "+ criteria);
//
//            productDao.selectProductCateInfo(criteria); // categoryCode 가 포함된 검색조건으로 재검색 후 List<Object> 타입으로 반환 > Casting 에러때문
//            log.info("categoryCode 가 포함된 검색조건으로 재검색 후 List<Object> 타입으로 반환 ==> "+ productDao.selectProductCateInfo(criteria));
//
//            categoryView.add(criteria);
//        }
//        criteria.setCategoryCode(tempCode);
//        log.info(categoryFilterList.toString());

        return categoryFilterList;
    }
}

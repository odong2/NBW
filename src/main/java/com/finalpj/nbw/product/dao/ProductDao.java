package com.finalpj.nbw.product.dao;

import com.finalpj.nbw.product.domain.CategoryFilter;
import com.finalpj.nbw.product.domain.Criteria;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.domain.Review;

import java.util.List;
import java.util.Map;

public interface ProductDao {
	Product getProduct(String number);

	/* 상품 등록 */
	int insertProduct(Product product) throws Exception;

	/* 뷰에서 얻은 키워드를 넘겨서 키워드가 포함된 책 제목을 반환한다. */
	List<Product> selectProductByWord(String keyword) throws Exception;

	/* 추천 검색어 조회 */
	List<Map<String, Object>> selectProductByWord(Map<String, Object> paramMap) throws Exception;

	/* 상품 목록 검색 > 페이징 포함 */
	List<Product> selectProduct(Criteria criteria);

	/* 조회된 상품 전체 개수 */
	int selectSearchCnt(Criteria criteria);

	/* 조회된 상품의 카테고리를 다시 조회 > 첫 번째 기준(Criteria)에 의해서 반환된 카테고리 필터를 반환 */
	List<CategoryFilter> selectProductCategory(Criteria criteria) throws Exception;

	/* 검색된 카테고리 개수 반환 */
	List<CategoryFilter> selectProductCateInfo(Criteria criteria) throws Exception;

	void updateLike(Map<String, Object> map);

	void reviewCountUpdate(Review review);

	void reviewInsert(Review review);
	
	List<Review> SelectReviewList(String p_no);


}


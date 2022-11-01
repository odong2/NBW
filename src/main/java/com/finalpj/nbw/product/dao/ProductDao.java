package com.finalpj.nbw.product.dao;

import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.product.domain.Criteria;
import com.finalpj.nbw.product.domain.Product;
import java.util.List;
import java.util.Map;


public interface ProductDao {
	Product getProduct(String number);

	/* 뷰에서 얻은 키워드를 넘겨서 키워드가 포함된 책 제목을 반환한다. */
	List<Map<String, Object>> selectProductByWord(Map<String, Object> paramMap) throws Exception;

	/* 상품 목록 검색 > 페이징 포함 */
	List<Product> selectProduct(Criteria criteria);

	/* 조회된 상품 전체 개수 */
	int selectSearchCnt(Criteria criteria);


}

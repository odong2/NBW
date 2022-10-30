package com.finalpj.nbw.product.dao;

import com.finalpj.nbw.product.domain.Product;
import java.util.List;
import java.util.Map;


public interface ProductDao {
	Product getProduct(String number);

	/* 뷰에서 얻은 키워드를 넘겨서 키워드가 포함된 책 제목을 반환한다. */
	List<Map<String, Object>> selectProductByWord(Map<String, Object> paramMap) throws Exception;

}

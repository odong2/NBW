package com.finalpj.nbw.product.dao;

import com.finalpj.nbw.product.domain.Product;
import java.util.List;


public interface ProductDao {
	Product getProduct(String number);

	/* 뷰에서 얻은 키워드를 넘겨서 키워드에 해당하는 상품 정보를 반환한다.*/
	public List<Product> selectProductByWord(String key) throws Exception;
}

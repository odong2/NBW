package com.finalpj.nbw.product.service;

import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.product.dao.ProductDao;
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

    @Autowired
    ProductDao productDao;

    /* 추천 검색어 조회 */
    public List<Map<String, Object>> search(Map<String, Object> paramMap) throws Exception {
        return  productDao.selectProductByWord(paramMap);
    }

    /* 상품 목록 조회 > 페이징*/
    public List<Product> searchProduct(Criteria criteria) throws Exception {
        log.info("SERVICE ===> 상품 목록 조회");
        return productDao.selectProduct(criteria);
    }

    /* 조회된 상품 총 갯수 */
    public int getTotalCount(Criteria criteria){
        log.info("SERVICE ===> 조회된 상품 총 갯수 ");
        return productDao.selectSearchCnt(criteria);
    }

}

package com.finalpj.nbw.product.service;

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

    @Autowired
    ProductDao productDao;

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

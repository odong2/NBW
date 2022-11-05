package com.finalpj.nbw.product.dao;

import com.finalpj.nbw.product.domain.Criteria;
import com.finalpj.nbw.product.repository.ProductDaoImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

@Slf4j
public class ProductDaoTest {

    @Autowired
    ProductDao productDao;

    @Test
    public void selectProductCategory() throws Exception {
        Criteria cri = new Criteria();
        cri.setKeyword("채");
        cri.setAmount(10);
        cri.setPageNum(1);
       log.info(productDao.selectProductCategory(cri).toString());
    }

    //@Test
//    public void selectProductCateInfo() {
//    }
}
package com.finalpj.nbw.product.repository;

import com.finalpj.nbw.product.dao.ProductDao;
import com.finalpj.nbw.product.domain.Product;
import org.junit.AfterClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration(locations= "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductDaoImplTest {


    @Autowired
    ProductDao productDao;

//    @Test
//    public void insertProduct() throws Exception {
//        Product product = new Product();
//        product.setP_title("test");
//        product.setP_author("test");
//        product.setP_img("null");
//        product.setP_publisher("test");
//        product.setP_price("20000");
//        product.setP_description("test");
//        product.setP_category("기술과학");
//        product.setP_count(100);
//
//        assertEquals(1, productDao.insertProduct(product));
//    }
}
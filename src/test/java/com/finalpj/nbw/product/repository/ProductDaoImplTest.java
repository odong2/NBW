package com.finalpj.nbw.product.repository;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

//@Slf4j
//public class ProductDaoImplTest {
//    @Autowired
//    SqlSession sqlSession;
//
//    @Test
//    public void testGetList(){
//        List list = sqlSession.selectList("selectProduct", "가톨릭");
//
//        list.forEach(product -> log.info(""+product));
//    }
//}
package com.finalpj.nbw.product.service;

import com.finalpj.nbw.product.dao.ProductDao;
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

    public List<Map<String, Object>> search(Map<String, Object> paramMap) throws Exception {
        return  productDao.selectProductByWord(paramMap);
    }
}

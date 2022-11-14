package com.finalpj.nbw.home.controller;

import com.finalpj.nbw.product.domain.Criteria;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.service.ProductService;
import lombok.extern.log4j.Log4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@RequestMapping("/*")
@Controller
@Log4j
public class HomeController {
    @Autowired
    ProductService productService;

    @GetMapping("home")
    public String HomePage(Criteria criteria, Model model) throws Exception {
        /* 최신 상품 여섯개를 불러온다. */
        criteria.setSort("recent");
        criteria.setAmount(6);
        List<Product> list = productService.searchProduct(criteria);
        model.addAttribute("homeList", list);
//        log.info(" 최신 상품 ====> "+ list);
        return "/home";
    }
}


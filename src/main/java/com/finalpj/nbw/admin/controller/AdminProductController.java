package com.finalpj.nbw.admin.controller;

import com.finalpj.nbw.product.domain.Criteria;
import com.finalpj.nbw.product.domain.Pagination;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.service.ProductService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/admin/product")
@Log4j
@Controller
public class AdminProductController {

    @Autowired
    ProductService productService;

    /* ***************************** 상품조회 페이지 요청 **************************** */
    @GetMapping("/list")
    public String productList(Model model, Criteria criteria) throws Exception {
        log.info("[ADMIN] 상품조회 페이지 요청");

        try {
            int totalCount =productService.getTotalCount(criteria);
            Pagination pagination = new Pagination(criteria, totalCount);
            List<Product> list = productService.searchProduct(criteria);
            model.addAttribute("list", list);

        } catch (Exception e){
            e.printStackTrace();
        }

        return "/admin/product/product";
    }

    /* *************************** 상품등록 페이지 요청 ****************************** */
    @GetMapping("/write")
    public String getPostPage() throws Exception{
        return "/admin/product/write";
    }

    /* ******************************* 상품등록 ********************************** */
    @PostMapping("/write")
    public String postProduct(Product product) throws Exception {
        productService.insertProduct(product);
        log.info("등록 성공? ====> "+ productService.insertProduct(product));
        return "redirect:/admin/product/list";
    }
}

package com.finalpj.nbw.admin.controller;

import com.finalpj.common.FileUploader;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.product.domain.Criteria;
import com.finalpj.nbw.product.domain.Pagination;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.service.ProductService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/admin/product/")
@Log4j
@Controller
public class AdminProductController {

    @Autowired
    ProductService productService;

    @Autowired
    FileUploader fileUploader;

    /* ***************************** 상품조회 페이지 요청 **************************** */
    @GetMapping("list")
    public String productList(Model model, Criteria criteria) throws Exception {
        log.info("[ADMIN] 상품조회 페이지 요청");

        try {
            log.info("[[ADMIN]] list 컨트롤러 진입");
            log.info("[[ADMIN]]의 CRITERIA ===> "+ criteria);

            int totalCount =productService.getTotalCount(criteria);
            log.info("totalCount ===>> "+ totalCount);
            Pagination pagination = new Pagination(criteria, totalCount);
            List<Product> list = productService.searchProduct(criteria);
            model.addAttribute("list", list);
            model.addAttribute("pagination", pagination);

        } catch (Exception e){
            e.printStackTrace();
        }

        return "/admin/product/product";
    }

    /* *************************** 상품등록 페이지 요청 ****************************** */
    @GetMapping("write")
    public String getPostPage() throws Exception{
        return "/admin/product/write";
    }

    /* ******************************* 상품등록 ********************************** */
    @PostMapping("write")
    public String postProduct(Product product, MultipartFile uploadFile, Model model) throws Exception {
        log.info(" [[AdminController]] 상품 등록 요청");
        String path = "/product";
        String original = uploadFile.getOriginalFilename();
        String saveFileName = "";
        log.info("originalFilename" + original);

        saveFileName = fileUploader.fileUpload(uploadFile, path);
        product.setP_img("/display/"+saveFileName);
        log.info("[[product]] ===> "+ product);

        if(saveFileName != null) {
            try {
                productService.insertProduct(product);
                model.addAttribute("success", "상품이 등록되었습니다. ");

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            model.addAttribute("fail", "등록에 실패하였습니다. ");
            return "redirect:mypage/info";
        }
        return "redirect:/admin/product/list";
    }

    /* ******************************* 상품상세조회********************************** */
    @GetMapping("{id}")
    public String detail(@PathVariable("id") String p_no, Model model) {
        Product product = productService.getAdProduct(p_no);
        log.info("p_no ===> "+ p_no);
        model.addAttribute("product", product);

        return "/admin/product/detail";
    }


    /* ******************************* 상품수정 ********************************** */
    @PostMapping("modify")
    public String modProduct(Product product, MultipartFile uploadFile){
        log.info("[[ADMIN]] 상품 수정 POST 요청.........");
        String path = "/product";
        String original = uploadFile.getOriginalFilename();
        String saveFileName = "";
        log.info("originalFilename" + original);

        saveFileName = fileUploader.fileUpload(uploadFile, path);
        product.setP_img("/display/"+saveFileName);

        try{
            int intI = productService.modifyProduct(product);
            log.info("수정 여부 ====> "+ intI);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/admin/product/list";
    }

    /* ******************************* 상품삭제 ********************************** */
    @GetMapping("delete/{p_no}")
    public String delProduct(@PathVariable Integer p_no){
        log.info("[[ADMIN]] 상품 삭제 POST 요청.........");
        try{
            int intI = productService.delProduct(p_no);
            log.info("수정 여부 ====> "+ intI);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/admin/product/list";
    }
}

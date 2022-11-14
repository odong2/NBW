package com.finalpj.nbw.product.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@Log4j
public class ImgController {
    /* ********************************  상품 사진 출력 ******************************** */
    @GetMapping(value = "/display/{p_img:.+}")
    @ResponseBody
    public ResponseEntity<byte[]> getProductImg(@PathVariable String p_img) throws Exception {
        log.info("/display"+ p_img + "===> Get 요청!! ");

        final String uploadRoot = System.getProperty("user.home");
        final String fileFolder = uploadRoot+"/Desktop/upload/product/";

        File file = new File(fileFolder + p_img);
        if(!file.exists())
            return  new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);

        ResponseEntity<byte[]> result = null;

        try {
            // 파일을 뷰로 전송하기 위해 전송정보를 담을 헤더 설정
            HttpHeaders headers = new HttpHeaders();

            String pType = Files.probeContentType(file.toPath());
            headers.add("Ptype", pType);
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);

            log.info("pType ===> "+ pType);
            log.info("headers ===> "+ headers);

        }catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
}
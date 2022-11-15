package com.finalpj.nbw.image.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.nio.file.Files;

@Controller
@RequestMapping("/img/*")
@Log4j
public class ImgController {

    /******************************* 사용자 이미지 다운로드(공지글) *****************************/
    @GetMapping("display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile (String imgName){
        log.info("fileName : " + imgName);
        final String uploadRoot = System.getProperty("user.home");
        final String fileFolder = uploadRoot+"/Desktop/upload/myphoto/";
        File file = new File(fileFolder + imgName);

        log.info("file: " + file);

        ResponseEntity<byte[]> result = null;

        try{
            HttpHeaders header = new HttpHeaders();

            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result= new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}

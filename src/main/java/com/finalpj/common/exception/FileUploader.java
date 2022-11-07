package com.finalpj.common.exception;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import lombok.extern.log4j.Log4j;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;


public class FileUploader {
	
    public static String fileUpload(MultipartFile file) {
      String originalFileName = file.getOriginalFilename();
      String saveFileName = "";
      
      // 첨부파일이 있을 경우
      if(originalFileName != null && originalFileName != "") {
//          String uploadPath = "C:"+File.separator+"upload"+File.separator+"file";
          String uploadPath = "/Users/comedown/Desktop/upload/review";
          
          UUID uuid = UUID.randomUUID();
          
          // 파일이름 중복을 피하기위해 uuid를 덧붙여 파일이름 저장
          saveFileName = uuid.toString() + "_" + originalFileName;
          File folder = new File(uploadPath, saveFileName);
          
          // 폴더가 없다면 생성
          if (!folder.isDirectory()) {
              folder.mkdirs();
          }
          
          try {
			file.transferTo(folder);
          } catch (IllegalStateException e) {
			e.printStackTrace();
          } catch (IOException e) {
			e.printStackTrace();
          }
      }
      
      return saveFileName;
    }
    
    public static List<String> fileUpload(List<MultipartFile> files) {
    	List<String> fileNames = new ArrayList<String>();
    	
        for (MultipartFile file : files) {
//        	fileNames.add(fileUpload(file));
        	
            String originalFileName = file.getOriginalFilename();
            String saveFileName = "";
            
            // 첨부파일이 있을 경우
            if(originalFileName != null && originalFileName != "") {
//                String uploadPath = "C:"+File.separator+"upload"+File.separator+"file";
                String uploadPath = "/Users/comedown/Desktop/upload/review";
                
                UUID uuid = UUID.randomUUID();
                
                // 파일이름 중복을 피하기위해 uuid를 덧붙여 파일이름 저장
                saveFileName = uuid.toString() + "_" + originalFileName;
                File folder = new File(uploadPath, saveFileName);
                
                // 폴더가 없다면 생성
                if (!folder.isDirectory()) {
                    folder.mkdirs();
                }
                
                try {
      			file.transferTo(folder);
                } catch (IllegalStateException e) {
      			e.printStackTrace();
                } catch (IOException e) {
      			e.printStackTrace();
                }
            }
            
            fileNames.add(saveFileName);
        }
    	
    	return fileNames;
    }
    
}

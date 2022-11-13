package com.finalpj.common;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.Normalizer;


@Component
public class FileUploader {
	
	private final String uploadRoot = System.getProperty("user.home");

	public String fileUpload(MultipartFile file, String path) {

		String originalFileName = convertFileNameForOs(file.getOriginalFilename());
		String saveFileName = "";
		
		// 첨부파일이 있을 경우
		if (originalFileName != null && originalFileName != "") {
			String uploadPath = uploadRoot+"/Desktop/upload/"+path;
			System.out.println(uploadPath);
			
			UUID uuid = UUID.randomUUID();

			// 파일이름 중복을 피하기위해 uuid를 덧붙여 파일이름 저장
			saveFileName = uuid.toString() + "_" + originalFileName;
			File folder = new File(uploadPath, saveFileName);

			// 폴더가 없다면 생성
			if (!folder.isDirectory()) {
				System.out.println("해당 경로에 폴더가 존재하지 않아 폴더를 생성합니다.");
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

	public List<String> fileUpload(List<MultipartFile> files, String path) {
		List<String> fileNames = new ArrayList<String>();

		for (MultipartFile file : files) {

			String originalFileName = convertFileNameForOs(file.getOriginalFilename());
			
			System.out.println("디코딩 전 : "+originalFileName);
			
			try {
				URLDecoder.decode(originalFileName, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}

			String saveFileName = "";
			
			System.out.println("디코딩 후 : "+originalFileName);

			// 첨부파일이 있을 경우
			if (originalFileName != null && originalFileName != "") {
				String uploadPath = uploadRoot+"/Desktop/upload/"+path;
				System.out.println(uploadPath);

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
	
	   /**
     * 맥 OS의 한글 인코딩 방식을 고려한 파일명 보정
     *
     * @param fileName
     * @param isMacOS
     * @param convertToMacFileName
     * @return
     */
    public String convertFileNameForOs(String fileName) {
        if (fileName == null) {
            fileName = "";
        }
        
		String osName = System.getProperty("os.name").toLowerCase();
		
        // 맥은 NFD(조합형), 윈도우는 NFC(완성형) 방식을 사용한다.
        if (osName.contains("window")) {
            // 윈도우 파일명 => 맥 파일명
            if (Normalizer.isNormalized(fileName, Normalizer.Form.NFC)) {
                fileName = Normalizer.normalize(fileName, Normalizer.Form.NFD);
            }
        } else {
            // 맥 파일명 => 윈도우 파일명 (맥에서 파일 업로드 시 사용)
            if (Normalizer.isNormalized(fileName, Normalizer.Form.NFD)) {
                fileName = Normalizer.normalize(fileName, Normalizer.Form.NFC);
            }
        }
        
        System.out.println(fileName);
        
        return fileName;
    }
}

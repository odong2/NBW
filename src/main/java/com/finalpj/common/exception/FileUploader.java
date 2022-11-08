package com.finalpj.common.exception;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

public class FileUploader {

	public static String fileUpload(MultipartFile file) {

		String originalFileName = file.getOriginalFilename();
		String saveFileName = "";

		// 첨부파일이 있을 경우
		if (originalFileName != null && originalFileName != "") {
			String uploadPath = Paths.get(System.getProperty("user.home")).resolve("upload/review").toString();

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

			String originalFileName = file.getOriginalFilename();
			String saveFileName = "";

			// 첨부파일이 있을 경우
			if (originalFileName != null && originalFileName != "") {
				String uploadPath = Paths.get(System.getProperty("user.home")).resolve("upload/review").toString();
				
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

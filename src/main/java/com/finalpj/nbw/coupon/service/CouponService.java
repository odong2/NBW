package com.finalpj.nbw.coupon.service;

import com.finalpj.common.FileUploader;
import com.finalpj.nbw.coupon.dao.CouponDao;
import com.finalpj.nbw.coupon.domain.Coupon;
import lombok.extern.log4j.Log4j;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class CouponService {
    private final CouponDao couponDao;
    private final FileUploader fileUploader;
    public CouponService(CouponDao couponDao, FileUploader fileUploader){

        this.couponDao = couponDao;
        this.fileUploader = fileUploader;
    }

    /************************* 모든 쿠폰 조회 *****************************/
    public List<Coupon> getAllRegistedCoupon () throws Exception {
       return couponDao.selectAllCoupon();
    }

    /******************* 다운로드 가능한 쿠폰 조회(마이페이지 쿠폰탭에서 사용) **********************/
    public List<Coupon> getDownLoadableCoupon(String mem_id) throws Exception{
        List<Coupon> couponList = null;
        couponList = couponDao.selectMemPublicCoupon(mem_id);
        return couponList;
    }
    /*************************** 이미 다운로드 된 쿠폰인지 조회 *********************************/
    public String searchDownloadedCoupon(Map pMap) throws Exception{
        return couponDao.selectDownloadedCoupon(pMap);
    }

    /************************** 회원 쿠폰정보 조회 *****************************/
    public List<Coupon> getCouponList(String mem_id) throws Exception{

        List<Coupon> couponList = null;
        /* (1) 쿠폰이 있는지 조회 */
        int isCoupon = couponDao.selectIsCoupon(mem_id);
        log.info("쿠폰 존재 여부 ====> " + isCoupon);
        /* (2) 쿠폰 조회결과로 분기 */
        if(isCoupon > 0){
            log.info("쿠폰이 존재함");
            /* (3) 쿠폰이 존재할 경우 회원의 쿠폰조회 */
            couponList = couponDao.selectCouponList(mem_id);
        }else {
            /* (3) 쿠폰이 존재하지 않을 경우 couponList 빈값 */
            log.info("쿠폰이 존재하지 않음");
        }
        return couponList;
    }
    /************************ 쿠폰 등록(관리자) *****************************/
    public int registCoupon(Coupon couponDto) throws Exception{
        // (1) 쿠폰의 이미지 업로드 분기
        MultipartFile couponImg = couponDto.getCp_file();
        String originalFileName = couponImg.getOriginalFilename();
        String saveImgName = "";
        // 업로드 파일이 없을 경우
        if(originalFileName.trim() == ""){
            return couponDao.insertCoupon(couponDto);
        }
        // 업로드 파일이 있는 경우
        saveImgName = fileUploader.fileUpload(couponImg, "coupon");
        couponDto.setCp_img(saveImgName);
        return couponDao.insertCoupon(couponDto);
    }
    /************************** 쿠폰 삭제 ******************************/
    public int removeCoupon(String cp_no) throws Exception{
        return couponDao.deleteCoupon(cp_no);
    }

    /************************ 쿠폰 다운로드 ****************************/
    public void downLoadCoupon(Map pMap) throws Exception{
        // (1) 다운로드 한 쿠폰을 tb_coupondownload 테이블에 등록
        int result = couponDao.insertDownloadCoupon(pMap);

        // (2) tb_couponzip 테이블에 해당 쿠폰 및 mem_id 등록
        if(result ==1){
            couponDao.insertMemCoupon(pMap);
        }
    }

}

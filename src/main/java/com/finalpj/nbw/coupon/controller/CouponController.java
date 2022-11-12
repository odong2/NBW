package com.finalpj.nbw.coupon.controller;

import com.finalpj.common.FileUploader;
import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.coupon.service.CouponService;
import com.finalpj.nbw.member.domain.Member;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.annotations.Delete;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Log4j
@Controller
@RequestMapping("/coupon")
public class CouponController {

    private final CouponService couponService;
    public CouponController( CouponService couponService){
        this.couponService = couponService;

    }
    /*********************************** 쿠폰 등록 ******************************/
    @PostMapping("/write")
    @ResponseBody
    public ResponseEntity<String> writeCoupon(Coupon couponDto, RedirectAttributes attr){
            log.info(couponDto);
            try {
                couponService.registCoupon(couponDto);
//                attr.addFlashAttribute("msg", "쿠폰 등록이 완료되었습니다");
            } catch(Exception e){
                e.printStackTrace();
//                attr.addFlashAttribute("msg", "쿠폰 등록중 문제가 생겼습니다. 다시 등록해 주세요.");
                return new ResponseEntity<String>("ERR",HttpStatus.BAD_REQUEST);
            }
                return new ResponseEntity<String>("OK",HttpStatus.OK);
    }
    /*********************************** 쿠폰 삭제 *********************************/
    @DeleteMapping("/{cp_no}")
    @ResponseBody
    public ResponseEntity<String> removeCoupon(@PathVariable String cp_no){
        try{
            couponService.removeCoupon(cp_no);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("ERR", HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<String>("OK", HttpStatus.OK);
    }
    /***************************** 등록된 모든 쿠폰 리스트 조회 *****************************/
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<List<Coupon>> getCouponList(){
        List<Coupon> couponList = null;
        try {
            couponList = couponService.getAllRegistedCoupon();
        }catch (Exception e){
            e.printStackTrace();
        }
        return new ResponseEntity<List<Coupon>>(couponList,HttpStatus.OK);
    }
    /**************************** 다운로드 가능한 쿠폰 리스트 조회  ***************************/
    @GetMapping("/down/list")
    @ResponseBody
    public ResponseEntity<List<Coupon>> getDownCouponList(HttpSession session){
        Member member = (Member)session.getAttribute("member");
        String mem_id = member.getMem_id();
        List<Coupon> couponList = null;
        try {
            couponList = couponService.getDownLoadableCoupon(mem_id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return new ResponseEntity<List<Coupon>>(couponList,HttpStatus.OK);
    }
    /******************************* 다운로드 한 쿠폰인지 조회 ************************************/
    @GetMapping("/check/{cp_no}")
    @ResponseBody
    public ResponseEntity<String> searchDownloadedCoupon(@PathVariable String cp_no, HttpSession session){
        String result = "";
        Member member = (Member)session.getAttribute("member");
        String mem_id = member.getMem_id();
        Map<String,String> pMap = new HashMap();
        pMap.put("cp_no", cp_no);
        pMap.put("mem_id", mem_id);
        try {
            result = couponService.searchDownloadedCoupon(pMap);
        } catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<String>(result, HttpStatus.OK);
    }

    /********************************  마이페이지에서 쿠폰 다운로드  *********************************/
    @PostMapping("/down/{cp_no}")
    @ResponseBody
    public ResponseEntity<String> downloadCoupon(@PathVariable String cp_no,HttpSession session){
        Member member= (Member)session.getAttribute("member");
        String mem_id = member.getMem_id();
        Map<String,String> pMap = new HashMap<>();
        pMap.put("mem_id",mem_id);
        pMap.put("cp_no", cp_no);
        try{
            couponService.downLoadCoupon(pMap);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("ERR", HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<String>("OK",HttpStatus.OK);
    }

    /********************************  쿠폰 썸네일  *********************************/
    @GetMapping("/display/{fileName:.+}")
    @ResponseBody
    public ResponseEntity<byte[]> getFile (@PathVariable String fileName){
        log.info("fileName : " + fileName);
        final String uploadRoot = System.getProperty("user.home");
        final String fileFolder = uploadRoot+"/Desktop/upload/coupon/";
        File file = new File(fileFolder + fileName);

        log.info("file: " + file);

        ResponseEntity<byte[]> result = null;

        try{
            HttpHeaders header = new HttpHeaders();

            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result= new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    /***************************** 쿠폰 번호 생성 ******************************/
    @GetMapping("/random/cpno")
    @ResponseBody
    public ResponseEntity<String> createCouponNumber(){
        String uuid = UUID.randomUUID().toString();
        String cpNo = uuid.substring(0,18);

        return new ResponseEntity<String>(cpNo, HttpStatus.OK);
    }


}

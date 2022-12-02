package com.finalpj.nbw.coupon.controller;

import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.coupon.service.CouponService;
import com.finalpj.nbw.member.domain.Member;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Files;
import java.util.*;

@Log4j
@Controller
@RequestMapping("/coupon")
public class CouponController {

    private final CouponService couponService;
    public CouponController(CouponService couponService){
        this.couponService = couponService;

    }

    /****************************** 회원의 쿠폰 조회 **************************************
     * @param  session : 회원의 아이디를 넘겨 받아 해당 회원의 쿠폰을 조회하는 데 사용
     * @return  : 회원이 가지고 있는 쿠폰을 CouponDto에 담아 List형태로 응답한다.
     * ***************************************************************************************/
    @GetMapping("/list/member")
    @ResponseBody
    public ResponseEntity<List<Coupon>> getMemCouponList(HttpSession session){
        Member member = (Member)session.getAttribute("member");
        String mem_id = member.getMem_id();
        List<Coupon> couponList = new ArrayList<>();
        try{
        couponList = couponService.getCouponList(mem_id);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ResponseEntity<List<Coupon>>(couponList, HttpStatus.OK);
    }

    /***************************** 쿠폰 등록(관리자) ******************************
     * @param couponDto : 관리자가 등록한 쿠폰의 정보를 CouponDto에 담아 등록한다.
     * @return : 오류 시 메시지 Err 전달, 성공 시 메시지 OK 전달
     ***************************************************************************/
    @PostMapping("/write")
    @ResponseBody
    public ResponseEntity<String> writeCoupon(Coupon couponDto){
            log.info(couponDto);
            try {
                couponService.registCoupon(couponDto);
            } catch(Exception e){
                e.printStackTrace();
                return new ResponseEntity<String>("ERR",HttpStatus.BAD_REQUEST);
            }
                return new ResponseEntity<String>("OK",HttpStatus.OK);
    }

    /******************************** 쿠폰 삭제(관리자)  ************************************
     * @param cp_no : 삭제 할 쿠폰 번호를 url형태로 넘겨 받아 해당 쿠폰 번호에 해당하는 쿠폰을 삭제한다
     * @return  : 오류 시 메시지 Err 전달, 성공 시 메시지 OK 전달
     ************************************************************************************/
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

    /***************************** 등록된 모든 쿠폰 리스트 조회(관리자) ****************************
     * 관리자 페이지에서 등록된 쿠폰 모두 조회
     * @return List<Coupon> : CouponDto에 담아 모든 List형태로 전달
     *****************************************************************************************/
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

    /**************************** 다운로드 가능한 쿠폰 리스트 조회  ******************************
     * @param session : 회원의 아이디를 통해 다운로드 가능한 쿠폰 리스트 조회
     * @return List<Coupon> : 다운로드 가능한 쿠폰 리스트 return
     ****************************************************************************************/
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

    /******************************* 다운로드 한 쿠폰인지 조회 ***********************************
     * @param cp_no : 쿠폰 번호를 넘겨 받아 해당 쿠폰이 다우로드 한 쿠폰인지 조회
     * @param session : session에서 member의 id 꺼냄/
     * @return result 값이 'Y' 면 다운로드 가능, 'N'이면 이미 다운로드 받은 쿠폰(DB에서 NVL2로 결과값을 가지고 온다)
     *****************************************************************************************/
    @GetMapping("/check/{cp_no}")
    @ResponseBody
    public ResponseEntity<String> searchDownloadedCoupon(@PathVariable String cp_no, HttpSession session){
        String result = "";
        Member member = (Member)session.getAttribute("member");
        String mem_id = member.getMem_id();
        //(1) 쿠폰번호, 아이디를 Map에 담아 Service 단으로 전달
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

    /********************************  마이페이지에서 쿠폰 다운로드  *********************************
     * @param cp_no : 쿠폰 번호
     * @param session : Session에서 Member의 id 구함
     * @return 다운로드 실패하면 'ERR' 메시지 전달, 다운로드 성공 시 'OK'메시지 전달
     *******************************************************************************************/
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

    /********************************  쿠폰 썸네일  *********************************
     * @param fileName : 쿠폰 이미지 이름
     * @return 해당 이미지 파일 byte 단위로 전송
     ******************************************************************************/
     /********************* @PathVariable 사용시 주의사항******************************
     * - null이나 공백 값이 들어가는 parameter는 적용시키지 말것.
     * - .(dot) 이 포함되어 있으면 . 포함하여 그 뒤가 잘려서 들어오므로 주의
     * - {변수: .+} 로 해결
     ******************************************************************************/
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
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    /***************************** 쿠폰 번호 생성(관리자) ******************************
     * @return 18자리의 난수를 생성하여 return
     *******************************************************************************/
    @GetMapping("/random/cpno")
    @ResponseBody
    public ResponseEntity<String> createCouponNumber(){
        String uuid = UUID.randomUUID().toString();
        String cpNo = uuid.substring(0,18);
        return new ResponseEntity<String>(cpNo, HttpStatus.OK);
    }


}

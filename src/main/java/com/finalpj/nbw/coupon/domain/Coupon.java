package com.finalpj.nbw.coupon.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Coupon {
    @Max(10)
    @NotBlank
    private String cp_no;
    @NotBlank
    private String cp_name;
    @NotBlank
    private Integer cp_price;
    @NotBlank
    private String cp_public;
    private MultipartFile cp_file;
    @Nullable
    private String cp_img;
    @Nullable
    private Date cp_cdate;
    @Nullable
    private String mem_id;
}

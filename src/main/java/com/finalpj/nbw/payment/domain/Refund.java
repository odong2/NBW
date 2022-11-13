package com.finalpj.nbw.payment.domain;

import java.util.Date;

import org.springframework.lang.Nullable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Refund {
	private String refund_no;             
	private String refund_reason;           
	private Date apply_date;           
	private String refund_status;    
	@Nullable
	private Date confirm_date;           
	private String order_no;           
	private Integer p_no;           
}

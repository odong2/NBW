package com.finalpj.nbw.payment.domain;

import java.util.Date;

import org.springframework.lang.Nullable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminPayment {
	private String order_no;
	private Integer p_no;
	@Nullable
	private String mem_id;
	private Date order_date;
	private String order_status;
}

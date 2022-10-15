package com.finalpj.nbw.cart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalpj.nbw.cart.dao.CartDao;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartService {
	
	@Autowired
	private CartDao cartDao;
	
	
}

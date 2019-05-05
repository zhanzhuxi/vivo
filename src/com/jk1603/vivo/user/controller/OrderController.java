package com.jk1603.vivo.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="/get",method=RequestMethod.GET)
	public String get() {
		return "user/order";
	}
	
}

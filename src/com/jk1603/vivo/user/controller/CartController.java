package com.jk1603.vivo.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.User;
import com.jk1603.vivo.user.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	HttpSession session;
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value="/get",method=RequestMethod.GET)
	public String get() {
		return "user/cart";
	}

	@ResponseBody
	@RequestMapping("/cart")
	public List<Cart> selectCart() {
		Cart cart=new Cart();
		Integer userid=(Integer) session.getAttribute("userid");
		User user=new User();
		user.setId(userid);
		cart.setUser(user);
		List<Cart> result=cartService.selectCart(cart);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/deletegoods")
	public String deleteGoods(Integer id) {
		String result=cartService.deleteGoods(id);
		return result;
	}
	
	//购物车里的每一条商品信息
	@ResponseBody
	@RequestMapping(value="/addorder",method=RequestMethod.POST)
	public String addOrder(@RequestBody List<Cart> goodsList){
		//List<Cart> result=cartService.get();
		return "";
	}
}

package com.jk1603.vivo.user.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.Goods;
import com.jk1603.vivo.user.pojo.User;
import com.jk1603.vivo.user.service.MyIndexService;

@Controller
@RequestMapping("/myindex")
public class MyIndexController {
	@Autowired
	HttpSession session;
	
	@Autowired
	MyIndexService myindexService;
	
	@RequestMapping(value="/get",method=RequestMethod.GET)
	public String get() {
		return "user/myindex";
	}
	
	@ResponseBody
	@RequestMapping("/myindex")
	public List<Goods> selectMobile(Integer id,String imgurl,String goodsname,String discount,BigDecimal price) {
		Goods goods=new Goods();
		goods.setId(id);
		goods.setImgurl(imgurl);
		goods.setGoodsname(goodsname);
		goods.setDiscount(discount);
		goods.setPrice(price);
		List<Goods> result=myindexService.selectMobile(goods);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/myindex1")
	public List<Goods> selectPart(Integer id,String imgurl,String goodsname,String discount,BigDecimal price) {
		Goods goods=new Goods();
		goods.setId(id);
		goods.setImgurl(imgurl);
		goods.setGoodsname(goodsname);
		goods.setDiscount(discount);
		goods.setPrice(price);
		List<Goods> result=myindexService.selectPart(goods);
		return result;
	}
	@ResponseBody
	@RequestMapping("/addCart")
	public String addCart(Integer goodsid) {
		Goods goods=new Goods();
		goods.setId(goodsid);
		Cart cart=new Cart();
		cart.setGoods(goods);
		cart.setQuantity(0);
		Integer userid=(Integer) session.getAttribute("userid");
		User user=new User();
		user.setId(userid);
		cart.setUser(user);
		String result=myindexService.addCart(cart);
		return result;
	}
//	public String addCart(String goodsname,BigDecimal price) {
//		Goods goods=new Goods();
//		goods.setGoodsname(goodsname);
//		goods.setPrice(price);
//		String result=myindexService.addCart(goods);
//		return result;
//	}
}

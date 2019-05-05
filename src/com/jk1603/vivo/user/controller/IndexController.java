package com.jk1603.vivo.user.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk1603.vivo.user.pojo.Goods;
import com.jk1603.vivo.user.service.IndexService;

@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	IndexService indexService;
	
	@RequestMapping(value="/get",method=RequestMethod.GET)
	public String get() {
		return "user/index";
	}
	
	@ResponseBody
	@RequestMapping("/index")
	public List<Goods> selectMobile(String imgurl,String goodsname,String discount,BigDecimal price) {
		Goods goods=new Goods();
		goods.setImgurl(imgurl);
		goods.setGoodsname(goodsname);
		goods.setDiscount(discount);
		goods.setPrice(price);
		List<Goods> result=indexService.selectMobile(goods);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/index1")
	public List<Goods> selectPart(String imgurl,String goodsname,String discount,BigDecimal price) {
		Goods goods=new Goods();
		goods.setImgurl(imgurl);
		goods.setGoodsname(goodsname);
		goods.setDiscount(discount);
		goods.setPrice(price);
		List<Goods> result=indexService.selectPart(goods);
		return result;
	}
}

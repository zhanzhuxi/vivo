package com.jk1603.vivo.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk1603.vivo.admin.pojo.Entry;
import com.jk1603.vivo.admin.pojo.Goods;
import com.jk1603.vivo.admin.pojo.Order;
import com.jk1603.vivo.admin.pojo.Store;
import com.jk1603.vivo.admin.service.EntryService;

@Controller
@RequestMapping("/vivoadmin")
public class AdminController {
	
	@Autowired
	EntryService entryService;
	
	@RequestMapping(value="/getentry" ,method=RequestMethod.GET)
	public String get(HttpSession session) {
		if(session.getAttribute("adname") != null) {
			return "admin/vivoback";
		}else {
			return "admin/adminlogin";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/getentry" ,method=RequestMethod.POST)
	public List<Entry> getDate() {
		List<Entry> result = entryService.get();
		return result;
	}
	
	// 入库操作
	@ResponseBody
	@RequestMapping("/addentry")
	public String addEntry(String goodsname,Integer goodsquantity) {
		Entry entry = new Entry();
		entry.setGoodsquantity(goodsquantity);
		Goods goods = new Goods();
		goods.setGoodsname(goodsname);
//		goods.setPrice(goodsprice);
		entry.setGoods(goods);
		
		System.out.println(entry.getGoods().getGoodsname());
		System.out.println(entry.getGoodsquantity());
//		System.out.println(entry.getGoods().getPrice());
		
		String result = entryService.addEntry(entry);
		return result;
	}
	
	// 刷新:已完成(重新发送数据库请求,刷新页面数据即可)
	
	// 删除
	@ResponseBody
	@RequestMapping("/deleteentry")
	public String deleteEntry(Integer id) {
		String result = entryService.deleteEntry(id);
		return result;
	}
	
	// 删除几条数据
	@ResponseBody
	@RequestMapping("/deletesomeentry")
	public String deleteSomeEntry(@RequestBody Integer[] deletesomeentry) {
		for(int i=0;i<deletesomeentry.length;i++) {
			System.out.println(deletesomeentry[i]);
		}
		String result = entryService.deleteSomeEntry(deletesomeentry);
		return result;
		//return "delete some entry success!";
	}
	
	// 编辑
	@ResponseBody
	@RequestMapping("/editentry")
	public String modifyEntry(@RequestParam int editid,@RequestParam String editgoodsname,@RequestParam Integer editgoodsquantity) {
		Entry entry = new Entry();
		entry.setId(editid);
		entry.setGoodsquantity(editgoodsquantity);
		Goods goods = new Goods();
		goods.setGoodsname(editgoodsname);
		//goods.setPrice(editgoodsprice);
		entry.setGoods(goods);
		
		System.out.println(editid);
		System.out.println(editgoodsname);
		System.out.println(editgoodsquantity);
//		System.out.println(editgoodsprice);
		String result = entryService.modifyEntry(entry);
		return result;
	}
	
	//商品管理
	@ResponseBody
	@RequestMapping("/goodsmanage")
	public List<Goods> getGoodsDate(){
		List<Goods> result = entryService.getGoodsDate();
		return result;
	}
	
	//添加商品
	@ResponseBody
	@RequestMapping("/addgoods")
	public String addGoods(Goods goods) {
		String result = entryService.addGoods(goods);
		return result;
	}
	
	//删除商品
	@ResponseBody
	@RequestMapping("/deletegoods")
	public String deleteGoods(Integer id) {
		String result = entryService.deleteGoods(id);
		return result;
	}
	
	//批量删除商品
	@ResponseBody
	@RequestMapping("/deletesomegoods")
	public String deleteSomeGoods(@RequestBody Integer[] deletesomegoods) {
		String result = entryService.deleteSomeGoods(deletesomegoods);
		System.out.println(deletesomegoods[0]);
		return result;
	}
	
	//编辑商品信息
	@ResponseBody
	@RequestMapping("/editgoods")
	public String editGoods(Goods goods) {
		String result = entryService.editGoods(goods);
		return result;
	}
	
	//查询仓库信息
	@ResponseBody
	@RequestMapping("/getStore")
	public List<Store> getStoreDate(){
		List<Store> result = entryService.getStoreDate();
		return result;
	}
	
	//将下架的物品上架
	@ResponseBody
	@RequestMapping("/grounding")
	public String grounding(Integer id) {
		String result = entryService.grounding(id);
		return result;
	}
	
	//将上架的物品下架
	@ResponseBody
	@RequestMapping("/undercarriage")
	public String undercarriage(Integer id) {
		String result = entryService.undercarriage(id);
		return result;
	}
	
	//查询订单
	@ResponseBody
	@RequestMapping("/getOrder")
	public List<Order> getOrderDate() {
		List<Order> result = entryService.getOrderDate();
		return result;
	}
	
	//出货
	@ResponseBody
	@RequestMapping("/deliver")
	public String deliver(Integer id,Integer goodsquantity) {
		Order order = new Order();
		order.setId(id);
		order.setGoodsquantity(goodsquantity);
		String result = entryService.deliver(order);
		return result;
	}
}

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
	
	// ������
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
	
	// ˢ��:�����(���·������ݿ�����,ˢ��ҳ�����ݼ���)
	
	// ɾ��
	@ResponseBody
	@RequestMapping("/deleteentry")
	public String deleteEntry(Integer id) {
		String result = entryService.deleteEntry(id);
		return result;
	}
	
	// ɾ����������
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
	
	// �༭
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
	
	//��Ʒ����
	@ResponseBody
	@RequestMapping("/goodsmanage")
	public List<Goods> getGoodsDate(){
		List<Goods> result = entryService.getGoodsDate();
		return result;
	}
	
	//�����Ʒ
	@ResponseBody
	@RequestMapping("/addgoods")
	public String addGoods(Goods goods) {
		String result = entryService.addGoods(goods);
		return result;
	}
	
	//ɾ����Ʒ
	@ResponseBody
	@RequestMapping("/deletegoods")
	public String deleteGoods(Integer id) {
		String result = entryService.deleteGoods(id);
		return result;
	}
	
	//����ɾ����Ʒ
	@ResponseBody
	@RequestMapping("/deletesomegoods")
	public String deleteSomeGoods(@RequestBody Integer[] deletesomegoods) {
		String result = entryService.deleteSomeGoods(deletesomegoods);
		System.out.println(deletesomegoods[0]);
		return result;
	}
	
	//�༭��Ʒ��Ϣ
	@ResponseBody
	@RequestMapping("/editgoods")
	public String editGoods(Goods goods) {
		String result = entryService.editGoods(goods);
		return result;
	}
	
	//��ѯ�ֿ���Ϣ
	@ResponseBody
	@RequestMapping("/getStore")
	public List<Store> getStoreDate(){
		List<Store> result = entryService.getStoreDate();
		return result;
	}
	
	//���¼ܵ���Ʒ�ϼ�
	@ResponseBody
	@RequestMapping("/grounding")
	public String grounding(Integer id) {
		String result = entryService.grounding(id);
		return result;
	}
	
	//���ϼܵ���Ʒ�¼�
	@ResponseBody
	@RequestMapping("/undercarriage")
	public String undercarriage(Integer id) {
		String result = entryService.undercarriage(id);
		return result;
	}
	
	//��ѯ����
	@ResponseBody
	@RequestMapping("/getOrder")
	public List<Order> getOrderDate() {
		List<Order> result = entryService.getOrderDate();
		return result;
	}
	
	//����
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

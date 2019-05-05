package com.jk1603.vivo.admin.service;

import java.util.List;

import com.jk1603.vivo.admin.pojo.Entry;
import com.jk1603.vivo.admin.pojo.Goods;
import com.jk1603.vivo.admin.pojo.Order;
import com.jk1603.vivo.admin.pojo.Store;

public interface EntryService {
	List<Entry> get();
	
	String addEntry(Entry entry);
	
	String deleteEntry(Integer id);
	
	String deleteSomeEntry(Integer[] deletesomeentry);
	
	String modifyEntry(Entry entry);
	
	List<Goods> getGoodsDate();
	
	String addGoods(Goods goods);
	
	String deleteGoods(Integer id);
	
	String deleteSomeGoods(Integer[] deletesomegoods);
	
	String editGoods(Goods goods);
	
	List<Store> getStoreDate();
	
	String grounding(Integer id);
	
	String undercarriage(Integer id);
	
	List<Order> getOrderDate();
	
	String deliver(Order order);
}

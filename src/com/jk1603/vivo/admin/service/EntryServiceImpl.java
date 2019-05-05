package com.jk1603.vivo.admin.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk1603.vivo.admin.dao.EntryDao;
import com.jk1603.vivo.admin.pojo.Entry;
import com.jk1603.vivo.admin.pojo.Goods;
import com.jk1603.vivo.admin.pojo.Order;
import com.jk1603.vivo.admin.pojo.Store;

@Service
public class EntryServiceImpl implements EntryService {

	@Autowired
	EntryDao entryDao;
	
	//获取页面数据
	@Override
	public List<Entry> get() {
		List<Entry> result = entryDao.get();
		//System.out.println(result.size());
		return result;
	}

	//添加入库信息
	@Override
	public String addEntry(Entry entry) {
		if(entry.getGoods().getGoodsname()=="" || entry.getGoodsquantity() == 0) {
			return "add entry failed!";
		}else {
			//入库前查询商品id，将id填入数组中
			Integer goodsid = entryDao.findGoodsId(entry.getGoods().getGoodsname());
			//原来没有这个商品
			if(goodsid==null) {
				return "goods no exists,please add!";
			}else {		// 商品已经存在
				// 判断仓库中有没有这个商品
				Integer storeid = entryDao.findStoreidByGoodsid(goodsid);
				// 仓库中没有商品先添加记录，同时quantity设置为0，状态设置为下架，ischecked设置为false，goodsid=goodsid
				if(storeid == null) {
					
					// 将传页面输过来的数据重新组合
					Entry conentry = new Entry();
					Goods goods = new Goods();
					goods.setId(goodsid);
					conentry.setGoods(goods);
					conentry.setGoodsquantity(entry.getGoodsquantity());
					conentry.setIschecked(false);
					entryDao.addEntry(conentry);
					
					Store store = new Store();
					store.setGoods(goods);
					store.setGoodsquantity(entry.getGoodsquantity());
					store.setGoodsstate("下架");
					store.setIschecked(false);
					entryDao.addStore(store);
					
					return "add entry success!";
				}else {//仓库中已有商品，改数量即可
					
					// 将传页面输过来的数据重新组合
					Entry conentry = new Entry();
					Goods goods = new Goods();
					goods.setId(goodsid);
					conentry.setGoods(goods);
					conentry.setGoodsquantity(entry.getGoodsquantity());
					conentry.setIschecked(false);
					entryDao.addEntry(conentry);
					
					Store store = new Store();
					store.setId(storeid);
					Integer oldStoreQuantity = entryDao.findStoreQuantityByGoodsid(goodsid);
					int newGoodsQuantity = entry.getGoodsquantity() + oldStoreQuantity;
					store.setGoodsquantity(newGoodsQuantity);
					entryDao.modifyQuantityInStore(store);
					
					return "add entry success!";
				}
				
			}
		}
	}

	//删除入库信息
	@Override
	public String deleteEntry(Integer id) {
		if(id == null) {
			return "no delete!";
		}else {
			entryDao.deleteEntry(id);
			return "delete entry success!";
		}
	}

	//批量删除入库信息
	@Override
	public String deleteSomeEntry(Integer[] deletesomeentry) {
		if(deletesomeentry.length == 0) {
			return "no delete!";
		}else {
			for(int i=0;i<deletesomeentry.length;i++) {
				entryDao.deleteEntry(deletesomeentry[i]);
			}
			return "delete some entry success!";
		}
	}

	//修改入库信息
	@Override
	public String modifyEntry(Entry entry) {
		
		Entry oldEntry = new Entry();
		oldEntry = entryDao.getEntryByEntryid(entry.getId());
		
		System.out.println(oldEntry.getGoods().getGoodsname());
		System.out.println(entry.getGoods().getGoodsname());
		
		//修改的是同一件商品
		if(entry.getGoods().getGoodsname().equals(oldEntry.getGoods().getGoodsname())) {
			entryDao.modifyEntry(entry);
			
			
			Store oldStore = new Store();
			oldStore = entryDao.findStoreinfoByGoodsid(oldEntry.getGoods().getId());//---------------------------------------------有问题
			
			//库存
			int temp = entry.getGoodsquantity() - oldEntry.getGoodsquantity();
			int reserveQuantity = oldStore.getGoodsquantity() + temp ;
			
			Store newStore = new Store();
			newStore.setId(oldStore.getId());
			newStore.setGoodsquantity(reserveQuantity);
			entryDao.modifyQuantityInStore(newStore);
			
			return "edit entry success!";
		}else {
			return "please add entry first!";
		}
	}

	//显示商品信息
	@Override
	public List<Goods> getGoodsDate() {
		List<Goods> goods = entryDao.getGoodsDate();
		System.out.println(goods.size());
		return goods;
	}

	//添加商品
	@Override
	public String addGoods(Goods goods) {
		if(goods.getGoodsname() == "" || goods.getPrice() == (new BigDecimal(0)) || goods.getCategory() == "" || goods.getDetails() == "" || goods.getDiscount() == "") {
			return "add goods failed!";
		}else {
			goods.setIschecked(false);
			entryDao.addGoods(goods);
			return "add goods success!";
		}
	}

	//删除商品
	@Override
	public String deleteGoods(Integer id) {
		if(id == null) {
			return "no delete!";
		}else {
			entryDao.deleteGoods(id);
			return "delete entry success!";
		}
	}

	//批量删除商品
	@Override
	public String deleteSomeGoods(Integer[] deletesomegoods) {
		if(deletesomegoods.length == 0) {
			return "no delete!";
		}else {
			for(int i=0;i<deletesomegoods.length;i++) {
				entryDao.deleteGoods(deletesomegoods[i]);
			}
			return "delete some goods success!";
		}
	}

	//编辑商品
	@Override
	public String editGoods(Goods goods) {
		if(goods.getGoodsname() == "" || goods.getPrice() == (new BigDecimal(0)) || goods.getDetails() == "" || goods.getCategory() == "" || goods.getDiscount() == "") {
			return "no edit!";
		}else {
			entryDao.editGoods(goods);
			return "edit goods success!";
		}
	}

	//查询仓库信息
	@Override
	public List<Store> getStoreDate() {
		List<Store> result = entryDao.getStoreDate();
		System.out.println(result.size());
		return result;
	}

	//将下架的物品上架
	@Override
	public String grounding(Integer id) {
		entryDao.grounding(id);
		return "grounding success!";
	}

	//将上架的物品下架
	@Override
	public String undercarriage(Integer id) {
		entryDao.undercarriage(id);
		return "undercarriage success!";
	}

	//查询订单信息
	@Override
	public List<Order> getOrderDate() {
		List<Order> result = entryDao.getOrderDate();
		System.out.println(result.size());
		return result;
	}

	//出货
	@Override
	public String deliver(Order order) {
		entryDao.changeOrderState(order);
		
		Store store = new Store();
		store = entryDao.findStoreinfoByOrderid(order);
		Integer newStoreGoodsquantity = store.getGoodsquantity() - order.getGoodsquantity();
		
		Store newStore = new Store();
		newStore.setId(store.getId());
		newStore.setGoodsquantity(newStoreGoodsquantity);
		entryDao.changeStoreGoodsquantity(newStore);
		
		return "deliver success!";
	}
}

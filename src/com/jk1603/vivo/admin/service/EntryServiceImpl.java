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
	
	//��ȡҳ������
	@Override
	public List<Entry> get() {
		List<Entry> result = entryDao.get();
		//System.out.println(result.size());
		return result;
	}

	//��������Ϣ
	@Override
	public String addEntry(Entry entry) {
		if(entry.getGoods().getGoodsname()=="" || entry.getGoodsquantity() == 0) {
			return "add entry failed!";
		}else {
			//���ǰ��ѯ��Ʒid����id����������
			Integer goodsid = entryDao.findGoodsId(entry.getGoods().getGoodsname());
			//ԭ��û�������Ʒ
			if(goodsid==null) {
				return "goods no exists,please add!";
			}else {		// ��Ʒ�Ѿ�����
				// �жϲֿ�����û�������Ʒ
				Integer storeid = entryDao.findStoreidByGoodsid(goodsid);
				// �ֿ���û����Ʒ����Ӽ�¼��ͬʱquantity����Ϊ0��״̬����Ϊ�¼ܣ�ischecked����Ϊfalse��goodsid=goodsid
				if(storeid == null) {
					
					// ����ҳ��������������������
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
					store.setGoodsstate("�¼�");
					store.setIschecked(false);
					entryDao.addStore(store);
					
					return "add entry success!";
				}else {//�ֿ���������Ʒ������������
					
					// ����ҳ��������������������
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

	//ɾ�������Ϣ
	@Override
	public String deleteEntry(Integer id) {
		if(id == null) {
			return "no delete!";
		}else {
			entryDao.deleteEntry(id);
			return "delete entry success!";
		}
	}

	//����ɾ�������Ϣ
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

	//�޸������Ϣ
	@Override
	public String modifyEntry(Entry entry) {
		
		Entry oldEntry = new Entry();
		oldEntry = entryDao.getEntryByEntryid(entry.getId());
		
		System.out.println(oldEntry.getGoods().getGoodsname());
		System.out.println(entry.getGoods().getGoodsname());
		
		//�޸ĵ���ͬһ����Ʒ
		if(entry.getGoods().getGoodsname().equals(oldEntry.getGoods().getGoodsname())) {
			entryDao.modifyEntry(entry);
			
			
			Store oldStore = new Store();
			oldStore = entryDao.findStoreinfoByGoodsid(oldEntry.getGoods().getId());//---------------------------------------------������
			
			//���
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

	//��ʾ��Ʒ��Ϣ
	@Override
	public List<Goods> getGoodsDate() {
		List<Goods> goods = entryDao.getGoodsDate();
		System.out.println(goods.size());
		return goods;
	}

	//�����Ʒ
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

	//ɾ����Ʒ
	@Override
	public String deleteGoods(Integer id) {
		if(id == null) {
			return "no delete!";
		}else {
			entryDao.deleteGoods(id);
			return "delete entry success!";
		}
	}

	//����ɾ����Ʒ
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

	//�༭��Ʒ
	@Override
	public String editGoods(Goods goods) {
		if(goods.getGoodsname() == "" || goods.getPrice() == (new BigDecimal(0)) || goods.getDetails() == "" || goods.getCategory() == "" || goods.getDiscount() == "") {
			return "no edit!";
		}else {
			entryDao.editGoods(goods);
			return "edit goods success!";
		}
	}

	//��ѯ�ֿ���Ϣ
	@Override
	public List<Store> getStoreDate() {
		List<Store> result = entryDao.getStoreDate();
		System.out.println(result.size());
		return result;
	}

	//���¼ܵ���Ʒ�ϼ�
	@Override
	public String grounding(Integer id) {
		entryDao.grounding(id);
		return "grounding success!";
	}

	//���ϼܵ���Ʒ�¼�
	@Override
	public String undercarriage(Integer id) {
		entryDao.undercarriage(id);
		return "undercarriage success!";
	}

	//��ѯ������Ϣ
	@Override
	public List<Order> getOrderDate() {
		List<Order> result = entryDao.getOrderDate();
		System.out.println(result.size());
		return result;
	}

	//����
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

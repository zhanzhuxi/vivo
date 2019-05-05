package com.jk1603.vivo.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jk1603.vivo.admin.pojo.Entry;
import com.jk1603.vivo.admin.pojo.Goods;
import com.jk1603.vivo.admin.pojo.Order;
import com.jk1603.vivo.admin.pojo.Store;

public interface EntryDao {
	//��ѯ���������Ϣ
	@Select("select entry.id,goods.goodsname as `goods.goodsname`,entry.goodsquantity,goods.price as `goods.price`,goods.category as `goods.category`,entry.ischecked from entry,goods where entry.goodsid=goods.id")
	List<Entry> get();
	
	//������Ʒ����ѯ��Ʒid��Ȼ��id���������Ϣ
	@Select("select id from goods where goodsname=#{goodsname}")
	Integer findGoodsId(String goodsname);
	
	//��������Ϣ
	@Insert("insert into entry(goodsid,goodsquantity,ischecked) values(#{goods.id},#{goodsquantity},#{ischecked})")
	void addEntry(Entry entry);
	
	//ɾ�������Ϣ
	@Delete("delete from entry where id=#{id}")
	void deleteEntry(int id);
	
	//����id��ѯ�����Ϣ
	@Select("select goodsid as `goods.id`,goodsname as `goods.goodsname`,price as `goods.price`,goodsquantity from goods,entry where goods.id=entry.goodsid and entry.id=#{entryid}")
	Entry getEntryByEntryid(Integer entryid);
	
	//�޸������Ϣ
	@Update("update entry set goodsquantity=#{goodsquantity} where id=#{id}")
	void modifyEntry(Entry entry);
	
	//��ѯ������Ʒ��Ϣ
	@Select("select * from goods")
	List<Goods> getGoodsDate();

	//�������Ʒ
	@Insert("insert into goods(goodsname,price,details,category,discount,ischecked) values(#{goodsname},#{price},#{details},#{category},#{discount},#{ischecked})")
	void addGoods(Goods goods);
	
	//����idɾ����Ʒ
	@Delete("delete from goods where id=#{id}")
	void deleteGoods(int id);
	
	//�޸���Ʒ��Ϣ
	@Update("update goods set goodsname=#{goodsname},price=#{price},details=#{details},category=#{category},discount=#{discount} where id=#{id}")
	void editGoods(Goods goods);
	
	//��ѯ�ֿ�����
	@Select("select store.id,goods.goodsname as `goods.goodsname`,goods.category as `goods.category`,store.goodsquantity,store.goodsstate,store.ischecked from store,goods where store.goodsid=goods.id")
	List<Store> getStoreDate();
	
	//���¼ܵ���Ʒ�ϼ�
	@Update("update store set goodsstate='�ϼ�' where id=#{id}")
	void grounding(int id);
	
	//���ϼܵ���Ʒ�¼�
	@Update("update store set goodsstate='�¼�' where id=#{id}")
	void undercarriage(int id);
	
	//������Ʒid��ѯ�ڲֿ��е�id
	@Select("select id from store where goodsid=#{goodsid}")
	Integer findStoreidByGoodsid(Integer goodsid);
	
	//����storeid�޸���Ʒ�ڲֿ��п������
	@Update("update store set goodsquantity=#{goodsquantity} where id=#{id}")
	void modifyQuantityInStore(Store store);
	
	//�ֿ�����Ӽ�¼
	@Insert("insert into store(goodsid,goodsquantity,goodsstate,ischecked) values(#{goods.id},#{goodsquantity},#{goodsstate},#{ischecked})")
	void addStore(Store store);
	
	//������Ʒid��ѯ�ֿ���Ϣ
	@Select("select store.id,store.goodsquantity from store,goods where store.goodsid=#{goodsid} and store.goodsid=goods.id")
	Store findStoreinfoByGoodsid(Integer goodsid);
	
	//������Ʒid��ѯ�ֿ���
	@Select("select store.goodsquantity from store where store.goodsid=#{goodsid}")
	Integer findStoreQuantityByGoodsid(Integer goodsid);
	
	//��ѯ����
	@Select("select `order`.id,`user`.username as `user.username`,goods.goodsname as `goods.goodsname`,`order`.goodsquantity,`user`.address as `user.address`,`order`.state,`order`.ischecked from `user`,goods,`order` where `order`.goodsid=goods.id and `order`.userid=`user`.id")
	List<Order> getOrderDate();
	
	//���ݶ����Ų�ѯ�ֿ���Ʒ��Ϣ
	@Select("select store.id,store.goodsquantity from `order`,store where `order`.goodsid=store.goodsid and `order`.id=#{id}")
	Store findStoreinfoByOrderid(Order order);
	
	//�ı䶩��״̬
	@Update("update `order` set state='�ѳ���' where id=#{id}")
	void changeOrderState(Order order);
	
	//�����ı�ֿ�����
	@Update("update store set goodsquantity=#{goodsquantity} where id=#{id}")
	void changeStoreGoodsquantity(Store store);
}

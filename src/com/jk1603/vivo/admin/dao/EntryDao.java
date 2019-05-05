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
	//查询所有入库信息
	@Select("select entry.id,goods.goodsname as `goods.goodsname`,entry.goodsquantity,goods.price as `goods.price`,goods.category as `goods.category`,entry.ischecked from entry,goods where entry.goodsid=goods.id")
	List<Entry> get();
	
	//根据商品名查询商品id，然后将id填入入库信息
	@Select("select id from goods where goodsname=#{goodsname}")
	Integer findGoodsId(String goodsname);
	
	//添加入库信息
	@Insert("insert into entry(goodsid,goodsquantity,ischecked) values(#{goods.id},#{goodsquantity},#{ischecked})")
	void addEntry(Entry entry);
	
	//删除入库信息
	@Delete("delete from entry where id=#{id}")
	void deleteEntry(int id);
	
	//根据id查询入库信息
	@Select("select goodsid as `goods.id`,goodsname as `goods.goodsname`,price as `goods.price`,goodsquantity from goods,entry where goods.id=entry.goodsid and entry.id=#{entryid}")
	Entry getEntryByEntryid(Integer entryid);
	
	//修改入库信息
	@Update("update entry set goodsquantity=#{goodsquantity} where id=#{id}")
	void modifyEntry(Entry entry);
	
	//查询所有商品信息
	@Select("select * from goods")
	List<Goods> getGoodsDate();

	//添加新商品
	@Insert("insert into goods(goodsname,price,details,category,discount,ischecked) values(#{goodsname},#{price},#{details},#{category},#{discount},#{ischecked})")
	void addGoods(Goods goods);
	
	//根据id删除商品
	@Delete("delete from goods where id=#{id}")
	void deleteGoods(int id);
	
	//修改商品信息
	@Update("update goods set goodsname=#{goodsname},price=#{price},details=#{details},category=#{category},discount=#{discount} where id=#{id}")
	void editGoods(Goods goods);
	
	//查询仓库数据
	@Select("select store.id,goods.goodsname as `goods.goodsname`,goods.category as `goods.category`,store.goodsquantity,store.goodsstate,store.ischecked from store,goods where store.goodsid=goods.id")
	List<Store> getStoreDate();
	
	//将下架的物品上架
	@Update("update store set goodsstate='上架' where id=#{id}")
	void grounding(int id);
	
	//将上架的物品下架
	@Update("update store set goodsstate='下架' where id=#{id}")
	void undercarriage(int id);
	
	//根据商品id查询在仓库中的id
	@Select("select id from store where goodsid=#{goodsid}")
	Integer findStoreidByGoodsid(Integer goodsid);
	
	//根据storeid修改商品在仓库中库存数量
	@Update("update store set goodsquantity=#{goodsquantity} where id=#{id}")
	void modifyQuantityInStore(Store store);
	
	//仓库中添加记录
	@Insert("insert into store(goodsid,goodsquantity,goodsstate,ischecked) values(#{goods.id},#{goodsquantity},#{goodsstate},#{ischecked})")
	void addStore(Store store);
	
	//根据商品id查询仓库信息
	@Select("select store.id,store.goodsquantity from store,goods where store.goodsid=#{goodsid} and store.goodsid=goods.id")
	Store findStoreinfoByGoodsid(Integer goodsid);
	
	//根据商品id查询仓库库存
	@Select("select store.goodsquantity from store where store.goodsid=#{goodsid}")
	Integer findStoreQuantityByGoodsid(Integer goodsid);
	
	//查询订单
	@Select("select `order`.id,`user`.username as `user.username`,goods.goodsname as `goods.goodsname`,`order`.goodsquantity,`user`.address as `user.address`,`order`.state,`order`.ischecked from `user`,goods,`order` where `order`.goodsid=goods.id and `order`.userid=`user`.id")
	List<Order> getOrderDate();
	
	//根据订单号查询仓库商品信息
	@Select("select store.id,store.goodsquantity from `order`,store where `order`.goodsid=store.goodsid and `order`.id=#{id}")
	Store findStoreinfoByOrderid(Order order);
	
	//改变订单状态
	@Update("update `order` set state='已出货' where id=#{id}")
	void changeOrderState(Order order);
	
	//出货改变仓库数量
	@Update("update store set goodsquantity=#{goodsquantity} where id=#{id}")
	void changeStoreGoodsquantity(Store store);
}

package com.jk1603.vivo.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.Order;

public interface CartDao {
	// 查询购物车信息
	@Select("select cart.id,goods.goodsname as 'goods.goodsname',goods.price as 'goods.price',cart.quantity \r\n" + 
			"from `user`,goods,cart \r\n" + 
			"where goods.id=cart.goodsid \r\n" + 
			"and cart.userid=`user`.id \r\n" + 
			"and `user`.id=#{c.user.id}")
	public List<Cart> selectCart(@Param("c") Cart cart);
	
	@Delete("delete from cart where id=#{id}")
	void deleteGoods(Integer id);
	
	@Insert("insert into order(userid,goodsid,goodsquantity,state,ischecked) values(#{user.id},#{goods.id},#{goodsquantity},#{state},#{ischecked})")
	void addOrder(Order order);
}

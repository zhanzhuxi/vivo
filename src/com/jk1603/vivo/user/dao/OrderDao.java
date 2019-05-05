package com.jk1603.vivo.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.Goods;

public interface OrderDao {
	// 查询购物车信息
		@Select("select goodsname,discount,price from order")
		public List<Goods> selectOrder(@Param("goodsname") String username, @Param("discount") String discount,
				@Param("price") String price);
		
//		@Select("select goods.imgurl as 'goods.imgurl',goods.goodsname as 'goods.goodsname',goods.discount as 'goods.discount',goods.details as 'goods.details',goods.price as 'goods.price'\r\n" + 
//				"from `user`,goods,cart\r\n" + 
//				"where goods.id=cart.goodsid \r\n" + 
//				"and cart.userid=`user`.id \r\n" + 
//				"and cart.id=#{id}")
//		public List<Cart> selectOrder(Cart cart);
}

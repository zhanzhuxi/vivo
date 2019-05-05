package com.jk1603.vivo.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.Goods;

public interface MyIndexDao {
	// 查询手机信息
	@Select("select id,imgurl,goodsname,discount,price from goods where category='手机'")
	public List<Goods> selectMobile(@Param("g") Goods goods);

	// 查询配件信息
	@Select("select id,imgurl,goodsname,discount,price from goods where category='配件'")
	public List<Goods> selectPart(@Param("g") Goods goods);

	 //(验证商品是否存在)
	@Select("select * from cart where goodsid=#{goodsid};")
	Integer isExist(Integer goodsid);
	
	// 加入购物车
	@Insert("insert into cart (quantity,userid,goodsid) values(#{quantity},#{user.id},#{goods.id});")
	 void addCart(Cart cart);
	
}

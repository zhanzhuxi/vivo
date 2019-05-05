package com.jk1603.vivo.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.Goods;

public interface MyIndexDao {
	// ��ѯ�ֻ���Ϣ
	@Select("select id,imgurl,goodsname,discount,price from goods where category='�ֻ�'")
	public List<Goods> selectMobile(@Param("g") Goods goods);

	// ��ѯ�����Ϣ
	@Select("select id,imgurl,goodsname,discount,price from goods where category='���'")
	public List<Goods> selectPart(@Param("g") Goods goods);

	 //(��֤��Ʒ�Ƿ����)
	@Select("select * from cart where goodsid=#{goodsid};")
	Integer isExist(Integer goodsid);
	
	// ���빺�ﳵ
	@Insert("insert into cart (quantity,userid,goodsid) values(#{quantity},#{user.id},#{goods.id});")
	 void addCart(Cart cart);
	
}

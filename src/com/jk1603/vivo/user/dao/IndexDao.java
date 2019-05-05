package com.jk1603.vivo.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.user.pojo.Goods;

public interface IndexDao {
	// 查询手机信息
	@Select("select imgurl,goodsname,discount,price from goods where category='手机'")
	public List<Goods> selectMobile(@Param("g") Goods goods);

	// 查询配件信息
	@Select("select imgurl,goodsname,discount,price from goods where category='配件'")
	public List<Goods> selectPart(@Param("g") Goods goods);

}

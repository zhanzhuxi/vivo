package com.jk1603.vivo.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.user.pojo.Goods;

public interface IndexDao {
	// ��ѯ�ֻ���Ϣ
	@Select("select imgurl,goodsname,discount,price from goods where category='�ֻ�'")
	public List<Goods> selectMobile(@Param("g") Goods goods);

	// ��ѯ�����Ϣ
	@Select("select imgurl,goodsname,discount,price from goods where category='���'")
	public List<Goods> selectPart(@Param("g") Goods goods);

}

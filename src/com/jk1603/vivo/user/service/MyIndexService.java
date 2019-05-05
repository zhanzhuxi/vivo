package com.jk1603.vivo.user.service;

import java.util.List;

import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.Goods;

public interface MyIndexService {
	//查询手机信息
	public List<Goods> selectMobile(Goods goods);
	//查询配件信息
	public List<Goods> selectPart(Goods goods);
	//加入购物车
	public String addCart(Cart cart);
}
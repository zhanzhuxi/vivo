package com.jk1603.vivo.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk1603.vivo.user.dao.MyIndexDao;
import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.Goods;

@Service
public class MyIndexServiceImpl implements MyIndexService{

	@Autowired
	MyIndexDao myindexDao;

	@Override
	public List<Goods> selectMobile(Goods goods) {
		return myindexDao.selectMobile(goods);
	}

	@Override
	public List<Goods> selectPart(Goods goods) {
		return myindexDao.selectPart(goods);
	}

	@Override
	public String addCart(Cart cart) {
		Integer g=myindexDao.isExist(cart.getUser().getId());
		if(g != null) {
			return "商品已存在";
		}
		myindexDao.addCart(cart);
		return "成功添加购物车";
	}
}

package com.jk1603.vivo.user.service;

import java.util.List;

import com.jk1603.vivo.user.pojo.Cart;

public interface CartService {
	// ��ѯ�����Ϣ
	public List<Cart> selectCart(Cart cart);
	
	public String deleteGoods(Integer id);
	
	public String addOrder(List<Cart> goodsList);
}

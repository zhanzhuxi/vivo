package com.jk1603.vivo.user.service;

import java.math.BigDecimal;
import java.util.List;

import com.jk1603.vivo.user.pojo.Cart;

public interface OrderService {
	// ��ѯ������Ϣ
	public String selectOrder(List<Cart> cart);
	
}

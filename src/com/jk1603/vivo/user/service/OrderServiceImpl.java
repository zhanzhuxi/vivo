package com.jk1603.vivo.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk1603.vivo.user.dao.OrderDao;
import com.jk1603.vivo.user.pojo.Cart;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderDao orderDao;
	
	@Override
	public String selectOrder(List<Cart> cart) {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.jk1603.vivo.user.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk1603.vivo.user.dao.CartDao;
import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.Goods;
import com.jk1603.vivo.user.pojo.Order;
import com.jk1603.vivo.user.pojo.User;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	CartDao cartDao;

	@Override
	public List<Cart> selectCart(Cart cart) {
		return cartDao.selectCart(cart);
	}

	@Override
	public String deleteGoods(Integer id) {
		cartDao.deleteGoods(id);
		return "删除成功";
	}

	@Override
	public String addOrder(List<Cart> goodsList) {
		List<Order> orderList=new ArrayList<>();
		for(int i=0;i<goodsList.size();i++) {
			Order order=new Order();
			User user=new User();
			user.setId(goodsList.get(i).getUser().getId());
			Goods goods=new Goods();
			goods.setId(goodsList.get(i).getGoods().getId());
			order.setUser(user);
			order.setGoods(goods);
			order.setGoodsquantity(goodsList.get(i).getQuantity());
			order.setState("未发货");
			order.setIschecked(false);
			orderList.add(order);
		}
		for(int i=0;i<orderList.size();i++) {
			cartDao.addOrder(orderList.get(i));
		}
		return null;
	}

	
}

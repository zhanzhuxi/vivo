package com.jk1603.vivo.user.service;

import java.util.List;

import com.jk1603.vivo.user.pojo.Cart;
import com.jk1603.vivo.user.pojo.Goods;

public interface MyIndexService {
	//��ѯ�ֻ���Ϣ
	public List<Goods> selectMobile(Goods goods);
	//��ѯ�����Ϣ
	public List<Goods> selectPart(Goods goods);
	//���빺�ﳵ
	public String addCart(Cart cart);
}
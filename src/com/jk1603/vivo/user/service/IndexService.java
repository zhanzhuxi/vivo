package com.jk1603.vivo.user.service;

import java.util.List;

import com.jk1603.vivo.user.pojo.Goods;

public interface IndexService {
	//��ѯ�ֻ���Ϣ
	public List<Goods> selectMobile(Goods goods);
	//��ѯ�����Ϣ
	public List<Goods> selectPart(Goods goods);

}

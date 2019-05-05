package com.jk1603.vivo.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk1603.vivo.user.dao.IndexDao;
import com.jk1603.vivo.user.pojo.Goods;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	IndexDao indexDao;

	@Override
	public List<Goods> selectMobile(Goods goods) {
		return indexDao.selectMobile(goods);
	}

	@Override
	public List<Goods> selectPart(Goods goods) {
		return indexDao.selectPart(goods);
	}

}

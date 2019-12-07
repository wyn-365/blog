package com.wang.blog.service.impl;

import java.util.List;

import com.wang.blog.dao.GongGaoDao;
import com.wang.blog.dao.impl.GongGaoDaoImpl;
import com.wang.blog.domain.GongGao;
import com.wang.blog.service.GongGaoService;


public class GongGaoServiceImpl implements GongGaoService {
	GongGaoDao gongGaoDao = new GongGaoDaoImpl();
	//实现查询所有公告
	@Override
	public List<GongGao> findGongGao() throws Exception {
		// TODO Auto-generated method stub
		return gongGaoDao.finfGongGao();
	}

}

package com.wang.blog.dao;

import java.util.List;

import com.wang.blog.domain.GongGao;

public interface GongGaoDao {

	List<GongGao> finfGongGao()throws Exception;

	void addGongGao(GongGao gongGao)throws Exception;

	void deleteGongGao(int id)throws Exception;

}

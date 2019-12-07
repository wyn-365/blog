package com.wang.blog.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.wang.blog.dao.GongGaoDao;
import com.wang.blog.domain.GongGao;
import com.wang.blog.utils.JDBCUtils;


public class GongGaoDaoImpl implements GongGaoDao {
	
	//查询心所有的公告
	@Override
	public List<GongGao> finfGongGao() throws Exception {
		String sql = "select * from gonggao order by id desc limit 0 , 4";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return  qr.query(sql, new BeanListHandler<GongGao>(GongGao.class));
	}
	//插入公告
	@Override
	public void addGongGao(GongGao gongGao) throws Exception {
		String sql = "insert into gonggao values(?,?,?)";
		System.out.println(gongGao.getContent());
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,gongGao.getId(),gongGao.getTitle(),gongGao.getContent());
		
	}
	
	//删除公告信息
	@Override
	public void deleteGongGao(int id) throws Exception {
		String sql = "delete from gonggao where id = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
		
	}

}

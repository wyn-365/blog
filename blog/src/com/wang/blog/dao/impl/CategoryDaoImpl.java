package com.wang.blog.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.wang.blog.dao.CategoryDao;
import com.wang.blog.domain.Category;
import com.wang.blog.utils.JDBCUtils;


public class CategoryDaoImpl implements CategoryDao {
	
	//查询所有分类
	@Override
	public List<Category> getAllCats() throws Exception {
		String sql = "select * from category";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return  qr.query(sql, new BeanListHandler<Category>(Category.class));
	}
	
	//删除某个分类
	@Override
	public void deleteCategory(String cid) throws Exception {
		String sql = "delete from category where cid = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,cid);
	}
	
	//添加分类
	@Override
	public void addCategory(Category c) throws Exception {
		String sql = "insert into category values(?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,c.getCid(),c.getCname());
		
	}

}

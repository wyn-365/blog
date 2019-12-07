package com.wang.blog.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.wang.blog.dao.BlogDao;
import com.wang.blog.domain.Blog;
import com.wang.blog.domain.Comment;
import com.wang.blog.domain.EveryDay;
import com.wang.blog.domain.PageBean;
import com.wang.blog.utils.JDBCUtils;

public class BlogDaoImpl implements BlogDao {
	
	//最热博客
	@Override
	public List<Blog> findHots() throws Exception {
		String sql = "select * from blog where bflag=1 and is_hot=1 order by bdate desc limit 0 , 6";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Blog>(Blog.class));
	}
	
	//查询最新博客
	@Override
	public List<Blog> findNews() throws Exception {
		String sql = "select * from blog where bflag=1 and is_hot=1 order by bdate desc limit 0 , 10";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Blog>(Blog.class));
	}
	
	//查询博客信息
	@Override
	public Blog blogInfo(String id) throws Exception {
		String sql = "select * from blog where id =?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<Blog>(Blog.class),id);
	}
	
	//查询分类下的博客带有分页

	@Override
	public int findTotalRecords(String cid) throws Exception {
		String sql = "select count(*) from blog where cid = ? ";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler(),cid);
		return num.intValue();
	}

	@Override
	public List findProductsByCidWithPage(String cid, int startIndex, int pageSize) throws Exception {
		String sql = "select * from blog   where cid =? and bflag=1 order by bdate desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Blog>(Blog.class),cid,startIndex,pageSize);
		
	}
	
	//查询所有博客的记录数量
	@Override
	public int findTotalRecords() throws Exception {
		String sql = "select count(*) from blog";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler());
		return num.intValue();
	}
	
	//后台查询所有的博客带有分页
	@Override
	public List<Blog> findAllProductsWithPage(int startIndex, int pageSize) throws Exception {
		String sql = "select * from blog order by bdate desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Blog>(Blog.class),startIndex,pageSize);
		
	}
	
	//获取对应博客下的评论
	@Override
	public List<Comment> getComment(String blog_id) throws Exception {
		String sql = "select * from comment where blog_id=? order by cdate desc ";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Comment>(Comment.class),blog_id);
	}
	
	//插入评论数据
	@Override
	public void writeComment(Comment comment) throws Exception {
		String sql = "insert into comment values(?,?,?,?,?,?,null)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params = {comment.getId(),comment.getUid(),comment.getContent(),comment.getCdate(),comment.getName(),comment.getBlog_id()};
		qr.update(sql,params);
		}
	
	//增加点击量
	@Override
	public void increaseNum(String id) throws Exception {
		
		String sql = "update blog set browse = browse + 1 where id = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
	}
	
	//增加评论数量
	@Override
	public void increaseComment(String blog_id) throws Exception {
		// TODO Auto-generated method stub
		String sql = "update blog set bcomment = bcomment + 1 where id = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,blog_id);
		
	}
	
	//查询每日推荐和每日一句
	@Override
	public EveryDay findEveryDay() throws Exception {
		String sql = "select * from everyday where id = 1";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<EveryDay>(EveryDay.class));
	}
	
	//上传博客
	@Override
	public void saveProduct(Blog blog) throws Exception {
		String sql = "insert into blog values(?,?,?,?,?,?,?,?,?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params = {blog.getId(),blog.getCid(),blog.getTitle(),blog.getContent(),blog.getBimage(),blog.getBdate(),blog.getIs_hot(),blog.getBflag(),blog.getBcomment(),blog.getBrowse()};
		qr.update(sql,params);
		
	}
	
	//后台查询所有的评论
	@Override
	public List<Comment> getComment() throws Exception {
		String sql = "select * from comment order by cdate desc ";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Comment>(Comment.class));
	}
	
	//删除评论信息
	@Override
	public void deleteComment(int id) throws Exception {
		String sql = "delete from comment where id = ? ";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
	}
	
	//删除博客
	@Override
	public void deleteBlog(String id) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from blog where id = ? ";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
	}
	
	//模糊查询不带有分页
	@Override
	public List<Blog> findProductLike(Map<String, String[]> condition) throws Exception {
		
		String sql = "select * from blog where 1=1 ";
		StringBuilder sb = new StringBuilder(sql);
		 
		//遍历map
		Set<String> keySet = condition.keySet();
		
		//定义参数的集合
        List<Object> params = new ArrayList<Object>();
        
        //System.out.println(params);//[] 
        
        for (String key : keySet) {

        //获取value
        String value = condition.get(key)[0];
        
        //判断value是否有值
        System.out.println(value);//测试【白】
        
        if(value != null && !"".equals(value)){
            //有值
            sb.append(" and "+key+" like ? ");

            params.add("%"+value+"%");//？条件的值
     
        }
	} 
        sql = sb.toString();
        
        System.out.println(sql);
        System.out.println("稳操胜券不过是旁人的误解");
        
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		
		return qr.query(sql, new BeanListHandler<Blog>(Blog.class),params.toArray());
	}

	
	
	//模糊查询所有博客带有分页
	@Override
	public List<Blog> findBlogWithPage(int startIndex, int pageSize, Map<String, String[]> condition) throws Exception {
		
		String sql = "select * from user  where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
      //2.遍历map
        Set<String> keySet = condition.keySet();
      //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        
        for (String key : keySet) {
            //排除分页条件参数
            if("curNum".equals(key) || "pageSize".equals(key)){
                continue;
            }
            //获取value
            String value = condition.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        //添加分页查询
        sb.append(" limit ?,? ");
        //添加分页查询参数值
        params.add(startIndex);
        params.add(pageSize);
        sql = sb.toString();
        System.out.println(sql);
        System.out.println(params);
        
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Blog>(Blog.class),startIndex,pageSize,condition);

	}
	
	//查询评论带有分页
	@Override
	public List<Comment> pingLunWithPage(int startIndex, int pageSize) throws Exception {
		String sql = "select * from comment  order by cdate desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Comment>(Comment.class),startIndex,pageSize);
	}

	@Override
	public int findTotalRecord() throws Exception {
		String sql = "select count(*) from comment";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler());
		return num.intValue();
	}
	
	//回复评论
	@Override
	public void getRcomment(String rcomment, int id) throws Exception {
		String sql = "update comment set rcomment = ?  where id =?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,rcomment,id);
	}
	
	//点击排行
	@Override
	public List<Blog> findPaiHang() throws Exception {
		String sql = "select * from blog where bflag=1 and is_hot=1 order by browse desc limit 0 , 6";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Blog>(Blog.class));
	}
	
	//站长推荐--评论排行
	@Override
	public List<Blog> findTuiJian() throws Exception {
		String sql = "select * from blog where bflag=1 and is_hot=1 order by bcomment desc limit 0 , 6";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Blog>(Blog.class));
	}

	
}

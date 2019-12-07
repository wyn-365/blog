package com.wang.blog.web.servlet;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.wang.blog.domain.Blog;
import com.wang.blog.domain.Category;
import com.wang.blog.domain.Comment;
import com.wang.blog.domain.EveryDay;
import com.wang.blog.domain.GongGao;
import com.wang.blog.domain.PageBean;
import com.wang.blog.domain.User;
import com.wang.blog.service.BlogService;
import com.wang.blog.service.CategoryService;
import com.wang.blog.service.GongGaoService;
import com.wang.blog.service.impl.BlogServiceImpl;
import com.wang.blog.service.impl.CategoryServiceImpl;
import com.wang.blog.service.impl.GongGaoServiceImpl;
import com.wang.blog.utils.UUIDUtils;
import com.wang.blog.web.base.BaseServlet;
/**
 * Servlet implementation class BlogInfoServlet
 */
@WebServlet("/blogInfoServlet")
public class BlogInfoServlet extends BaseServlet {

	//提交评论信息
	//同时增加评论的数量
	public String writeComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String content = request.getParameter("content");
		if(content.indexOf("你妈")>=0 || content.indexOf("傻逼")>=0
				|| content.indexOf("操")>=0 || content.indexOf("大爷")>=0 
				)
		{
		//存在
			request.setAttribute("msg", "你个小婊子，胆大包天，竟敢骂朕！");
			return "/jsp/404.jsp";
		} 
		
		//获取分类的id
		String uid = request.getParameter("uid");
		if(uid != null){
			  String blog_id =request.getParameter("ccid");//获取对应的博客id
			  
			   //获取session中用户信息
			  
			  String name = request.getParameter("uname");
			  Comment comment = new Comment();
			  
			  comment.setId(UUIDUtils.getNum());
			  comment.setBlog_id(blog_id);
			  comment.setContent(content);
			  comment.setUid(uid);
			  comment.setName(name);
			  comment.setCdate(new Date());
			  //调用业务层插入数据
				BlogService blogService =  new BlogServiceImpl();
			  blogService.writeComment(comment);
			  //增加评论的数量 blog_id
			  blogService.increaseComment(blog_id);
			  
			  response.sendRedirect(request.getContextPath() + "/blogInfoServlet?method=blogInfo&id="+ blog_id);
			  return null;
		}else {
			//匿名评论
			  String blog_id =request.getParameter("ccid");//获取对应的博客id
			 
			  Comment comment = new Comment();
			  
			  comment.setId(UUIDUtils.getNum());
			  comment.setBlog_id(blog_id);
			  comment.setContent(content);
			  
			  comment.setUid(UUIDUtils.getId());
			  comment.setName("匿名用户");
			  
			  comment.setCdate(new Date());
			  //调用业务层插入数据
				BlogService blogService =  new BlogServiceImpl();
			  blogService.writeComment(comment);
			  //增加评论的数量 blog_id
			  blogService.increaseComment(blog_id);
			  
			  response.sendRedirect(request.getContextPath() + "/blogInfoServlet?method=blogInfo&id="+ blog_id);
			  return null;
		
		}
		 // return "/jsp/article.jsp";
	}
	
	
	//查询分类下所有博客带有分页
	public String findAllBlog(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取分类的id
		String cid =request.getParameter("cid");
		BlogService blogService =  new BlogServiceImpl();
		
		int curNum = Integer.parseInt(request.getParameter("num"));
		//调用业务层
		PageBean pm = blogService.findProductsByCidWithPage(cid,curNum);
		//放到request域对象中
		request.setAttribute("page", pm);
		//转发页面
		
		return "/jsp/product_list.jsp";
	}
	
	//点击博客，进入详细信息，跳转到详细信息页面
	//同时增加点击量+1
	public String blogInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//获取博客的id
		String id =request.getParameter("id");
		BlogService blogService =  new BlogServiceImpl();
		Blog blog = blogService.blogInfo(id);
		//增加点击量
		blogService.increaseNum(id);
		String blog_id = id;
		//并获取该条博客的所有评论信息
		List<Comment> list = blogService.getComment(blog_id);
		//获取所有分类
		CategoryService categoryService = new CategoryServiceImpl();
		List<Category> list01 = categoryService.getAllCats();
		
		//获取所有公告
		GongGaoService gongGaoService = new GongGaoServiceImpl();
		List<GongGao> list04 = gongGaoService.findGongGao();
		//获取所有热门博客
		List<Blog> list02 = blogService.findHots();
		//获取每日一句
		EveryDay  everyDay = blogService.findEveryDay();
		
		List<Blog> list07 = blogService.findPaiHang();
		List<Blog> list08 = blogService.findTuiJian();
		//存放到request域中
		request.setAttribute("blog",blog);
		request.setAttribute("comment",list);
		request.setAttribute("allCats", list01);
		request.setAttribute("hots", list02);
		request.setAttribute("gonggao", list04);
		request.setAttribute("everyday", everyDay);
		request.setAttribute("paihang", list07);
		request.setAttribute("tuijian", list08);
		//跳转页面
		return "/jsp/article.jsp";
	}

	

}

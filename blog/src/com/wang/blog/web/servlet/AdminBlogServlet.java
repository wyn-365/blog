package com.wang.blog.web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.wang.blog.dao.GongGaoDao;
import com.wang.blog.dao.impl.GongGaoDaoImpl;
import com.wang.blog.domain.Blog;
import com.wang.blog.domain.Category;
import com.wang.blog.domain.Comment;
import com.wang.blog.domain.GongGao;
import com.wang.blog.domain.PageBean;
import com.wang.blog.domain.User;
import com.wang.blog.service.AdminService;
import com.wang.blog.service.BlogService;
import com.wang.blog.service.CategoryService;
import com.wang.blog.service.GongGaoService;
import com.wang.blog.service.impl.AdminServiceImpl;
import com.wang.blog.service.impl.BlogServiceImpl;
import com.wang.blog.service.impl.CategoryServiceImpl;
import com.wang.blog.service.impl.GongGaoServiceImpl;
import com.wang.blog.utils.UUIDUtils;
import com.wang.blog.utils.UploadUtils;
import com.wang.blog.web.base.BaseServlet;


@WebServlet("/adminBlogServlet")
public class AdminBlogServlet extends BaseServlet {
	
	//后台付汇用户的评论
	public String getRcomment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String rcomment = request.getParameter("rcomment");
		String ids = request.getParameter("id");
		int id = Integer.parseInt(ids);
		System.out.println(rcomment);
		System.out.println(id);
		
		
		BlogService blogService =  new BlogServiceImpl();
		blogService.getRcomment(rcomment,id);	
		
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=pingLunWithPage&num=1");
		return null;
	}
	
	//删除博客
	public String deleteBlog(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		BlogService blogService =  new BlogServiceImpl();
		blogService.deleteBlog(id);
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=blogUI&num=1");
		return null;
		
	}
	//点击用户管理，跳转并查询所有的用户信息
	public String userUI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		AdminService adminService = new AdminServiceImpl();
		List<User> user  =  adminService.finAllUsers();
		
		request.setAttribute("users", user);
		return "/admin/manage-user.jsp";
	}
	
	//增加某个分类addCategory
	public String addCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cname = request.getParameter("cname");
		Category c = new Category();
		c.setCid(UUIDUtils.getId());
		c.setCname(cname);
		CategoryService categoryService = new CategoryServiceImpl();
		categoryService.addCategory(c);
		//重定向
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=categoryUI");
		return null;
	}
	
	//删除某个分类
	public String deleteCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//获取分类的id
		String cid = request.getParameter("cid");
		CategoryService categoryService = new CategoryServiceImpl();
		categoryService.deleteCategory(cid);
		
		//重定向
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=categoryUI");
		return null;
	
	}
	//获取全部分类信息 跳转页面
	public String categoryUI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//获取全部分类信息
		CategoryService categoryService = new CategoryServiceImpl();
		List<Category> list = categoryService.getAllCats();
		request.setAttribute("allCats", list);
		return "/admin/category.jsp";
	}
	//删除评论信息	
	public String deleteComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("id");
		int id = Integer.parseInt(ids);
		System.out.println("删除评论的id是："+id);
		BlogService blogService =  new BlogServiceImpl();
		blogService.deleteComment(id);		
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=pingLunWithPage&num=1");
		return null;
	
	}
	//查询所有的评论带有分页
	public String pingLunWithPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取分类的id
		
		BlogService blogService =  new BlogServiceImpl();
		int curNum = Integer.parseInt(request.getParameter("num"));
		//调用业务层
		PageBean pm = blogService.pingLunWithPage(curNum);
		//放到request域对象中
		request.setAttribute("page", pm);
		return "/admin/comment.jsp";
	}
	
	
	//查询所有评论信息 并查询到所有评论信息
	public String pingLunUI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BlogService blogService =  new BlogServiceImpl();
		List<Comment> list = blogService.getComment();
		request.setAttribute("comment",list);
		return "/admin/comment.jsp";
	}
	
	//删除公告信息deleteGongGao
	public String deleteGongGao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("id");
		int id = Integer.parseInt(ids);
		GongGaoDao gongGaoDao = new GongGaoDaoImpl();
		gongGaoDao.deleteGongGao(id);
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=gongGaoUI");
		return null;
	}
	
	//添加公告信息
	public String gongGao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取参数
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		GongGao gongGao = new GongGao();
		gongGao.setTitle(title);
		gongGao.setContent(content);
		gongGao.setId(UUIDUtils.getNum());
		//调用业务层
		GongGaoDao gongGaoDao = new GongGaoDaoImpl();
		gongGaoDao.addGongGao(gongGao);
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=gongGaoUI");
		return null;
	
	}
	
	//点击公告 获取公告信息
	public String gongGaoUI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		GongGaoService gongGaoService = new GongGaoServiceImpl();
		List<GongGao> list04 = gongGaoService.findGongGao();
		request.setAttribute("gonggao", list04);
		return "/admin/notice.jsp";
	}
	//点击上传博客 提交博客信息
	public String addProduct(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Map<String,String> map = new HashMap<String,String>();//存储表单
		Blog blog = new Blog();//存储携带表单数据 service dao
		
		//获取全部表单数据 有上传图片的组件upload
		try {
			//下面三行获取图片 【输入流】 得到请求体中所有的数据，查分和封装
			DiskFileItemFactory fac = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fac);
			List<FileItem> list = upload.parseRequest(req);
			//遍历集合
			for(FileItem item : list) {
				//普通表单
				if(item.isFormField()) {
					//放入map
					map.put(item.getFieldName(), item.getString("utf-8"));
				}else {
					
					//获取要保存文件原始的名称
					String oldFileName = item.getName();
					//要保存的文件
					String newFileName = UploadUtils.getUUIDName(oldFileName);
					
					//上传的功能
					InputStream is = item.getInputStream();
					//服务端创建上传文件的目录
					//最优秀的性能  多级目录 当前目录下的文件
					String realPath = getServletContext().getRealPath("/images/blog");
					System.out.println(realPath);
					// 获取到本地服务器根路径 D:\APP\Tomcat\apache-tomcat-8.0.52\wtpwebapps\blog\images\blog
					
					//创目录
					String dir = UploadUtils.getDir(newFileName);
					String path = realPath+dir;
					//生成了目录结构
					//内存中生命目录
					File newDir  = new File(path);
					if(!newDir.exists()) {
						newDir.mkdirs();//创建
					}
					
					//创阿金文件
					File finalFile = new File(newDir,newFileName);
					if(!finalFile.exists()) {
						finalFile.createNewFile();//创建0kb文件
					}
					//简历输出流
					OutputStream os = new FileOutputStream(finalFile);
					
					IOUtils.copy(is, os);
					
					//释放资源
					IOUtils.closeQuietly(is);
					IOUtils.closeQuietly(os);
					
					map.put("bimage", "images/blog"+dir+"/"+newFileName);				
				}
			}
			
			//封装对象
			BeanUtils.populate(blog, map);
			//为没有属性的数据进行手动赋值
			//String cid= req.getParameter("category");
			//blog.setCid(cid);
			blog.setId((UUIDUtils.getId()));
			blog.setBdate(new Date());
			blog.setBflag(1);
			blog.setIs_hot(1);
			blog.setBcomment(0);
			blog.setBrowse(0);
			
			//调用service存储数据
			BlogService blogService = new BlogServiceImpl();
			blogService.saveProduct(blog);
			
			//重定向页面
			//resp.sendRedirect("/store/adminProductServlet?method=findAllProductsWithPage&num=1");
			resp.sendRedirect(req.getContextPath()+"/adminBlogServlet?method=blogUI&num=1");
		}catch(Exception e){
			e.printStackTrace();
			
		}
		//
		return null;
	
	}
	
	
	//点击写博客，获取博客分类信息addArticle
	public String addArticle(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//resp.sendRedirect(req.getContextPath()+"/adminBlogServlet?method=blogUI");
		CategoryService categoryService = new CategoryServiceImpl();
		List<Category> list = categoryService.getAllCats();
		req.setAttribute("allCats", list);
		return "/admin/add-article.jsp";
	}
	
	//点击博客文章跳转博客页面，同时获取博客所有的信息
	public String blogUI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BlogService blogService =  new BlogServiceImpl();
		
		int curNum = Integer.parseInt(request.getParameter("num"));
		//调用业务层
		PageBean pm = blogService.findAllProductsWithPage(curNum);
		//放到request域对象中
		request.setAttribute("page", pm);
		
		return "/admin/article.jsp";
	
	
	
	}
}

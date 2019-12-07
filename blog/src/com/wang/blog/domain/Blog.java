package com.wang.blog.domain;

import java.util.Date;
import java.util.List;



public class Blog {
	private String id;
	private String cid;
	private String title;
	private String content;
	private String bimage;//博客图片路径
	private Date bdate;//博客的日期
	private int is_hot;//是够热门
	private  int bflag;//是否上架
	private int bcomment;//评论个数
	private int browse;//浏览数量
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBimage() {
		return bimage;
	}
	public void setBimage(String bimage) {
		this.bimage = bimage;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(int is_hot) {
		this.is_hot = is_hot;
	}
	public int getBflag() {
		return bflag;
	}
	public void setBflag(int bflag) {
		this.bflag = bflag;
	}
	public int getBcomment() {
		return bcomment;
	}
	public void setBcomment(int bcomment) {
		this.bcomment = bcomment;
	}
	public int getBrowse() {
		return browse;
	}
	public void setBrowse(int browse) {
		this.browse = browse;
	}
	@Override
	public String toString() {
		return "Blog [id=" + id + ", cid=" + cid + ", title=" + title + ", content=" + content + ", bimage=" + bimage
				+ ", bdate=" + bdate + ", is_hot=" + is_hot + ", bflag=" + bflag + ", bcomment=" + bcomment
				+ ", browse=" + browse + "]";
	}
	public Blog(String id, String cid, String title, String content, String bimage, Date bdate, int is_hot, int bflag,
			int bcomment, int browse) {
		super();
		this.id = id;
		this.cid = cid;
		this.title = title;
		this.content = content;
		this.bimage = bimage;
		this.bdate = bdate;
		this.is_hot = is_hot;
		this.bflag = bflag;
		this.bcomment = bcomment;
		this.browse = browse;
	}
	public Blog() {
		super();
	}
	
	public void setList(List<Blog> list) {
		// TODO Auto-generated method stub
		
	}
}

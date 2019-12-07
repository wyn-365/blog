package com.wang.blog.domain;

import java.util.Date;

public class Comment {
	private int id;
	private String uid;
	private String content;
	private Date cdate;
	private String name;
	private String blog_id;//对应的评论对应哪一条博客
	private String rcomment;
	
	public Comment(int id, String uid, String content, Date cdate, String name, String blog_id, String rcomment) {
		super();
		this.id = id;
		this.uid = uid;
		this.content = content;
		this.cdate = cdate;
		this.name = name;
		this.blog_id = blog_id;
		this.rcomment = rcomment;
	}
	public String getRcomment() {
		return rcomment;
	}
	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
	}
	public Comment(int id, String uid, String content, Date cdate, String name, String blog_id) {
		super();
		this.id = id;
		this.uid = uid;
		this.content = content;
		this.cdate = cdate;
		this.name = name;
		this.blog_id = blog_id;
	}
	public String getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(String blog_id) {
		this.blog_id = blog_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", uid=" + uid + ", content=" + content + ", cdate=" + cdate + ", name=" + name
				+ ", blog_id=" + blog_id + ", rcomment=" + rcomment + "]";
	}
	public Comment(int id, String uid, String content, Date cdate, String name) {
		super();
		this.id = id;
		this.uid = uid;
		this.content = content;
		this.cdate = cdate;
		this.name = name;
	}
	public Comment() {
		super();
	}
	
	
}

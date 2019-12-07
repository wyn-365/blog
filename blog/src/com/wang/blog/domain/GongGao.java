package com.wang.blog.domain;

import java.util.List;

public class GongGao {
	private int id;
	private String title;
	private String content;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	@Override
	public String toString() {
		return "GongGao [id=" + id + ", title=" + title + ", content=" + content + "]";
	}
	public GongGao(int id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}
	public GongGao() {
		super();
	}
	
	public void setList(List<GongGao> list) {
		// TODO Auto-generated method stub
		
	}
	public void findGong(GongGao gongGao) {
		// TODO Auto-generated method stub
		
	}
}

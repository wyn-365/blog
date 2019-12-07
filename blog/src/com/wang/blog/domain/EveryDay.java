package com.wang.blog.domain;

public class EveryDay {
	private String id;
	private String title;
	private String content;
	private String etitle;
	private String econtent;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	@Override
	public String toString() {
		return "EveryDay [id=" + id + ", title=" + title + ", content=" + content + ", etitle=" + etitle + ", econtent="
				+ econtent + "]";
	}
	public EveryDay(String id, String title, String content, String etitle, String econtent) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.etitle = etitle;
		this.econtent = econtent;
	}
	public EveryDay() {
		super();
	}
	
	
	
}

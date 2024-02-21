package com.User;

import java.util.Date;

public class NotesDetails {
	private int id;
	private String title;
	private String content;
	private Date Adate;
	private userdetails user;

	/**
	 * 
	 */
	public NotesDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

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

	public Date getAdate() {
		return Adate;
	}

	public void setAdate(Date adate) {
		Adate = adate;
	}

	public userdetails getUser() {
		return user;
	}

	public void setUser(userdetails user) {
		this.user = user;
	}

}

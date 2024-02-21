package com.User;

public class userdetails {
	int userId;
	String Name;
	String Email;
	String Password;
	String RePassword;

	/**
	 * @param userId
	 * @param name
	 * @param email
	 * @param password
	 * @param rePassword
	 */
	public userdetails(int userId, String name, String email, String password, String rePassword) {
		super();
		this.userId = userId;
		Name = name;
		Email = email;
		Password = password;
		RePassword = rePassword;
	}

	public userdetails() {
		// TODO Auto-generated constructor stub
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getRePassword() {
		return RePassword;
	}

	public void setRePassword(String rePassword) {
		RePassword = rePassword;
	}

	@Override
	public String toString() {
		return "userdetails [userId=" + userId + ", Name=" + Name + ", Email=" + Email + ", Password=" + Password
				+ ", RePassword=" + RePassword + "]";
	}

}

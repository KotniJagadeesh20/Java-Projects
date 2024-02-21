package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.User.userdetails;
import com.connection.DBUtil;

public class UserDao {
	private Connection connection;

	public UserDao() {
		// TODO Auto-generated constructor stub
	}

	public boolean Registeruser(userdetails user) {
		boolean registerflag = false;
		System.out.println(user);
		try {
			String query = "INSERT INTO user_details(name,email,Userpassword) VALUES (?, ?, ?)";
			connection = DBUtil.getconnection();
			PreparedStatement PStatement = connection.prepareStatement(query);
			PStatement.setString(1, user.getName());
			PStatement.setString(2, user.getEmail());
			PStatement.setString(3, user.getPassword());

			int updatecount = PStatement.executeUpdate();
			if (updatecount >= 1) {
				registerflag = true;
				// System.out.println(registerflag);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return registerflag;

	}

	public userdetails loginuser(userdetails user) {

		userdetails user1 = null;
		try {
			String login_query = "SELECT * FROM user_details WHERE email = ? AND Userpassword = ?";
			Connection connection = DBUtil.getconnection();
			PreparedStatement psstatement = connection.prepareStatement(login_query);
			psstatement.setString(1, user.getEmail());
			psstatement.setString(2, user.getPassword());
			ResultSet rset = psstatement.executeQuery();
			if (rset.next()) {
				user1 = new userdetails();
				user1.setUserId(rset.getInt("id"));
				user1.setName(rset.getString("name"));
				user1.setEmail(rset.getString("email"));
				user1.setPassword(rset.getString("UserPassword"));
				user1.setRePassword(rset.getString("UserPassword"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user1;

	}
}

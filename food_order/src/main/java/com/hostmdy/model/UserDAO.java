package com.hostmdy.model;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.crypto.PasswordEncoder;
import com.hostmdy.crypto.PasswordValidator;

public class UserDAO {
	
	private DataSource dataSource;

	public UserDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStm;
	private ResultSet rs;
	
	private void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// Get All User 
	public List<User> getAllUser(){
		List<User> userList = new ArrayList<>();
		
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user ;");
			while (rs.next()) {
				userList.add(new User(
						rs.getLong("id"), 
						rs.getString("name"), 
						rs.getString("email"), 
						rs.getString("password"), 
						rs.getString("phone"),
						rs.getString("location"),
						rs.getString("address"),
						rs.getString("payment"),
						rs.getString("card"),
						rs.getDate("date").toLocalDate(),
						rs.getString("role")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return userList;
	}
	
	// Get User By Id
	public User getUserById(Long id) {
		User user = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where id='"+id+"';");
			while (rs.next()) {
				user = new User(
						rs.getLong("id"), 
						rs.getString("name"), 
						rs.getString("email"), 
						rs.getString("password"), 
						rs.getString("phone"),
						rs.getString("location"),
						rs.getString("address"),
						rs.getString("payment"),
						rs.getString("card"),
						rs.getDate("date").toLocalDate(),
						rs.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return user;
	}
	
	// Get User By Email
	public User getUserByEmail(String email) {
		User user = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where email='"+email+"';");
			while (rs.next()) {
				user = new User(
						rs.getLong("id"), 
						rs.getString("name"), 
						rs.getString("email"), 
						rs.getString("password"), 
						rs.getString("phone"),
						rs.getString("location"),
						rs.getString("address"),
						rs.getString("payment"),
						rs.getString("card"),
						rs.getDate("date").toLocalDate(),
						rs.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return user;
	}
	
	// Validate User email
	public boolean validateUser(String email,String password) {
		User user = null;
		if(checkUserExist(email)) {
			user = getUserByEmail(email);
		}
		
		if(user != null) {
			try {
				if(PasswordValidator.validatePassword(password, user.getPassword())) {
					return true;
				}
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		return false;
	}
	
	// check user exist (inside create user)
	private boolean checkUserExist(String email) {
		if(getUserByEmail(email) != null) {
			return true;
		}else {
			return false;
		}
	}
	
	// Create New User 
	public boolean createNewUser(User user) {
		boolean created = false;
		if(checkUserExist(user.getEmail())) {
			return false;
		}
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("insert into user "
					+ "(name,email,password,phone,date,active,role) "
					+ "values(?,?,?,?,?,?,?);");
			pStm.setString(1, user.getName());
			pStm.setString(2, user.getEmail());
			try {
				pStm.setString(3, PasswordEncoder.encode(user.getPassword()));
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pStm.setString(4, user.getPhone());
			pStm.setDate(5, Date.valueOf(LocalDate.now()));
			pStm.setBoolean(6, true);
			pStm.setString(7, "user");
			int rowEffected = pStm.executeUpdate();
			created = (rowEffected > 0)? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return created;
	}
	
	// Update User 
	public boolean updateUser(User user) {
		boolean updated = false;
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("update user set "
					+ "name=?,"
					+ "phone=?,"
					+ "location=?,"
					+ "address=?,"
					+ "payment=?,"
					+ "card=? where id=?;");
			pStm.setString(1, user.getName());
			pStm.setString(2, user.getPhone());
			pStm.setString(3, user.getLocation());
			pStm.setString(4, user.getAddress());
			pStm.setString(5, user.getPayment());
			pStm.setString(6, user.getCard());
			pStm.setLong(7, user.getId());
			int rowEffected = pStm.executeUpdate();
			updated = (rowEffected > 0)? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return updated;
	}
	
	// Flash Delete User 
	public boolean deleteUser(Long id) {
		boolean deleted = false;
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("update user set active='"+0+"' where id='"+id+"';");
			int rowEffected = pStm.executeUpdate();
			deleted = (rowEffected > 0)? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return deleted;
	}

}

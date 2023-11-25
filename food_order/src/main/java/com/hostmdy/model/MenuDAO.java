package com.hostmdy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class MenuDAO {
	
	private final DataSource dataSource;

	public MenuDAO(DataSource dataSource) {
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
	
	// search
	public List<Menu> searchFromMenu(String search){
		List<Menu> menuList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("select * from menu where title like ? or category like ?;");
			pStm.setString(1, "%"+search+"%");
			pStm.setString(2, "%"+search+"%");
			rs = pStm.executeQuery();
			while (rs.next()) {
				menuList.add(new Menu(
						rs.getLong("id"), 
						rs.getString("title"), 
						Category.valueOf(rs.getString("category")), 
						rs.getInt("price"), 
						rs.getString("ingredients"), 
						rs.getBoolean("veg"),
						rs.getDouble("calorie"), 
						rs.getDouble("fat"), 
						rs.getDouble("protein"), 
						rs.getString("description"), 
						rs.getString("image")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return menuList;
	}
	
	// get All From Menu
	public List<Menu> getAllFromMenu(){
		List<Menu> menuList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from menu;");
			while (rs.next()) {
				menuList.add(new Menu(
						rs.getLong("id"), 
						rs.getString("title"), 
						Category.valueOf(rs.getString("category")), 
						rs.getInt("price"), 
						rs.getString("ingredients"), 
						rs.getBoolean("veg"), 
						rs.getDouble("calorie"), 
						rs.getDouble("fat"), 
						rs.getDouble("protein"), 
						rs.getString("description"), 
						rs.getString("image")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return menuList;
	}
	
	// Get menu By Id
	public Menu getByIdFromMenu(Long id) {
		Menu menu = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from menu where id='"+id+"';");
			while (rs.next()) {
				menu = new Menu(
						rs.getLong("id"), 
						rs.getString("title"), 
						Category.valueOf(rs.getString("category")), 
						rs.getInt("price"), 
						rs.getString("ingredients"),
						rs.getBoolean("veg"), 
						rs.getDouble("calorie"), 
						rs.getDouble("fat"), 
						rs.getDouble("protein"), 
						rs.getString("description"), 
						rs.getString("image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return menu;
	}
	
	
	// Create Menu 
	public boolean addToMenu(Menu menu) {
		boolean created = false;
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("insert into menu "
					+ "(title,category,price,ingredients,veg,calorie,fat,protein,description,image) "
					+ "values(?,?,?,?,?,?,?,?,?,?);");
			pStm.setString(1, menu.getTitle());
			pStm.setString(2, menu.getCategory().toString());
			pStm.setInt(3, menu.getPrice());
			pStm.setString(4, menu.getIngredients());
			pStm.setBoolean(5, menu.getVeg());
			pStm.setDouble(6, menu.getCalorie());
			pStm.setDouble(7, menu.getFat());
			pStm.setDouble(8, menu.getProtein());
			pStm.setString(9, menu.getDescription());
			pStm.setString(10, menu.getImage());
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
	
	// Update Menu
	public boolean updateToMenu(Menu menu) {
		boolean updated = false;
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("update menu set "
					+ "title=?,"
					+ "category=?,"
					+ "price=?,"
					+ "ingredients=?,"
					+ "veg=?,"
					+ "calorie=?,"
					+ "fat=?,"
					+ "protein=?,"
					+ "description=?,"
					+ "image=? where id=?;");
			pStm.setString(1, menu.getTitle());
			pStm.setString(2, menu.getCategory().toString());
			pStm.setInt(3, menu.getPrice());
			pStm.setString(4, menu.getIngredients());
			pStm.setBoolean(5, menu.getVeg());
			pStm.setDouble(6, menu.getCalorie());
			pStm.setDouble(7, menu.getFat());
			pStm.setDouble(8, menu.getProtein());
			pStm.setString(9, menu.getDescription());
			pStm.setString(10, menu.getImage());
			pStm.setLong(11, menu.getId());
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
	
	// Delete Menu
	public boolean deleteFromMenu(Long id) {
		boolean deleted = false;
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("delete from menu where id=?;");
			pStm.setLong(1, id);
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

package com.hostmdy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class OrderItemDAO {
	
	private final DataSource dataSource;

	public OrderItemDAO(DataSource dataSource) {
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
	
	// get all
	public List<OrderItem> getAllOrderItem(){
		List<OrderItem> itemList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from orderitems ;");
			while (rs.next()) {
				itemList.add(new OrderItem(
						rs.getLong("id"), 
						rs.getLong("orderid"), 
						rs.getLong("menuid"), 
						rs.getString("title"), 
						rs.getInt("quantity"), 
						rs.getInt("subtotal"), 
						rs.getString("image")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return itemList;
	}
	
	// get by id 
	public OrderItem getOrderItemById(Long id) {
		OrderItem orderItem = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from orderitems where id='"+id+"';");
			while (rs.next()) {
				orderItem = new OrderItem(
						rs.getLong("id"), 
						rs.getLong("orderid"), 
						rs.getLong("menuid"), 
						rs.getString("title"), 
						rs.getInt("quantity"), 
						rs.getInt("subtotal"), 
						rs.getString("image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return orderItem;
	}
	
	// get by orderid
	public List<OrderItem> getOrderItemsByOrderId(Long orderid){
		List<OrderItem> itemList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from orderitems where orderid='"+orderid+"';");
			while (rs.next()) {
				itemList.add(new OrderItem(
						rs.getLong("id"), 
						rs.getLong("orderid"), 
						rs.getLong("menuid"), 
						rs.getString("title"), 
						rs.getInt("quantity"), 
						rs.getInt("subtotal"), 
						rs.getString("image")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return itemList;
	}
	
	// create
	public boolean createOrderItem(OrderItem orderItem) {
		boolean success = false;
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("insert into orderitems "
					+ "(orderid,menuid,title,quantity,subtotal,image) "
					+ "values(?,?,?,?,?,?);");
			pStm.setLong(1, orderItem.getOrderid());
			pStm.setLong(2, orderItem.getMenuid());
			pStm.setString(3, orderItem.getTitle());
			pStm.setInt(4, orderItem.getQuantity());
			pStm.setLong(5, orderItem.getSubtotal());
			pStm.setString(6, orderItem.getImage());
			int rowEffected = pStm.executeUpdate();
			success = (rowEffected > 0)? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
	}
	

}

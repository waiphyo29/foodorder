package com.hostmdy.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class OrderDAO {
	
	private final DataSource dataSource;

	public OrderDAO(DataSource dataSource) {
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
	
	// Get All
	public List<Order> getAllOrder(){
		List<Order> orderList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from orders order by id desc;");
			while (rs.next()) {
				orderList.add(new Order(
						rs.getLong("id"), 
						rs.getLong("customerid"), 
						rs.getInt("cost"), 
						rs.getDate("date").toLocalDate(), 
						rs.getTime("time").toLocalTime(), 
						rs.getBoolean("pickup"), 
						rs.getString("description"),
						rs.getBoolean("orderup")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return orderList;
	}
	
	// get by id
	public Order getOrderById(Long id){
		Order order = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from orders where id='"+id+"';");
			while (rs.next()) {
				order = new Order(
						rs.getLong("id"), 
						rs.getLong("customerid"), 
						rs.getInt("cost"), 
						rs.getDate("date").toLocalDate(), 
						rs.getTime("time").toLocalTime(), 
						rs.getBoolean("pickup"), 
						rs.getString("description"), 
						rs.getBoolean("orderup"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return order;
	}
	
	public List<Order> getOrderByCustomerId(Long customerid){
		List<Order> orderList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from orders where customerid='"+customerid+"' order by id desc;");
			while (rs.next()) {
				orderList.add(new Order(
						rs.getLong("id"), 
						rs.getLong("customerid"), 
						rs.getInt("cost"), 
						rs.getDate("date").toLocalDate(), 
						rs.getTime("time").toLocalTime(), 
						rs.getBoolean("pickup"), 
						rs.getString("description"), 
						rs.getBoolean("orderup")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return orderList;
	}
	
	// create 
	public boolean createOrder(Order order) {
		boolean success = false;
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("insert into orders "
					+ "(customerid,cost,date,time,pickup,description,orderup) "
					+ "values(?,?,?,?,?,?,?);");
			pStm.setLong(1, order.getCustomerid());
			pStm.setInt(2, order.getCost());
			pStm.setDate(3, Date.valueOf(LocalDate.now()));
			pStm.setTime(4, Time.valueOf(LocalTime.now()));
			pStm.setBoolean(5, order.getPickup());
			pStm.setString(6, order.getDescription());
			pStm.setBoolean(7, true);
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
	
	// get latest id
	public Long getMaxId() {
		Long id = 0L;
		try {
			connection = dataSource.getConnection();
			pStm = connection.prepareStatement("select max(id) as max_id from orders ;");
			rs = pStm.executeQuery();
			while (rs.next()) {
				id =  rs.getLong("max_id");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return id;
	}
	
	// confirm 
	public boolean orderConfirm(Long id) {
		boolean success = false;
			try {
				connection = dataSource.getConnection();
				pStm = connection.prepareStatement("update orders set orderup=? where id=?;");
				pStm.setBoolean(1, false);
				pStm.setLong(2, id);
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

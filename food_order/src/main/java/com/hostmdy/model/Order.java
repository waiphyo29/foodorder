package com.hostmdy.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class Order {
	
	private Long id;
	private Long customerid;
	private Integer cost;
	private LocalDate date;
	private LocalTime time;
	private Boolean pickup;
	private String description;
	private Boolean orderup;
	
	public Order() {}

	public Order(Long customerid, Integer cost, Boolean pickup, String description) {
		super();
		this.customerid = customerid;
		this.cost = cost;
		this.pickup = pickup;
		this.description = description;
	}

	public Order(Long id, Long customerid, Integer cost, LocalDate date, LocalTime time, Boolean pickup,
			String description, Boolean orderup) {
		super();
		this.id = id;
		this.customerid = customerid;
		this.cost = cost;
		this.date = date;
		this.time = time;
		this.pickup = pickup;
		this.description = description;
		this.orderup = orderup;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Long customerid) {
		this.customerid = customerid;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public LocalTime getTime() {
		return time;
	}

	public void setTime(LocalTime time) {
		this.time = time;
	}

	public Boolean getPickup() {
		return pickup;
	}

	public void setPickup(Boolean pickup) {
		this.pickup = pickup;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getOrderup() {
		return orderup;
	}

	public void setOrderup(Boolean orderup) {
		this.orderup = orderup;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", customerid=" + customerid + ", cost=" + cost + ", date=" + date + ", time=" + time
				+ ", pickup=" + pickup + ", description=" + description + ", orderup=" + orderup + "]";
	}
	
}

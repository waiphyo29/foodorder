package com.hostmdy.model;

import java.time.LocalDate;

public class User {
	
	private Long id;
	private String name;
	private String email;
	private String password;
	private String phone;
	private String location;
	private String address;
	private String payment;
	private String card;
	private LocalDate date;
	private String role;
	
	public User() {}

	public User(String name, String email, String password, String phone) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
	}

	public User(String name, Long id, String phone, String location, String address, String payment, String card) {
		super();
		this.name = name;
		this.id = id;
		this.phone = phone;
		this.location = location;
		this.address = address;
		this.payment = payment;
		this.card = card;
	}

	public User(Long id, String name, String email, String password, String phone, String location, String address,
			String payment, String card, LocalDate date, String role) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.location = location;
		this.address = address;
		this.payment = payment;
		this.card = card;
		this.date = date;
		this.role = role;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", phone=" + phone
				+ ", location=" + location + ", address=" + address + ", payment=" + payment + ", card=" + card
				+ ", date=" + date + ", role=" + role + "]";
	}

}

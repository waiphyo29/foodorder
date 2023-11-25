package com.hostmdy.model;

public class OrderItem {
	
	private Long id;
	private Long orderid;
	private Long menuid;
	private String title;
	private Integer quantity;
	private Integer subtotal;
	private String image;
	
	public OrderItem() {}

	public OrderItem(Long menuid, String title, Integer quantity, Integer subtotal, String image) {
		super();
		this.menuid = menuid;
		this.title = title;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.image = image;
	}

	public OrderItem(Long orderid, Long menuid, String title, Integer quantity, Integer subtotal, String image) {
		super();
		this.orderid = orderid;
		this.menuid = menuid;
		this.title = title;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.image = image;
	}

	public OrderItem(Long id, Long orderid, Long menuid, String title, Integer quantity, Integer subtotal,
			String image) {
		super();
		this.id = id;
		this.orderid = orderid;
		this.menuid = menuid;
		this.title = title;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.image = image;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getOrderid() {
		return orderid;
	}

	public void setOrderid(Long orderid) {
		this.orderid = orderid;
	}

	public Long getMenuid() {
		return menuid;
	}

	public void setMenuid(Long menuid) {
		this.menuid = menuid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Integer subtotal) {
		this.subtotal = subtotal;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", orderid=" + orderid + ", menuid=" + menuid + ", title=" + title
				+ ", quantity=" + quantity + ", subtotal=" + subtotal + ", image=" + image + "]";
	}

	
	
}

package com.hostmdy.model;

public class Menu {
	
	private Long id;
	private String title;
	private Category category;
	private Integer price;
	private String ingredients;
	private Boolean veg;
	private Double calorie;
	private Double fat;
	private Double protein;
	private String description;
	private String image;
	
	public Menu() {}

	

	public Menu(String title, Category category, Integer price, String ingredients, Boolean veg, Double calorie,
			Double fat, Double protein, String description, String image) {
		super();
		this.title = title;
		this.category = category;
		this.price = price;
		this.ingredients = ingredients;
		this.veg = veg;
		this.calorie = calorie;
		this.fat = fat;
		this.protein = protein;
		this.description = description;
		this.image = image;
	}



	public Menu(Long id, String title, Category category, Integer price, String ingredients, Boolean veg, Double calorie, Double fat,
			Double protein, String description, String image) {
		super();
		this.id = id;
		this.title = title;
		this.category = category;
		this.price = price;
		this.ingredients = ingredients;
		this.veg = veg;
		this.calorie = calorie;
		this.fat = fat;
		this.protein = protein;
		this.description = description;
		this.image = image;
	}



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public Category getCategory() {
		return category;
	}



	public void setCategory(Category category) {
		this.category = category;
	}



	public Integer getPrice() {
		return price;
	}



	public void setPrice(Integer price) {
		this.price = price;
	}



	public String getIngredients() {
		return ingredients;
	}



	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}



	public Boolean getVeg() {
		return veg;
	}



	public void setVeg(Boolean veg) {
		this.veg = veg;
	}



	public Double getCalorie() {
		return calorie;
	}



	public void setCalorie(Double calorie) {
		this.calorie = calorie;
	}



	public Double getFat() {
		return fat;
	}



	public void setFat(Double fat) {
		this.fat = fat;
	}



	public Double getProtein() {
		return protein;
	}



	public void setProtein(Double protein) {
		this.protein = protein;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	@Override
	public String toString() {
		return "Menu [id=" + id + ", title=" + title + ", category=" + category + ", price=" + price + ", ingredients="
				+ ingredients + ", veg=" + veg + ", calorie=" + calorie + ", fat=" + fat + ", protein=" + protein
				+ ", description=" + description + ", image=" + image + "]";
	}

}

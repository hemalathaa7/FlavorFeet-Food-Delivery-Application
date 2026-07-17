
package com.tap.Model;

import java.time.LocalTime;

public class Restaurant {
	private int RestaurantId; 
	private String  RestaurantName;
	private String  address;
	private String  cuisineType;
	private LocalTime  openingTime;
	private LocalTime  closingTime;
	private double  rating;
	private int  amount;
	private String imagePath;         //Food image ///blob

	
	
	public Restaurant() {
		// TODO Auto-generated constructor stub
	}



	public Restaurant(int restaurantId, String restaurantName, String address, String cuisineType,
			LocalTime openingTime, LocalTime closingTime, double rating, int amount, String imagePath) {
		super();
		RestaurantId = restaurantId;
		RestaurantName = restaurantName;
		this.address = address;
		this.cuisineType = cuisineType;
		this.openingTime = openingTime;
		this.closingTime = closingTime;
		this.rating = rating;
		this.amount = amount;
		this.imagePath = imagePath;
	}



	public int getRestaurantId() {
		return RestaurantId;
	}



	public void setRestaurantId(int restaurantId) {
		RestaurantId = restaurantId;
	}



	public String getRestaurantName() {
		return RestaurantName;
	}



	public void setRestaurantName(String restaurantName) {
		RestaurantName = restaurantName;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getCuisineType() {
		return cuisineType;
	}



	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}



	public LocalTime getOpeningTime() {
		return openingTime;
	}



	public void setOpeningTime(LocalTime openingTime) {
		this.openingTime = openingTime;
	}



	public LocalTime getClosingTime() {
		return closingTime;
	}



	public void setClosingTime(LocalTime closingTime) {
		this.closingTime = closingTime;
	}



	public double getRating() {
		return rating;
	}



	public void setRating(double rating) {
		this.rating = rating;
	}



	public int getAmount() {
		return amount;
	}



	public void setAmount(int amount) {
		this.amount = amount;
	}



	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}



	@Override
	public String toString() {
		return "Restaurant [RestaurantId=" + RestaurantId + ", RestaurantName=" + RestaurantName + ", address="
				+ address + ", cuisineType=" + cuisineType + ", openingTime=" + openingTime + ", closingTime="
				+ closingTime + ", rating=" + rating + ", amount=" + amount + ", imagePath=" + imagePath + "]";
	}
		}
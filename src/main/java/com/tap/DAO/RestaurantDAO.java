package com.tap.DAO;

import java.util.List;

import com.tap.Model.Restaurant;

public interface RestaurantDAO {
	void addRestaurant(Restaurant restaurant);
	Restaurant getRestaurant(int RestaurantId);
	void updateRestaurant(Restaurant restaurant);
	void deleteRestaurant(int RestaurantId);
	List<Restaurant> getAllRestaurants();

	String getRestaurantNameById(int restaurantId);
	Restaurant getRestaurantById(int restaurantId);

}
package com.tap.Model;

public class RestaurantPerformance {

    private String restaurantName;
    private int totalOrders;
    private double revenue;
    private double rating;

    public RestaurantPerformance() {}

    public RestaurantPerformance(String restaurantName,
                                 int totalOrders,
                                 double revenue,
                                 double rating) {

        this.restaurantName = restaurantName;
        this.totalOrders = totalOrders;
        this.revenue = revenue;
        this.rating = rating;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public int getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }
}
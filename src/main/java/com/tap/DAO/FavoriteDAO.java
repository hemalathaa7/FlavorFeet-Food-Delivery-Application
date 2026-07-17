package com.tap.DAO;

import java.util.List;
import com.tap.Model.FavoriteMenu;
import com.tap.Model.FavoriteRestaurant;
import com.tap.Model.Menu;
import com.tap.Model.Restaurant;



public interface FavoriteDAO {

    // ==========================
    // Restaurant Favorites
    // ==========================

    boolean addFavoriteRestaurant(FavoriteRestaurant favorite);

    boolean removeFavoriteRestaurant(int userId, int restaurantId);

    boolean isFavoriteRestaurant(int userId, int restaurantId);

    List<FavoriteRestaurant> getFavoriteRestaurants(int userId);
    List<Restaurant> getFavoriteRestaurantDetails(int userId);


    // ==========================
    // Menu Favorites
    // ==========================

    boolean addFavoriteMenu(FavoriteMenu favorite);

    boolean removeFavoriteMenu(int userId, int menuId);

    boolean isFavoriteMenu(int userId, int menuId);

    List<FavoriteMenu> getFavoriteMenus(int userId);
    
    
    List<Menu> getFavoriteMenuDetails(int userId);

}
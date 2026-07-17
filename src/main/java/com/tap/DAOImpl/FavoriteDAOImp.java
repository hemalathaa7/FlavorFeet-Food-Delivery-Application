package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.FavoriteDAO;
import com.tap.Model.FavoriteMenu;
import com.tap.Model.FavoriteRestaurant;
import com.tap.Model.Menu;
import com.tap.Model.Restaurant;
import com.tap.utility.DBConnection;

public class FavoriteDAOImp implements FavoriteDAO {

    private Connection con;

    // ==========================
    // Restaurant Queries
    // ==========================

    private static final String ADD_RESTAURANT =
            "INSERT INTO favorite_restaurants(userId, restaurantId) VALUES(?, ?)";

    private static final String REMOVE_RESTAURANT =
            "DELETE FROM favorite_restaurants WHERE userId=? AND restaurantId=?";

    private static final String CHECK_RESTAURANT =
            "SELECT * FROM favorite_restaurants WHERE userId=? AND restaurantId=?";

    private static final String GET_RESTAURANTS =
            "SELECT * FROM favorite_restaurants WHERE userId=?";


    // ==========================
    // Menu Queries
    // ==========================

    private static final String ADD_MENU =
            "INSERT INTO favorite_menu(userId, menuId) VALUES(?, ?)";

    private static final String REMOVE_MENU =
            "DELETE FROM favorite_menu WHERE userId=? AND menuId=?";

    private static final String CHECK_MENU =
            "SELECT * FROM favorite_menu WHERE userId=? AND menuId=?";

    private static final String GET_MENUS =
            "SELECT * FROM favorite_menu WHERE userId=?";


    public FavoriteDAOImp() {
        con = DBConnection.getConnection();
    }

// addFavoriteRestaurant()
    @Override
    public boolean addFavoriteRestaurant(FavoriteRestaurant favorite) {

        try {
            PreparedStatement pstmt = con.prepareStatement(ADD_RESTAURANT);

            pstmt.setInt(1, favorite.getUserId());
            pstmt.setInt(2, favorite.getRestaurantId());

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // removeFavoriteRestaurant()
    @Override
    public boolean removeFavoriteRestaurant(int userId, int restaurantId) {

        try {
            PreparedStatement pstmt = con.prepareStatement(REMOVE_RESTAURANT);

            pstmt.setInt(1, userId);
            pstmt.setInt(2, restaurantId);

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    
    //isFavoriteRestaurant
    @Override
    public boolean isFavoriteRestaurant(int userId, int restaurantId) {

        try {
            PreparedStatement pstmt = con.prepareStatement(CHECK_RESTAURANT);

            pstmt.setInt(1, userId);
            pstmt.setInt(2, restaurantId);

            ResultSet rs = pstmt.executeQuery();

            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    
    //getFavoriteRestaurants
    @Override
    public List<FavoriteRestaurant> getFavoriteRestaurants(int userId) {

        List<FavoriteRestaurant> favorites = new ArrayList<>();

        try {
            PreparedStatement pstmt = con.prepareStatement(GET_RESTAURANTS);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                FavoriteRestaurant favorite = new FavoriteRestaurant();

                favorite.setFavoriteId(rs.getInt("favoriteId"));
                favorite.setUserId(rs.getInt("userId"));
                favorite.setRestaurantId(rs.getInt("restaurantId"));
                favorite.setCreatedAt(rs.getTimestamp("createdAt"));

                favorites.add(favorite);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return favorites;
    }

    
    //addFavoriteMenu
    @Override
    public boolean addFavoriteMenu(FavoriteMenu favorite) {

        try {
            PreparedStatement pstmt = con.prepareStatement(ADD_MENU);

            pstmt.setInt(1, favorite.getUserId());
            pstmt.setInt(2, favorite.getMenuId());

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    
    //removeFavoriteMenu
    @Override
    public boolean removeFavoriteMenu(int userId, int menuId) {

        try {
            PreparedStatement pstmt = con.prepareStatement(REMOVE_MENU);

            pstmt.setInt(1, userId);
            pstmt.setInt(2, menuId);

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    
    //isFavoriteMenu
    @Override
    public boolean isFavoriteMenu(int userId, int menuId) {

        try {
            PreparedStatement pstmt = con.prepareStatement(CHECK_MENU);

            pstmt.setInt(1, userId);
            pstmt.setInt(2, menuId);

            ResultSet rs = pstmt.executeQuery();

            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    
    //getFavoriteMenus
    @Override
    public List<FavoriteMenu> getFavoriteMenus(int userId) {

        List<FavoriteMenu> favorites = new ArrayList<>();

        try {
            PreparedStatement pstmt = con.prepareStatement(GET_MENUS);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                FavoriteMenu favorite = new FavoriteMenu();

                favorite.setFavoriteId(rs.getInt("favoriteId"));
                favorite.setUserId(rs.getInt("userId"));
                favorite.setMenuId(rs.getInt("menuId"));
                favorite.setCreatedAt(rs.getTimestamp("createdAt"));

                favorites.add(favorite);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return favorites;
    }

    
    
    //getFavoriteMenuDetails

    @Override
    public List<Restaurant> getFavoriteRestaurantDetails(int userId) {
    	
    	final String GET_FAVORITE_RESTAURANT_DETAILS =
    			"SELECT r.* FROM restaurant r " +
    			"INNER JOIN favorite_restaurants f " +
    			"ON r.restaurantId = f.restaurantId " +
    			"WHERE f.userId = ?";

        List<Restaurant> restaurants = new ArrayList<>();

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(GET_FAVORITE_RESTAURANT_DETAILS);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurantId"));
                restaurant.setRestaurantName(rs.getString("restaurantName"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setCuisineType(rs.getString("cuisineType"));
                restaurant.setOpeningTime(rs.getTime("openingTime").toLocalTime());
                restaurant.setClosingTime(rs.getTime("closingTime").toLocalTime());
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setAmount(rs.getInt("amount"));
                restaurant.setImagePath(rs.getString("imagePath"));

                restaurants.add(restaurant);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurants;
    }

    
    
    //getFavoriteMenuDetails
    @Override
    public List<Menu> getFavoriteMenuDetails(int userId) {

        final String GET_FAVORITE_MENU_DETAILS =
                "SELECT m.* FROM menu m " +
                "INNER JOIN favorite_menu f " +
                "ON m.menuId = f.menuId " +
                "WHERE f.userId = ?";

        List<Menu> menus = new ArrayList<>();

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(GET_FAVORITE_MENU_DETAILS);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setItemName(rs.getString("itemName"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setImagePath(rs.getString("imagePath"));
                menu.setAvailable(rs.getBoolean("isAvailable"));

                menus.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menus;
    }
	
}
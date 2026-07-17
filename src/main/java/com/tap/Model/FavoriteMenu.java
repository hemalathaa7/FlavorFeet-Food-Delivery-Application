package com.tap.Model;

import java.sql.Timestamp;

public class FavoriteMenu {

    private int favoriteId;
    private int userId;
    private int menuId;
    private Timestamp createdAt;

    public FavoriteMenu() {
    }

    public FavoriteMenu(int userId, int menuId) {
        this.userId = userId;
        this.menuId = menuId;
    }

    public FavoriteMenu(int favoriteId, int userId, int menuId, Timestamp createdAt) {
        this.favoriteId = favoriteId;
        this.userId = userId;
        this.menuId = menuId;
        this.createdAt = createdAt;
    }

    public int getFavoriteId() {
        return favoriteId;
    }

    public void setFavoriteId(int favoriteId) {
        this.favoriteId = favoriteId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
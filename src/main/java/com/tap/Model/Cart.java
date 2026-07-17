package com.tap.Model;

import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items;

    public Cart() {
        items = new LinkedHashMap<>();
    }

    public void addItem(CartItem cartItem) {
        int menuId = cartItem.getMenuId();

        if (items.containsKey(menuId)) {
            CartItem existingItem = items.get(menuId);
            existingItem.setQuantity(existingItem.getQuantity() + cartItem.getQuantity());
        } else {
            items.put(menuId, cartItem);
        }
    }

    public void updateItem(int menuId, int quantity) {
        if (items.containsKey(menuId)) {
            if (quantity <= 0) {
                items.remove(menuId);
            } else {
                items.get(menuId).setQuantity(quantity);
            }
        }
    }

    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }
}
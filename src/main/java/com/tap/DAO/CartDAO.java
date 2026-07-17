package com.tap.DAO;

import java.util.List;

import com.tap.Model.Cart;

public interface CartDAO {
	
	void addCart(Cart cart);
	Cart getCart(int CartId);
	void updateCart(Cart cart);
	void deleteCart(int CartId);
	List<Cart> getAllCart();

}
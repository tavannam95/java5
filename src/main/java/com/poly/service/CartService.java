package com.poly.service;

import java.util.Collection;

import com.poly.beans.CartItemModel;

public interface CartService {

	int getCount();

	double getAmount();

	void update(int productId, int quantity);

	void clear();

	Collection<CartItemModel> getCartItems();

	void remove(int productId);

	void add(CartItemModel item);

}

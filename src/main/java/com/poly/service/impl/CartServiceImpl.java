package com.poly.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.beans.CartItemModel;
import com.poly.service.CartService;

@Service
@SessionScope
public class CartServiceImpl implements CartService{

	private Map<Integer, CartItemModel> map = new HashMap<Integer, CartItemModel>();

	@Override
	public void add(CartItemModel item) {

		CartItemModel exist = map.get(item.getId());
		if (exist != null) {
			exist.setQuantity(item.getQuantity() + exist.getQuantity());
		} else {
			map.put(item.getId(), item);
		}
	}

	@Override
	public void remove(int productId) {
		map.remove(productId);
	}

	@Override
	public Collection<CartItemModel> getCartItems() {
		return map.values();
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public void update(int productId, int quantity) {
		CartItemModel item = map.get(productId);
		if (quantity <= 0) {
			map.remove(productId);
		}else {
			item.setQuantity(quantity);
		}
	}
	
	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item->item.getQuantity() * item.getPrice()).sum();
	}
	
	@Override
	public int getCount() {
		if (map.isEmpty()) {
			return 0;
		}
		return map.values().size();
		
	}

}

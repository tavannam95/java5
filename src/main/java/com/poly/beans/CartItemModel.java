package com.poly.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItemModel {
	private int id;
	private int quantity;
	private String name;
	private double price;
}

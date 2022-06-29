package com.poly.beans;

import javax.validation.constraints.Min;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailModel {
	private int orderId;
	private int productId;
	private double price;
	
	@Min(value = 1,message =  "Số lượng phải lớn hơn 0!")
	private int quantity;
	
}

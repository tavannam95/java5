package com.poly.beans;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderModel {
	
	private int userId;
	private Date createDate;
	private String address;
	private int status;
	
}

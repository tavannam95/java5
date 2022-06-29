package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entities.Product;

public interface ProductDAO extends JpaRepository<Product, Integer>{
	@Query( nativeQuery = true, value = "SELECT * FROM Products WHERE discount != 0 "
			+ "ORDER BY (price - discount) DESC LIMIT 0,8 ")
	List<Product> findProductsDiscount();
}

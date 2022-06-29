package com.poly.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entities.Order;


public interface OrderDAO extends JpaRepository<Order, Integer>{
	@Query("SELECT o FROM Order o WHERE o.user.id = :accountId")
	List<Order> findByUserId(@Param("accountId") Integer id);
	
	@Query("SELECT o FROM Order o WHERE o.user.id = :accountId AND o.status = 0")
	List<Order> findByUserIdStatus(@Param("accountId") Integer id);
}

package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entities.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{
	@Query(value = "SELECT od FROM OrderDetail od WHERE od.order.id = :id ")
	List<OrderDetail> findByOrderId(@Param("id") Integer id);
}

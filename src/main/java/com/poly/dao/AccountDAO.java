package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entities.Account;

public interface AccountDAO extends JpaRepository<Account, Integer>{
	@Query(" SELECT acc FROM Account acc WHERE acc.username like :username ")
	Account findByUsername(@Param("username") String username);
	
}

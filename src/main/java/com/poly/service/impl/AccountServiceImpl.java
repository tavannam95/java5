package com.poly.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.stereotype.Service;

import com.poly.dao.AccountDAO;
import com.poly.entities.Account;
import com.poly.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	AccountDAO accountDAO;

	
	
	@Override
	public Account findByUsername(String username) {
		return accountDAO.findByUsername(username);
	}

	@Override
	public Account login(String username, String password) {
		Account account = findByUsername(username);
		if (account!=null && account.getPassword().equals(password)) {
			return account;
		}
		return null;
	}
	
	@Override
	public <S extends Account> S save(S entity) {
		return accountDAO.save(entity);
	}

	@Override
	public <S extends Account> Optional<S> findOne(Example<S> example) {
		return accountDAO.findOne(example);
	}

	@Override
	public List<Account> findAll() {
		return accountDAO.findAll();
	}

	@Override
	public Page<Account> findAll(Pageable pageable) {
		return accountDAO.findAll(pageable);
	}

	@Override
	public List<Account> findAll(Sort sort) {
		return accountDAO.findAll(sort);
	}

	@Override
	public List<Account> findAllById(Iterable<Integer> ids) {
		return accountDAO.findAllById(ids);
	}

	@Override
	public Optional<Account> findById(Integer id) {
		return accountDAO.findById(id);
	}

	@Override
	public <S extends Account> List<S> saveAll(Iterable<S> entities) {
		return accountDAO.saveAll(entities);
	}

	@Override
	public void flush() {
		accountDAO.flush();
	}

	@Override
	public boolean existsById(Integer id) {
		return accountDAO.existsById(id);
	}

	@Override
	public <S extends Account> S saveAndFlush(S entity) {
		return accountDAO.saveAndFlush(entity);
	}

	@Override
	public <S extends Account> List<S> saveAllAndFlush(Iterable<S> entities) {
		return accountDAO.saveAllAndFlush(entities);
	}

	@Override
	public <S extends Account> Page<S> findAll(Example<S> example, Pageable pageable) {
		return accountDAO.findAll(example, pageable);
	}

	@Override
	public void deleteInBatch(Iterable<Account> entities) {
		accountDAO.deleteInBatch(entities);
	}

	@Override
	public <S extends Account> long count(Example<S> example) {
		return accountDAO.count(example);
	}

	@Override
	public void deleteAllInBatch(Iterable<Account> entities) {
		accountDAO.deleteAllInBatch(entities);
	}

	@Override
	public long count() {
		return accountDAO.count();
	}

	@Override
	public <S extends Account> boolean exists(Example<S> example) {
		return accountDAO.exists(example);
	}

	@Override
	public void deleteById(Integer id) {
		accountDAO.deleteById(id);
	}

	@Override
	public void deleteAllByIdInBatch(Iterable<Integer> ids) {
		accountDAO.deleteAllByIdInBatch(ids);
	}

	@Override
	public void delete(Account entity) {
		accountDAO.delete(entity);
	}

	@Override
	public <S extends Account, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction) {
		return accountDAO.findBy(example, queryFunction);
	}

	@Override
	public void deleteAllById(Iterable<? extends Integer> ids) {
		accountDAO.deleteAllById(ids);
	}

	@Override
	public void deleteAllInBatch() {
		accountDAO.deleteAllInBatch();
	}

	@Override
	public Account getOne(Integer id) {
		return accountDAO.getOne(id);
	}

	@Override
	public void deleteAll(Iterable<? extends Account> entities) {
		accountDAO.deleteAll(entities);
	}

	@Override
	public void deleteAll() {
		accountDAO.deleteAll();
	}

	@Override
	public Account getById(Integer id) {
		return accountDAO.getById(id);
	}

	@Override
	public Account getReferenceById(Integer id) {
		return accountDAO.getReferenceById(id);
	}

	@Override
	public <S extends Account> List<S> findAll(Example<S> example) {
		return accountDAO.findAll(example);
	}

	@Override
	public <S extends Account> List<S> findAll(Example<S> example, Sort sort) {
		return accountDAO.findAll(example, sort);
	}
	
}

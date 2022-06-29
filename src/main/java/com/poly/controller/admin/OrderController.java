package com.poly.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.beans.OrderModel;
import com.poly.dao.AccountDAO;
import com.poly.dao.OrderDAO;
import com.poly.entities.Account;
import com.poly.entities.Order;

@Controller
@RequestMapping("/admin/orders")
public class OrderController {
	
	@Autowired
	AccountDAO accountDAO;
	
	@Autowired
	OrderDAO orderDAO;
	
	@ModelAttribute("accounts")
	public Map<Integer, String> getAccounts() {
		Map<Integer, String> map = new HashMap<Integer, String>();
		List<Account> list = this.accountDAO.findAll();
		for (Account account : list) {
			map.put(account.getId(), account.getUsername());
		}
		return map;
	}
	
	@GetMapping("/index")
	public String index(
			Model model,
			@RequestParam(name = "size", defaultValue = "5") Integer size,
			@RequestParam(name = "page", defaultValue = "0") Integer page
			) {
		
		Pageable pageable = PageRequest.of(page, size);
		Page<Order> p = this.orderDAO.findAll(pageable);
		
		model.addAttribute("page", page);
		model.addAttribute("data", p);
		model.addAttribute("view", "admin/orders/index.jsp");
		return "layout";
	}
	
	@GetMapping("/create")
	public String create(
				Model model,
				@ModelAttribute("orderModel") OrderModel orderModel
			) {
		model.addAttribute("view", "admin/orders/create.jsp");
		return "layout";
	}
	
	@PostMapping("/store")
	public String store(
				Model model,
				OrderModel orderModel
			) {
		Date now = new Date();
		Account account = this.accountDAO.findById(orderModel.getUserId()).get();
		Order order = new Order();
		order.setAddress(account.getAddress());
		order.setStatus(0);
		order.setUser(account);
		order.setCreateDate(now);
		
		this.orderDAO.save(order);
		
		return "redirect:/admin/orders/index";
	}
	
	@RequestMapping("/accept/{id}")
	public String accept(
				@PathVariable("id") Integer id
			) {
		Order order = this.orderDAO.findById(id).get();
		order.setStatus(2);
		
		this.orderDAO.save(order);
		
		return "redirect:/admin/orders/index";
	}
	
	@RequestMapping("/cancel/{id}")
	public String cancel(
				@PathVariable("id") Integer id
			) {
		Order order = this.orderDAO.findById(id).get();
		order.setStatus(1);
		
		this.orderDAO.save(order);
		
		return "redirect:/admin/orders/index";
	}
}

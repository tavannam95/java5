package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entities.Category;
import com.poly.entities.Product;

@Controller
public class HomeController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@ModelAttribute("listProductsDiscount")
	public List<Product> getListProductsDiscount() {
		List<Product> listProductsDiscount = this.productDAO.findProductsDiscount();
		return listProductsDiscount;
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		List<Category> list = this.categoryDAO.findAll();
		return list;
	}
	
	@GetMapping("/home")
	public String index(
				Model model,
				@RequestParam(name = "size", defaultValue = "8") Integer size,
				@RequestParam(name = "page", defaultValue = "0") Integer page
			) {
		
		Pageable pageable = PageRequest.of(page, size);
		Page<Product> p = this.productDAO.findAll(pageable);
		
		model.addAttribute("page", page);
		model.addAttribute("data", p);
		
		model.addAttribute("view", "index.jsp");
		return "layout";
	}
}

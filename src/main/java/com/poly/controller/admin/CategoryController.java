package com.poly.controller.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.beans.CategoryModel;
import com.poly.dao.CategoryDAO;
import com.poly.entities.Category;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@GetMapping("/index")
	public String index(
				Model model,
				@RequestParam(name = "size", defaultValue = "5") Integer size,
				@RequestParam(name = "page", defaultValue = "0") Integer page
			) {
		
		Pageable pageable = PageRequest.of(page, size);
		Page<Category> p = this.categoryDAO.findAll(pageable);
		
		model.addAttribute("page", page);
		model.addAttribute("data", p);
		model.addAttribute("view", "admin/categories/index.jsp");
		return "layout";
	}
	
	@GetMapping("/create")
	public String create(
				Model model,
				@ModelAttribute("categoryModel") CategoryModel categoryModel
			) {
		model.addAttribute("view", "admin/categories/create.jsp");
		return "layout";
		
	}
	
	@PostMapping("/store")
	public String store(
				Model model,
				@Valid @ModelAttribute("categoryModel") CategoryModel categoryModel,
				BindingResult result
			) {
		if (result.hasErrors()) {
			model.addAttribute("view", "admin/categories/create.jsp");
			return "layout";
		}else {
			Category category = new Category();
			category.setName(categoryModel.getName());
			this.categoryDAO.save(category);
			
			return "redirect:/admin/categories/index";
		}
	}
	
	@GetMapping("/edit/{id}")
	public String edit(
				@PathVariable("id") Category category,
				Model model
			) {
		
		model.addAttribute("category", category);
		model.addAttribute("view", "admin/categories/edit.jsp");
		return "layout";
	}
	
	@PostMapping("/update/{id}")
	public String update(
				@PathVariable("id") Integer id,
				CategoryModel categoryModel
			) {
		Category category = this.categoryDAO.findById(id).get();
		category.setName(categoryModel.getName());
		
		this.categoryDAO.save(category);
		
		return "redirect:/admin/categories/index";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(
				@PathVariable("id") Category category
			) {
		
		this.categoryDAO.delete(category);
		return "redirect:/admin/categories/index";
	}
	
}

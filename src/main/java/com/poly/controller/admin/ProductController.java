package com.poly.controller.admin;

import java.nio.file.Path;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

import com.poly.beans.ProductModel;
import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entities.Category;
import com.poly.entities.Product;

@Controller
@RequestMapping("/admin/products")
public class ProductController {

	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext context;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@ModelAttribute("categories")
	public Map<Integer, String> getCategories() {
		Map<Integer, String> map = new HashMap<Integer, String>();
		List<Category> list = this.categoryDAO.findAll();
		for (Category category : list) {
			map.put(category.getId(), category.getName());
		}
		return map;
	}

	@GetMapping("/index")
	public String index(Model model, @RequestParam(name = "size", defaultValue = "5") Integer size,
			@RequestParam(name = "page", defaultValue = "0") Integer page) {
		Pageable pageable = PageRequest.of(page, size);
		Page<Product> p = this.productDAO.findAll(pageable);

		model.addAttribute("page", page);
		model.addAttribute("data", p);
		model.addAttribute("view", "admin/products/index.jsp");
		return "layout";
	}

	@GetMapping("/create")
	public String create(Model model, @ModelAttribute("productModel") ProductModel productModel) {
		model.addAttribute("view", "admin/products/create.jsp");
		return "layout";
	}

	@PostMapping("/store")
	public String store(Model model, HttpServletRequest request,
			@Valid @ModelAttribute("productModel") ProductModel productModel, BindingResult result) {
		Product product = new Product();
		if (result.hasErrors()) {
			model.addAttribute("view", "admin/products/create.jsp");
			return "layout";
		} else {

			if (!productModel.getImageFile().isEmpty()) {

				String path = context.getRealPath("/");
				try {
					productModel.setImage(productModel.getImageFile().getOriginalFilename());
					String filePath = path + "/images/" + productModel.getImage();

					productModel.getImageFile().transferTo(Path.of(filePath));
					productModel.setImageFile(null);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

			}

			Date nowDate = new Date();
			Category category = this.categoryDAO.findById(productModel.getCategoryId()).get();

			product.setName(productModel.getName());
			product.setPrice(productModel.getPrice());
			product.setImage(productModel.getImage());
			product.setQuantity(productModel.getQuantity());
			product.setDescription(productModel.getDescription());
			product.setCreatedDate(nowDate);
			product.setUpdateDate(nowDate);
			product.setCategory(category);

			this.productDAO.save(product);
			session.setAttribute("error", "Thêm mới thành công!");
			return "redirect:/admin/products/index";
		}
	}

	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Product product, Model model) {
		ProductModel productModel = new ProductModel();
		productModel.setCategoryId(product.getCategory().getId());
		productModel.setCreatedDate(product.getCreatedDate());
		productModel.setImage(product.getImage());
		productModel.setName(product.getName());
		productModel.setDiscount(product.getDiscount());
		productModel.setPrice(product.getPrice());
		productModel.setQuantity(product.getQuantity());
		productModel.setDescription(product.getDescription());
		productModel.setDeleted(product.getDeleted());

		model.addAttribute("productModel", productModel);
		model.addAttribute("product", product);

		model.addAttribute("view", "admin/products/edit.jsp");
		return "layout";
	}

	@PostMapping("/update/{id}")
	public String update(Model model, @PathVariable("id") Integer id,
			@Valid @ModelAttribute("productModel") ProductModel productModel, BindingResult result) {

		if (result.hasErrors()) {
			Product product = this.productDAO.findById(id).get();
			model.addAttribute("product", product);
			model.addAttribute("view", "admin/products/edit.jsp");
			return "layout";
		}

		if (productModel.getPrice()<productModel.getDiscount()) {
			System.out.println("Check Giá");
			Product product = this.productDAO.findById(id).get();
			model.addAttribute("product", product);
			model.addAttribute("view", "admin/products/edit.jsp");
			session.setAttribute("error", "Giá khuyến mãi phải nhỏ hơn giá gốc!");
			return "layout";
		}
		
		Product product = this.productDAO.findById(id).get();
		product.setName(productModel.getName());
		product.setPrice(productModel.getPrice());
		product.setDiscount(productModel.getDiscount());
		product.setQuantity(productModel.getQuantity());
		product.setDescription(productModel.getDescription());
		product.setDeleted(productModel.getDeleted());
		product.setCategory(this.categoryDAO.findById(productModel.getCategoryId()).get());

		this.productDAO.save(product);

		return "redirect:/admin/products/index";
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Product product) {
		this.productDAO.delete(product);
		return "redirect:/admin/products/index";
	}

}

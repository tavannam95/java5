package com.poly.controller.admin;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.beans.CartItemModel;
import com.poly.dao.ProductDAO;
import com.poly.entities.Product;
import com.poly.service.CartService;

@Controller
@RequestMapping("/carts")
public class CartController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CartService cartService;
	
	@GetMapping("/index")
	public String index(
				Model model
			) {
		
		Collection<CartItemModel> cartItems = this.cartService.getCartItems();
		
		model.addAttribute("view", "admin/carts/index.jsp");
		model.addAttribute("carts", cartItems);
		model.addAttribute("count", this.cartService.getCount());
		model.addAttribute("totalPrice", this.cartService.getAmount());
		return "layout";
	}
	
	@RequestMapping("/add/{id}")
	public String add(
				@PathVariable("id") Integer id
			) {
		Product product = this.productDAO.findById(id).get();
		if (product != null) {
			CartItemModel cartItemModel = new CartItemModel();
			BeanUtils.copyProperties(product, cartItemModel);
			cartItemModel.setQuantity(1);
			this.cartService.add(cartItemModel);
		}
		session.setAttribute("message", "Thêm vào giỏ hàng thành công!");
		return "redirect:/carts/detail/" + id;
	}
	@GetMapping("/remove/{id}")
	public String remove(
				@PathVariable("id") Integer id
			) {
		this.cartService.remove(id);
		return "redirect:/carts/index";
	}
	@GetMapping("/clear")
	public String clear() {
		return "redirect:/carts/index";
	}
	@PostMapping("/update/{id}")
	public String update(
			@PathVariable("id") Integer id,
			@Param("quantity") Integer quantity
			){
		this.cartService.update(id, quantity);
		return "redirect:/carts/index";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(
				Model model,
				@PathVariable("id") Product product
			) {
		model.addAttribute("product", product);
		model.addAttribute("view", "admin/carts/detail.jsp");
		return "layout";
	}
	
}

package com.poly.beans;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ProductModel {
	
	//name
	
	@NotBlank(message = "Không được để trống!")
	@Pattern(regexp = "([A-Za-z0-9ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠ-ỹ\\,\\.\\- ]{0,255}$)", 
	message = "Không được chứa ký tự đặc biệt!")
	private String name;
	
	
	private String image;
	
	
	private Date createdDate;
	
	private Date updateDate;
	
	@Min(value = 1, message = "Giá phải lớn hơn 0!")
	private double price;
	
	@Min(value = 0, message = "Giá khuyến mãi không hợp lệ!")
	private double discount;
	
	private int quantity;
	
	private String description;
	
	
	@Min(value = 0, message = "Trạng thái phải là 0 hoặc 1!")
	@Max(value = 1, message = "Trạng thái phải là 0 hoặc 1!")
	private int deleted;
	
	private int categoryId;
	
	
	private MultipartFile imageFile;
}

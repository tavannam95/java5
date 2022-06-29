package com.poly.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryModel {
	
	@NotBlank(message = "Không được để trống!")
	@Pattern(regexp = "([A-Za-z0-9ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠ-ỹ ]{0,255}$)", 
	message = "Không được chứa ký tự đặc biệt hoặc số!")
	private String name;
}

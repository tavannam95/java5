package com.poly.beans;

import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountModel {

	// Username

//	@NotBlank(message = "Không được để trống!")
	@Size(min = 4, max = 255, message = "Tài khoản từ 4 đến 255 ký tự!")
	@Pattern(regexp = "([a-zA-z0-9\\._]{0,255})", message = "Không được chứa ký tự đặc biệt!")
	private String username;

	// Password

//	@NotBlank(message = "Không được để trống!")
	@Size(min = 6, message = "Ít nhất 6 ký tự!")
	private String password;

	// Fullname

	@NotBlank(message = "Không được để trống!")
	@Pattern(regexp = "([A-Za-zÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠ-ỹ ]{0,255}$)", 
			message = "Không được chứa ký tự đặc biệt hoặc số!")
	private String fullname;
	
	//Email
	
	@Email
	@NotBlank(message = "Không được để trống!")
	private String email;
	
	//Photo
	
	private String photo;
	
	//Address
	
	@NotBlank(message = "Không được để trống!")
	@Pattern(regexp = "([A-Za-z0-9ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠ-ỹ\\,\\.\\- ]{0,255}$)", 
	message = "Không được chứa ký tự đặc biệt!")
	private String address;
	
	//Activated
	
	@NotNull
	@Min(value = 0, message = "Giá trị nhỏ nhất là 0!")
	@Max(value = 1, message = "Giá trị lớn nhất là 1!")
	private int activated;
	
	//Admin
	
	@NotNull
	@Min(value = 0, message = "Giá trị nhỏ nhất là 0!")
	@Max(value = 1, message = "Giá trị lớn nhất là 1!")
	private int admin;
	private MultipartFile imageFile;
}

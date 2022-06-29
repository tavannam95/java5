package com.poly.beans;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthModel {
	
	@NotNull
	@Size(min = 4, message = "Ít nhất 4 ký tự!")
	private String username;
	@NotNull
	@Size(min = 6, message = "Ít nhất 6 ký tự!")
	private String password;
	private boolean remember;
}

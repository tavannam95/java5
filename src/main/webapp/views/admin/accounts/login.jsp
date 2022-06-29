<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<div class="row mt-3">
		<div class="col-5">
			<h1 class="text-danger" style="font-size: 42px">Cập nhật tài
				khoản</h1>
		</div>
		<div class="col-7">
			<div class="container mt-5" style="margin-top: 10px;">
				<form:form action="/admin/accounts/login/${ account.username }"
					method="post"
					enctype="multipart/form-data">

					<!-- username -->

					<div class="form-floating mb-3">
						<form:input path="username" type="text" class="form-control "
							id="floatingPassword" placeholder="Password" />
						<form:errors path="username" style="color: red"></form:errors>
						<label for="floatingPassword">Tài khoản</label>
					</div>

					<!-- password -->

					<div class="form-floating mb-3">
						<form:input path="password" type="password" class="form-control"
							id="floatingInput" placeholder="." />
						<form:errors path="password" style="color: red"></form:errors>
						<label for="floatingInput">Password</label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="flexCheckDefault"> <label class="form-check-label"
							for="flexCheckDefault"> Nhớ mật khẩu? </label>
					</div>

					<button class="btn btn-primary">Đồng ý</button>
				</form:form>
			</div>
		</div>
	</div>
</div>
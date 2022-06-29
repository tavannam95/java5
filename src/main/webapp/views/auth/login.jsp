<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container mt-3">
	<div class="row">
		<div class="col-5">
			<h1 class="text-danger">Đăng nhập</h1>
		</div>

		<div class="col-7">
			<form:form action="/auth/signin" method="post"
				modelAttribute="authModel" enctype="multipart/form-data">

				<!-- username -->

				<div class="form-floating mb-3">
					<form:input path="username" type="text" class="form-control "
						id="floatingPassword" placeholder="Password" />
					<form:errors path="username" style="color:red"></form:errors>
					<label for="floatingPassword">Tài khoản</label>
				</div>

				<!-- password -->

				<div class="form-floating mb-3">
					<form:input path="password" type="password" class="form-control "
						id="floatingPassword" placeholder="Password" />
					<form:errors path="password" style="color:red"></form:errors>
					<label for="floatingPassword">Mật khẩu</label>
				</div>

				<!-- remember -->

				<div class="form-check mb-3">
					<form:checkbox path="remember" class="form-check-input"
						id="flexCheckDefault" />
					<label class="form-check-label" for="flexCheckDefault">Nhớ
						tài khoản</label>
				</div>
				<button class="btn btn-primary">Đăng nhập</button>
			</form:form>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row mt-3">
	<div class="col-5">
		<h1 class="text-danger" style="font-size: 62px">Đăng ký</h1>
	</div>
	<div class="col-7">
		<div class="container mt-5" style="margin-top: 10px;">
			<form:form action="/auth/store" method="post"
				modelAttribute="accountModel" enctype="multipart/form-data">

				<!-- fullname -->

				<div class="form-floating mb-3">
					<form:input path="fullname" type="text" class="form-control "
						id="floatingInput" placeholder="." />
						<form:errors path="fullname" style="color: red"></form:errors>
					<label for="floatingInput">Họ và tên</label>
				</div>

				<!-- username -->

				<div class="form-floating mb-3">
					<form:input path="username" type="text" class="form-control "
						id="floatingPassword" placeholder="Password" />
						<form:errors path="username" style="color: red"></form:errors>
					<label for="floatingPassword">Tài khoản</label>
				</div>

				<!-- password -->

				<div class="form-floating mb-3">
					<form:input path="password" type="password" class="form-control "
						id="floatingPassword" placeholder="Password" />
						<form:errors path="password" style="color: red"></form:errors>
					<label for="floatingPassword">Mật khẩu</label>
				</div>

				<!-- email -->

				<div class="form-floating mb-3">
					<form:input path="email" type="email" class="form-control "
						id="floatingInput" placeholder="." />
						<form:errors path="email" style="color: red"></form:errors>
					<label for="floatingInput">Email</label>
				</div>
				
				<!-- address -->

				<div class="form-floating mb-3">
					<form:input path="address" type="text" class="form-control "
						id="floatingInput" placeholder="." />
						<form:errors path="address" style="color: red"></form:errors>
					<label for="floatingInput">Địa chỉ</label>
				</div>

				<!-- photo -->

				<div class="form-control mb-3">
					<label for="floatingInput">Ảnh đại diện</label> <input
						class="form-control mt-3" type="file" max-size="2000"  accept="image/*" name="imageFile" />
				</div>
				<button class="btn btn-primary">Đăng ký</button>
			</form:form>
		</div>
	</div>
</div>


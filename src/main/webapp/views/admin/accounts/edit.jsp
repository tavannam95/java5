<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row mt-3">
	<div class="col-5">
		<h1 class="text-danger" style="font-size: 42px">Cập nhật tài
			khoản</h1>
	</div>
	<div class="col-7">
		<div class="container mt-5" style="margin-top: 10px;">
			<form:form action="/admin/accounts/update/${ account.id }"
				method="post" modelAttribute="accountModel" enctype="multipart/form-data">

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

				<!-- email -->
				<div class="form-floating mb-3">
					<form:input path="email" type="email" class="form-control "
						id="floatingInput" placeholder="."/>
						<form:errors path="email" style="color: red"></form:errors>
					<label for="floatingInput">Email</label>
				</div>
				
					<!-- password -->

					<div class="form-floating mb-3">
						<form:input path="password" type="password" class="form-control"
							id="floatingInput" placeholder="." />
							<form:errors path="password" style="color: red"></form:errors>
						<label for="floatingInput">Password</label>
					</div>
				
				<!-- address -->

				<div class="form-floating mb-3">
					<form:input path="address" type="text" class="form-control "
						id="floatingInput" placeholder="." />
						<form:errors path="address" style="color: red"></form:errors>
					<label for="floatingInput">Địa chỉ</label>
				</div>

				<!-- activated -->

				<div class="form-control mb-3">
					<label class="ms-1 form-label row">Trạng thái</label>
					<div class="form-check form-check-inline">
						<form:radiobutton class="form-check-input" path="activated"
							value="0" />
						<label class="form-check-label" for="inlineRadio1">Chưa
							kích hoạt</label>
					</div>
					<div class="form-check form-check-inline">
						<form:radiobutton class="form-check-input" path="activated"
							value="1" />
						<label class="form-check-label" for="inlineRadio2">Kích
							hoạt</label>
					</div>
						<form:errors path="activated" style="color: red"></form:errors>
				</div>


				<!-- admin -->

				<div class="form-control mb-3">
					<label class="ms-1 form-label row">Vai trò</label>
					<div class="form-check form-check-inline">
						<form:radiobutton class="form-check-input" path="admin" value="0" />
						<label class="form-check-label" for="inlineRadio1">Thành
							viên</label>
					</div>
					<div class="form-check form-check-inline">
						<form:radiobutton class="form-check-input" path="admin" value="1" />
						<label class="form-check-label" for="inlineRadio2">Quản
							trị viên</label>
					</div>
						<form:errors path="admin" style="color: red"></form:errors>
				</div>

				<button class="btn btn-primary">Đồng ý</button>
			</form:form>
		</div>
	</div>
</div>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row mt-3">
	<div class="col-5">
		<h1 class="text-danger" style="font-size: 62px">Thêm sản phẩm</h1>
	</div>
	<div class="col-7">
		<div class="container mt-5" style="margin-top: 10px;">
			<form:form action="/admin/products/store" method="post"
				modelAttribute="productModel" enctype="multipart/form-data">

				<!-- name -->

				<div class="form-floating mb-3">
					<form:input path="name" type="text" class="form-control "
						id="floatingInput" placeholder="." />
					<form:errors path="name" style="color:red"></form:errors>
					<label for="floatingInput">Tên sản phẩm:</label>
				</div>

				<!-- price -->

				<div class="form-floating mb-3">
					<form:input path="price" type="number" class="form-control "
						id="floatingPassword" placeholder="Password" />
					<form:errors path="price" style="color:red"></form:errors>
					<label for="floatingPassword">Giá:</label>
				</div>
				
				<!-- quantity -->

				<div class="form-floating mb-3">
					<form:input path="quantity" type="number" class="form-control "
						id="floatingPassword" placeholder="Password" />
					<form:errors path="quantity" style="color:red"></form:errors>
					<label for="floatingPassword">Số lượng:</label>
				</div>

				<!-- category -->
				<div class="form-control mb-3">
					<label for="floatingInput">Danh mục:</label>
					<form:select class="form-select mt-2" path="categoryId">
						<form:options items="${ categories }" value="${ categories.id }"></form:options>
					</form:select>
				</div>

				<!-- description -->

				<div class="form-floating mb-3">
					<form:textarea class="form-control" style="height: 100px"
						path="description" placeholder="description" />
					<label for="floatingTextarea2">Mô tả sản phẩm</label>
				</div>

				<!-- available -->

				<%-- <div class="form-control mb-3">
					<label class="ms-1 form-label row">Trạng thái</label>
					<div class="form-check form-check-inline">
						<form:radiobutton class="form-check-input" path="available"
							value="0" />
						<label class="form-check-label" for="inlineRadio1">Hết hàng</label>
					</div>
					<div class="form-check form-check-inline">
						<form:radiobutton class="form-check-input" path="available"
							value="1" />
						<label class="form-check-label" for="inlineRadio2">Còn hàng</label>
					</div>
					<form:errors path="available" style="color:red"></form:errors>
				</div> --%>

				<!-- photo -->

				<div class="form-control mb-3">
					<label for="floatingInput">Ảnh sản phẩm:</label> <input
						class="form-control mt-3" type="file"
						accept="image/*" name="imageFile" />
				</div>
				<button class="btn btn-primary">Đồng ý</button>
			</form:form>
		</div>
	</div>
</div>


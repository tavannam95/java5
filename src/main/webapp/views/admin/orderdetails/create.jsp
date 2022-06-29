<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row mt-3">
	<div class="col-4">
		<h1 class="text-danger" style="font-size: 44px">Thêm sản phẩm vào
			đơn hàng</h1>
	</div>
	<div class="col-8">
		<div class="container mt-5" style="margin-top: 10px;">
			<form:form action="/admin/orderdetails/store/${ order.id }" method="post"
				modelAttribute="orderDetailModel" enctype="multipart/form-data">

				<!-- account -->
				<div class="form-control mb-3">
					<label for="floatingInput">Sản phẩm</label>
					<form:select class="form-select mt-2" path="productId">
						<form:options items="${ products }" value="${ products.id }"></form:options>
					</form:select>
				</div>

				<!-- quantity -->

				<div class="form-floating mb-3">
					<form:input path="quantity" type="number" class="form-control "
						id="floatingInput" placeholder="." />
						<form:errors path="quantity" style="color:red"></form:errors>
					<label for="floatingInput">Số lượng</label>
				</div>

				<button class="btn btn-primary">Đồng ý</button>
			</form:form>
		</div>
	</div>
</div>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row mt-3">
	<div class="col-5">
		<h1 class="text-danger" style="font-size: 42px">Cập nhật sản phẩm</h1>
	</div>
	<div class="col-7">
		<div class="container mt-5" style="margin-top: 10px;">
			<form:form action="/admin/orderdetails/update/${ orderDetail.id }/${ orderDetail.order.id }"
				method="post" modelAttribute="orderDetailModel" enctype="multipart/form-data">

				<!-- price -->
				
				<div class="form-floating mb-3">
					<form:input path="quantity" type="number" class="form-control "
						id="floatingPassword" placeholder="Password" />
						<form:errors path="quantity" style="color:red"></form:errors>
					<label for="floatingPassword">Số lượng</label>
				</div>

				<button class="btn btn-primary">Đồng ý</button>
			</form:form>
		</div>
	</div>
</div>


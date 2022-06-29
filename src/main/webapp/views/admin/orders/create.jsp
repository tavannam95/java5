<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row mt-3">
	<div class="col-5">
		<h1 class="text-danger" style="font-size: 62px">Tạo đơn hàng</h1>
	</div>
	<div class="col-7">
		<div class="container mt-5" style="margin-top: 10px;">
			<form:form action="/admin/orders/store" method="post"
				modelAttribute="orderModel" enctype="multipart/form-data">
				
				<!-- account -->
				<div class="form-control mb-3">
					<label for="floatingInput">Khách hàng</label>
					<form:select class="form-select mt-2" path="userId">
						<form:options items="${ accounts }" value="${ accounts.id }"></form:options>
					</form:select>
				</div>
	
				<button class="btn btn-primary">Đồng ý</button>
			</form:form>
		</div>
	</div>
</div>


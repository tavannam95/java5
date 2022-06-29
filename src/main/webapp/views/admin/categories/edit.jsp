<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row mt-3">
	<div class="col-5">
		<h1 class="text-danger" style="font-size: 42px">Cập nhật danh mục</h1>
	</div>
	<div class="col-7">
		<div class="container mt-5" style="margin-top: 10px;">
			<form:form action="/admin/categories/update/${ category.id }"
				method="post" modelAttribute="category" enctype="multipart/form-data">

				<!-- name -->

				<div class="form-floating mb-3">
					<form:input path="name" type="text" class="form-control "
						id="floatingInput" placeholder="." />
					<label for="floatingInput">Tên danh mục</label>
				</div>

				<button class="btn btn-primary">Đồng ý</button>
			</form:form>
		</div>
	</div>
</div>


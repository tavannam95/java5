<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="container">
	<div class="row mt-3">
		<div class="col-12">
			<h1 class="text-danger">Quản lý danh mục</h1>
		</div>
		<div class="">
			<a class="btn btn-primary" href="/admin/categories/create"> Thêm
				mới </a>
		</div>
	</div>
	<table class="table text-center table-bordered mt-3 border-dark">
		<thead>
			<tr class="bg-primary text-white">
				<th scope="col">#</th>
				<th scope="col">Tên danh mục</th>
				<th colspan="2" scope="col">Chức năng</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ data.content }" var="cate" varStatus="s">
				<tr>
					<th scope="row">${ s.count }</th>
					<td>${ cate.name }</td>
					<td><a href="/admin/categories/edit/${ cate.id }"
						class="btn btn-warning">Sửa</a></td>
					<td><a type="button" class="btn btn-primary"
						data-bs-toggle="modal"
						data-bs-target="#deleteCategory_${ cate.id }">Xóa</a></td>
				</tr>

				<!-- Modal -->
				<div class="modal fade" id="deleteCategory_${ cate.id }"
					tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Xóa danh mục</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">Bạn có muốn xóa không?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Hủy</button>
								<a href="/admin/categories/delete/${ cate.id }" type="button"
									class="btn btn-primary">Đồng ý</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</tbody>
	</table>

	<div class="row">
		<div class="d-flex justify-content-center">
			<ul class="pagination">
				<li class="page-item ${ page == 0? 'disabled':'' }"><a
					class="page-link" href="/admin/categories/index?page=${ page-1 }">Prev</a></li>
				<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
					<li class="page-item ${ page == i? 'disabled':'' }"><a class="page-link"
						href="/admin/categories/index?page=${ i }"> ${ i + 1 } </a></li>
				</c:forEach>
				<li class="page-item ${ page == (data.totalPages - 1)? 'disabled':'' }"><a class="page-link" href="/admin/categories/index?page=${ page+1 }">Next</a></li>
			</ul>
		</div>
	</div>
</div>

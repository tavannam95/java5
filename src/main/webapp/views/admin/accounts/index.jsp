<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="container">
	<div class="row mt-3">
		<div class="col-12">
			<h1 class="text-danger">Quản lý tài khoản</h1>
		</div>
		<div class="">
			<a class="btn btn-primary" href="/admin/accounts/create"> Thêm
				mới </a>
		</div>
	</div>
	<table class="table text-center table-bordered mt-3 border-dark">
		<thead>
			<tr class="bg-primary text-white">
				<th scope="col">#</th>
				<th scope="col">Họ và tên</th>
				<th scope="col">Tài khoản</th>
				<th scope="col">Email</th>
				<th scope="col">Kích hoạt</th>
				<th scope="col">Vai trò</th>
				<th scope="col">Hình ảnh</th>
				<th colspan="2">Chức năng</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ data.content }" var="acc" varStatus="s">
				<tr>
					<th scope="row">${ s.count }</th>
					<td>${ acc.fullname }</td>
					<td>${ acc.username }</td>
					<td>${ acc.email }</td>
					<td>${ acc.activated == 0 ? "In-active" : "Active" }</td>
					<td>${ acc.admin == 1 ? "Admin" : "Member" }</td>
					<td><img alt="" src="/images/${ acc.photo }"
						style="height: 100px"></td>
					<td><a href="/admin/accounts/edit/${ acc.id }"
						class="btn btn-warning">Sửa</a></td>
					<td><a type="button" class="btn btn-danger"
						data-bs-toggle="modal" data-bs-target="#deleteAccount_${ acc.id }">Xóa</a></td>
				</tr>

				<!-- Modal -->
				<div class="modal fade" id="deleteAccount_${ acc.id }" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Xóa tài
									khoản</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">Bạn có muốn xóa không?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Hủy</button>
									<a href="/admin/accounts/delete/${ acc.id }" type="button" class="btn btn-primary">Đồng ý</a>
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
					class="page-link" href="/admin/accounts/index?page=${ page-1 }">Prev</a></li>
				<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
					<li class="page-item ${ page == i? 'disabled':'' }"><a class="page-link"
						href="/admin/accounts/index?page=${ i }"> ${ i + 1 } </a></li>
				</c:forEach>
				<li class="page-item ${ page == (data.totalPages - 1)? 'disabled':'' }"><a class="page-link" href="/admin/accounts/index?page=${ page+1 }">Next</a></li>
			</ul>
		</div>
	</div>
	
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="container">
	<div class="row mt-3">
		<div class="col-12">
			<h1 class="text-danger">Chi tiết đơn hàng</h1>
		</div>
		<div class="">
			<a class="btn btn-primary"
				href="/admin/orderdetails/create/${ orderId }"> Thêm mới </a>
		</div>
	</div>
	<table class="table text-center table-bordered mt-3 border-dark">
		<thead>
			<tr class="bg-primary text-white">
				<th scope="col">#</th>
				<th scope="col">Tên sản phẩm</th>
				<th scope="col">Giá</th>
				<th scope="col">Số lượng</th>
				<th colspan="2">Chức năng</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ data }" var="acc" varStatus="s">
				<tr>
					<th scope="row">${ s.count }</th>
					<td>${ acc.product.name }</td>
					<td><fmt:formatNumber value="${ acc.price }" pattern="#,###"></fmt:formatNumber>
						₫</td>
					<td>${ acc.quantity }</td>
					<td><a href="/admin/orderdetails/edit/${ acc.id }"
						class="btn btn-warning">Sửa</a></td>
					<td><a type="button" class="btn btn-danger"
						data-bs-toggle="modal" data-bs-target="#deleteAccount_${ acc.id }">Xóa</a>

					</td>
				</tr>
					<!-- Modal -->
					<div class="modal fade" id="deleteAccount_${ acc.id }"
						tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Xóa sản
										phẩm trong hóa đơn</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">Bạn có muốn xóa không?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Hủy</button>
									<a href="/admin/orderdetails/delete/${ acc.id }/${ orderId }"
										type="button" class="btn btn-primary">Đồng ý</a>
								</div>
							</div>
						</div>
					</div>
			</c:forEach>

		</tbody>
	</table>

</div>

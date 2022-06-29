<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<div class="container">
	<div class="row mt-3">
		<div class="col-12">
			<h1 class="text-danger">Quản lý giỏ hàng</h1>
		</div>
	</div>
	<c:if test="${ empty carts }">
		<div class="alert alert-danger">Giỏ hàng trống!</div>
	</c:if>
	<c:if test="${ !empty carts }">
		<table class="table text-center table-bordered mt-3 border-dark">
			<thead>
				<tr class="bg-primary text-white">
					<th scope="col">#</th>
					<th scope="col">Tên</th>
					<th scope="col">Số lượng</th>
					<th scope="col">Giá</th>
					<th scope="col">Chức năng</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ carts }" var="item" varStatus="s">
					<form action="/carts/update/${ item.id }" method="POST">
						<tr>
							<th scope="row">${ s.count }</th>
							<td>${ item.name }</td>
							<td class="w-25"><input type="number" class="form-control"
								value="${ item.quantity }" name="quantity"
								onblur="this.form.submit()" /></td>
							<td><fmt:formatNumber value="${ item.price*item.quantity }"
									pattern="#,###"></fmt:formatNumber> ₫</td>
							<td><a class="btn btn-danger"
								href="/carts/remove/${ item.id }" data-bs-toggle="modal"
								data-bs-target="#deleteAccount_${ item.id }"> <i
									class="fas fa-trash-alt"></i> Xóa
							</a></td>
						</tr>
						<!-- Modal -->
						<div class="modal fade" id="deleteAccount_${ item.id }"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Xóa sản
											phẩm</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Bạn có muốn xóa không?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Hủy</button>
										<a href="/carts/remove/${ item.id }" type="button"
											class="btn btn-primary">Đồng ý</a>
									</div>
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th>Tổng giá:</th>
					<td colspan="4"><fmt:formatNumber value="${ totalPrice }"
									pattern="#,###"></fmt:formatNumber> ₫</td>
				</tr>
			</tfoot>
		</table>
		<div class="row">
			<c:if test="${ !empty user }">
				<a class="btn btn-primary rounded-pill col-12" data-bs-toggle="modal"
								data-bs-target="#order">
					Đặt hàng
				</a>
			</c:if>
			<c:if test="${ empty user }">
				<a class="btn btn-danger rounded-pill col-12" href="/auth/login">
					Đăng nhập để đặt hàng
				</a>
			</c:if>
				<!-- Modal -->
						<div class="modal fade" id="order"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Đặt hàng</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Bạn có muốn đặt hàng?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Hủy</button>
										<a href="/admin/orderdetails/store" type="button"
											class="btn btn-primary">Đồng ý</a>
									</div>
								</div>
							</div>
						</div>
		</div>
	</c:if>

</div>
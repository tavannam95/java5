<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="container">
	<div class="row mt-3">
		<div class="col-12">
			<h1 class="text-danger">Quản lý đơn hàng</h1>
		</div>
		<!-- <div class="">
			<a class="btn btn-primary" href="/admin/orders/create"> Thêm
				mới </a>
		</div> -->
	</div>
	<table class="table text-center table-bordered mt-3 border-dark">
		<thead>
			<tr class="bg-primary text-white">
				<th scope="col">#</th>
				<th scope="col">Họ và tên</th>
				<th scope="col">Địa chỉ</th>
				<th scope="col">Ngày tạo</th>
				<th scope="col">Trạng thái</th>
				<th colspan="2">Chức năng</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ data.content }" var="acc" varStatus="s">
				<c:if test="${ acc.status!=0 }">
					<tr>
						<th scope="row">${ s.count }</th>
						<td>${ acc.user.fullname }</td>
						<td>${ acc.address }</td>
						<td>${ acc.createDate }</td>
						<td>${ acc.status == 1 ? "Chưa xác nhận" : acc.status == 2 ?"Đã xác nhận":"Đang chờ" }</td>
						<c:if test="${ acc.status == 1 }">
							<td><a type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#acceptOrder_${ acc.id }">Xác
									nhận</a></td>
						</c:if>
						<c:if test="${ acc.status == 3 }">
							<td><a type="button" class="btn btn-secondary disabled"
								data-bs-toggle="modal" data-bs-target="#acceptOrder_${ acc.id }">Đã
									nhận hàng</a></td>
						</c:if>
						<c:if test="${ acc.status == 2 }">
							<td><a type="button" class="btn btn-danger"
								data-bs-toggle="modal" data-bs-target="#cancelOrder_${ acc.id }">Hủy
									đơn</a></td>
						</c:if>
						<td><a href="/admin/orderdetails/index/${ acc.id }"
							class="btn btn-success">Chi tiết</a></td>
					</tr>

					<!-- Modal Accept -->
					<div class="modal fade" id="acceptOrder_${ acc.id }" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Xác nhận
										đơn hàng</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">Bạn có muốn xác nhận đơn không?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Hủy</button>
									<a href="/admin/orders/accept/${ acc.id }" type="button"
										class="btn btn-primary">Đồng ý</a>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal Cancel -->
					<div class="modal fade" id="cancelOrder_${ acc.id }" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Hủy đơn
										hàng</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">Bạn có muốn hủy đơn không?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Hủy</button>
									<a href="/admin/orders/cancel/${ acc.id }" type="button"
										class="btn btn-primary">Đồng ý</a>
								</div>
							</div>
						</div>
					</div>
				</c:if>

			</c:forEach>

		</tbody>
	</table>

	<div class="row">
		<div class="d-flex justify-content-center">
			<ul class="pagination">
				<li class="page-item ${ page == 0? 'disabled':'' }"><a
					class="page-link" href="/admin/orders/index?page=${ page-1 }">Prev</a></li>
				<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
					<li class="page-item ${ page == i? 'disabled':'' }"><a
						class="page-link" href="/admin/orders/index?page=${ i }"> ${ i + 1 }
					</a></li>
				</c:forEach>
				<li
					class="page-item ${ page == (data.totalPages - 1)? 'disabled':'' }"><a
					class="page-link" href="/admin/orders/index?page=${ page+1 }">Next</a></li>
			</ul>
		</div>
	</div>

</div>

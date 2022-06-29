<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="container">
	<div class="row mt-3">
		<div class="col-12">
			<h1 class="text-danger">Quản lý sản phẩm</h1>
		</div>
		<c:if test="${ empty data.content }">
			<div class="alert alert-danger">Không có sản phẩm!</div>
		</c:if>
		<div class="">
			<a class="btn btn-primary" href="/admin/products/create"> Thêm
				mới </a>
		</div>
	</div>



	<c:if test="${ !empty data.content }">
		<table class="table text-center table-bordered mt-3 border-dark">
			<thead>
				<tr class="bg-primary text-white">
					<th scope="col">#</th>
					<th scope="col">Tên</th>
					<th scope="col">Giá</th>
					<th scope="col">Số lượng</th>
					<th scope="col">Tình trạng</th>
					<th scope="col">Ngày thêm</th>
					<th scope="col">Danh mục</th>
					<th scope="col">Hình ảnh</th>
					<th colspan="2">Chức năng</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ data.content }" var="acc" varStatus="s">
					<tr>
						<th scope="row">${ s.count }</th>
						<td>${ acc.name }</td>
						<td><fmt:formatNumber value="${ acc.price }" pattern="#,###"></fmt:formatNumber>
							₫</td>
						<td>${ acc.quantity }</td>
						<td>${ acc.deleted == 1? 'Dừng kinh doanh':'Đang kinh doanh' }</td>
						<td><fmt:formatDate pattern="dd-MM-yyyy"
								value="${ acc.createdDate }" /></td>
						<td>${ acc.category.name }</td>
						<td><img alt="" src="/images/${ acc.image }"
							style="height: 100px"></td>
						<td><a href="/admin/products/edit/${ acc.id }"
							class="btn btn-warning">Sửa</a></td>
						<td>
							<%-- <a type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#deleteAccount_${ acc.id }">Xóa</a></td>
					<td> --%> <c:if test="${ acc.deleted == 1 }">
								<a href="" class="btn btn-success">Kích hoạt</a>
							</c:if> <c:if test="${ acc.deleted == 0 }">
								<a href="" class="btn btn-danger">Dừng kinh doanh</a>
							</c:if>

						</td>
					</tr>

					<!-- Modal -->
					<%-- <div class="modal fade" id="deleteAccount_${ acc.id }" tabindex="-1"
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
									<a href="/admin/products/delete/${ acc.id }" type="button" class="btn btn-primary">Đồng ý</a>
							</div>
						</div>
					</div>
				</div> --%>
				</c:forEach>

			</tbody>
		</table>
		<div class="row">
			<div class="d-flex justify-content-center">
				<ul class="pagination">
					<li class="page-item ${ page == 0? 'disabled':'' }"><a
						class="page-link" href="/admin/products/index?page=${ page-1 }">Prev</a></li>
					<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
						<li class="page-item ${ page == i? 'disabled':'' }"><a
							class="page-link" href="/admin/products/index?page=${ i }">
								${ i + 1 } </a></li>
					</c:forEach>
					<li
						class="page-item ${ page == (data.totalPages - 1)? 'disabled':'' }"><a
						class="page-link" href="/admin/products/index?page=${ page+1 }">Next</a></li>
				</ul>
			</div>
		</div>
	</c:if>


</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="container">
	<%-- <h1 class="text-danger">Danh mục</h1>
	<div class="d-flex flex-row bd-highlight mb-3">
		<c:forEach var="category" items="${ categories }">
			<div class="me-2">
				<a href="" class="btn btn-outline-primary"> ${ category.name } </a>
			</div>
		</c:forEach>
	</div> --%>

	<h1 class="text-danger">Giảm giá</h1>
	<div class="row">
		<c:forEach var="p" items="${ listProductsDiscount }" varStatus="s">
			<c:if test="${ p.deleted == 0 }">
				<div class="col-3 mb-3">
					<div class="card p-3 h-100" style="width: 18rem;">
						<img src="/images/${ p.image }" class="card-img-top h-100"
							alt="...">
						<div class="card-body">
							<h5 class="card-title fw-bold">${ p.name }</h5>
							<c:if test="${ p.discount != 0 }">
								<div class="row">
									<span style="color: red; font-size: 20px"> <del
											style="font-size: 18px; color: gray">
											<fmt:formatNumber value="${ p.price }" pattern="#,###"></fmt:formatNumber>
											₫
										</del> <fmt:formatNumber value="${ p.discount }" pattern="#,###"></fmt:formatNumber>
										₫
									</span>
								</div>
							</c:if>
							<c:if test="${ p.discount == 0 }">
								<span style="font-size: 20px; color: red"> <fmt:formatNumber
										value="${ p.price }" pattern="#,###"></fmt:formatNumber> ₫
								</span>
							</c:if>
							<a href="/carts/detail/${ p.id }" class="btn btn-success w-100">
								<i class="fas fa-eye"></i> Chi tiết
							</a>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<h1 class="text-danger">Tất cả sả phẩm</h1>
	<div class="row">
		<c:forEach var="p" items="${ data.content }" varStatus="s">
			<c:if test="${ p.deleted == 0 }">
				<div class="col-3 mb-3">
					<div class="card p-3 h-100" style="width: 18rem;">
						<img src="/images/${ p.image }" class="card-img-top h-100"
							alt="...">
						<div class="card-body">
							<h5 class="card-title fw-bold">${ p.name }</h5>
							<c:if test="${ p.discount != 0 }">
								<div class="row">
									<span style="color: red; font-size: 20px"> <del
											style="font-size: 18px; color: gray">
											<fmt:formatNumber value="${ p.price }" pattern="#,###"></fmt:formatNumber>
											₫
										</del> <fmt:formatNumber value="${ p.discount }" pattern="#,###"></fmt:formatNumber>
										₫
									</span>
								</div>
							</c:if>
							<c:if test="${ p.discount == 0 }">
								<span style="font-size: 20px; color: red"> <fmt:formatNumber
										value="${ p.price }" pattern="#,###"></fmt:formatNumber> ₫
								</span>
							</c:if>
							<a href="/carts/detail/${ p.id }" class="btn btn-success w-100">
								<i class="fas fa-eye"></i> Chi tiết
							</a>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<%-- <div class="row">
		<div class="row">
		<div class="d-flex justify-content-center">
			<ul class="pagination">
				<li class="page-item ${ page == 0? 'disabled':'' }"><a
					class="page-link" href="/home?page=${ page-1 }">Prev</a></li>
				<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
					<li class="page-item ${ page == i? 'disabled':'' }"><a class="page-link"
						href="/home?page=${ i }"> ${ i + 1 } </a></li>
				</c:forEach>
				<li class="page-item ${ page == (data.totalPages - 1)? 'disabled':'' }"><a class="page-link" href="/home?page=${ page+1 }">Next</a></li>
			</ul>
		</div>
	</div>
	</div> --%>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="row border border-light p-3 rounded-3">
	<c:if test="${ !empty sessionScope.message }">
		<div class="alert alert-primary" role="alert">${ sessionScope.message }
		</div>
		<c:remove var="message" scope="session" />
	</c:if>
	<c:if test="${ !empty sessionScope.error }">
		<div class="alert alert-danger" role="alert">${ sessionScope.error }
		</div>
		<c:remove var="error" scope="session" />
	</c:if>
	<div class="col-6">
		<img alt="" src="/images/${ product.image }" class="h-100 img-fluid">
	</div>
	<div class="col-6">
		<form action="/carts/add/${ product.id }" method="post">
			<h1 class="card-text text-danger">${ product.name }</h1>
			<h2 class="card-text">
				Giá:
				<c:if test="${ product.discount != 0 }">
					<span class="text-danger"> <fmt:formatNumber value="${ product.discount }"
							pattern="#,###"></fmt:formatNumber> ₫
					</span>
					<del style="font-size:24px; color: gray">
						<fmt:formatNumber value="${ product.price }" pattern="#,###"></fmt:formatNumber>
						₫
					</del>
				</c:if>
				<c:if test="${ product.discount == 0 }">
					<fmt:formatNumber value="${ product.price }" pattern="#,###"></fmt:formatNumber>
								₫
						</c:if>
			</h2>
			<h2 class="card-text text-dark">Số lượng trong kho: ${ product.quantity }
				chiếc</h2>
			<h3 class="card-text text-dark">Mô tả sản phẩm: ${ product.description }
			</h3>
			<button class="btn btn-success rounded-pill w-100">
				<i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng
			</button>
		</form>
	</div>

</div>
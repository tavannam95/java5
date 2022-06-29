<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/fontawesome-free/css/all.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary bg-gradient">
		<div class="container-xxl">
			<a class="navbar-brand text-light" href="/home"
				style="font-family: 'Pacifico', cursive;">SOF3021</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse offset-1"
				id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-3 mb-lg-0 ">
					<li class="nav-item"><a class="nav-link active ms-3"
						aria-current="page" href="/home">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link text-light ms-3"
						href="">Hàng mới <!-- <span class="badge bg-danger">New</span> -->
					</a></li>
					<li class="nav-item"><a class="nav-link active ms-3" href="">Liên
							hệ</a></li>
					<li class="nav-item"><a class="nav-link active ms-3" href="">Giới
							thiệu</a></li>
					<c:if test="${ user.admin == 1 }">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle active" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> Quản trị </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="/admin/accounts/index">Người
										dùng</a></li>
								<li><a class="dropdown-item" href="/admin/categories/index">Danh
										mục</a></li>
								<li><a class="dropdown-item" href="/admin/products/index">Sản
										phẩm</a></li>
								<li><a class="dropdown-item" href="/admin/orders/index">Đơn
										hàng</a></li>
							</ul></li>
					</c:if>
					<c:if test="${ empty user }">
						<li class="nav-item"><a class="nav-link active ms-3"
							href="/carts/index"> <i class="fas fa-shopping-cart"></i>
						</a></li>
					</c:if>

				</ul>
				<c:if test="${ empty user }">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link text-light active"
							aria-current="page" href="/auth/login">Đăng nhập</a></li>
						<li class="nav-item"><a class="btn btn-outline-light"
							href="/auth/create">Đăng ký</a></li>
					</ul>
				</c:if>
				<c:if test="${ !empty user }">
					<ul class="nav">
							<li class="nav-item"><a class="nav-link text-light active"
							aria-current="page" href="/carts/index"> <i class="fas fa-shopping-cart"></i>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-light" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> <img class="rounded-circle"
								height="28px" src="/images/${ user.photo }"></img>
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">Cài đặt chung</a></li>
								<li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
								<li><a class="dropdown-item" href="#">Giỏ hàng của bạn</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a type="button" class="dropdown-item"
									data-bs-toggle="modal" data-bs-target="#logout">Đăng xuất</a></li>

							</ul></li>
					</ul>
				</c:if>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="logout" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Bạn có muốn
							đăng xuất không?</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body d-flex justify-content-center">
						<a class="col-1 btn btn-primary w-25" href="/auth/logout">Đồng
							ý</a>
						<button type="button" class="col-1 btn btn-secondary ms-3 w-25"
							data-bs-dismiss="modal">Hủy</button>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container">
			<a class="navbar-brand" href="#">SOF3021</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/home">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link active" href="/home">Login</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">Pricing</a>
					</li>
					<li class="nav-item"><a class="nav-link active">Disabled</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle active" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> Quản lý </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/admin/accounts/index">Tài
									khoản</a></li>
							<li><a class="dropdown-item" href="/admin/categories/index">Danh
									mục</a></li>
							<li><a class="dropdown-item" href="/admin/products/index">Sản
									phẩm</a></li>
							<li><a class="dropdown-item" href="/admin/orders/index">Đơn
									hàng</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav> -->
	<div class="container mt-3">
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
		<jsp:include page="${ view }"></jsp:include>

	</div>
	<div class="container-fluid p-0 mt-3">
		<footer class="bg-dark border-top border-5 border-primary pb-3">
			<div class="row m-0">
				<div class="col-lg-12 col-xl-4 mt-3">
					<a
						class="text-white text-decoration-none offset-1 offset-xxl-2 fs-1"
						href="/home"> <i class="fas fa-book-open"></i> <span class=""
						style="font-family: 'Pacifico', cursive;">SOF3021</span>
					</a>
				</div>
				<div class="col-10 col-xl-6 offset-1 mt-3">
					<div class="row text-white">
						<h2>
							Thông tin liên hệ
							</h2>
							<span>Trụ sở chính Tòa nhà FPT Polytechnic, Phố Trịnh Văn
								Bô, Nam Từ Liêm, Hà Nội</span>
					</div>
					<div class="row">
						<div class="col-6 mt-3">
							<h5 class="text-warning mt-3 text-decoration-underline">Cơ
								sở Hà Nội</h5>
							<span class="text-white"> Tòa nhà FPT Polytechnic, Phố
								Trịnh Văn Bô, Nam Từ Liêm, Hà Nội <br> <br> (024) 7300
								1955
							</span>
							<h5 class="text-warning mt-3 text-decoration-underline"
								class="mt-3">Cơ sở Đà Nẵng</h5>
							<span class="text-white"> Số 137 Nguyễn Thị Thập, Phường
								Hòa Minh, Quận Liên Chiểu, TP. Đà Nẵng <br> <br>
								(0236) 3710 999
							</span>

							<h5 class="text-warning mt-3 text-decoration-underline"
								class="mt-3">Cơ sở Cần Thơ</h5>
							<span class="text-white"> Số 288, Nguyễn Văn Linh, phường
								An Khánh, quận Ninh Kiều, Tp. Cần Thơ. <br> <br>
								(0292) 7300 468
							</span>

						</div>
						<div class="col-6 mt-3">
							<h5 class="text-warning mt-3 text-decoration-underline">Cơ
								sở Hồ Chí Minh</h5>
							<span class="text-white"> 391A Nam Kỳ Khởi Nghĩa, Q. 3,
								TP. Hồ Chí Minh <br> <br> 778/B1 Nguyễn Kiệm, P.4, Q.
								Phú Nhuận, TP. Hồ Chí Minh <br> <br> Toà nhà
								Innovation, lô 24, Công viên phần mềm Quang Trung, Quận 12, Hồ
								Chí Minh <br> <br> (028) 3526 8799 – (028) 62523434
							</span>

							<h5 class="text-warning mt-3 text-decoration-underline">Cơ
								sở Tây Nguyên</h5>
							<span class="text-white"> Số 300/6 đường Hà Huy Tập, p.
								Tân An, TP. Buôn Ma Thuột, Đắk Lắk <br> <br> (0262)
								355 5678
							</span>
						</div>
					</div>
				</div>
			</div>
	</footer>
	</div>
	<!-- Script -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

</body>
</html>
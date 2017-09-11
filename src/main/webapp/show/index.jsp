<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("utf-8"); %>

<%

String auth_hash = "";


Cookie[] cookies = request.getCookies();

String current_user = "";

if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("auth_hash")) {
			auth_hash = cookie.getValue();
		};
	}

	current_user = helper.Auth.isAuth(auth_hash);
}


if (current_user.equals("")) {
	response.sendRedirect("/auth");
}

if (!helper.Auth.isOperator(current_user)) {
	response.sendRedirect("/auth?status=no_access");
}


%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<header>

			<nav class="navbar navbar-light bg-light justify-content-between">
				<div class="container">
					<a href="/" class="navbar-brand"><%= current_user %></a>
					<ul class="navbar-nav">
						<li class="nav-item active">
							<% if (current_user.isEmpty()) {%>
								<a class="nav-link" href="/auth/">Вход</a>
							<% } else { %>
								<a class="nav-link" href="/auth/process?unlogin=true">Выход</a>
							<% } %>
						</li>
					</ul>
				</div>

			</nav>
		</header>
		<br>

    <div class="warp">
      <div class="container">
				<h3>Запросы от пользователей</h3>
				<div class="js-result">

				</div>
      </div>
    </div>

		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script type="text/javascript">
			$(function() {
				$(".js-result").load("/api/statement")
			})


    </script>
	</body>
</html>

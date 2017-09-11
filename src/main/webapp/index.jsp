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






%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<style media="screen">

			body {
				position: relative;
			}

			body:not(.submited) .alert-is-submit {
				display: none
			}

			.alert-is-submit {
				position: absolute;
				top: 20%;
				text-align: center;
				width: 100%;
				font-size: 3rem;
				font-weight: bold;
			}

			.warp {
				filter: blur(0);
				opacity: 1;
				transition: all .5s;
			}

			.submited .warp {
				filter: blur(3px);
				opacity: .5;
				pointer-events: none;
			}
		</style>
	</head>
	<body>
		<header>

			<nav class="navbar navbar-light bg-light justify-content-between">
				<div class="container">
					<a href="/" class="navbar-brand"><%= current_user %></a>
					<ul class="navbar-nav">
						<li class="nav-item">
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
		<div class="alert-is-submit">
			отправлено!
		</div>
    <div class="warp">
      <div class="container">
				<h3>Форма обратной связи</h3>
				<form method="post" class="js-form-receiver">
					<div class="form-group">
				    <label for="form_last_name">Фамилия</label>
				    <input required type="text" class="form-control" name="form_last-name" id="form_last_name">
				  </div>
					<div class="form-group">
				    <label for="form_first-name">Имя</label>
				    <input required type="text" class="form-control" name=form_first-name id="form_first-name">
				  </div>
					<div class="form-group">
				    <label for="form_middle-name">Отчество</label>
				    <input required type="text" class="form-control" name=form_middle-name id="form_middle-name">
				  </div>
					<div class="form-group">
				    <label for="form_receiver-id">Получатель</label>
						<div class="js-form_receiver-id">
							<select class="form-control">
							</select>
						</div>

				  </div>
					<div class="form-group">
				    <label for="form-title">Тема</label>
				    <input required type="text" class="form-control" name="form-title" id="form-title">
				  </div>
					<div class="form-group">
				    <label for="form_text-message">Текст сообщения</label>
				    <textarea required class="form-control" name="form_text-message" id="form_text-message"></textarea>
				  </div>
					<button class="btn btn-success" type="submit">Отправить</button>
				</form>
      </div>
    </div>

		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script type="text/javascript">
			$(function() {
				$(".js-form_receiver-id").load("/api/getReceivers")

				$(".js-form-receiver").on("submit", function() {
					console.log($(this).serialize());
					$.ajax({
						method: "POST",
						url: "/api/statement",
						data: $(this).serialize(),
						success: function(data) {
							$("body").addClass("submited")
						}
					})

					return false;
				})
			})


    </script>
	</body>
</html>

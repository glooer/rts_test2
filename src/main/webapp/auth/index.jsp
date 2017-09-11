<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap,models.Human" %>
<% request.setCharacterEncoding("utf-8"); %>


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
          <a href="/" class="navbar-brand"></a>
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="/auth/">Вход</a>
            </li>
          </ul>
        </div>

      </nav>
    </header>
    <br>
			<% if (request.getParameter("state") != null && request.getParameter("state").equals("nope")) { %>
			<div class="form-group">
				<div class="container">
					<div class="alert alert-danger" role="alert">
						<strong>Оу, нет!</strong> Кажется вы ввели неверный логин или пароль, попробуйте ещё раз
					</div>
				</div>
			</div>
			<% } %>

			<% if (request.getParameter("status") != null && request.getParameter("status").equals("no_access")) { %>
			<div class="form-group">
				<div class="container">
					<div class="alert alert-danger" role="alert">
						<strong>Оу, нет!</strong> Кажется у вас нет досутпа к запрашиваемой странице, попробуйте авторизоваться
					</div>
				</div>
			</div>
			<% } %>

    <div class="warp">
      <div class="container">
        <form action="/auth/process" method="post">
          <div class="form-group">
            <h4>Форма входа</h4>
          </div>
          <div class="form-group">
            <input class="form-control" type="text" name="email" value="" placeholder="email">
          </div>
          <div class="form-group">
            <input class="form-control" type="password" name="password" value="" placeholder="пароль">
          </div>
					<div class="form-check">
					  <label class="form-check-label">
					    <input class="form-check-input" name="is_remember" type="checkbox" value="true">
					    Запомнить меня
					  </label>
					</div>
          <button class="btn btn-light" type="submit">Вход</button>
        </form>
      </div>
    </div>

		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	</body>
</html>

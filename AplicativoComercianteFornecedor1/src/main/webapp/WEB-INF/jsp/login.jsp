<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style-gabriel.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Login</title>
</head>

<body class="body-login">
	<form action="/login" method="post">
		<div class="box">
			<div class="container">
				<div class="top-header">
					<header>Login</header>
				</div>

				<div class="input-field">
					<input type="text" class="input" placeholder="Usuario" name="cnpj"
						required></input> <i class="bi bi-person"></i>
				</div>

				<div class="input-field">
					<input type="password" class="input" placeholder="Senha"
						name="senha" required> <i class="bi bi-lock"></i>
				</div>
				<div class="entrega">
					<div class="titulo-entrega">
						<p>Você é comerciante ou fornecedor ?</p>
					</div>
					<div class="input-entrega">
						<input type="radio" id="fornecedor-radio" name="opcoes" value="Fornecedor" class="input-fornecedor-comerciante-radio" required>
						<label for="fornecedor-radio">Fornecedor</label> 
					</div>
					<div class="input-entrega">
						<input type="radio" id="comerciante-radio" name="opcoes" value="Comerciante" class="input-fornecedor-comerciante-radio" required>
						<label for="comerciante-radio">Comerciante</label> 
					</div>
				</div>
				<div class="input-field">
					<input type="submit" class="submit" value="Entrar">
				</div>
			</div>
		</div>
	</form>

	

	<%
	String error = (String) request.getAttribute("error");

	if (error != null) {
		if (error.equals("1")) {
			out.println("<p>Cnpj inválido!</p>");
		} else if (error.equals("2")) {
			out.println("<p>Senha inválida</p>");
		} else if (error.equals("3")) {
			out.println("<p>A sessão expirou, faça login novamente</p>");
		} else if (error.equals("4")) {
			out.println("<p>Faça o login seu Expertinho.</p>");
		}
	}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.ArrayList, com.senac.grupo.AplicativoComercianteFornecedor.model.Fornecedor,
    com.senac.grupo.AplicativoComercianteFornecedor.model.DadosFornecedor,
    com.senac.grupo.AplicativoComercianteFornecedor.model.Produto,
    java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="JS/script.js"></script>
<link rel="stylesheet" href="style-gabriel.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<title>Novo Produto</title>
</head>
<body>

	<%
List<Produto> listaTodosProdutos = (List<Produto>) request.getAttribute("listaTodosProdutos");
Fornecedor fornecedor = (Fornecedor) session.getAttribute("Fornecedor");
DadosFornecedor dadosFornecedor = (DadosFornecedor) session.getAttribute("DadosFornecedor");
if(fornecedor == null){
	response.sendRedirect("/erroLogin?error=3");
}
if(dadosFornecedor == null){
	response.sendRedirect("/erroLogin?error=4");
}

//List<Produto> listaProdutos = (List<Produto>) new ArrayList<>();

%>
	<div class="container-form">
		<div class="form-imagee">
			<div id="conteudo">
				<h1>Obrigado por ajudar a nossa comunidade a crescer cada dia
					mais!</h1>
				<br> <br> <br>
				<h5>Produto</h5>
				<form action="/criarNovoTipoProduto" id="criarNovoTipoProduto"
					method="post">
					<div class="input-group">
						<div class="input-box">
							<input type="text" id="produtos" name="novoTipoProduto">
						</div>
					</div>
					<div class="entrega">
						<div class="continue-button">
							<button type="submit">Criar</button>
							<button onclick="fechar('conteudo')">Fechar</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="form">
			<form action="/registrarProduto" method="post">
				<div class="form-header">
					<div class="title">
						<h1>Cadastre seus Produtos</h1>
					</div>
					<div class="login-button">
						<button onclick="window.location.href='/listarProdutosFornecedor'">Meus
							Produtos</button>
					</div>
				</div>
				<div class="input-group">
					<div class="input-box">
						<label for="preco">Preço</label> <input id="preco" type="text"
							name="precoProduto" placeholder="R$">
					</div>
					<div class="input-box">
						<label for="nome">Produto</label> <select id="produtos"
							name="produtoSelecionado">
							<option>--Selecione um produto--</option>
							<% for(Produto produto : listaTodosProdutos) {%>
							<option value="<%=produto.getIdProduto()%>"><%=produto.getNomeProduto() %></option>
							<% }%>
						</select>
					</div>
				</div>
				<div class="entrega">
					<div class="continue-button">
						<button type="submit">Cadastrar</button>
					</div>
				</div>
			</form>
			<div class="entrega">
				<div class="product-button">
					Não encontrou seu produto? clique no botão abaixo e Cadastre.
					<button onclick="abrir('conteudo')">Novo produto</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>

</html>
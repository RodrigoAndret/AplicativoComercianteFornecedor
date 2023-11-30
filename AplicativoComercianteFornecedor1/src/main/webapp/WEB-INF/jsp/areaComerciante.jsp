<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page
	import="com.senac.grupo.AplicativoComercianteFornecedor.model.Comerciante, 
				com.senac.grupo.AplicativoComercianteFornecedor.model.DadosComerciante,
				com.senac.grupo.AplicativoComercianteFornecedor.model.DadosFornecedor,
				com.senac.grupo.AplicativoComercianteFornecedor.model.Produto,
				com.senac.grupo.AplicativoComercianteFornecedor.model.ProdutoFornecedor,
				java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Area Comerciante</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="styleareacomerciante.css">
</head>

<body class="fundo">
	<% 
	Comerciante comerciante = (Comerciante) session.getAttribute("Comerciante");
	DadosComerciante dadosComerciante = (DadosComerciante) session.getAttribute("DadosComerciante");
	if(comerciante == null){
		response.sendRedirect("/erroLogin?error=3");
	}
	if(dadosComerciante == null){
		response.sendRedirect("/erroLogin?error=4");
	}
	
	
	List<DadosFornecedor> listaDadosFornecedor = (List<DadosFornecedor>) request.getAttribute("ListaDadosFornecedor");
	List<Produto> listaProdutos = (List<Produto>) request.getAttribute("listaTodosProdutos");
	List<ProdutoFornecedor> listaProdutoFornecedor = (List<ProdutoFornecedor>) request.getAttribute("ListaProdutoFornecedor");
%>

	<div class="box-comerciante">
		<div class="container-md container-comerciante">

			<div class="titulo-comerciante">
				<h1>Buscar produtos</h1>
			</div>

			<nav class="navbar">
				<form action="/pesquisarProduto" method="post">
					<select id="pesquisar-produtos" name="pesquisaProduto" class="form-select">
						<option selected>Selecione um produto</option>
						<%if(listaProdutos != null){ 
						for(Produto produto : listaProdutos){
						%>
						<option value="<%=produto.getIdProduto()%>"><%= produto.getNomeProduto() %></option>
						<%}} %>
					</select>
					<div class="form-inline" id="form-pesquisa">
						<input type="submit" class="botao-enviar btn btn-primary" value="Pesquisar">
					</div>
				</form>
			</nav>

			<section class="content">

				<table class="table">
					<thead>
						<tr>
							<th scope="col">Produto</th>
							<th scope="col">Preço</th>
							<th scope="col">Fornecedor</th>
							<th scope="col">Entrega</th>
						</tr>
					</thead>

					<tbody id="tabela-produtos">
						<%
			if(listaProdutoFornecedor != null){
				for(int i = 0; i < listaProdutoFornecedor.size(); i++){%>
						<tr>
							<th scope="row"><%= listaProdutoFornecedor.get(i).getProduto().getNomeProduto() %></th>
							<td><%= listaProdutoFornecedor.get(i).getPreco() %></td>
							<td><%= listaDadosFornecedor.get(i).getRazaoSocial() %></td>
							<td><%= listaDadosFornecedor.get(i).getEntrega() == true ? "Sim" : "Não" %></td>
						</tr>
						<%}}%>

					</tbody>
				</table>

			</section>

		</div>
	</div>

	<a href="/deslogar" class="btn btn-primary">Sair</a>

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
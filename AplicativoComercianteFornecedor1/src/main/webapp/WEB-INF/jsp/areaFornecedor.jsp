<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.senac.grupo.AplicativoComercianteFornecedor.model.Fornecedor, 
    				com.senac.grupo.AplicativoComercianteFornecedor.model.DadosFornecedor,
    				com.senac.grupo.AplicativoComercianteFornecedor.model.ProdutoFornecedor,
    				com.senac.grupo.AplicativoComercianteFornecedor.service.ProdutoFornecedorService,
    				java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
]
<!--copiar o link abaixo-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="style-gabriel.css">

<title>Meus Produtos</title>
</head>
<body>
	<%
	Fornecedor fornecedor = (Fornecedor) session.getAttribute("Fornecedor");
	DadosFornecedor dadosFornecedor = (DadosFornecedor) session.getAttribute("DadosFornecedor");
	if (fornecedor == null) {
		response.sendRedirect("/erroLogin?error=3");
	}
	if (dadosFornecedor == null) {
		response.sendRedirect("/erroLogin?error=4");
	}
	List<ProdutoFornecedor> listaDeProdutosDoFornecedor = (List<ProdutoFornecedor>) request.getAttribute("ListaDeProdutosFornecedor");
	Integer produtoSelecionadoId = (Integer) session.getAttribute("ProdutoSelecionadoId");
	%>
	<div class="container-xxl">
		<button class="botao-produto"
			onclick="window.location.href='/listarTodosProdutos'">Novo
			Produto</button>
		<h2>Meus Produtos</h2>
		<div class="div-table">
			<table border="1" class="table table-hover ">
				<thead class="head-table">
					<tr>
						<th scope="col">Produto</th>
						<th scope="col">Preço</th>
						<th scope="col">Editar</th>
						<th scope="col">Excluir</th>
					</tr>
				</thead>
				<%
				if (listaDeProdutosDoFornecedor != null) {
					if (!listaDeProdutosDoFornecedor.isEmpty()) {
						for (ProdutoFornecedor produtoForn : listaDeProdutosDoFornecedor) {
				%>
				<tbody class="body-table">
					<tr>
						<th scope="row"><%=produtoForn.getProduto().getNomeProduto()%></th>
						<td><%=produtoForn.getPreco()%></td>
						<th>
							<button type="button" onclick="window.location.href='/editarProduto?produtoId=<%=produtoForn.getId()%>'" style="background-color: #fff; border: none;">
								<span style="color: black;"> 
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
										<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
		                  				<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
		                  			</svg>
								</span>
							</button>
						</th>
						<th>
							<button class="delete" onclick="window.location.href='/excluirProduto?produtoId=<%=produtoForn.getId()%>'">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
				                  <path
										d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z" />
				                  <path
										d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z" />
				                </svg>
							</button>
						</th>
					</tr>
				</tbody>
				<%
				}
				}
				}
				%>
			</table>
			<%
				if (produtoSelecionadoId != null) {
			%>
			<form action="/confirmarEdicaoProduto">
				<label for="novo-preco">Novo preço</label> 
				<input type="text" id="novo-preco" class="form-control" name="novoPreco">
				<button type="submit" class="btn btn-primary">Editar preço</button>
			</form>
			<%
			}
			%>	
	</div>
	<a href="/deslogar" class="btn btn-primary">Sair</a>
		</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
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
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style-gabriel.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <title>Cadastro Fornecedor</title>
</head>
<body>
	<div class="container-form">
		<div class="form-image">
            <img src="imagens/undraw_team_up_re_84ok.svg">
        </div>
        <div class="form">
			<form action="/cadastrarFornecedor" method="post">
				<div class="form-header">
                    <div class="title">
                        <h1>Cadastre-se</h1>
                    </div>
                    <div class="login-button">
                        <button onclick="window.location.href='/'">Voltar</button>
                    </div>
                </div>
                <div class="input-group">
                	<div class="input-box">
						<label for="razao-social">Razão Social</label>
						<input type="text" id="razao-social" name="razaoSocial" placeholder="Digite a razão social" required>
             		</div>
             		<div class="input-box">
						<label for="nome-fantasia">Nome Fantasia</label>
						<input type="text" id="nome-fantasia" name="nomeFantasia" placeholder="Digite o nome da empresa" required>
             		</div>
             		<div class="input-box">
						<label for="cnpj">CNPJ</label>
						<input type="text" id="cnpj" name="cnpj" placeholder="Digite o CNPJ da empresa" required>
             		</div>
             		<div class="input-box">
						<label for="telefone">Telefone</label>
						<input type="text" id="telefone" name="telefone" placeholder="(xx)XXXX-XXXX" required>
             		</div>
             		<div class="input-box">
						<label for="celular">Celular</label>
						<input type="text" id="celular" name="celular" placeholder="(xx)9XXXX-XXXX" required>
             		</div>
             		<div class="input-box">
						<label for="email">Email</label>
						<input type="text" id="email" name="email" placeholder="Digite o e-mail da empresa" required>
             		</div>
             		<div class="input-box">
						<label for="uf">Unidade Federal</label>
						<input type="text" id="uf" name="uf" placeholder="Digite a unidade federal da empresa" required>
					</div>
             		<div class="input-box">
						<label for="cidade">Cidade</label>
						<input type="text" id="cidade" name="cidade" placeholder="Digite a cidade da empresa" required>
             		</div>
             		<div class="input-box">
						<label for="bairro">Bairro</label>
						<input type="text" id="bairro" name="bairro" placeholder="Digite o bairro da empresa" required>
             		</div>
             		<div class="input-box">
						<label for="logradouro">Logradouro</label>
						<input type="text" id="logradouro" name="logradouro" placeholder="Ex: Rua X, Avenida X, Ap X" required>
             		</div>
             		<div class="input-box">
						<label for="cep">CEP</label>
						<input type="text" id="cep" name="cep" placeholder="xxxxx-xxx" required>
             		</div>
             		<div class="input-box">
						<label for="senha">Senha</label>
						<input type="password" id="senha" name="senha" placeholder="Digite sua senha" required>
             		</div>
             		<div class="input-box">
             			<label for="confirma-senha">Confirmar Senha</label>
						<input type="text" id="confirma-senha" name="confirmaSenha">
             		</div>
				</div>
				<div class="entrega">					
					<div class="titulo-entrega">					
						<h6>Você faz a entrega dos produtos?</h6>
					</div>
					<div class="opcoes-entrega">	
						<div class="input-entrega">
							<input type="radio" id="sim" name="entrega" value="true" required> 
							<label for="sim">Sim</label>
						</div>
					</div>
					<div class="input-entrega">
						<input type="radio" id="nao" name="entrega" value="false" required> 
						<label for="nao">Não</label>
					</div>
				</div>
				<div class="continue-button">
					<button type="submit">Cadastrar</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
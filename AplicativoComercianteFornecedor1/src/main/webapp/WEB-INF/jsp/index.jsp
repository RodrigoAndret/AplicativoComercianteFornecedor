<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tela inicial</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="inicial.css">
</head>

<body>

    <nav class="navbar bg-body-tertiary" data-bs-theme="dark" style="height: 11vh;">
        <div class="container-fluid">
        <a class="navbar-brand" class="logo"><i class="bi bi-fire"></i><span>Food</span></a>
          
         <div class="dropdown menu-cadastro" style="display: inline-flex;">
            <button class="btn btn-secondary dropdown-toggle botao-cadastrar" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              Cadastrar
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="cadastroFornecedor">Fornecedor</a></li>
              <li><a class="dropdown-item" a href="cadastroComerciante">Comerciante</a></li>
            </ul>
            <div class="botaologin"><button onclick="window.location.href='login'">Login</button></div>
          </div>

        </div>
      </nav>


      
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="3000">
                <img src="./imagens/desktop1.jpg" class="d-block w-100" data-bs-interval="3000" >
              </div>
              <div class="carousel-item">
                <img src="./imagens/desktop2.jpg" class="d-block w-100" data-bs-interval="3000">
              </div>
              <div class="carousel-item">
                <img src="./imagens/desktop3.jpg" class="d-block w-100" data-bs-interval="3000">
              </div>
              <div class="carousel-item">
                <img src="./imagens/desktop4.jpg" class="d-block w-100" data-bs-interval="3000">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Próxima</span>
            </button>
          </div>
     
      


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>


<!-- 
<a href="cadastroFornecedor">Cadastrar Fornecedor</a>
<a href="cadastroComerciante">Cadastrar Comerciante</a>
<a href="login">login</a>
 -->
</html>
<%-- 
    Document   : index.jsp
    Created on : 30 de out. de 2023, 12:06:16
    Author     : jose.serafim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text css" href="../icons/css/boxicons.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
    <title>Aluga ChromeBook</title>
</head>

<body>
    <div class="borda-esquerda">
        <div class="container-esquerda">
            <h1 class="titulo1">Bem Vindo de Volta!</h1>
            <p class="para1">Você está usando um sistema desenvolvido pelos alunos de SI da FICR da turma 2022.2</p>
            <p class="para2">Todos os direitos são reservados aos integrantes da equipe.</p>
        </div>
    </div>

    <form class="borda-direita" action="pages/validar.jsp">
        <h1 class="titulo2">Login</h1>
        <div class="form-group">
        <input type="text" class="form-control cpf1" id="CPF" aria-describedby="CPF" placeholder="CPF (apenas números)" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" required>
        </div>
        <div class="form-group">
            <input type="password" class="form-control senha1" id="exampleInputPassword1" placeholder="Senha" required>
        </div>
        <a href="pages/validar.jsp"><button type="submit" class="btn btn-primary">Entrar</button></a>
    </form>
    <div class="form-group">
        <h1>Caso não seja cadastrado ainda clique aqui no botão abaixo.</h1>
        <a href="pages/CADASTROCOORDENADOR.jsp"><button type="submit" class="btn btn-primary">Cadastrar</button></a>
    </div>
</body>

</html>

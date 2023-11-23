<%-- 
    Document   : PERFILALTERAR
    Created on : 26 de out. de 2023, 09:37:47
    Author     : evert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../icons/css/boxicons.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap"
        rel="stylesheet">
    <title>ALTERAR PERFIL</title>
</head>
    <div class="bordaDoTopo">
        <div class="container-fluid">     
            <a href="home.jsp"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="homecadastro.jsp"><button class="botoesDoTopo">CADASTRO</button></a>
            <a href="aluguel.jsp"><button class="botoesDoTopo">ALUGUEL</button></a>
            <a href="devolucao.jsp"><button class="botoesDoTopo">DEVOLUÇÃO</button></a>
            <a href="relatorio.jsp"><button class="botoesDoTopo">RELATÓRIO</button></a>
            <a href="sair.jsp"><button class="power"><img src="../images/power.png" class="power" style="height: 30px;"></button></a>
            <a href="perfil.jsp"><button class="user"><img src="../images/user.png" class="user" style="height: 30px;"></button></a>
        </div>
    </div>
    <br><br> <br><br>
    </div>
    <body>
    <div class="container containerBaixo">
        <div class="container containerMeio">
            <div class="titulo">
                <a>ALTERAR PERFIL</a>
            </div>

            <div class="img">
                <img src="../images/perfil.png" alt="perfil" class="imgperfil">
            </div>

            <form action="#">
                <div class="mb-3 mt-3">
                    <label for="nome" class="form-label"><a>Nome</a></label>
                    <input type="text" class="form-control" id="Nome" placeholder="" name="nome">
                </div>

                <div class="mb-3 mt-3">
                    <label for="matricula" class="form-label"><a>Matrícula</a></label>
                    <input type="text" class="form-control" id="Matricula" placeholder="" name="matricula">
                </div>

                <div class="mb-3 mt-3">
                    <label for="cargo" class="form-label"><a>Cargo</a></label>
                    <input type="text" class="form-control" id="Cargo" placeholder="" name="cargo">
                </div>

                <div class="row justify-content-md-center">
                    <a href="perfil.html" class="BotaoSubmit">Salvar</a>
                    <button type="reset" class="BotaoSubmit cancelar">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
    </body>
</html>

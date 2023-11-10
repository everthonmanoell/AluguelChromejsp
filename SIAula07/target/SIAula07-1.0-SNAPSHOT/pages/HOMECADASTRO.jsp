<%-- 
    Document   : HOMECADASTRO
    Created on : 1 de nov. de 2023, 23:29:08
    Author     : ohana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../icons/css/boxicons.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap" rel="stylesheet">
    <title>QUAL O TIPO DE CADASTRO</title>
</head>
<body class="topo">
    <div class="bordaDoTopo">
        <div class="container-fluid">     
            <a href="HOME.jsp"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="HOMECADASTRO.jsp"><button class="botoesDoTopo">CADASTRO</button></a>
            <a href="ALUGUEL.jsp"><button class="botoesDoTopo">ALUGUEL</button></a>
            <a href="DEVOLUCAO.jsp"><button class="botoesDoTopo">DEVOLUÇÃO</button></a>
            <a href="RELATORIO.jsp"><button class="botoesDoTopo">RELATÓRIO</button></a>
            <a href="SAIR.jsp"><button class="power"><img src="../images/power.png" class="power" style="height: 30px;"></button></a>
            <a href="PERFIL.jsp"><button class="user"><img src="../images/user.png" class="user" style="height: 30px;"></button></a>
        </div>
    </div>
    <br><br><br><br>
        <div class="container containerMeio">
            <div class="titulo">
                <a>QUAL O TIPO DE CADASTRO?</a>
            </div>
            <div class="row justify-content-center">
                <div class="fonteMeio">
                    <a href="CADASTROCOORDENADOR.jsp"><button class="botoesDoMeio">COORDENADOR</button></a><br>
                    <a href="CADASTROCHROMEBOOK.jsp"><button class="botoesDoMeio">CHROMEBOOK</button></a><br>
                    <a href="CADASTROALUNO.jsp"><button class="botoesDoMeio">ALUNO</button></a><br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

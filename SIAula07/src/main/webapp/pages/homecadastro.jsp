<%-- 
    Document   : HOMECADASTRO
    Created on : 1 de nov. de 2023, 23:29:08
    Author     : felipe
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="usuario.*"%>
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
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap" rel="stylesheet">
    <title>QUAL O TIPO DE CADASTRO</title>
</head>
    <div class="bordaDoTopo">
        <div class="container-fluid">     
            <a href="home.jsp"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="homecadastro.jsp"><button class="botoesDoTopo" id="cadastro">CADASTRO</button></a>
            <a href="aluguel.jsp"><button class="botoesDoTopo" id="aluguel">ALUGUEL</button></a>
            <a href="devolucao.jsp"><button class="botoesDoTopo" id="devolucao">DEVOLUÇÃO</button></a>
            <a href="relatorio.jsp"><button class="botoesDoTopo" id="relatorio">RELATÓRIO</button></a>
            <a href="sair.jsp"><button class="power"><img src="../images/power.png" class="power" style="height: 30px;"></button></a>
       </div>
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var currentPage = window.location.pathname;

        var buttonCadastro = document.getElementById("cadastro");
        var buttonLink = buttonCadastro.closest("a").getAttribute("href");

        if (currentPage.endsWith(buttonLink)) {
            buttonCadastro.classList.add("pressionado");
        }
    });
</script>
    <br><br><br><br>
        <div class="container containerMeio">
            <div class="titulo">
                <a>QUAL O TIPO DE CADASTRO?</a>
            </div>
            <div class="row justify-content-center">
                <div class="fonteMeio">
                    <a href="cadastrocoordenador.jsp"><button class="botoesDoMeio">COORDENADOR</button></a><br>
                    <a href="cadastrochromebook.jsp"><button class="botoesDoMeio">CHROMEBOOK</button></a><br>
                    <a href="cadastroaluno.jsp"><button class="botoesDoMeio">ALUNO</button></a><br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

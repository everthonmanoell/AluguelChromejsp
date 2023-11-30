<%-- 
    Document   : devolucao
    Created on : 1 de nov. de 2023, 23:29:08
    Author     : Ev
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="usuario.*"%>
<%@page import="usuario.ControleAluguel"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%ControleAluguel controle = ControleAluguel.getInstance();%>
   
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../icons/css/boxicons.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="stylesheet" href="js/send.js">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap" rel="stylesheet">
    <title>DEVOLUÇÃO</title>
</head>
    <div class="bordaDoTopo">
        <div class="container-fluid">     
            <a href="home.jsp"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="homecadastro.jsp"><button class="botoesDoTopo" id="cadastro">CADASTRO</button></a>
            <a href="aluguel.jsp"><button class="botoesDoTopo" id="aluguel">ALUGUEL</button></a>
            <a href="devolucao.jsp"><button class="botoesDoTopo" id="devolucao">DEVOLUÇÃO</button></a>
            <a href="relatorio.jsp"><button class="botoesDoTopo" id="relatorio">RELATÓRIO</button></a>
            <a href="sair.jsp"><button class="power"><img src="../images/power.png" class="power" style="height: 30px;"></button></a>
            <a href="perfil.jsp"><button class="user"><img src="../images/user.png" class="user" style="height: 30px;"></button></a>
       </div>
    </div>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var currentPage = window.location.pathname;

        var buttonCadastro = document.getElementById("devolucao");
        var buttonLink = buttonCadastro.closest("a").getAttribute("href");

        if (currentPage.endsWith(buttonLink)) {
            buttonCadastro.classList.add("pressionado");
        }
    });
</script>
    <br>
        <div class="container containerDevolucao">
            <div class="titulo">
                <a>DEVOLUÇÃO</a>
            </div>
            <table class="table">
                <thead>
                <th scope="col"><input type="search" class="form-control rounded" placeholder="" aria-label="Search" aria-describedby="search-addon" style="width:500px; margin-left:200px " id="send"/></th>
                <th scope="col"><button type="button" class="btn btn-outline-primary btn-sm" id="send">pesquisar</button></th>
                <th scope="col">TOTAL EM USO</th>
                <th scope="col"><input class="form-control" type="text" id="totalemuso" name="totalemuso" style="width:100px" readonly></th>
            </table>
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">M. Coordenador</th>
                        <th scope="col">M. Aluno</th>
                        <th scope="col">Tombamento</th>
                        <th scope="col">Situação Chromebook</th>
                        <th scope="col">Data aluguel</th>
                        <th scope="col">Hora aluguel</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%out.println(controle.listarDadosAlugueis());%>
                        

                    </tr>

                </tbody>
            </table>

        </div>
    </div>
</div>
</div>
</body>

</html>







</html>
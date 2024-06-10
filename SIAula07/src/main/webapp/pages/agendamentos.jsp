<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="control.*"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%
        ControleBancoAgendar control = ControleBancoAgendar.getInstance();
        String pesquisa = request.getParameter("pesquisa");
    %>
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
    <link rel="shortcut icon" href="../images/title 1.png" type="image/x-icon" />
    <title>AGENDAMENTOS</title>
</head>
<body>
    <div class="bordaDoTopo">
        <div class="container-fluid">     
            <a href="home.jsp"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="homecadastro.jsp"><button class="botoesDoTopo" id="cadastro">CADASTRO</button></a>
            <a href="aluguel.jsp"><button class="botoesDoTopo" id="aluguel">ALUGUEL</button></a>
            <a href="devolucao.jsp"><button class="botoesDoTopo" id="devolucao">DEVOLUÇÃO</button></a>
            <a href="relatorio.jsp"><button class="botoesDoTopo" id="relatorio">RELATÓRIO</button></a>
            <a href="agendamentos.jsp"><button class="botoesDoTopo pressionado" id="agendamentos">AGENDAMENTOS</button></a>
            <a href="sair.jsp"><button class="power"><img src="../images/power.png" class="power" style="height: 30px;"></button></a>
       </div>
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var currentPage = window.location.pathname;

        var buttonCadastro = document.getElementById("agendamentos");
        var buttonLink = buttonCadastro.closest("a").getAttribute("href");

        if (currentPage.endsWith(buttonLink)) {
            buttonCadastro.classList.add("pressionado");
        }
    });
    </script>
    <br>
    <div class="container containerDevolucao">
        <div class="titulo">
            <a>AGENDAMENTOS</a>
        </div>
        <br>
        <table class="table">
            <form action="pesquisa/pesquisarAgendados.jsp" method="get">
                <th scope="col">
                    <input type="search" class="form-control w-255" placeholder="Digite a matricula, data, hora ou data para o aluguel" id="pesquisar" name="pesquisa">
                </th>
                <th scope="col">
                    <button onclick="searchData()" class="btn btn-primary"><i class='bx bx-search'></i></button>
                </th>
                <th scope="col" id="totalemuso" style="float:inline-end;">
                    TOTAL AGENDADOS PARA RETIRADA:
                    <% 
                    if(pesquisa != null && !pesquisa.isEmpty()) {
                        out.print(control.contarAgendamentosComPesquisa(pesquisa));
                    } else {
                        out.print(control.quantidadeAgendamentos());
                    }
                    %>
                </th>
            </form>
        </table>
        <table class="table table-striped table-sm table-hover">
            <thead>
                <tr>
                    <th scope="col" class="tabela">Matricula do aluno</th>
                    <th scope="col" class="tabela">Data do Agendamento</th>
                    <th scope="col" class="tabela">Hora do Agendamento</th>
                    <th scope="col" class="tabela">Data pedida no aluguel</th>
                </tr>
            </thead>
            <tbody>
                <%
                if(pesquisa == null || pesquisa.isEmpty()){
                    out.println(control.consultarAgendamentos());
                } else {
                    out.println(control.listarPesquisaAgendamentos(pesquisa));
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>

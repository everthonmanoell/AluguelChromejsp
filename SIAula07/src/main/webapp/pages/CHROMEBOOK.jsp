<%-- 
    Document   : CHROMEBOOK
    Created on : 26 de out. de 2023, 09:36:24
    Author     : evert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/icons/css/boxicons.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="/css/table.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap"
        rel="stylesheet">
    <title>Aluguel</title>
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
    <br><br> <br><br>
    </div>
    <div class="container containerBaixo">
        <div class="container containerMeio">




            <nav class="navbar bg-body-tertiary colorb">
                <div class="container-fluid">
                    <a class="navbar-brand">RELATÓRIO</a>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Pesquisa" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Pesquisa</button>
                    </form>
                </div>
            </nav>


            <form action="#">
                <div class="table">
                    <table>
                        <thead>
                            <tr>
                                <th>TOMBAMENTO</th>
                                <th>SITUAÇÃO</th>
                                <th>ALUGADO (SIM/NÃO)</th>
                                <th>DESCRIÇÃO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#</td>
                                <td>#</td>
                                <td>#</td>
                                <td>#</td>
                            </tr>

                            <!-- Adicione mais linhas conforme necessário -->
                        </tbody>
                    </table>

                    <div class="row justify-content-md-center buttt">
                        <button type="submit" class="BotaoSubmit">Confirmar</button><button type="reset"
                            class="BotaoSubmit">Cancelar</button>

                    </div>

                </div>
        </div>
    </div>
    </div>
    </div>
    </form>

</body>

</html>
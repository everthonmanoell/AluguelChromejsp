<%-- 
    Document   : RELATORIO
    Created on : 26 de out. de 2023, 09:37:58
    Author     : evert
--%>

<div%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text css" href="../icons/css/boxicons.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap" rel="stylesheet">
    <title>Relatório Coordenador</title>
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
    <br><br>
    </div>
        <div class="containerRelatorio">
            <div class="row justify-content-center">
                <div class="fonteRelatorio">
            <a href="relatorioaluno.jsp"><button class="botoesDoRelatorio">ALUNOS</button></a>
            <a href="relatoriocoordenador.jsp"><button class="botoesDoRelatorio">COORDENADOR</button></a>
            <a href="relatorioalugado.jsp"><button class="botoesDoRelatorio">ALUGADOS</button></a>
            <a href="relatoriochormebook.jsp"><button class="botoesDoRelatorio">CHORMEBOOK</button></a>
            <a href=""><button class="botoesDoRelatorio">EMPTY</button></a>
            <a href=""><button class="botoesDoRelatorio">EMPTY</button></a>
                    </div>
                </div>  
            </div>
        <br><br><br><br>
        <div class="container containerDevolucao">
            <div class="titulo">
                <a>Relatório Coordenador</a>
            </div>
            <table class="table">
                    <thead>
                            <th scope="col"><input type="search" class="form-control rounded" placeholder="" aria-label="Search" aria-describedby="search-addon" style="width:500px; margin-left:200px "/></th>
                        <th scope="col"><button type="button" class="btn btn-outline-primary btn-sm">pesquisar</button></th>
                        <th scope="col">TOTAL CADASTRADOS</th>
                        <th scope="col"><input class="form-control" type="text" id="totalemuso" name="totalemuso" style="width:100px" readonly></th>
            </table>
                <table class="table table-sm">
                    <thead>
                      <tr>
                        <th scope="col">Nome Completo</th>
                        <th scope="col">CPF</th>
                        <th scope="col">Senha</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"></th>
                        <td></td>
                        <td></td>
                        <td><button type="submit" class="btn btn-outline-primary btn-sm">Alterar</button><button type="submit" class="btn btn-outline-primary btn-sm">Excluir</button></td>
                      </tr>
                      <tr>
                        <th scope="row"></th>
                        <td></td>
                        <td></td>
                        <td><button type="submit" class="btn btn-outline-primary btn-sm">Alterar</button><button type="submit" class="btn btn-outline-primary btn-sm">Excluir</button></td>
                      </tr>
                    </tbody>
                  </table>

                </div>
            </div>
        </div>
    </div>
    
</body>

</html>

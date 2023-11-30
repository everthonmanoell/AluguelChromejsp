<%-- 
    Document   : PERFIL
    Created on : 18 de nov. de 2023, 00:37:09
    Author     : felipe
--%>
<%@page import="usuario.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
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
    <title>Relatório de Chromebook</title>
</head>
    <div class="bordaDoTopo">
        <div class="container-fluid">     
            <a href="home.jsp"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="homecadastro.jsp"><button class="botoesDoTopo" id="cadastro">CADASTRO</button></a>
            <a href="aluguel.jsp"><button class="botoesDoTopo" id="aluguel">ALUGUEL</button></a>
            <a href="devolucao.jsp"><button class="botoesDoTopo" id="devolucao">DEVOLUÇÃO</button></a>
            <a href="relatorio.jsp"><button class="botoesDoTopo pressionado" id="relatorio">RELATÓRIO</button></a>
            <a href="sair.jsp"><button class="power"><img src="../images/power.png" class="power" style="height: 30px;"></button></a>
            <a href="perfil.jsp"><button class="user"><img src="../images/user.png" class="user" style="height: 30px;"></button></a>
       </div>
    </div>
    <br>
    </div>
    </div>
    <div class="container">
        <div class="containerRelatorio">
            <div class="row justify-content-center">
                <div class="fonteRelatorio">
                    <a href="relatorioaluno.jsp"><button class="botoesDoRelatorio">ALUNOS</button></a>
                    <a href="relatoriocoordenador.jsp"><button class="botoesDoRelatorio">COORDENADOR</button></a>
                    <a href="relatoriochromebook.jsp"><button class="botoesDoRelatorio">CHORMEBOOK</button></a>                    
                <a href="relatorioaluguel.jsp"><button class="botoesDoRelatorio" id="alugados">ALUGADOS</button></a>
                </div>
            </div>  
        <div class="container containerDevolucao">
            <div class="titulo">
                <a>RELATÓRIO DE CHROMEBOOK </a>
            </div>
        </div>
            
        <%
            ControleUsuario controle = ControleUsuario.getInstance();
        %>
            
            <table class="table">
                    <thead>
                            <th scope="col"><input type="search" class="form-control rounded" placeholder="Pesquisar" aria-label="Search" aria-describedby="search-addon" style="width:500px; margin-left:200px " id="send"/></th>
                        <th scope="col"><button type="button" class="btn btn-primary btn-sm" id="send">pesquisar</button></th>
                        <th scope="col">TOTAL CADASTRADOS</th>
                        <th scope="col" id="totalemuso" style="width:50px"><%out.print(controle.contarChromebook());%></th>
            </table>
                <table class="table table-sm">
                    <thead>
                      <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Tombamento</th>
                        <th scope="col">Situação</th>
                        <th scope="col">Descrição</th>
                       
                      </tr>
                    </thead>
                    <tbody>
                        
                    <%
                    if(controle.listarDadosChromebook() != null ){
                        out.println(controle.listarDadosChromebook());
                    }else{
                        out.println("<p>Nenhum chromebook foi cadastrado! :( </p>");
                    }
                    %>
                        
                     </tbody>
                     
                  </table>

                </div>
            </div>
        </div>
    </div>
    
</body>

</html>
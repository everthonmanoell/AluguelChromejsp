<%-- 
    Document   : relatoriochromebook
    Created on : 18 de nov. de 2023, 00:37:09
    Author     : felipe
--%>
<%@page import="control.*"%>
<%@page import="model.*"%>
<%@ page import="java.sql.*" %>
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
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="../images/title 1.png" type="image/x-icon" />
    <title>Relatório de Chromebook</title>
</head>
<%
            ControleBancoChromebook control = ControleBancoChromebook.getInstance();
            String pesquisa = request.getParameter("pesquisa");

        %>
    <div class="bordaDoTopo">
        <div class="container-fluid">     
            <a href="home.jsp"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="homecadastro.jsp"><button class="botoesDoTopo" id="cadastro">CADASTRO</button></a>
            <a href="aluguel.jsp"><button class="botoesDoTopo" id="aluguel">ALUGUEL</button></a>
            <a href="devolucao.jsp"><button class="botoesDoTopo" id="devolucao">DEVOLUÇÃO</button></a>
            <a href="relatorio.jsp"><button class="botoesDoTopo pressionado" id="relatorio">RELATÓRIO</button></a>
            <a href="sair.jsp"><button class="power"><img src="../images/power.png" class="power" style="height: 30px;"></button></a>
       </div>
    </div>
    <br>
    <div class="container">
        <div class="containerRelatorio">
            <div class="row justify-content-center">
                <div class="fonteRelatorio">
                <a href="relatorioaluno.jsp"><button class="botoesDoRelatorio" id="alunos">ALUNOS</button></a>
                <a href="relatoriocoordenador.jsp"><button class="botoesDoRelatorio" id="coordenador">COORDENADOR</button></a>
                <a href="relatoriochromebook.jsp"><button class="botoesDoRelatorio" id="chromebook">CHROMEBOOK</button></a>
                <a href="relatorioaluguel.jsp"><button class="botoesDoRelatorio" id="alugados">ALUGADOS</button></a>
                </div>
            </div>  
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var currentPage = window.location.pathname;

        var buttonCadastro = document.getElementById("chromebook");
        var buttonLink = buttonCadastro.closest("a").getAttribute("href");

        if (currentPage.endsWith(buttonLink)) {
            buttonCadastro.classList.add("pressionado");
        }
    });
</script>

        <div class="container containerDevolucao">
            <div class="titulo">
                <a>RELATÓRIO DE CHROMEBOOK </a>
            </div>
        </div>           
             <main>
            <table class="table">
                        <form action="pesquisa/pesquisarchromebook.jsp" method="get">
                            <th scope="col"><input type="search" class="form-control w-255" placeholder="Pesquisar" id="Pesquisa por tombamento ou situação" name="pesquisa">
                            <th scope="col"><button onclick="searchData()" class="btn btn-primary"><i class='bx bx-search'></i></i></th></th></button>
                            <th scope="col" id="totalemuso" style="float:inline-end;">TOTAL:
                    <% if(pesquisa != null && !pesquisa.isEmpty()) {
                        out.print(control.contarChromebooksComPesquisa(pesquisa));
                    } else {
                        out.print(control.listarQuantidadeChromebook());
                    } %>
                        </form>
            </table>
            </main>
                <table class="table table-striped table-sm table-hover">
                    <thead>
                      <tr>
                        <th scope="col"  class="tabela">Id</th>
                        <th scope="col"  class="tabela">Tombamento</th>
                        <th scope="col"  class="tabela">Situação</th>
                        <th scope="col"  class="tabela">Descrição</th>                       
                      </tr>
                    </thead>
                    <tbody>
                        
                    
                    <%
                        
                        if(pesquisa == null || pesquisa.isEmpty()){
                            out.println(control.listarDadosChromebook());
                            }else{
                            out.println(control.listarPesquisaChromebook(pesquisa));
                        
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

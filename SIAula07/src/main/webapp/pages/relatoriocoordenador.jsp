<%-- 
    Document   : RELATORIOCOORDENADOR
    Created on : 18 de nov. de 2023, 00:37:09
    Author     : felipe
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.*"%>

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
        <title>Relatório de Coordenadores</title>
    </head>
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

            <div class="container containerDevolucao">
                <div class="titulo">
                    <a>RELATÓRIO DE COORDERNADORES</a>
                </div>
            </div>

            <%
                ControleBancoUsuario control = ControleBancoUsuario.getInstance();
            %>

            <main>
            <table class="table">
                        <th scope="col"><input type="search" class="form-control w-255" placeholder="Pesquisar" id="pesquisar">
                        <th scope="col"><button onclick="searchData()" class="btn btn-primary"><i class='bx bx-search'></i></i></th></th></button>
                        
                        <th scope="col" id="totalemuso" style=" float:inline-end;">TOTAL CADASTRADOS: <% out.print(control.listarQuantidadeUsuarios()); %> </th>
            </table>
            </main>            
            <table class="table table-striped table-sm table-hover">
                <thead>
                    <tr>
                        <th scope="col" class="tabela">Id</th>
                        <th scope="col" class="tabela">Nome</th>
                        <th scope="col" class="tabela">Matrícula</th>                      
                    </tr>
                </thead>
                <tbody id="conteudo">
                    <%
                        if(control.listarDadosUsuarios() != null ){
                            out.println(control.listarDadosUsuarios());
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var currentPage = window.location.pathname;


        var buttonCadastro = document.getElementById("coordenador");
        var buttonLink = buttonCadastro.closest("a").getAttribute("href");

        if (currentPage.endsWith(buttonLink)) {
            buttonCadastro.classList.add("pressionado");
        }
    });
    
    var conteudoOriginal = document.getElementById('conteudo').innerHTML;

    document.getElementById('pesquisar').addEventListener('input', function() {
    var termoPesquisa = this.value.toLowerCase();
    var conteudo = conteudoOriginal.toLowerCase();

    if (termoPesquisa !== '') {
        if (conteudo.includes(termoPesquisa)) {
            // Resetar o destaque anterior
            document.getElementById('conteudo').innerHTML = conteudoOriginal;

            // Destacar o termo correspondente apenas no texto visível
            destacarTextoVisivel(document.getElementById('conteudo'), termoPesquisa);
        } else {
            document.getElementById('conteudo').style.display = 'none';
        }
    } else {
        // Resetar o destaque se o termo de pesquisa estiver vazio
        document.getElementById('conteudo').innerHTML = conteudoOriginal;
        document.getElementById('conteudo').style.display = 'block';

        // Verificar se o campo de pesquisa está vazio
        if (this.value === '') {
            // Recarregar a página ao limpar o campo de pesquisa
            location.reload();
        }
    }
});

function destacarTextoVisivel(elemento, termo) {
    var nós = elemento.childNodes;

    nós.forEach(function(nó) {
        if (nó.nodeType === 3) { // Nó de texto
            var conteudo = nó.nodeValue.toLowerCase();
            if (conteudo.includes(termo)) {
                var regex = new RegExp('(' + termo + ')', 'gi');
                var conteudoDestacado = conteudo.replace(regex, '<span style="background-color: #0ca7fe;">$1</span>');
                var span = document.createElement('span');
                span.innerHTML = conteudoDestacado;
                nó.replaceWith(span);
            }
        } else if (nó.nodeType === 1) { // Nó de elemento
            destacarTextoVisivel(nó, termo);
        }
    });
}


</script>

</body>
</html>

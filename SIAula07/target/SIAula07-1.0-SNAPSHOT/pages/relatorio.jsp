<%-- 
    Document   : RELATORIO
    Created on : 18 de nov. de 2023, 00:37:09
    Author     : felipe
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>RELATÓRIO</title>
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
<br>
    <div class="container">
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
        <div class="containerRelatoriocentro" style="text-align: center; padding-bottom: 200px;">
            <br>
            <br>
            <h1> Relatórios.</h1>
            <p>Nesse sistema você pode obter todos os cadastro de alunos, coordenadores e o próprio Chromebook, além de poder observar o status e quem possui o Chromebook. Basta entrar nas abas específicas e escolher o que fazer.</p>
        </div>
    </div>
    
</body>

</html>

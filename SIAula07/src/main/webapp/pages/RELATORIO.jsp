<%-- 
    Document   : RELATORIO
    Created on : 26 de out. de 2023, 09:37:58
    Author     : evert
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
    <br><br>
    </div>
 
        <div class="containerRelatorio">
            <div class="titulo">
                <a>RELATÓRIO</a>
            <div class="row justify-content-center">
                <div class="fonteRelatorio">
            <a href="RELATORIOALUNO.jsp"><button class="botoesDoRelatorio">ALUNOS</button></a>
            <a href="RELATORIOCOORDENADOR.jsp"><button class="botoesDoRelatorio">COORDENADOR</button></a>
            <a href="RELATORIOALUGADO.jsp"><button class="botoesDoRelatorio">ALUGADOS</button></a>
            <a href="RELATORIOCHROMEBOOK.jsp"><button class="botoesDoRelatorio">CHORMEBOOK</button></a>
            <a href=""><button class="botoesDoRelatorio">EMPTY</button></a>
            <a href=""><button class="botoesDoRelatorio">EMPTY</button></a>
                    </div>
                </div>  
            </div>
        </div>
   
    <div class="container">
        <div class="containerRelatorio" style="text-align: center">
            <h1> Sistema de relatórios.</h1>
            <p>Nesse sistema você pode obter todos os cadastro de alunos, coordenadores e o próprio Chromebook, além de poder observar o status e quem possui o Chromebook. Basta entrar nas abas específicas e escolher o que fazer.</p>
        </div>
    </div>
    
</body>

</html>

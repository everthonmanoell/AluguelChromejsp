<%-- 
    Document   : CHROMEBOOK
    Created on : 26 de out. de 2023, 09:36:24
    Author     : Everthon Manoel
--%>

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
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap"
        rel="stylesheet">
    <title>CADASTRO DE CHROMEBOOK</title>
</head>
<body class="topo">
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
        <div class="container containerMeio">
            <div class="titulo">
                <a>CADASTRO DE CHROMEBOOK</a>
            </div>
            <form action="validarchromebook.jsp" method="post">
                <div class="fonteCoordenador">
                    <label for="TOMBAMENTO" class="form-label"><a>TOMBAMENTO:</a></label>
                    <input type="text" class="form-control" id="TOMBAMENTO" placeholder="" name="tombamento" required>
                    <label for="SITUACAO" class="form-label"><a>SITUAÇÃO:</a></label>
                    <select class="form-select" id="SITUACAO" name="situacao" required>
                        <option></option>
                        <option value="1">INOPERANTE</option>
                        <option value="2">OPERANTE</option>
                    </select>
                    <label for="DESCRICAO" class="form-label"><a>DESCRIÇÃO:</a></label>
                    <textarea class="form-control" rows="2" maxlength="100" style="resize: none" id="DESCRICAO"
                        name="DESCRICAO"></textarea>
                    <br>
                    <div class="row justify-content-md-center">
                        <button type="submit" class="BotaoSubmit">Salvar</button>
                        <button type="reset" class="BotaoSubmit cancelar">Cancelar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>


<%-- 
    Document   : validar
    Created on : Oct 4, 2023, 7:37:32 PM
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
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap" rel="stylesheet">
    <title>CADASTRO DE COORDENADOR</title>
</head>

<body class="topo">
    <div class="bordaDoTopo">
        <div class="container-fluid">
           
        </div>
    </div>

    <br><br> <br><br>
        <div class="container containerMeio">
            <div class="titulo">
                <a>CADASTRO DE COORDENADOR</a>
            </div>
            <form action="validarcadastro.jsp" method="post">
                <div class="fonteCoordenador">
                    <label for="nomecompleto" class="form-label"><a>NOME COMPLETO:</a></label>
                    <input type="text" class="form-control" id="nomecompleto" placeholder="Nome completo" name="nomecompleto" required>
                    <label for="cpf" class="form-label"><a>CPF:</a></label>
                    <input type="text" name="cpf" class="form-control cpf1" id="CPF" aria-describedby="CPF" placeholder="CPF" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" required>
                    <label for="password" class="form-label"><a>ESCOLHA UMA SENHA:</a></label>
                    <input type="password" name="senha" class="form-control" placeholder="Senha" id="password"  required style="margin-bottom: 10px" >
                    <input type="password" name="senha2" class="form-control" placeholder="Confirme Senha" id="confirm_password" required style="margin-bottom: 10px">
                    
                    <div class="row justify-content-md-center">
                        <button type="submit" class="BotaoSubmit">Cadastrar</button>
                        <button class="BotaoSubmit cancelar" onclick="window.location.href='../index.jsp'">Voltar</button>
                        
                    </div>
                 
                </div>
            </form>
        </div>
    </div>
</body>

</html>

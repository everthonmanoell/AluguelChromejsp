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
                <a>CADASTRO DE COORDENADOR</a>
            </div>
            <form action="validarcadastro.jsp?erro=true" method="post">
                <div class="fonteCoordenador">
                    <label for="nomecompleto" class="form-label"><a>NOME COMPLETO:</a></label>
                    <input type="text" class="form-control" id="nomecompleto" placeholder="" name="nomecompleto" required>
                    <label for="matricula" class="form-label"><a>Matrícula:</a></label>
                    <input type="text" class="form-control cpf1" id="CPF" aria-describedby="CPF" placeholder="CPF" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" required>
                    <label for="password" class="form-label"><a>ESCOLHA UMA SENHA:</a></label>
                    <input type="password" name="senha" class="form-control" placeholder="Senha" id="password"  required style="margin-bottom: 10px" >
                    <input type="password" name="senha2" class="form-control" placeholder="Confirme Senha" id="confirm_password" required style="margin-bottom: 10px">
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

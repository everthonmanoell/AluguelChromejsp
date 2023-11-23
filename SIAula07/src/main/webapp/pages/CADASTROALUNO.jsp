<%-- 
    Document   : CADASTROALUNO
    Created on : 26 de out. de 2023, 09:35:35
    Author     : felipe
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
    <title>CADASTRO DE ALUNO</title>
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
        <div class="container containerMeio">
            <div class="titulo">
                <a>CADASTRO DE ALUNO</a>
            </div>
            <form action="#">
                <div class="fonteCoordenador">
                    <label for="nomecompleto" class="form-label"><a>NOME COMPLETO:</a></label>
                    <input type="text" class="form-control" id="nomecompleto" placeholder="" name="nomecompleto" required>
                    <label for="matricula" class="form-label"><a>MATRÍCULA:</a></label>
                    <input type="text" maxlength="11" class="form-control" id="cpf" placeholder="Máx. 11 caracteres" name="matricula" required>
                    <label for="TURNO" class="form-label"><a>TURNO:</a></label>
                    <select class="form-select" id="TURNO" name="TURNO" required>
                        <option></option>
                        <option value="MANHA">MANHÃ</option>
                        <option value="TARDE">TARDE</option>
                        <option value="NOITE">NOITE</option>
                    </select>
                    <label for="PERIODO" class="form-label"><a>PERÍODO:</a></label>
                    <select class="form-select" id="PERIODO" name="PERIODO" required>
                        <option></option>
                        <option value="1">1º PERÍODO</option>
                        <option value="2">2º PERÍODO</option>
                        <option value="3">3º PERÍODO</option>
                        <option value="4">4º PERÍODO</option>
                        <option value="5">5º PERÍODO</option>
                        <option value="6">6º PERÍODO</option>
                        <option value="7">7º PERÍODO</option>
                        <option value="8">8º PERÍODO</option>
                        <option value="9">9º PERÍODO</option>
                        <option value="10">10º PERÍODO</option>
                    </select>
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


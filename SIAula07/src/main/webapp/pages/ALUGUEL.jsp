<%-- 
    Document   : ALUGUEL
    Created on : 26 de out. de 2023, 09:35:03
    Author     : evert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../icons/css/boxicons.min.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap" rel="stylesheet">
    <title>Aluguel</title>
</head>

<body class="topo">
    <div class="bordaDoTopo">
        <div class="container-fluid">
            <a href="HOME.html"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="CADASTRO.html"><button class="botoesDoTopo">CADASTRO</button></a>
            <a href="ALUGUEL.html"><button class="botoesDoTopo">ALUGUEL</button></a>
            <a href="DEVOLUCÃO.html"><button class="botoesDoTopo">DEVOLUÇÃO</button></a>
            <a href="RELATORIO.html"><button class="botoesDoTopo">RELATÓRIO</button></a>
            <a href="../LOGIN.html"><button class="power"><img src="../images/power.png" class="power"></button></a>
            <a href="PERFIL.html"><button class="user"><img src="../images/user.png" class="user" style="height: 30px;"></button></a>
        </div>
    </div>
    <br><br><br><br>
        <div class="container containerMeio">
            <div class="titulo">
                <a>ALUGUEL DE CHROMEBOOK</a>
            </div>
            <form action="#">
                <div class="mb-3 mt-3">
                    <label for="matricula" class="form-label"><a>Matrícula:</a></label>
                    <input type="text" class="form-control" id="matricula" placeholder="" name="matricula" required>
                </div>
                <div class="mb-3 mt-3">
                    <label for="tombamento" class="form-label"><a>Tombamento:</a></label>
                    <input type="text" class="form-control" id="tombamento" placeholder="" name="tombamento" required>
                </div>
                <div class="mb-3 mt-3">
                    <label for="sit-chro" class="form-label"><a>Situação Chromebook:</a></label>
                    <select class="form-control" id="sit-chro" name="sit-chro" required>
                        <option value=""></option>
                        <option value="inoperante">Inoperante</option>
                        <option value="operante">Operante</option>
                    </select>
                </div>
                <div class="mb-3 mt-3">
                    <label for="datalugu" class="form-label"><a>Data de Aluguel:</a></label>
                    <input type="date" class="form-control" id="datalugu" placeholder="" name="datalugu" required>
                </div>
                <div class="mb-3 mt-3">
                    <label for="hora" class="form-label"><a>Hora início:</a></label>
                    <input type="time" class="form-control" id="hora" placeholder="" name="hora" required>
                </div>
                <div class="mb-3 mt-3">
                    <label for="termino" class="form-label"><a>Hora término:</a></label>
                    <input type="time" class="form-control" id="termino" placeholder="" name="termino" required>
                </div>
                <div class="row justify-content-md-center">
                    <button type="submit" class="BotaoSubmit">Confirmar</button>
                    <button type="reset" class="BotaoSubmit">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

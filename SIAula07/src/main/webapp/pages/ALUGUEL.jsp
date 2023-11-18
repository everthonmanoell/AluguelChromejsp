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
    <title>ALUGUEL DE CHROMEBOOK</title>
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
                <a>ALUGUEL DE CHROMEBOOK</a>
            </div>
            <form action="#">
                <div class="fonteCoordenador">
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
    </div>
</body>
</html>

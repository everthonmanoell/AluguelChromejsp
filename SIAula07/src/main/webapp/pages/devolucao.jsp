<%-- 
    Document   : devolucao
    Created on : 1 de nov. de 2023, 23:29:08
    Author     : Ev
--%>
<!DOCTYPE html>
<html lang="pt-br">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../icons/css/boxicons.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Kanit:wght@100;400;700&display=swap"
        rel="stylesheet">
    <title>DEVOLUÇÃO</title>
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
        <div class="container containerDevolucao">
            <div class="titulo">
                <a>DEVOLUÇÃO</a>
            </div>
            <table class="table">
                    <thead>
                            <th scope="col"><input type="search" class="form-control rounded" placeholder="" aria-label="Search" aria-describedby="search-addon" style="width:500px; margin-left:200px "/></th>
                        <th scope="col"><button type="button" class="btn btn-outline-primary btn-sm">pesquisar</button></th>
                        <th scope="col">TOTAL EM USO</th>
                        <th scope="col"><input class="form-control" type="text" id="totalemuso" name="totalemuso" style="width:100px" readonly></th>
            </table>
                <table class="table table-sm">
                    <thead>
                      <tr>
                        <th scope="col">Nome</th>
                        <th scope="col">Matricula</th>
                        <th scope="col">Tombamento</th>
                        <th scope="col">Data aluguel</th>
                        <th scope="col">Hora aluguel</th>
                        <th scope="col">Data Entrega</th>
                        <th scope="col">Hora Entrega</th>
                        <th scope="col"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"></th>
                        <td></td>
                        <td></td>
                        <td></td>   
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><button type="submit" class="btn btn-outline-primary btn-sm">Devolver</button></td>
                        
                      </tr>
                      <tr>
                        <th scope="row"></th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><button type="submit" class="btn btn-outline-primary btn-sm">Devolver</button></td>
                      </tr>
                    </tbody>
                  </table>

                </div>
            </div>
        </div>
    </div>
</body>

</html>







</html>
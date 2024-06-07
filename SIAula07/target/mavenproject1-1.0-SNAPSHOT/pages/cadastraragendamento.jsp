<%-- 
    Document   : CHROMEBOOK
    Created on : 26 de out. de 2023, 09:36:24
    Author     : Felipe
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.*"%>
<%@page import="model.*"%>
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
    <title>CADASTRAR AGENDAMENTO</title>
</head>


    <br>
        <div class="container containerMeio">
            <div class="titulo">
                <p>AGENDAMENTO</p>
            </div>
            <form action="validar/validarAgendamento.jsp" method="post">
                <div class="fonteCoordenador">



                                        
                    <div class="mb-3 mt-3">
                        <label for="matricula" class="form-label"><a>Matrícula do aluno:</a></label>
                        <input type="text" value="" name="matricula"  required class="form-control" id="matricula" aria-describedby="matricula" placeholder="Digite a matricula do aluno">
                    </div>
                                        
                    
                    <div class="mb-3 mt-3">
                        <label for="data" class="form-label"><a>Data </a></label>
                        <input type="date"  value="" class="form-control"  id="data" placeholder="" name="data" required/>
                    </div>
                    
</div>




                    <div class="row justify-content-md-center">
                        <button type="submit" class="BotaoSubmit"> Confirmar                         
                        </button>
                        <button type="reset" class="BotaoSubmit cancelar">Cancelar</button>
                        
                        <script>
                            function exibirMensagem(mensagem) {
                            alert(mensagem);
                            }
                        </script>
                    </div>
            </form>
        </div>
    </div>
</div>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var currentPage = window.location.pathname;

        var buttonCadastro = document.getElementById("aluguel");
        var buttonLink = buttonCadastro.closest("a").getAttribute("href");

        if (currentPage.endsWith(buttonLink)) {
            buttonCadastro.classList.add("pressionado");
        }
    });
</script>




</body>
</html>
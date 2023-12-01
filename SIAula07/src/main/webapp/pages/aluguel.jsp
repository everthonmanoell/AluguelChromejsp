<%-- 
    Document   : CHROMEBOOK
    Created on : 26 de out. de 2023, 09:36:24
    Author     : Everthon Manoel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="usuario.*"%>
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
    <title>ALUGUEL DE CHROMEBOOK</title>
</head>
    <div class="bordaDoTopo">
        <div class="container-fluid">     
            <a href="home.jsp"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="homecadastro.jsp"><button class="botoesDoTopo" id="cadastro">CADASTRO</button></a>
            <a href="aluguel.jsp"><button class="botoesDoTopo" id="aluguel">ALUGUEL</button></a>
            <a href="devolucao.jsp"><button class="botoesDoTopo" id="devolucao">DEVOLUÇÃO</button></a>
            <a href="relatorio.jsp"><button class="botoesDoTopo" id="relatorio">RELATÓRIO</button></a>
            <a href="sair.jsp"><button class="power"><img src="../images/power.png" class="power" style="height: 30px;"></button></a>
       </div>
    </div>

    <br>
        <div class="container containerMeio">
            <div class="titulo">
                <p>

                    <%
                        String id = request.getParameter("id");
                        String matriculaCoordenador = request.getParameter("matriculaCoordenador");
                        String matriculaAluno = request.getParameter("matriculaAluno");
                        String tombamento = request.getParameter("tombamento");
                        String situacaochromebook = request.getParameter("situacaochromebook");
                        String dataaluguel = request.getParameter("dataaluguel");
                        String horainicio = request.getParameter("horainicio");
                        String datatermino = request.getParameter("datatermino");
                        String horatermino = request.getParameter("horatermino");
                        


                        ControleAluguel controle = ControleAluguel.getInstance();
                        Aluguel usr = null;

                        if (id != null) {
                            out.println("Devolução de Chromebook");
                            usr = controle.getAluguel(id);
                        } else {
                            out.println("Aluguel de Chromebook");
                            // Ajuste na chamada do construtor:
                            usr = new Aluguel("", "", "", "", "", "", "", "", ""); // Substitua pelos valores apropriados
                        }
                    %>


                </p>

            </div>
            <form action="validar/validaraluguel.jsp<%if(id != null){out.print("?devolver=true");}%>" method="post">
                <div class="fonteCoordenador">

                    <div class="mb-3 mt-3">
                        <label for="id" class="form-label"><a>ID:</a></label>
                        <input type="text" value="<%if(id!=null){out.print(usr.getId());}%>" <%if(id!=null){out.print("readonly");}%> class="form-control" id="id" placeholder="" name="id" required>
                    </div> 

                    <div class="mb-3 mt-3">
                        <label for="matricula" class="form-label"><a>Matrícula do Coordenador:</a></label>
                        <input type="text" value="<%if(id!=null){out.print(usr.getMatriculaUsuario());}%>" <%if(id!=null){out.print("readonly");}%> class="form-control" id="matricula" placeholder="" name="matriculaCoordenador" required>
                    </div>
                    
                    <div class="mb-3 mt-3">
                        <label for="matricula" class="form-label"><a>Matrícula do Aluno:</a></label>
                        <input type="text" value="<%if(id!=null){out.print(usr.getMatricula());}%>" <%if(id!=null){out.print("readonly");}%> class="form-control" id="matricula" placeholder="" name="matriculaAluno" required>
                    </div>
                    
                    <div class="mb-3 mt-3">
                        <label for="tombamento" class="form-label"><a>Tombamento:</a></label>
                        <input type="text" value="<%if(id!=null){out.print(usr.getTombamento());}%>" <%if(id!=null){out.print("readonly");}%> class="form-control" id="tombamento" placeholder="" name="tombamento" required>
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="sit-chro" class="form-label"><a>Situação Chromebook:</a></label>
                        <select class="form-control" id="sit-chro" name="situacaochromebook" required>
                            <option value=""></option>
                            <option value="inoperante" <%if((id!=null) && (usr.getSituacaoChromebook().equals("inoperante"))){out.print("selected");}%> >Inoperante</option>
                            <option value="operante"   <%if((id!=null) && (usr.getSituacaoChromebook().equals("inoperante"))){out.print("selected");}%> >Operante</option>
                        </select>
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="datalugu" class="form-label"><a>Data de Aluguel:</a></label>
                        <input type="date" value="<%if(id!=null){out.print(usr.getDataAluguel());}%>" <%if(id!=null){out.print("readonly");}%> class="form-control" id="datalugu" placeholder="" name="dataaluguel" required>
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="hora" class="form-label"><a>Hora início:</a></label>
                        <input type="time" value="<%if(id!=null){out.print(usr.getHoraInicio());}%>" <%if(id!=null){out.print("readonly");}%> class="form-control" id="hora" placeholder="" name="horainicio" required>
                    </div>

                    <% if (id != null) { %>
                        <div class="mb-3 mt-3">
                            <label for="datatermino" class="form-label"><a>Data término:</a></label>
                            <input type="date" value="<%= usr.getDataTermino() %>" class="form-control" id="datatermino" placeholder="" name="datatermino">
                        </div>

                        <div class="mb-3 mt-3">
                            <label for="termino" class="form-label"><a>Hora término:</a></label>
                            <input type="time" value="<%= usr.getHoraTermino() %>" class="form-control" id="termino" placeholder="" name="horatermino">
                        </div>
                    <% } %>





                    <div class="row justify-content-md-center">
                        <button type="submit" class="BotaoSubmit" 
                            <% if(id != null){out.print("onclick=\"exibirMensagem('O devolução foi efetuada com sucesso!');\"");}
                                else{out.print("onclick=\"exibirMensagem('O Aluguel foi adicionado com sucesso!');\"");}%>>
                            <%if(id!=null){out.print("Devolver");}else{out.print("Alugar");}%>
                        </button>
                        <button type="reset" class="BotaoSubmit">Cancelar</button>
                        
                        
                        
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

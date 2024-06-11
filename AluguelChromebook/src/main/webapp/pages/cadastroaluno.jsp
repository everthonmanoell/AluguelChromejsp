<%-- 
    Document   : CADASTROALUNO
    Created on : 26 de out. de 2023, 09:35:35
    Author     : felipe
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
    <title>Cadastro De Aluno</title>
</head>

    <%
            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String matricula = request.getParameter("matricula");
            String turno = request.getParameter("turno");
            String periodo = request.getParameter("periodo");
            String turma = request.getParameter("turma");
    %>


<body>
    <div class="bordaDoTopo">
        <div class="container-fluid">     
            <a href="home.jsp"><button class="botoesDoTopo">ÍNICIO</button></a>
            <a href="homecadastro.jsp"><button class="botoesDoTopo pressionado" id="cadastro"><%if(id != null){out.print("EDITANDO");}else{out.print("CADASTRO");}%></button></a>
            <a href="aluguel.jsp"><button class="botoesDoTopo" id="aluguel">ALUGUEL</button></a>
            <a href="devolucao.jsp"><button class="botoesDoTopo" id="devolucao">DEVOLUÇÃO</button></a>
            <a href="relatorio.jsp"><button class="botoesDoTopo" id="relatorio">RELATÓRIO</button></a>
            <a href="agendamentos.jsp"><button class="botoesDoTopo" id="agendamentos">AGENDAMENTOS</button></a>
            <a href="sair.jsp"><button class="power"><img src="../images/power.png" class="power" style="height: 30px;"></button></a>
       </div>
    </div>
    <br>
        <div class="container containerMeio">
            <div class="titulo">
                <p>
                    
                    <%
      
                        
                        
                        ControleBancoAluno control = ControleBancoAluno.getInstance();
                        Aluno usr = null;

                        if (id != null) {
                            out.println("Editando Cadastro do Aluno");
                            usr = control.getAluno(id);
                        } else {
                            out.println("Cadastro do Aluno");
                            // Ajuste na chamada do construtor:
                            usr = new Aluno("", "", "", "", "", ""); // Substitua pelos valores apropriados
                        }
                    %>
                    
                </p>
            </div>
                <form action="validar/validaraluno.jsp<% if (id != null) { out.print("?id=" + usr.getId()); } else { out.print("?op=true"); } %>" method="post">

                <div class="fonteCoordenador">

                    
                    <label for="nomecompleto" class="form-label">NOME COMPLETO:</label>
                    <input type="text" value="<%if(id!=null){out.print(usr.getNome());}%>" class="form-control" id="nomecompleto" placeholder="Digite o nome completo do aluno" name="nome" required>
                    
                    <label for="matricula" class="form-label">MATRÍCULA:</label>
                    <input type="text" value="<%if(id!=null){out.print(usr.getMatricula());}%>" class="form-control" id="matricula" placeholder="Digite a matrícula" name="matricula" required>
                    
                   
                    <label for="CURSO" class="form-label">CURSO:</label>
                    <select class="form-select" id="CURSO" name="curso" required>
                    <option  selected disable onlyread>Selecione uma opção</option>
                    <option value="sem curso" <%if((id!=null) && (usr.getCurso().equals("sem curso"))){out.print("selected");}%> >Sem Curso</option>
                    <option value="administracao" <%if((id!=null) && (usr.getCurso().equals("administracao"))){out.print("selected");}%> >Adm - Administração</option>
                    <option value="analise e desenvolvimento de sistemas" <%if((id!=null) && (usr.getCurso().equals("analise e desenvolvimento de sistemas"))){out.print("selected");}%> >ADS - Análise e Desenvolvimento de Sistemas</option>
                    <option value="direito" <%if((id!=null) && (usr.getCurso().equals("direito"))){out.print("selected");}%> >Dir - Direito</option>
                    <option value="enfermagem" <%if((id!=null) && (usr.getCurso().equals("enfermagem"))){out.print("selected");}%>  >Enf - Enfermagem</option>
                    <option value="gestao da qualidade" <%if((id!=null) && (usr.getCurso().equals("gestao de qualidade"))){out.print("selected");}%> >GQ - Gestão da Qualidade</option>
                    <option value="gestao de recursos humanos" <%if((id!=null) && (usr.getCurso().equals("gestao de recursos humanos"))){out.print("selected");}%> >GRH - Gestão de Recursos Humanos</option>
                    <option value="gestao financeira"<%if((id!=null) && (usr.getCurso().equals("gestao financeira"))){out.print("selected");}%> >GF - Gestão Financeira</option>
                    <option value="gestao publica" <%if((id!=null) && (usr.getCurso().equals("gestao publica"))){out.print("selected");}%> >GP - Gestão Pública</option>
                    <option value="psicologia" <%if((id!=null) && (usr.getCurso().equals("psicologia"))){out.print("selected");}%> >Psi - Psicologia</option>
                    <option value="sistemas para internet"<%if((id!=null) && (usr.getCurso().equals("sistemas para internet"))){out.print("selected");}%> >SI - Sistemas para Internet</option>                    
                    </select>
     
                    <label for="TURNO" class="form-label">TURNO:</label>
                    <select class="form-select" id="TURNO" name="turno" required>
                        <option  selected disable onlyread>Selecione uma opção</option>
                        <option value="manha" <%if((id!=null) && (usr.getTurno().equals("manha"))){out.print("selected");}%> >MANHÃ</option>
                        <option value="tarde" <%if((id!=null) && (usr.getTurno().equals("tarde"))){out.print("selected");}%> >TARDE</option>
                        <option value="noite" <%if((id!=null) && (usr.getTurno().equals("noite"))){out.print("selected");}%> >NOITE</option>
                    </select>
                    

                    
                    <label for="PERIODO" class="form-label">PERÍODO:</label>
                    <select class="form-select" id="PERIODO" name="periodo" required>
                        <option selected disable onlyread>Selecione uma opção</option>
                        <option value="1" <%if((id!=null) && (usr.getPeriodo().equals("1"))){out.print("selected");}%>  >1º PERÍODO</option>
                        <option value="2" <%if((id!=null) && (usr.getPeriodo().equals("2"))){out.print("selected");}%>  >2º PERÍODO</option>
                        <option value="3" <%if((id!=null) && (usr.getPeriodo().equals("3"))){out.print("selected");}%>  >3º PERÍODO</option>
                        <option value="4" <%if((id!=null) && (usr.getPeriodo().equals("4"))){out.print("selected");}%>  >4º PERÍODO</option>
                        <option value="5" <%if((id!=null) && (usr.getPeriodo().equals("5"))){out.print("selected");}%>  >5º PERÍODO</option>
                        <option value="6" <%if((id!=null) && (usr.getPeriodo().equals("6"))){out.print("selected");}%>  >6º PERÍODO</option>
                        <option value="7" <%if((id!=null) && (usr.getPeriodo().equals("7"))){out.print("selected");}%>  >7º PERÍODO</option>
                        <option value="8" <%if((id!=null) && (usr.getPeriodo().equals("8"))){out.print("selected");}%>  >8º PERÍODO</option>
                        <option value="9" <%if((id!=null) && (usr.getPeriodo().equals("9"))){out.print("selected");}%>  >9º PERÍODO</option>
                        <option value="10"<%if((id!=null) && (usr.getPeriodo().equals("10"))){out.print("selected");}%> >10º PERÍODO</option>
                    </select>

                    
                    <label for="TURMA" class="form-label">TURMA:</label>
                    <select class="form-select" id="TURMA" name="turma" required>
                        <option value="" selected disable onlyread> Selecione uma opção</option>
                        <option value="a" >Não tenho</option>
                        <option value="a"  <%if((id!=null) && (usr.getTurma().equals("a"))){out.print("selected");}%> >A</option>
                        <option value="b"  <%if((id!=null) && (usr.getTurma().equals("b"))){out.print("selected");}%> >B</option>
                        <option value="c"  <%if((id!=null) && (usr.getTurma().equals("c"))){out.print("selected");}%> >C</option>
                        <option value="d"  <%if((id!=null) && (usr.getTurma().equals("d"))){out.print("selected");}%> >D</option>
                        <option value="e"  <%if((id!=null) && (usr.getTurma().equals("e"))){out.print("selected");}%> >E</option>
                        <option value="f"  <%if((id!=null) && (usr.getTurma().equals("f"))){out.print("selected");}%> >F</option>
                    </select>
                    <br>
   

                    
                    <div class="row justify-content-md-center">
                        <button type="submit" class="BotaoSubmit" 
                            <% if(id != null){out.print("onclick=\"exibirMensagem('O Cadastro do Aluno foi alterado com sucesso!');\"");}
                                else{out.print("onclick=\"exibirMensagem('O cadastro do Aluno foi adicionado com sucesso!');\"");}%>>
                            <%if(id!=null){out.print("Salvar");}else{out.print("Cadastrar");}%>
                        </button>
                        <button type="reset" class="BotaoSubmit cancelar" onclick="window.location.href='homecadastro.jsp';">Voltar</button>
                         <script>
                            function exibirMensagem(mensagem) {
                            alert(mensagem);
                            }
                        </script>
                    </div>
                       
                </div>
            </form>
        </div>
    </div>
</body>

</html>


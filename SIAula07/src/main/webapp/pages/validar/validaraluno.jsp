<%-- 
    Document   : validarchromebook
    Created on : 26 de nov. de 2023, 09:10:41
    Author     : Everthon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="usuario.Aluno"%>
<%@page import="usuario.ControleUsuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String nome = request.getParameter("nome");
           String matricula = request.getParameter("matricula");
           String turno = request.getParameter("turno");
           String periodo = request.getParameter("periodo");
           String turma = request.getParameter("turma");

           if (matricula != null) {
               // Crie um objeto Chromebook apenas se os parâmetros não forem nulos
               Aluno aluno = new Aluno(nome, matricula, turno, periodo, turma);

               // Adicione o Chromebook ao controle de usuários (ou ao controle específico de Chromebooks, se houver)
               ControleUsuario controle = ControleUsuario.getInstance();
               controle.adicionarAluno(aluno);

               response.sendRedirect("../cadastroaluno.jsp");
           } else {
               // Caso os parâmetros sejam nulos, você pode redirecionar para uma página de erro ou fazer algo adequado.
               response.sendRedirect("../error.jsp");
           }
        %>
    </body>
</html>


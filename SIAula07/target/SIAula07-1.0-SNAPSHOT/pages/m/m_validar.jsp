<%-- 
    Document   : validar
    Created on : Oct 4, 2023, 7:37:32 PM
    Author     : ficr
--%>
<%@page import="usuario.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validar</title>
    </head>
    <body>
        
        <%
           String nomecompleto = request.getParameter("nome");
           String login = request.getParameter("login");
           String senha = request.getParameter("senha");
           String tipo = request.getParameter("tipo");

           Usuario usr = new Usuario(nome, login, senha, tipo);

           ControleUsuario controle = ControleUsuario.getInstance();
           controle.adicionarUsuario(usr);

        %>
        <h1>Cadastro realizado com sucesso!</h1><br>
        <a href="cadastro.jsp">Cadastrar outro usuario</a><br>
        <a href="index.jsp">Login</a><br>
    </body>
</html>

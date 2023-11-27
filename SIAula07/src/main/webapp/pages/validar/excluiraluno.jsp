<%-- 
    Document   : excluirchromebook
    Created on : 27 de nov. de 2023, 18:06:21
    Author     : evert
--%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Excluir Chromebook</title>
</head>
<body>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="usuario.*"%>
<%@page import="usuario.ControleUsuario"%>

<%
    String id = request.getParameter("id");

    ControleUsuario controle = ControleUsuario.getInstance();
    controle.excluirAluno(id);

    response.sendRedirect("../relatorioaluno.jsp");
%>
</body>
</html>

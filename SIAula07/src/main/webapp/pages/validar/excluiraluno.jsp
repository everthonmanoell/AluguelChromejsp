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
<%@page import="control.*"%>
<%@page import="model.*"%>

<%
    String id = request.getParameter("id");

    ControleAluno controle = ControleAluno.getInstance();
    controle.excluirAluno(id);

    response.sendRedirect("../relatorioaluno.jsp");
%>
</body>
</html>
